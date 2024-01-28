open Voodoo_lib
module Result = Bos_setup.R
open Result.Infix

type ('a, 'e) result = ('a, 'e) Rresult.result = Ok of 'a | Error of 'e

module InputSelect = struct
  let order path =
    let ext = Fpath.get_ext path in
    match ext with ".cmti" -> 0 | ".cmt" -> 1 | ".cmi" -> 2 | _ -> 3

  (* Given a list of Sourceinfo.t values, we need to find the 'best'
     file for each, and return an Sourceinfo_index.t of these *)
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
    Sourceinfo_index.of_source_infos result
end

module IncludePaths = struct
  let get : Sourceinfo_index.t -> Sourceinfo.t -> Fpath.Set.t =
   fun index si ->
    let s = Mld.compile_dir si.parent in
    let set = Fpath.Set.of_list [ s ] in
    List.fold_left
      (fun paths dep ->
        match Sourceinfo_index.find_opt dep.Odoc.c_digest index with
        | Some si -> Fpath.Set.add Sourceinfo.(compile_dir si) paths
        | None -> (
            match Sourceinfo_index.find_extern_opt dep.Odoc.c_digest index with
            | Some p -> Fpath.Set.add p paths
            | None ->
                Format.eprintf "Missing dependency: %s %s\n%!" dep.c_unit_name
                  dep.c_digest;
                paths))
      set si.deps

  let link : Sourceinfo_index.t -> Fpath.Set.t =
   fun index ->
    let dirs =
      Sourceinfo_index.M.fold
        (fun _ v acc -> Fpath.Set.add (Sourceinfo.compile_dir v) acc)
        index.intern Fpath.Set.empty
    in
    Sourceinfo_index.M.fold
      (fun _ v acc -> Fpath.Set.add v acc)
      index.extern dirs
end

let get_source_info parent path =
  match Fpath.segs path with
  | "prep" :: "universes" :: id :: pkg_name :: version :: _ -> (
      match Odoc.compile_deps path with
      | Some (name, digest, deps) ->
          [
            Sourceinfo.
              {
                package = { universe = id; name = pkg_name; version };
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
        if name = Fpath.v "index.m" then Sourceinfo_index.(combine (read p) acc)
        else acc)
      Sourceinfo_index.empty Paths.compile
  in
  let index =
    match index_res with Ok index -> index | Error _ -> Sourceinfo_index.empty
  in

  let opam_file = match Opam.find package with Ok f -> Some f | _ -> None in

  let libraries = Library_names.get_libraries package in

  let package_mlds, otherdocs = Package_mlds.find package in

  let error_log = Error_log.find package in

  let auto_generated_index_mld =
    Index_mld_page.gen package ~blessed ~modules ~libraries ~package_mlds
      ~error_log ~failed
  in

  let () =
    Package_info.gen ~output:output_path ~libraries:libraries.libraries
  in

  let sis =
    Compat.List.concat_map (get_source_info auto_generated_index_mld) prep
  in
  let this_index = InputSelect.select sis in
  Sourceinfo_index.write this_index auto_generated_index_mld;
  let index = Sourceinfo_index.combine this_index index in
  let rec compile h si compiled =
    if List.mem si.Sourceinfo.path compiled then compiled
    else
      let compiled =
        List.fold_left
          (fun (compiled : Fpath.t list) dep ->
            match Sourceinfo_index.find_opt dep.Odoc.c_digest this_index with
            | Some si -> compile h si compiled
            | None -> compiled)
          compiled si.deps
      in
      let includes = IncludePaths.get index si in
      let output = Sourceinfo.output_file si in
      Odoc.compile ~parent:auto_generated_index_mld.Mld.name ~output si.path
        ~includes ~children:[];
      si.path :: compiled
  in
  let _ = ignore (Sourceinfo_index.M.fold compile this_index.intern []) in
  let mldvs =
    Package_mlds.compile ~parent:auto_generated_index_mld package_mlds
  in
  let unit_includes = IncludePaths.link index in
  let docs_includes = Package_mlds.include_paths mldvs in
  let all_includes = Fpath.Set.union unit_includes docs_includes in
  let all_includes =
    Fpath.Set.add (Mld.compile_dir auto_generated_index_mld) all_includes
  in
  let output = Fpath.(v "html") in
  Util.mkdir_p output;
  Sourceinfo_index.M.iter
    (fun _ si ->
      if Sourceinfo.is_hidden si then ()
      else
        Odoc.link
          (Sourceinfo.output_file si)
          ~includes:all_includes
          ~output:(Sourceinfo.output_odocl si))
    this_index.intern;
  let odocls =
    Sourceinfo_index.M.fold
      (fun _ si acc ->
        if Sourceinfo.is_hidden si then acc
        else Sourceinfo.output_odocl si :: acc)
      this_index.intern []
  in
  Odoc.link
    (Mld.output_file auto_generated_index_mld)
    ~includes:all_includes
    ~output:(Mld.output_odocl auto_generated_index_mld);
  List.iter
    (fun mldv ->
      Odoc.link (Mld.output_file mldv) ~includes:all_includes
        ~output:(Mld.output_odocl mldv))
    mldvs;
  let odocls =
    odocls @ List.map Mld.output_odocl (auto_generated_index_mld :: mldvs)
  in
  Format.eprintf "%d other files to copy\n%!" (List.length otherdocs);
  let otherdocs, _opam_file =
    Otherdocs.copy auto_generated_index_mld otherdocs opam_file
  in
  List.iter (fun p -> Format.eprintf "dest: %a\n%!" Fpath.pp p) otherdocs;
  List.iter (Odoc.html ~output) odocls;
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
  if failed then
    Bos.OS.File.write Fpath.(output_path / "failed") "failed" |> Result.get_ok;
  ()
