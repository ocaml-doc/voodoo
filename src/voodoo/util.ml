(* util.ml *)
open Bos
module Result = Bos_setup.R
open Result.Infix

let is_hidden s =
  let len = String.length s in
  let rec aux i =
    if i > len - 2 then false
    else if s.[i] = '_' && s.[i + 1] = '_' then true
    else aux (i + 1)
  in
  aux 0

let lines_of_channel ic =
  let rec inner acc =
    try
      let l = input_line ic in
      inner (l :: acc)
    with End_of_file -> List.rev acc
  in
  inner []

let lines_of_process cmd =
  match OS.Cmd.(run_out ~err:err_stderr cmd |> to_lines) with
  | Ok x -> x
  | Error (`Msg e) -> failwith ("Error: " ^ e)

let mkdir_p d =
  let segs =
    Fpath.segs (Fpath.normalize d) |> List.filter (fun s -> String.length s > 0)
  in
  let _ =
    List.fold_left
      (fun path seg ->
        let d = Fpath.(path // v seg) in
        try
          Unix.mkdir (Fpath.to_string d) 0o755;
          d
        with
        | Unix.Unix_error (Unix.EEXIST, _, _) -> d
        | exn -> raise exn)
      (Fpath.v ".") segs
  in
  ()

let copy src dst = Bos.OS.File.read src >>= Bos.OS.File.write dst
