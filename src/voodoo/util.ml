(* util.ml *)
open Bos

let get_ok = function Result.Ok x -> x | Error _ -> failwith "get_ok: Not OK"

let is_hidden s =
  let len = String.length s in
  let rec aux i =
    if i > len - 2 then false
    else if s.[i] = '_' && s.[i + 1] = '_' then true
    else aux (i + 1)
  in
  aux 0

(* Not present on 4.02.3 *)
let protect ~finally f =
  try
    let result = f () in
    finally ();
    result
  with e ->
    finally ();
    raise e

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

let copy src dst =
  let open Result in
  let ( >>= ) m f = match m with Ok x -> f x | Error y -> Error y in
  Bos.OS.File.read src >>= Bos.OS.File.write dst
