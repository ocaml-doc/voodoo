(* Prep *)

let top_path = Fpath.v "prep"

let run _whitelist _ =
  let packages = Opam.all_opam_packages () in
  let packages =
    List.filter
      (fun pkg -> pkg.Opam.name <> "ocaml-secondary-compiler")
      packages
  in
  let root = Opam.prefix () |> Fpath.v in
  let pkg_contents =
    List.map (fun pkg -> (pkg, Opam.pkg_contents pkg.Opam.name)) packages
  in

  List.iter
    (fun (package, files) ->
      let _, universe = Universe.Current.dep_universe package.Opam.name in
      let dest =
        Fpath.(
          top_path / "universes" / universe.Universe.id / package.name
          / package.version)
      in
      let filter fpath =
        let is_in_doc_dir =
          match Fpath.segs fpath with "doc" :: _ -> true | _ -> false
        in
        let _, filename = Fpath.split_base fpath in
        let ext = Fpath.get_ext filename in
        let no_ext = Fpath.rem_ext filename in
        is_in_doc_dir
        || List.mem ext [ ".cmt"; ".cmti"; ".cmi" ]
        || List.mem no_ext (List.map Fpath.v [ "META"; "dune-package" ])
      in
      let copy fpath =
        let dest = Fpath.(dest // fpath) in
        let dir, _ = Fpath.split_base dest in
        Util.mkdir_p dir;
        Util.cp
          (Format.asprintf "%a" Fpath.pp Fpath.(root // fpath))
          (Format.asprintf "%a" Fpath.pp dest)
      in
      List.iter copy (List.filter filter files))
    pkg_contents;
  Universe.Current.save top_path
