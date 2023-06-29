(* otherdocs *)

(* Copy the other docs into the version directory *)
let copy version docs opam_file =
  let dir = Fpath.(Mld.link_dir version / version.name) in
  let copy src =
    let _, n = Fpath.split_base src in
    let _ =
      match Bos.OS.Dir.create dir with
      | Ok _ -> ()
      | Error (`Msg m) ->
          Format.eprintf "Failed to create destination dir: %s\n%!" m;
          ()
    in
    let dst = Fpath.(dir // n) in
    Format.eprintf "dst: %a\n%!" Fpath.pp dst;
    match Util.copy src dst with Ok _ -> [ dst ] | Error _ -> []
  in
  let opam_file =
    match opam_file with
    | Some f -> ( match copy f with dst :: _ -> Some dst | [] -> None)
    | None -> None
  in
  (List.map copy docs |> List.concat, opam_file)
