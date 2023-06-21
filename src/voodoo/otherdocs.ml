(* otherdocs *)

let convert_org_to_md src =
  let dst = Filename.remove_extension src ^ ".md" in
  let cmd =
    Bos.Cmd.(
      v "pandoc" % "--wrap" % "none" % "--from" % "org" % "--to" % "markdown"
      % "-o" % dst % src)
  in
  let () =
    match Bos.OS.Cmd.run cmd with
    | Ok () -> ()
    | Error (`Msg err) -> failwith err
  in
  dst

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
    match Fpath.get_ext src with
    | ".org" -> (
        let src_md =
          match Fpath.of_string (convert_org_to_md (Fpath.to_string src)) with
          | Ok s -> s
          | Error (`Msg err) -> failwith err
        in
        let dst_md = Fpath.set_ext ".md" dst in
        match (Util.copy src dst, Util.copy src_md dst_md) with
        | Ok _, Ok _ -> [ dst; dst_md ]
        | Ok _, Error _ -> [ dst ]
        | Error _, Ok _ -> [ dst; dst_md ]
        | Error _, Error _ -> [])
    | _ -> ( match Util.copy src dst with Ok _ -> [ dst ] | Error _ -> [])
  in
  let opam_file =
    match opam_file with
    | Some f -> ( match copy f with dst :: _ -> Some dst | [] -> None)
    | None -> None
  in
  (List.map copy docs |> List.concat, opam_file)
