type actions = { copy : (Fpath.t * Fpath.t) list; objinfo : Fpath.t list }

module Result = Bos_setup.R
open Result.Infix

let write_dune_rules (package : Package.t) build_path dest =
  Bos.OS.Dir.with_current build_path
    (fun () ->
      let cmts =
        Bos.OS.File.exists (Fpath.v "dune-project") >>= fun exists ->
        Bos.OS.Dir.exists (Fpath.v "_build/default") >>= fun exists' ->
        if exists && exists' then
          Bos.OS.Dir.fold_contents ~dotfiles:true
            (fun p acc -> if Fpath.has_ext ".cmt" p then p :: acc else acc)
            []
            Fpath.(v "_build")
        else Error (`Msg "Root doesn't exist, cannot fetch .cmt files")
      in
      match Util.R.value ~default:[] cmts with
      | [] -> ()
      | cmts -> (
          let cmd =
            List.fold_left
              (fun acc cmt -> Bos.Cmd.(acc % p cmt))
              Bos.Cmd.(v "dune" % "rules" % "-p" % package.name)
              cmts
          in
          try
            let lines = Util.lines_of_process cmd in
            Format.eprintf "Generated dune_rules: %a" Fpath.pp
              Fpath.(dest / "dune_rules");
            Util.write_file Fpath.(dest / "dune_rules") lines
          with _ -> ()))
    ()
  |> Util.R.value ~default:()

(** [process_package root p files] copies some files among [files] to the
    [Package.prep_path p]. Store the [ocamlobjinfo] of the [.cma] files. *)
let process_package :
    Fpath.t ->
    Package.t ->
    Fpath.t list ->
    (Fpath.t * Fpath.t) list ->
    Fpath.t ->
    unit =
 fun root package files src_files build_path ->
  let dest = Package.prep_path package in
  let src_dest = Package.src_path package in

  (* Some packages produce ocaml artefacts that can't be processed with the switch's
      ocaml compiler - most notably the secondary compiler! This switch is intended to
      be used to ignore those files *)
  let process_ocaml_artefacts =
    let package_blacklist = [ "ocaml-secondary-compiler" ] in
    not (List.mem package.name package_blacklist)
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
      process_ocaml_artefacts
      && List.mem ext [ ".cmt"; ".cmti"; ".cmi" ]
      && not has_hyphen
    in
    let do_copy =
      (not in_build_dir)
      && (is_in_doc_dir || is_module
         || List.mem no_ext (List.map Fpath.v [ "META"; "dune-package" ]))
    in
    let is_cma = process_ocaml_artefacts && List.mem ext [ ".cma"; ".cmxa" ] in
    let copy =
      if do_copy then Fpath.(root // fpath, dest // fpath) :: acc.copy
      else acc.copy
    in
    let objinfo = if is_cma then fpath :: acc.objinfo else acc.objinfo in
    { copy; objinfo }
  in
  let copy =
    List.map (fun (fpath, rpath) -> Fpath.(fpath, src_dest // rpath)) src_files
  in
  let actions = List.fold_right foldfn files { copy; objinfo = [] } in
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
    actions.objinfo;
  write_dune_rules package build_path dest

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
  let pkg_src src_root =
    let src_files =
      let dune_src_root = Fpath.(src_root / "_build" / "default") in
      let root =
        match Bos.OS.Dir.exists dune_src_root with
        | Ok true -> dune_src_root
        | _ -> src_root
      in
      Bos.OS.Dir.fold_contents
        (fun p acc ->
          if Fpath.has_ext ".ml" p then
            (p, Fpath.relativize ~root p |> Option.get) :: acc
          else acc)
        [] dune_src_root
    in
    Util.R.value ~default:[] src_files
  in
  List.iter
    (fun package ->
      let files = Opam.pkg_contents package in
      let build_path =
        Fpath.(
          root / ".opam-switch" / "build"
          / (package.Package.name ^ "." ^ package.version))
      in
      let src_files = pkg_src build_path in
      process_package root package files src_files build_path;
      match Opam.opam_file package with
      | Some lines ->
          let dest = Package.prep_path package in
          Util.write_file Fpath.(dest / "opam") lines
      | None -> ())
    packages
