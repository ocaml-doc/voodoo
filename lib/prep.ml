(* Prep *)

type actions = {
  copy : (Fpath.t * Fpath.t) list;
  info : Fpath.t list;
  objinfo : Fpath.t list;
}

type source_info = {
  package : Package.t;
  path : Fpath.t;
  name : string;
  digest : Digest.t;
  deps : Odoc.compile_dep list;
}

let process_package : Fpath.t -> Package.t -> Fpath.t list -> unit =
 fun root package files ->
  let dest = Package.prep_path package in
  let foldfn fpath acc =
    let is_in_doc_dir =
      match Fpath.segs fpath with "doc" :: _ -> true | _ -> false
    in
    let _, filename = Fpath.split_base fpath in
    let ext = Fpath.get_ext filename in
    let no_ext = Fpath.rem_ext filename in
    let is_module = List.mem ext [ ".cmt"; ".cmti"; ".cmi" ] in
    let do_copy =
      is_in_doc_dir || is_module
      || List.mem no_ext (List.map Fpath.v [ "META"; "dune-package" ])
    in
    let is_cma = List.mem ext [ ".cma"; ".cmxa" ] in
    let copy =
      if do_copy then Fpath.(root // fpath, dest // fpath) :: acc.copy
      else acc.copy
    in
    let info = if is_module then fpath :: acc.info else acc.info in
    let objinfo = if is_cma then fpath :: acc.objinfo else acc.objinfo in
    { copy; info; objinfo }
  in
  let actions =
    List.fold_right foldfn files { copy = []; info = []; objinfo = [] }
  in
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

let run _ (universes : (string * string) list) =
  let get_universe =
    match universes with
    | [] ->
        let id = ref 0 in
        Printf.eprintf
          "Warning: No universes have been specified: will generate dummy \
           universes\n\
           %!";
        fun pkg ->
          let universe = string_of_int !id in
          incr id;
          Some (universe, pkg.Opam.name, pkg.version)
    | _ -> (
        fun pkg ->
          try Some (List.assoc pkg.Opam.name universes, pkg.name, pkg.version)
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
    List.map
      (fun ((_, pkg_name, _) as package) ->
        (package, Opam.pkg_contents pkg_name))
      packages
  in
  List.iter
    (fun (package, files) -> process_package root package files)
    pkg_contents;
  List.iter
    (fun package ->
      let _, name, version = package in
      match Opam.opam_file name version with
      | Some lines ->
          let dest = Package.prep_path package in
          Util.write_file Fpath.(dest / "opam") lines
      | None -> ())
    packages
