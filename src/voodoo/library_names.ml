module Dune = struct
  module Result = Bos_setup.R
  open Result.Infix

  type ('a, 'e) result = ('a, 'e) Rresult.result = Ok of 'a | Error of 'e

  module Library = struct
    type wrapped_t = {
      main_module_name : string;
      modules : string list;
      alias_module : string;
    }

    type unwrapped_t = { modules : string list }
    type singleton_t = string

    type wrapping =
      | Wrapped of wrapped_t
      | Unwrapped of unwrapped_t
      | Singleton of singleton_t

    type t = { name : string; dependencies : string list; ty : wrapping }
  end

  type t = {
    name : string;
    version : string option;
    libraries : Library.t list;
  }

  let assoc_list = function
    | Sexplib.Sexp.List ls ->
        List.map
          (function
            | Sexplib.Sexp.List (Sexplib.Sexp.Atom x :: xs) -> Some (x, xs)
            | _ -> None)
          ls
        |> List.fold_left
             (fun acc x -> match x with Some y -> y :: acc | None -> acc)
             []
        |> List.rev
        |> fun x -> Ok x
    | _ -> Error (`Msg "Expecting list in assoc_list")

  let string_of_atom = function
    | [ Sexplib.Sexp.Atom x ] -> Ok x
    | _ -> Error (`Msg "Expecting singleton atom in string_of_atom")

  let assoc name l =
    try Ok (List.assoc name l)
    with _ ->
      Error
        (`Msg
          (Printf.sprintf "Expecting key '%s' in assoc - keys are: [%s]" name
             (String.concat ", " (List.map fst l))))

  let process_wrapped_library d =
    assoc_list (Sexplib.Sexp.List d) >>= fun l ->
    assoc "main_module_name" l >>= string_of_atom >>= fun main_module_name ->
    assoc "modules" l >>= fun modules ->
    let modules = List.map assoc_list modules in
    let modules =
      List.fold_right
        (fun l acc ->
          let r = l >>= assoc "name" >>= string_of_atom in
          match r with Ok x -> x :: acc | Error _ -> acc)
        modules []
    in
    assoc "alias_module" l >>= fun alias_module ->
    assoc_list (Sexplib.Sexp.List alias_module) >>= fun l ->
    assoc "name" l >>= string_of_atom >>= fun alias_module ->
    Ok (Library.Wrapped { main_module_name; modules; alias_module })

  let process_unwrapped_library l =
    let modules = List.map assoc_list l in
    let modules =
      List.fold_right
        (fun l acc ->
          let r = l >>= assoc "name" >>= string_of_atom in
          match r with Ok x -> x :: acc | Error _ -> acc)
        modules []
    in
    Ok (Library.Unwrapped { modules })

  let process_singleton_library l =
    assoc_list (Sexplib.Sexp.List l) >>= fun l ->
    assoc "name" l >>= string_of_atom >>= fun name ->
    Ok (Library.Singleton name)

  let process_library :
      Sexplib.Sexp.t -> (Library.t, [> `Msg of string ]) result =
   fun s ->
    assoc_list s >>= fun l ->
    assoc "name" l >>= string_of_atom >>= fun name ->
    assoc "modules" l >>= fun m ->
    (match m with
    | [ Sexplib.Sexp.List x ] -> Ok x
    | _ -> Error (`Msg (Printf.sprintf "modules wasn't a singleton list")))
    >>= fun m ->
    (match m with
    | Sexplib.Sexp.Atom "wrapped" :: l -> process_wrapped_library l
    | Sexplib.Sexp.Atom "unwrapped" :: l -> process_unwrapped_library l
    | Sexplib.Sexp.Atom "singleton" :: l -> process_singleton_library l
    | Sexplib.Sexp.Atom x :: _ ->
        Error (`Msg (Format.sprintf "Unexpected library type: %s\n%!" x))
    | _ -> Error (`Msg (Format.sprintf "Very unexpected library structure")))
    >>= fun ty ->
    let dependencies =
      match assoc "requires" l with
      | Ok deps ->
          List.fold_right
            (fun x acc ->
              match x with Sexplib.Sexp.Atom y -> y :: acc | _ -> acc)
            deps []
      | Error _ -> []
    in
    Ok Library.{ name; ty; dependencies }

  let process_dune_package : Sexplib.Sexp.t -> (t, [> `Msg of string ]) result =
   fun s ->
    assoc_list s >>= fun l ->
    assoc "name" l >>= string_of_atom >>= fun name ->
    let version =
      match assoc "version" l >>= string_of_atom with
      | Ok x -> Some x
      | Error _ -> None
    in
    List.fold_right
      (fun (x, l) acc ->
        acc >>= fun acc ->
        match (x, l) with
        | "library", l -> (
            match process_library (Sexplib.Sexp.List l) with
            | Ok l -> Ok (l :: acc)
            | Error e -> Error e)
        | _ -> Ok acc)
      l (Ok [])
    >>= fun libraries -> Ok { name; version; libraries }

  let sexp_of_file p =
    try
      let ic = open_in (Fpath.to_string p) in
      let lines = Util.lines_of_channel ic in
      close_in ic;
      Ok (Sexplib.Sexp.of_string ("(" ^ String.concat "\n" lines ^ ")"))
    with e ->
      Error
        (`Msg
          (Printf.sprintf "Error in process_file: %s" (Printexc.to_string e)))

  let process_file p =
    Format.eprintf "process_file: %s\n%!" (Fpath.to_string p);
    sexp_of_file p >>= process_dune_package

  let find package =
    let path = Package.prep_path package in
    Bos.OS.Dir.fold_contents ~dotfiles:true
      (fun p acc ->
        let _, name = Fpath.split_base p in
        if name = Fpath.v "dune-package" then Ok p else acc)
      (Error (`Msg "Missing"))
      path
    |> Result.join

  (* TODO: process dune-package based on the dune version, since dune-package
     is not a stable format - it's internal to dune, so it can change *)
end

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
    let file_name = Fpath.basename file in
    let library_name =
      if file_name = "META" then Fpath.parent file |> Fpath.basename
      else Fpath.get_ext file
    in
    let meta = Fl_metascanner.parse ic in
    let libraries =
      { name = library_name; archive_name = library_name; modules = [] }
      :: (meta.pkg_children
         |> List.map (extract_name_and_archive ~base_library_name:library_name)
         |> List.flatten)
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
      Format.eprintf "trying to look up archive_name: %s\n%!" archive_name
    in
    let library =
      List.find (fun l -> l.archive_name = archive_name) libraries
    in
    library.modules <- library.modules @ units

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
            { libraries })
end
