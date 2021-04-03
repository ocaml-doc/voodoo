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
  match res with
  | Ok l ->
      Format.eprintf "Found %d pages\n%!" (List.length l);
      l
  | Error _ -> []

let compile _package version package_mlds =
  if List.length package_mlds = 0 then (
    Format.eprintf "No children\n%!";
    [])
  else (
    Format.eprintf "package mlds: [%s]\n%!"
      (String.concat "," (List.map Fpath.to_string package_mlds));
    let cwd = Fpath.v "." in
    let children =
      List.map
        (fun p ->
          let _, n = Fpath.split_base p in
          Odoc.CPage (Fpath.to_string (Fpath.rem_ext n)))
        package_mlds
    in
    let docs = Mld.v cwd "docs" (Some version) children "{0 Docs}" in
    ignore (Mld.compile docs);
    let package_mldvs = List.map (fun p -> Mld.of_fpath docs p) package_mlds in
    List.iter Mld.compile package_mldvs;
    package_mldvs)

let include_paths mlds =
  let all_mlds =
    match mlds with { Mld.parent = Some p; _ } :: _ -> p :: mlds | _ -> mlds
  in
  List.fold_left
    (fun acc mld -> Fpath.Set.add (Mld.output_dir mld) acc)
    Fpath.Set.empty all_mlds
