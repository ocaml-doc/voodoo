(* Prep *)
open Meta


type actions = { copy : (Fpath.t * Fpath.t) list; info : Fpath.t list }

type source_info = {
  package : package;
  path : Fpath.t;
  name : string;
  digest : Digest.t;
  deps : Odoc.compile_dep list
}


let process_package :
    Fpath.t -> package -> Fpath.t list -> source_info list
    =
 fun root package files ->
  let dest = package_path package in
  let foldfn fpath acc =
    let is_in_doc_dir =
      match Fpath.segs fpath with "doc" :: _ -> true | _ -> false
    in
    let _, filename = Fpath.split_base fpath in
    let ext = Fpath.get_ext filename in
    let no_ext = Fpath.rem_ext filename in
    let is_module = List.mem ext [ ".cmt"; ".cmti"; ".cmi" ] in
    let is_opam = filename = Fpath.v "opam" || ext = ".opam" in
    let do_copy =
      is_in_doc_dir || is_module || is_opam
      || List.mem no_ext (List.map Fpath.v [ "META"; "dune-package" ])
    in
    let copy =
      if do_copy then Fpath.(root // fpath, dest // fpath) :: acc.copy
      else acc.copy
    in
    let info = if is_module then fpath :: acc.info else acc.info in
    { copy; info }
  in
  let actions = List.fold_right foldfn files { copy = []; info = [] } in
  List.iter
    (fun (src, dst) ->
      let dir, _ = Fpath.split_base dst in
      Util.mkdir_p dir;
      Util.cp (Fpath.to_string src) (Fpath.to_string dst))
    actions.copy;
  List.fold_right
    (fun path acc ->
      match Odoc.compile_deps Fpath.(root // path) with
      | Some (name, digest, deps) ->
          {package; path; name; digest; deps} :: acc
      | None -> acc)
    actions.info [];;

let calculate_deps package source_infos =
  let modules = List.filter (fun si -> si.package = package) source_infos in
  let (packages, intra) =
    List.fold_left (fun (inter,intra) si ->
      let deps = si.deps in
      let (inter, intra') =
        List.fold_left (fun (inter, intra) dep ->
          let digest = dep.Odoc.c_digest in
          try
            let dep_si = List.find (fun si -> si.digest = digest) source_infos in
            if dep_si.package = package
            then (inter, dep_si.digest :: intra)
            else (
              let (dir, _) = Fpath.split_base dep_si.path in
              let inter_dep = (dep_si.package, dir) in
              let inter = 
                if List.mem inter_dep inter then inter else inter_dep :: inter
              in
              (inter, intra))
            with Not_found ->
              Format.eprintf "Not found handling %a (digest %s, module %s)\n%!" Fpath.pp si.path digest dep.Odoc.c_unit_name;
              (inter, intra)
          ) (inter,[]) deps
      in
      let intra_dep = { source_file = si.path; intra_deps = intra'} in
      (inter, intra_dep :: intra)) ([],[]) modules
  in
  let order path = 
    let ext = Fpath.get_ext path in
    match ext with
    | ".cmti" -> 0
    | ".cmt" -> 1
    | ".cmi" -> 2
    | _ -> 3
  in
  let hashtbl = Hashtbl.create 100 in
  List.iter (fun si ->
      if Hashtbl.mem hashtbl si.digest
      then ()
      else begin
        let files =
          List.filter (fun si' -> si.digest = si'.digest) source_infos |>
          List.map (fun si -> si.path) |>
          List.sort (fun x y -> compare (order x) (order y))
        in
        Hashtbl.add hashtbl si.digest files
      end
      ) modules;
  
  {modules = hashtbl; intra; packages}

let run _whitelist _ =
  let packages = Opam.all_opam_packages () in
  let packages =
    List.filter
      (fun pkg -> pkg.Opam.name <> "ocaml-secondary-compiler")
      packages
  in
  let packages = List.map (fun opam_package ->
    let _, universe = Universe.Current.dep_universe opam_package.Opam.name in
    (universe.Universe.id, opam_package.name, opam_package.version)
    ) packages in
  let root = Opam.prefix () |> Fpath.v in
  let pkg_contents =
    List.map (fun ((_,pkg_name,_) as package) -> (package, Opam.pkg_contents pkg_name)) packages
  in
  let (source_infos : source_info list) =
    List.fold_right
    (fun (package, files) acc ->
      (process_package root package files) @ acc)
    pkg_contents [] in
  let metas =
    List.map (fun package ->
      let deps = calculate_deps package source_infos in
      { package; deps; libraries = []}) packages in
  List.iter Meta.save metas;
  Universe.Current.save prep_path;;
