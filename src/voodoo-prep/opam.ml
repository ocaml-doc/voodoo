(* opam *)
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

let lib () =
  Util.lines_of_process Cmd.(opam % "var" % "--switch" % get_switch () % "lib")
  |> List.hd

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

let pkg_contents pkg =
  let prefix = Fpath.v (prefix ()) in
  let changes_file =
    Format.asprintf "%a/.opam-switch/install/%s.changes" Fpath.pp prefix pkg
  in
  let ic = open_in changes_file in
  let changed = OpamFile.Changes.read_from_channel ic in
  close_in ic;
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
  List.map (fun path -> Fpath.(v path)) added

let opam_file name version =
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
