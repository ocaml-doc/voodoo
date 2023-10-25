open Voodoo_lib
module Result = Bos_setup.R
open Result.Infix

type ('a, 'e) result = ('a, 'e) Rresult.result = Ok of 'a | Error of 'e

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

let get_source_info source_maps parent path =
  match Fpath.segs path with
  | "prep" :: "universes" :: universe :: pkg_name :: version :: rest -> (
      match Odoc.compile_deps path with
      | Some (name, digest, deps) ->
          let package = { Package.universe; name = pkg_name; version } in
          let src_file =
            match List.assoc_opt package source_maps with
            | Some map ->
                let path = String.concat "/" rest in
                let p = Fpath.v path |> Fpath.set_ext ".cmt" in
                Dune_rules.ml_of_cmt map p
            | _ -> None
          in
          [ { Sourceinfo.package; path; src_file; name; digest; deps; parent } ]
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
  Bos.OS.Dir.contents Fpath.(Paths.prep / "universes") >>= fun universes ->
  let universe =
    match
      Compat.List.find_opt
        (fun u ->
          match Bos.OS.Dir.exists Fpath.(u / pkg_name) with
          | Ok b -> b
          | Error _ -> false)
        universes
    with
    | Some u -> Ok u
    | None -> Error (`Msg (Format.sprintf "Failed to find package %s" pkg_name))
  in
  universe >>= fun u ->
  Bos.OS.Dir.contents ~rel:true Fpath.(u / pkg_name) >>= fun version ->
  match (Fpath.segs u, version) with
  | _ :: _ :: u :: _, [ version ] -> Ok (u, Fpath.to_string version)
  | _ -> Error (`Msg (Format.sprintf "Failed to find package %s" pkg_name))

let run pkg_name ~blessed ~failed =
  let is_interesting p =
    List.mem (Fpath.get_ext p) [ ".cmti"; ".cmt"; ".cmi" ]
  in
  (* Remove old pages *)
  let () =
    Bos.OS.File.delete Fpath.(Paths.compile / "page-packages.odoc")
    |> Result.get_ok
  in
  let () =
    Bos.OS.File.delete Fpath.(Paths.compile / "page-universes.odoc")
    |> Result.get_ok
  in

  let universe, version =
    match find_universe_and_version pkg_name with
    | Ok x -> x
    | Error (`Msg e) ->
        Format.eprintf "%s\n%!" e;
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
    |> Result.get_ok
  in
  let dune_rules =
    Bos.OS.Dir.fold_contents ~dotfiles:false
      (fun p acc ->
        match Fpath.segs p with
        | [ "prep"; "universes"; universe; name; version; "dune_rules" ] ->
            if right_package p then
              ({ Package.universe; name; version }, p) :: acc
            else acc
        | _ -> acc)
      [] Paths.prep
  in
  let source_maps =
    match dune_rules with
    | Ok ps -> List.map (fun (pkg, rules) -> (pkg, Dune_rules.read rules)) ps
    | _ -> []
  in
  let modules =
    List.fold_left
      (fun acc f ->
        let _, name = Fpath.split_base f in
        let name = Fpath.rem_ext name |> Fpath.to_string in
        if List.mem name acc then acc else name :: acc)
      [] prep
  in
  let package = { Package.universe; name = pkg_name; version } in
  let output_path =
    if blessed then Fpath.(Paths.link / "p" / pkg_name / version)
    else Fpath.(Paths.link / "u" / universe / pkg_name / version)
  in
  Util.mkdir_p output_path;

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
    match Ocamlobjinfo.find package with
    | Ok packages -> Ocamlobjinfo.process packages
    | Error _err -> []
  in

  let package_mlds, otherdocs = Package_mlds.find package in

  let error_log = Error_log.find package in

  let parent, src_parent =
    let source_map = List.assoc_opt package source_maps in
    let src_files =
      match source_map with
      | Some map ->
          Dune_rules.M.fold
            (fun _cmt src acc -> Fpath.to_string src :: acc)
            map.Dune_rules.src []
      | None -> []
    in
    Version.gen_parent package ~blessed ~modules ~src_files ~dune ~libraries
      ~package_mlds ~error_log ~failed
  in

  let () = Package_info.gen ~output:output_path ~dune ~libraries in

  let sis = Compat.List.concat_map (get_source_info source_maps parent) prep in
  let src_parent_odoc = Src.output_file src_parent in
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
      let source =
        match si.src_file with
        | Some fpath -> Some (src_parent_odoc, fpath)
        | None -> None
      in
      Odoc.compile ~parent:parent.Mld.name ~output si.path ~includes ?source
        ~children:[];
      si.path :: compiled
  in
  let _ = ignore (Index.M.fold compile this_index.intern []) in
  let mldvs = Package_mlds.compile ~parent package_mlds in
  let unit_includes = IncludePaths.link index in
  let docs_includes = Package_mlds.include_paths mldvs in
  let all_includes = Fpath.Set.union unit_includes docs_includes in
  let all_includes = Fpath.Set.add (Mld.compile_dir parent) all_includes in
  let output = Fpath.(v "html") in
  Util.mkdir_p output;
  Index.M.iter
    (fun _ si ->
      if Sourceinfo.is_hidden si then
        let src = Sourceinfo.output_file si in
        let dst = Sourceinfo.output_linked_odoc_for_src si in
        let cmd = Bos.Cmd.(v "cp" % p src % p dst) in
        Voodoo_lib.Util.run_silent cmd
      else
        Odoc.link
          (Sourceinfo.output_file si)
          ~includes:all_includes
          ~output:(Sourceinfo.output_odocl si))
    this_index.intern;
  Odoc.link (Mld.output_file parent) ~includes:all_includes
    ~output:(Mld.output_odocl parent);
  Odoc.link
    (Src.output_file src_parent)
    ~includes:all_includes
    ~output:(Src.output_odocl src_parent);
  List.iter
    (fun mldv ->
      Odoc.link (Mld.output_file mldv) ~includes:all_includes
        ~output:(Mld.output_odocl mldv))
    mldvs;
  Format.eprintf "%d other files to copy\n%!" (List.length otherdocs);
  let otherdocs, _opam_file = Otherdocs.copy parent otherdocs opam_file in
  List.iter (fun p -> Format.eprintf "dest: %a\n%!" Fpath.pp p) otherdocs;
  let () =
    Bos.OS.File.delete (Fpath.v "compile/page-p.odoc") |> Result.get_ok
  in
  let () =
    Bos.OS.File.delete (Fpath.v "compile/page-u.odoc") |> Result.get_ok
  in
  let () =
    Bos.OS.File.delete (Fpath.v ("compile/p/page-" ^ pkg_name ^ ".odoc"))
    |> Result.get_ok
  in
  (* copy source *)
  let () =
    let src_path = Package.src_path package in
    match Bos.OS.Dir.exists src_path with
    | Ok true ->
        let cmd = Bos.Cmd.(v "rsync" % "-av" % p src_path % p output_path) in
        List.iter
          (fun l -> Format.eprintf "%s\n%!" l)
          (Util.lines_of_process cmd)
    | _ -> ()
  in
  if failed then
    Bos.OS.File.write Fpath.(output_path / "failed") "failed" |> Result.get_ok;
  ()
