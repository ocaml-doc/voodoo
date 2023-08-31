module Result = Bos_setup.R
open Result.Infix
module StringSet = Jsoo_cmi.StringSet

let run path package =
  Bos.OS.Dir.fold_contents
    (fun fpath (acc, universes) ->
      let rel_fpath =
        match Fpath.relativize ~root:path fpath with
        | Some x -> x
        | None -> failwith "Bos error"
      in
      let segs = Fpath.segs rel_fpath in
      let universes =
        match segs with
        | "universes" :: universe_id :: _ -> StringSet.add universe_id universes
        | _ -> universes
      in
      let path_relevant =
        match (package, segs) with
        | Some s, "universes" :: _universe_id :: package' :: _ -> package' = s
        | Some _, _ -> false
        | None, _ -> true
      in
      if
        path_relevant
        && List.mem (Fpath.get_ext fpath)
             [ Jsoo_cma.ext; Jsoo_toplevel.meta_ext ]
      then (fpath :: acc, universes)
      else (acc, universes))
    ([], StringSet.empty) path
  >>= fun (files, universes) ->
  let toplevels =
    List.fold_left
      (fun acc x ->
        if Fpath.has_ext Jsoo_cma.ext x then (
          Jsoo_cma.process x;
          acc)
        else Jsoo_toplevel.process x :: acc)
      [] files
  in
  let cmis =
    List.concat
      (List.map (fun toplevel -> toplevel.Jsoo_toplevel.cmis) toplevels)
    |> List.sort_uniq Jsoo_cmi.compare
  in
  Jsoo_cmi.copy universes cmis;
  toplevels
  |> List.map (fun t -> t.Jsoo_toplevel.package)
  |> List.sort_uniq Package.compare
  |> List.iter (fun package ->
         toplevels
         |> List.filter (fun t -> t.Jsoo_toplevel.package = package)
         |> List.map Jsoo_toplevel.to_yojson
         |> fun toplevels ->
         Yojson.Safe.to_file
           Fpath.(Package.jsoo_path package / "toplevels.json" |> to_string)
           (`List toplevels));
  Ok ()

let copy_files root pkg_contents =
  let findlib_cmas = Jsoo_cma.findlib () in
  let pkgs = List.map (fun (x, _, _) -> x) pkg_contents in
  Jsoo_cmi.stdlib pkgs >>= fun stdlib_cmis ->
  Util.R.iter_list pkg_contents ~f:(fun (package, cmas, _) ->
      let findlib_pkgs =
        List.filter_map
          (fun p ->
            match List.assoc_opt Fpath.(root // p) findlib_cmas with
            | Some pkg -> Some (p, pkg)
            | None ->
                Logs.info (fun m ->
                    m "No findlib pkg for archive %a%!" Fpath.pp p);
                None)
          cmas
      in
      Util.R.iter_list findlib_pkgs ~f:(fun (cma_fpath, findlib_pkg) ->
          let cma = Jsoo_cma.{ package; path = cma_fpath } in
          Jsoo_cma.marshal cma;
          let include_paths = Ocamlfind.include_paths findlib_pkg in
          let cmis =
            List.concat
              (List.map
                 (fun (package, _, contents) ->
                   List.filter_map
                     (fun path ->
                       let dir, file = Fpath.split_base path in
                       if
                         Fpath.has_ext ".cmi" file
                         && List.mem
                              Fpath.(to_string (root // dir))
                              include_paths
                       then Some Jsoo_cmi.{ package; path }
                       else None)
                     contents)
                 pkg_contents)
          in
          let cmis = cmis @ stdlib_cmis in
          Ocamlfind.js_files findlib_pkg
          |> Bos_setup.R.reword_error_msg (fun s ->
                 Bos_setup.R.msgf "Bad js file for: %a (%s)\n%!" Package.pp
                   package s)
          >>| fun js_files ->
          let dep_cmas =
            List.filter_map
              (fun path ->
                match
                  List.find_opt
                    (fun (_, _, contents) ->
                      List.exists (fun p -> Fpath.(root // p) = path) contents)
                    pkg_contents
                with
                | Some (package, _, _) -> Some { Jsoo_cma.package; path }
                | None ->
                    Logs.info (fun m ->
                        m "Failed to find package containing %a\n%!" Fpath.pp
                          path);
                    None)
              (Ocamlfind.dep_cmas findlib_pkg)
          in
          let toplevel =
            { Jsoo_toplevel.package; cma_fpath; js_files; dep_cmas; cmis }
          in
          Jsoo_toplevel.copy_js_files root toplevel;
          Jsoo_toplevel.marshal toplevel))
