open Bos

let opam = Cmd.v "opam"
let switch = ref None

type package = { name : string; version : string }

let rec get_switch () =
  match !switch with
  | None ->
      let cur_switch =
        Util.lines_of_process Cmd.(opam % "switch" % "show") |> List.hd
      in
      switch := Some cur_switch;
      get_switch ()
  | Some s -> s

let prefix () =
  Util.lines_of_process
    Cmd.(opam % "var" % "--switch" % get_switch () % "prefix")
  |> List.hd

let deps_of_opam_result line =
  match Astring.String.fields ~empty:false line with
  | [ name; version ] -> [ { name; version } ]
  | _ -> []

let all_opam_packages () =
  Util.lines_of_process
    Cmd.(
      opam % "list" % "--switch" % get_switch () % "--columns=name,version"
      % "--color=never" % "--short")
  |> List.map deps_of_opam_result
  |> List.flatten

let pkg_contents { Package.name; _ } =
  let prefix = Fpath.v (prefix ()) in
  let changes_file =
    Format.asprintf "%a/.opam-switch/install/%s.changes" Fpath.pp prefix name
  in
  let file = OpamFilename.raw changes_file in
  let filename =
    OpamFile.make @@ OpamFilename.raw @@ Filename.basename changes_file
  in
  let changed =
    OpamFilename.with_contents
      (fun str ->
        OpamFile.Changes.read_from_string ~filename
        @@
        (* Field [opam-version] is invalid in [*.changes] files, displaying a warning. *)
        if OpamStd.String.starts_with ~prefix:"opam-version" str then
          match OpamStd.String.cut_at str '\n' with
          | Some (_, str) -> str
          | None -> assert false
        else str)
      file
  in
  let added =
    OpamStd.String.Map.fold
      (fun file x acc ->
        match x with
        | OpamDirTrack.Added _ -> (
            try
              if not @@ Sys.is_directory Fpath.(to_string (prefix // v file))
              then file :: acc
              else acc
            with _ ->
              acc
              (* dose (and maybe others) sometimes creates a symlink to something that doesn't exist *)
            )
        | _ -> acc)
      changed []
  in
  List.map Fpath.v added

let opam_file { Package.name; version; _ } =
  let prefix = Fpath.v (prefix ()) in
  let opam_file =
    Format.asprintf "%a/.opam-switch/packages/%s.%s/opam" Fpath.pp prefix name
      version
  in
  try
    let ic = open_in opam_file in
    let lines = Util.lines_of_channel ic in
    close_in ic;
    Some lines
  with _ -> None
