(* Pull out error log *)

type t = string list option

let find package =
  let path = Fpath.(Package.prep_path package / "opam.err.log") in
  try
    let ic = open_in (Fpath.to_string path) in
    let result = Util.lines_of_channel ic in
    close_in ic;
    Format.printf "Found error log (%d bytes)\n%!" (List.fold_left (fun sum l -> sum + String.length l + 1) 0 result);
    Some result
  with _ -> None
