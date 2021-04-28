(* otherdocs *)

let find package =
  let path = Fpath.(Package.prep_path package / "doc" / Package.name package) in
  let res =
    Bos.OS.Dir.fold_contents ~dotfiles:false
      (fun p acc -> if not (Fpath.is_dir_path p) then p :: acc else acc)
      [] path
  in
  match res with
  | Ok l ->
      Format.eprintf "Found %d non-mld pages\n%!" (List.length l);
      l
  | Error _ -> []

(* Copy the other docs into the version directory *)
let copy version docs =
  let dir = Mld.output_dir version in
  let copy src =
    let _, n = Fpath.split_base src in
    let dst = Fpath.(dir // n) in
    Util.copy src dst
  in
  List.map copy docs
