(* util.ml *)
open Bos

let get_ok = function | Result.Ok x -> x | Error _ -> failwith "get_ok: Not OK"

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
      inner (l::acc)
    with End_of_file -> List.rev acc
  in inner []

let lines_of_process cmd =
  match OS.Cmd.(run_out ~err:err_null cmd |> to_lines) with
  | Ok x -> x
  | Error (`Msg e) -> failwith ("Error: " ^ e)

let mkdir_p d =
  let segs = Fpath.segs (Fpath.normalize d) |> List.filter (fun s -> String.length s > 0) in
  let _ = List.fold_left (fun path seg ->
  let d = Fpath.(path // v seg) in
    try Unix.mkdir (Fpath.to_string d) 0o755; d with
    | Unix.Unix_error (Unix.EEXIST, _, _) -> d
    | exn -> raise exn) (Fpath.v ".") segs in
  ()

let write_file filename lines =
  let dir = fst (Fpath.split_base filename) in
  mkdir_p dir;
  let oc = open_out (Fpath.to_string filename) in
  List.iter (fun line -> Printf.fprintf oc "%s\n" line) lines;
  close_out oc

let time txt fn a =
  let start_time = Unix.gettimeofday () in
  let result = fn a in
  let end_time = Unix.gettimeofday () in
  Format.eprintf "%s: %f\n%!" txt (end_time -. start_time);
  result

let cp src dst =
  Format.eprintf "%s -> %s\n%!" src dst;
  assert (lines_of_process Cmd.(v "cp" % src % dst) = [])
