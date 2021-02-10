(* util.ml *)

let ( / ) = Fpath.( / )

let fpf = Printf.fprintf

let lines_of_channel ic =
  let rec inner acc =
    try
      let l = input_line ic in
      inner (l :: acc)
    with End_of_file -> List.rev acc
  in
  inner []

let lines_of_process prog args =
  let ic = Unix.open_process_in (Filename.quote_command prog args) in
  Fun.protect
    ~finally:(fun () -> ignore (Unix.close_process_in ic))
    (fun () -> lines_of_channel ic)

let rec mkdir_p d =
  let d_str = Fpath.to_string d in
  if not (Sys.file_exists d_str) then (
    mkdir_p (Fpath.parent d);
    Unix.mkdir d_str 0o755 )

let write_file p f =
  Format.eprintf "Create '%a'\n%!" Fpath.pp p;
  mkdir_p (Fpath.parent p);
  let out = open_out (Fpath.to_string p) in
  Fun.protect ~finally:(fun () -> close_out out) (fun () -> f out)

let time txt fn a =
  let start_time = Unix.gettimeofday () in
  let result = fn a in
  let end_time = Unix.gettimeofday () in
  Format.eprintf "%s: %f\n%!" txt (end_time -. start_time);
  result

let is_dir (_, p) = Sys.is_directory (Fpath.to_string p)

(** Returns both the basename and the path of each files. *)
let list_dir p =
  match Sys.readdir (Fpath.to_string p) with
  | exception Sys_error _ -> []
  | names ->
      Array.sort String.compare names;
      Array.map (fun n -> (n, Fpath.( / ) p n)) names |> Array.to_list

let rec list_dir_rec acc p =
  list_dir p
  |> List.fold_left
       (fun acc ((_, f) as f') ->
         if is_dir f' then list_dir_rec acc f else f :: acc)
       acc

let list_dir_rec p = list_dir_rec [] p

(** Parent directories of [dst] created automatically if needed. *)
let mv src ~dst =
  Format.eprintf "Move '%a' to '%a'\n%!" Fpath.pp src Fpath.pp dst;
  mkdir_p (Fpath.parent dst);
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
