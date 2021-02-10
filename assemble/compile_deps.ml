open Builder
open Util

let query p =
  let process_line line =
    match Astring.String.cuts ~sep:" " line with
    | [ c_name; c_digest ] -> Some (c_name, c_digest)
    | _ -> None
  in
  Util.lines_of_process "odoc" [ "compile-deps"; Fpath.to_string p ]
  |> List.filter_map process_line

module DigestMap = Map.Make (Digest)

let compute paths =
  let deps_and_digest f =
    (* Query [odoc compile-deps]. *)
    if not (Fpath.mem_ext [ ".cmti"; ".cmt"; ".cmi" ] f) then None
    else
      let unit_name =
        String.capitalize_ascii Fpath.(to_string (rem_ext (base f)))
      in
      match List.partition (fun (name, _) -> name = unit_name) (query f) with
      | [ self ], deps -> Some (snd self, List.map snd deps)
      | _ ->
          Format.eprintf "Failed to find digest for self (%a)\n%!" Fpath.pp f;
          None
  in
  let deps_and_digests = List.map deps_and_digest paths in
  let inputs_by_digest =
    List.fold_left2
      (fun acc f -> function Some (digest, _) -> DigestMap.add digest f acc
        | None -> acc)
      DigestMap.empty paths deps_and_digests
  in
  let find_dep dep = DigestMap.find_opt dep inputs_by_digest in
  let deps_tbl = Deps.create () in
  List.iter2
    (fun target -> function
      | Some (_, deps) ->
          Deps.add deps_tbl target (List.filter_map find_dep deps) | None -> ())
    paths deps_and_digests;
  deps_tbl

(** Scan a directory and compute the dependencies of every object files. *)
let of_dir_rec root = list_dir_rec root |> compute
