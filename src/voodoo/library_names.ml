module Without_dune = struct
  (** To extract the library names for a given package, without using dune, we

      1. parse the META file of the package with ocamlfind to see which
      libraries exist.

      2. use ocamlobjinfo to get a list of all modules within the library.

      This code assumes that the META file lists for every library an archive
      [archive_name], and that for this cma archive exists a corresponsing
      [archive_name].ocamlobjinfo file. *)

  type library = {
    name : string;
    archive_name : string;
    mutable modules : string list;
  }

  type t = { libraries : library list }

  let process_meta_file file =
    let _ = Format.eprintf "process_meta_file: %s\n%!" (Fpath.to_string file) in
    let rec extract_name_and_archive ~base_library_name
        ((name, pkg_expr) : string * Fl_metascanner.pkg_expr) =
      let maybe_archive_name =
        try Some (Fl_metascanner.lookup "archive" [ "byte" ] pkg_expr.pkg_defs)
        with Not_found -> None
      in
      let child_libraries =
        pkg_expr.pkg_children
        |> List.map
             (extract_name_and_archive
                ~base_library_name:(base_library_name ^ "." ^ name))
        |> List.flatten
      in
      match maybe_archive_name with
      | Some archive_name ->
          let archive_name =
            String.sub archive_name 0 (String.length archive_name - 4)
          in

          { name = base_library_name ^ "." ^ name; modules = []; archive_name }
          :: child_libraries
      | None -> child_libraries
    in
    let ic = open_in (Fpath.to_string file) in
    let meta = Fl_metascanner.parse ic in
    let library_name =
      let cma_filename =
        try Fl_metascanner.lookup "archive" [ "byte" ] meta.pkg_defs
        with Not_found -> failwith "META file does not contain archive/byte"
      in
      String.sub cma_filename 0 (String.length cma_filename - 4)
    in
    let libraries =
      { name = library_name; archive_name = library_name; modules = [] }
      :: (meta.pkg_children
         |> List.map (extract_name_and_archive ~base_library_name:library_name)
         |> List.flatten)
      |> List.filter (fun (lib : library) ->
             not
               (String.split_on_char '.' lib.name
               |> List.exists (fun x -> x = "__private__")))
    in
    libraries

  let process_ocamlobjinfo_file ~(libraries : library list) file =
    let _ =
      Format.eprintf "process_ocamlobjinfo_file: %s\n%!" (Fpath.to_string file)
    in
    let ic = open_in (Fpath.to_string file) in
    let lines = Util.lines_of_channel ic in
    let affix = "Unit name: " in
    let len = String.length affix in
    close_in ic;
    let units =
      List.map
        (fun line ->
          if Astring.String.is_prefix ~affix line then
            Some (String.sub line len (String.length line - len))
          else None)
        lines
    in
    let units =
      List.fold_right
        (fun l acc -> match l with Some x -> x :: acc | None -> acc)
        units []
    in
    let _, archive_name = Fpath.split_base file in
    let archive_name = archive_name |> Fpath.rem_ext |> Fpath.to_string in
    let _ =
      Format.eprintf "trying to look up archive_name: %s\nunits: %s\n%!"
        archive_name (String.concat "," units)
    in
    try
      let library =
        List.find (fun l -> l.archive_name = archive_name) libraries
      in
      library.modules <- library.modules @ units
    with Not_found ->
      Format.eprintf "failed to find archive_name: %s\n%!" archive_name;
      ()

  let get_libraries package =
    let path = Package.prep_path package in
    let maybe_meta_files =
      Bos.OS.Dir.fold_contents ~dotfiles:true
        (fun p acc ->
          let is_meta = p |> Fpath.rem_ext |> Fpath.basename = "META" in
          if is_meta then p :: acc else acc)
        [] path
    in

    match maybe_meta_files with
    | Error _ ->
        failwith
          "FIXME: had an error traversing directories to find the META files"
    | Ok meta_files -> (
        let libraries =
          meta_files |> List.map process_meta_file |> List.flatten
        in

        let _ =
          Format.eprintf "found archive_names: [%s]\n%!"
            (String.concat ", "
               (List.map (fun (l : library) -> l.archive_name) libraries))
        in

        let maybe_ocamlobjinfo_files =
          Bos.OS.Dir.fold_contents ~dotfiles:true
            (fun p acc ->
              let is_ocamlobjinfo = Fpath.get_ext p = ".ocamlobjinfo" in
              if is_ocamlobjinfo then p :: acc else acc)
            [] path
        in
        match maybe_ocamlobjinfo_files with
        | Error _ ->
            failwith "FIXME: had an error going over the ocamlobjinfo files"
        | Ok ocamlobjinfo_files ->
            List.iter (process_ocamlobjinfo_file ~libraries) ocamlobjinfo_files;
            let _ =
              Format.eprintf "found archive_names: [%s]\n%!"
                (String.concat ", "
                   (List.map
                      (fun (l : library) ->
                        l.archive_name ^ "/" ^ String.concat "," l.modules)
                      libraries))
            in
            { libraries })
end
