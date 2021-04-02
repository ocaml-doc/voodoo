(* package mlds *)

let find package =
  let path =
    Fpath.(
      Package.prep_path package / "doc" / Package.name package / "odoc-pages")
  in
  let res =
    Bos.OS.Dir.fold_contents ~dotfiles:true
      (fun p acc -> if Fpath.get_ext p = ".mld" then p :: acc else acc)
      [] path
  in
  match res with Ok l -> l | Error _ -> []

let compile _package version package_mlds =
  let cwd = Fpath.v "." in
  let children =
    List.map (fun p -> Odoc.CPage (Fpath.to_string p)) package_mlds
  in
  let docs = Mld.v cwd "docs" (Some version) children "{0 Docs}" in
  ignore (Mld.compile docs);
  let package_mldvs = List.map (fun p -> Mld.of_fpath docs p) package_mlds in
  List.iter Mld.compile package_mldvs
