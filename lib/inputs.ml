open Listm

let with_open_dir d f =
  let dh = Unix.opendir (Fpath.to_string d) in
  Util.protect
    ~finally:(fun () -> Unix.closedir dh)
    (fun () ->
      f dh)

let filter_dots = function
| "." -> []
| ".." -> []
| e -> [e]
  
let contents dir =
  with_open_dir dir (fun dh ->
    let rec loop acc =
      try loop (Unix.readdir dh :: acc) with _ -> acc
    in loop []) >>= filter_dots >>= fun x -> [Fpath.(dir / x)]

let filter pred item = if pred item then [item] else []

let is_dir x =
  try Unix.((stat (Fpath.to_string x)).st_kind = S_DIR) with _ -> false

let has_ext exts f =
  List.exists (fun suffix -> Fpath.has_ext suffix f) exts

let rec find_files extensions base_dir =
  let items = contents base_dir in
  let dirs = items >>= filter is_dir in
  let cmis = items >>= filter (has_ext extensions) |> List.map Fpath.rem_ext |> setify in
  let subitems = dirs >>= find_files extensions in
  cmis @ subitems
