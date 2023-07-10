open Bos

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

let run_silent cmd =
  match OS.Cmd.(run_out ~err:err_stderr cmd |> to_null) with
  | Ok () -> ()
  | Error _ -> Logs.err (fun m -> m "Command failed: %a%!" Bos.Cmd.pp cmd)

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

let write_file filename lines =
  let dir = fst (Fpath.split_base filename) in
  mkdir_p dir;
  let oc = open_out (Fpath.to_string filename) in
  List.iter (fun line -> Printf.fprintf oc "%s\n" line) lines;
  close_out oc

let cp src dst = run_silent Cmd.(v "cp" % p src % p dst)
let mv src dst = run_silent Cmd.(v "mv" % p src % p dst)

module O = struct
  let to_result ~none = function Some x -> Ok x | None -> Error none
end

module R = struct
  open Bos_setup.R.Infix

  let combine_list lx =
    List.fold_left
      (fun acc x ->
        acc >>= fun acc ->
        x >>| fun x -> x :: acc)
      (Ok []) lx

  let iter_list ~f lx =
    List.fold_left (fun acc x -> acc >>= fun () -> f x) (Ok ()) lx
end
