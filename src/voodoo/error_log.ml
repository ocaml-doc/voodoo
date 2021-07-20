(* Pull out error log *)

type t = string list option

let find package =
  let path = Fpath.(Package.prep_path package / "opam.err.log") in
  try
    let ic = open_in (Fpath.to_string path) in
    let result = Some (Util.lines_of_channel ic) in
    close_in ic;
    result
  with _ -> None
