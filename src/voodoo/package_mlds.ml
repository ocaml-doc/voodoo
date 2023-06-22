(* package mlds *)

let find package =
  let path = Fpath.(Package.prep_path package / "doc" / package.name) in
  let res =
    Bos.OS.Dir.fold_contents ~elements:`Files ~dotfiles:false
      (fun p (mlds, other) ->
        match Fpath.segs p |> List.rev with
        | _ :: "odoc-pages" :: _ when Fpath.get_ext p = ".mld" ->
            (p :: mlds, other)
        | _ -> (mlds, p :: other))
      ([], []) path
  in
  match res with
  | Ok (mlds, other) ->
      Format.eprintf "Found %d mld pages and %d other pages\n%!"
        (List.length mlds) (List.length other);
      (mlds, other)
  | Error _ ->
      Format.eprintf "Found no other pages\n%!";
      ([], [])

let compile _package version package_mlds =
  if List.length package_mlds = 0 then (
    Format.eprintf "No children\n%!";
    [])
  else (
    Format.eprintf "package mlds: [%s]\n%!"
      (String.concat "," (List.map Fpath.to_string package_mlds));
    let package_mlds =
      List.filter (fun p -> Fpath.basename p <> "index.mld") package_mlds
    in
    let package_mldvs =
      List.map (fun p -> Mld.of_fpath version p) package_mlds
    in
    List.iter Mld.compile package_mldvs;
    package_mldvs)

let include_paths mlds =
  let all_mlds =
    match mlds with { Mld.parent = Some p; _ } :: _ -> p :: mlds | _ -> mlds
  in
  List.fold_left
    (fun acc mld -> Fpath.Set.add (Mld.compile_dir mld) acc)
    Fpath.Set.empty all_mlds
