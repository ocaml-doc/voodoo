type actions = { copy : (Fpath.t * Fpath.t) list; objinfo : Fpath.t list }

(** [process_package root p files] copies some files among [files] to the
    [Package.prep_path p]. Store the [ocamlobjinfo] of the [.cma] files. *)
let process_package : Fpath.t -> Package.t -> Fpath.t list -> unit =
 fun root package files ->
  let dest = Package.prep_path package in

  let format_matches_compiler_version path =
    let open Unix in
    let cmd = "ocamlobjinfo " ^ Fpath.to_string path in
    try
      let ic, oc = open_process cmd in
      let rec matches_version ic =
        try
          let line = input_line ic in
          let prefix = "Wrong magic number" in
          let str_len = String.length line in
          if str_len >= 18 && String.sub line 0 18 = prefix then (
            Printf.eprintf "ERROR: ocamlobjinfo on %s: %s\n"
              (Fpath.to_string path) line;
            false)
          else if str_len > 0 then matches_version ic
          else true
        with End_of_file -> true
      in
      let matches_version = matches_version ic in
      let _ = close_process (ic, oc) in
      matches_version
    with _ ->
      Printf.eprintf "ERROR: Failed to run ocamlobjinfo on %s\n"
        (Fpath.to_string path);
      false
  in

  (* Some packages produce ocaml artefacts that can't be processed with the switch's
      ocaml compiler - most notably the secondary compiler! This switch is intended to
      be used to ignore those files *)
  let is_blacklisted =
    let package_blacklist = [ "ocaml-secondary-compiler" ] in
    List.mem package.name package_blacklist
  in

  let foldfn fpath acc =
    let is_in_doc_dir =
      match Fpath.segs fpath with "doc" :: _ -> true | _ -> false
    in

    (* Menhir puts a dune build dir into docs for some reason *)
    let in_build_dir = List.exists (fun x -> x = "_build") (Fpath.segs fpath) in

    let _, filename = Fpath.split_base fpath in
    let ext = Fpath.get_ext filename in
    let no_ext = Fpath.rem_ext filename in
    let has_hyphen = String.contains (Fpath.to_string filename) '-' in
    let is_module =
      (not is_blacklisted)
      && List.mem ext [ ".cmt"; ".cmti"; ".cmi" ]
      && (not has_hyphen)
      && format_matches_compiler_version Fpath.(root // fpath)
    in
    let do_copy =
      (not in_build_dir)
      && (is_in_doc_dir || is_module
         || List.mem no_ext (List.map Fpath.v [ "META"; "dune-package" ]))
    in
    let is_cma = (not is_blacklisted) && List.mem ext [ ".cma"; ".cmxa" ] in
    let copy =
      if do_copy then Fpath.(root // fpath, dest // fpath) :: acc.copy
      else acc.copy
    in
    let objinfo = if is_cma then fpath :: acc.objinfo else acc.objinfo in
    { copy; objinfo }
  in
  let actions = List.fold_right foldfn files { copy = []; objinfo = [] } in
  List.iter
    (fun (src, dst) ->
      let dir, _ = Fpath.split_base dst in
      Util.mkdir_p dir;
      Util.cp (Fpath.to_string src) (Fpath.to_string dst))
    actions.copy;
  List.iter
    (fun fpath ->
      let lines =
        Util.lines_of_process
          Bos.Cmd.(v "ocamlobjinfo" % Fpath.(to_string (root // fpath)))
      in
      Util.write_file Fpath.(dest // set_ext "ocamlobjinfo" fpath) lines)
    actions.objinfo

let run (universes : (string * string) list) =
  let get_universe =
    match universes with
    | [] ->
        let id = ref 0 in
        Printf.eprintf
          "Warning: No universes have been specified: will generate dummy \
           universes\n\
           %!";
        fun pkg ->
          let universe_id = string_of_int !id in
          let name = pkg.Opam.name in
          let version = pkg.version in
          incr id;
          Some { Package.universe_id; name; version }
    | _ -> (
        fun pkg ->
          try
            let universe_id = List.assoc pkg.Opam.name universes in
            let name = pkg.name in
            let version = pkg.version in
            Some { universe_id; name; version }
          with _ -> None)
  in

  let packages =
    Opam.all_opam_packages ()
    |> List.fold_left
         (fun acc pkg ->
           match get_universe pkg with Some pkg -> pkg :: acc | None -> acc)
         []
  in
  let root = Opam.prefix () |> Fpath.v in
  let pkg_contents =
    List.map (fun package -> (package, Opam.pkg_contents package)) packages
  in
  List.iter
    (fun (package, files) -> process_package root package files)
    pkg_contents;
  List.iter
    (fun package ->
      match Opam.opam_file package with
      | Some lines ->
          let dest = Package.prep_path package in
          Util.write_file Fpath.(dest / "opam") lines
      | None -> ())
    packages
