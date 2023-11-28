let find package =
  let path = Package.prep_path package in
  let res =
    Bos.OS.Dir.fold_contents ~elements:`Files ~dotfiles:false ~traverse:`None
      (fun p js -> if Fpath.has_ext "js" p then p :: js else js)
      [] path
  in
  match res with Ok js -> js | Error _ -> []

let copy files dest_dir =
  let () =
    match Bos.OS.Dir.create dest_dir with
    | Ok _ -> ()
    | Error (`Msg m) ->
        Format.eprintf "Failed to create destination dir: %s\n%!" m;
        ()
  in
  let copy src =
    let dest_file = Fpath.(dest_dir / basename src) in
    ignore (Util.copy src dest_file)
  in
  List.iter copy files
