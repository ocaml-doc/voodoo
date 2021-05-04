(* do! *)

open Listm

module InputSelect = struct
  let order path =
    let ext = Fpath.get_ext path in
    match ext with ".cmti" -> 0 | ".cmt" -> 1 | ".cmi" -> 2 | _ -> 3

  (* Given a list of Sourceinfo.t values, we need to find the 'best'
     file for each, and return an Index.t of these *)
  let select sis =
    let h = Hashtbl.create (List.length sis) in
    List.iter
      (fun (si : Sourceinfo.t) ->
        let cur = try Hashtbl.find h si.digest with _ -> [] in
        Hashtbl.replace h si.digest (si :: cur))
      sis;
    let result =
      Hashtbl.fold
        (fun _k v acc ->
          let best =
            List.sort
              (fun v1 v2 -> compare (order v1.Sourceinfo.path) (order v2.path))
              v
            |> List.hd
          in
          best :: acc)
        h []
    in
    Index.of_source_infos result
end

module IncludePaths = struct
  let get : Index.t -> Sourceinfo.t -> Fpath.Set.t =
   fun index si ->
    let s = Mld.compile_dir si.parent in
    let set = Fpath.Set.of_list [ s ] in
    List.fold_left
      (fun paths dep ->
        match Index.find_opt dep.Odoc.c_digest index with
        | Some si -> Fpath.Set.add Sourceinfo.(compile_dir si) paths
        | None -> (
            match Index.find_extern_opt dep.Odoc.c_digest index with
            | Some p -> Fpath.Set.add p paths
            | None ->
                Format.eprintf "Missing dependency: %s %s\n%!" dep.c_unit_name
                  dep.c_digest;
                paths))
      set si.deps

  let link : Index.t -> Fpath.Set.t =
   fun index ->
    let dirs =
      Index.M.fold
        (fun _ v acc -> Fpath.Set.add (Sourceinfo.compile_dir v) acc)
        index.intern Fpath.Set.empty
    in
    Index.M.fold (fun _ v acc -> Fpath.Set.add v acc) index.extern dirs
end

let get_source_info parent path =
  match Fpath.segs path with
  | "prep" :: "universes" :: id :: pkg_name :: version :: _ -> (
      match Odoc.compile_deps path with
      | Some (name, digest, deps) ->
          [
            Sourceinfo.
              {
                package = (id, pkg_name, version);
                path;
                name;
                digest;
                deps;
                parent;
              };
          ]
      | None -> [])
  | _ -> []

let package_info_of_fpath p =
  match Fpath.segs p with
  | "prep" :: "universes" :: id :: pkg_name :: pkg_version :: _ ->
      (id, pkg_name, pkg_version)
  | _ ->
      Format.eprintf "%s\n%!" (Fpath.to_string p);
      failwith "Bad path"

let find_universe_and_version pkg_name =
  let universes =
    Bos.OS.Dir.contents Fpath.(Paths.prep / "universes") |> Util.get_ok
  in
  let u =
    List.find
      (fun u ->
        match Bos.OS.Dir.exists Fpath.(u / pkg_name) with
        | Ok b -> b
        | Error _ -> false)
      universes
  in
  let version =
    Bos.OS.Dir.contents ~rel:true Fpath.(u / pkg_name) |> Util.get_ok
  in
  match (Fpath.segs u, version) with
  | _ :: _ :: u :: _, [ version ] -> Some (u, Fpath.to_string version)
  | _ -> None

let run pkg_name is_blessed =
  let is_interesting p =
    List.mem (Fpath.get_ext p) [ ".cmti"; ".cmt"; ".cmi" ]
  in
  (* Remove old pages *)
  let () =
    Bos.OS.File.delete Fpath.(Paths.compile / "page-packages.odoc")
    |> Util.get_ok
  in
  let () =
    Bos.OS.File.delete Fpath.(Paths.compile / "page-universes.odoc")
    |> Util.get_ok
  in

  let universe, version =
    match find_universe_and_version pkg_name with
    | Some x -> x
    | None ->
        Format.eprintf "Failed to find package\n%!";
        exit 1
  in

  let right_package p =
    let _, n, _ = package_info_of_fpath p in
    n = pkg_name
  in
  let prep =
    Bos.OS.Dir.fold_contents ~dotfiles:true
      (fun p acc ->
        if is_interesting p && right_package p then p :: acc else acc)
      [] Paths.prep
    |> Util.get_ok
  in
  let modules =
    List.fold_left
      (fun acc f ->
        let _, name = Fpath.split_base f in
        let name = Fpath.rem_ext name |> Fpath.to_string in
        if List.mem name acc then acc else name :: acc)
      [] prep
  in
  let package = (universe, pkg_name, version) in
  let index_res =
    Bos.OS.Dir.fold_contents ~dotfiles:true
      (fun p acc ->
        let _, name = Fpath.split_base p in
        if name = Fpath.v "index.m" then Index.(combine (read p) acc) else acc)
      Index.empty Paths.compile
  in
  let index =
    match index_res with Ok index -> index | Error _ -> Index.empty
  in

  let dune =
    match Dune.(find package >>= process_file) with
    | Ok x ->
        Format.eprintf "Got dune\n%!";
        Some x
    | Error (`Msg m) ->
        Format.eprintf "No dune: %s\n%!" m;
        None
  in
  let opam_file = match Opam.find package with Ok f -> Some f | _ -> None in

  let libraries =
    match Ocamlobjinfo.(find package >>= process) with
    | Ok x -> x
    | Error _ -> []
  in

  let package_mlds, otherdocs = Package_mlds.find package in

  let parent =
    Version.gen_parent package ~blessed:is_blessed ~modules ~dune ~libraries
      ~package_mlds
  in

  let sis = prep >>= get_source_info parent in
  let this_index = InputSelect.select sis in
  Index.write this_index parent;
  let index = Index.combine this_index index in
  let rec compile h si compiled =
    if List.mem si.Sourceinfo.path compiled then compiled
    else
      let compiled =
        List.fold_left
          (fun (compiled : Fpath.t list) dep ->
            match Index.find_opt dep.Odoc.c_digest this_index with
            | Some si -> compile h si compiled
            | None -> compiled)
          compiled si.deps
      in
      let includes = IncludePaths.get index si in
      let output = Sourceinfo.output_file si in
      ignore
        (Odoc.compile ~parent:parent.Mld.name ~output si.path ~includes
           ~children:[]);
      si.path :: compiled
  in
  let _ = ignore (Index.M.fold compile this_index.intern []) in
  let mldvs = Package_mlds.compile package parent package_mlds in
  let unit_includes = IncludePaths.link index in
  let docs_includes = Package_mlds.include_paths mldvs in
  let all_includes = Fpath.Set.union unit_includes docs_includes in
  let all_includes = Fpath.Set.add (Mld.compile_dir parent) all_includes in
  let output = Fpath.(v "html") in
  Util.mkdir_p output;
  Index.M.iter
    (fun _ si ->
      if Sourceinfo.is_hidden si then ()
      else
        ignore
          (Odoc.link
             (Sourceinfo.output_file si)
             ~includes:all_includes
             ~output:(Sourceinfo.output_odocl si)))
    this_index.intern;
  let odocls =
    Index.M.fold
      (fun _ si acc ->
        if Sourceinfo.is_hidden si then acc
        else Sourceinfo.output_odocl si :: acc)
      this_index.intern []
  in
  ignore
    (Odoc.link (Mld.output_file parent) ~includes:all_includes
       ~output:(Mld.output_odocl parent));
  List.iter
    (fun mldv ->
      ignore
        (Odoc.link (Mld.output_file mldv) ~includes:all_includes
           ~output:(Mld.output_odocl mldv)))
    mldvs;
  let odocls = odocls @ List.map Mld.output_odocl (parent :: mldvs) in
  let name = Printf.sprintf "%s.%s" pkg_name version in
  let otherdocs, opam_file = Otherdocs.copy parent otherdocs opam_file in
  Odoc.gen output name opam_file
    (Mld.output_odocl parent |> Fpath.to_string)
    otherdocs odocls;
  let () =
    Bos.OS.File.delete (Fpath.v "compile/page-packages.odoc") |> Util.get_ok
  in
  let () =
    Bos.OS.File.delete (Fpath.v "compile/page-universes.odoc") |> Util.get_ok
  in
  let () =
    Bos.OS.File.delete (Fpath.v ("compile/packages/page-" ^ pkg_name ^ ".odoc"))
    |> Util.get_ok
  in
  ()

let run_all () =
  Format.eprintf
    "Handling all packages. Getting dependency data from current opam switch\n\
     %!";
  let packages = Opam.all_opam_packages () in
  Format.eprintf "Metadata found";
  let deps = List.map (fun pkg -> (pkg, Opam.dependencies pkg)) packages in
  let done_pkgs : Opam.package list ref = ref [] in
  let rec doit pkg =
    if List.mem pkg !done_pkgs then ()
    else
      let deps_opt = try Some (List.assoc pkg deps) with _ -> None in
      match deps_opt with
      | Some deps ->
          List.iter doit deps;
          Format.eprintf "Building docs for package %s\n%!" pkg.Opam.name;
          (try run pkg.Opam.name true
           with e ->
             Format.eprintf "Ignoring failure %s!\n%!" (Printexc.to_string e));
          done_pkgs := pkg :: !done_pkgs
      | None -> ()
  in
  List.iter doit packages
