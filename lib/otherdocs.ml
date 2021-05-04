(* otherdocs *)

(* Copy the other docs into the version directory *)
let copy version docs opam_file =
  let dir = Fpath.(Mld.link_dir version / version.name) in
  let copy src =
    let _, n = Fpath.split_base src in
    let dst = Fpath.(dir // n) in
    match Util.copy src dst with Ok _ -> [ dst ] | Error _ -> []
  in
  let opam_file =
    match opam_file with
    | Some f -> ( match copy f with dst :: _ -> Some dst | [] -> None)
    | None -> None
  in
  (List.map copy docs |> List.concat, opam_file)
