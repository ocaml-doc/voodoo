(* util.ml *)

let lines_of_channel ic =
  let rec inner acc =
    try
      let l = input_line ic in
      inner (l::acc)
    with End_of_file -> List.rev acc
  in inner []

let lines_of_process prog args =
  let ic = Unix.open_process_in (Filename.quote_command prog args) in
  Fun.protect
    ~finally:(fun () -> ignore (Unix.close_process_in ic))
    (fun () -> lines_of_channel ic)

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
  assert (lines_of_process "cp" [ src; dst ] = [])

let list_dir p =
  match Sys.readdir (Fpath.to_string p) with
  | exception Sys_error _ -> []
  | names ->
      Array.sort String.compare names;
      Array.map (fun n -> (n, Fpath.( / ) p n)) names |> Array.to_list

let mv src ~dst =
  let src = Fpath.to_string src and dst = Fpath.to_string dst in
  Sys.rename src dst

let group_by (type a) ~(cmp : a -> a -> int) (key : 'b -> a) lst =
  let module M = Map.Make (struct
    type t = a

    let compare = cmp
  end) in
  let to_lst = function Some v -> v | None -> [] in
  let multi_add acc b = M.update (key b) (fun v -> Some (b :: to_lst v)) acc in
  List.fold_left multi_add M.empty lst |> M.bindings
