(* opam *)
open Bos

let opam = Cmd.v "opam"
let switch = ref None

type package = { name : string; version : string }

let of_string str =
  match Astring.String.cut ~sep:"." str with
  | Some (name, version) -> Some { name; version }
  | _ -> None

let rec get_switch () =
  match !switch with
  | None ->
      let cur_switch =
        Util.lines_of_process Cmd.(opam % "switch" % "show") |> List.hd
      in
      switch := Some cur_switch;
      get_switch ()
  | Some s -> s

let pp_package fmt package =
  Format.fprintf fmt "%s.%s" package.name package.version

module S = Set.Make (struct
  type t = package

  let compare x y = compare x y
end)

let deps_of_opam_result line =
  match Astring.String.fields ~empty:false line with
  | [ name; version ] -> [ { name; version } ]
  | _ -> []

let dependencies package =
  if package.name = "ocaml" then
    [ { name = "ocaml-base-compiler"; version = package.version } ]
  else
    let package' = Format.asprintf "%a" pp_package package in
    let args =
      Util.lines_of_process
        Cmd.(
          opam % "list" % "--switch" % get_switch () % "--required-by"
          % package' % "--columns=name,version" % "--color=never" % "--short")
    in
    Compat.List.concat_map deps_of_opam_result args

let all_opam_packages () =
  let args =
    Util.lines_of_process
      Cmd.(
        opam % "list" % "--switch" % get_switch () % "--columns=name,version"
        % "--color=never" % "--short")
  in
  Compat.List.concat_map deps_of_opam_result args

open Result

let bind r f = match r with Ok v -> f v | Error _ as e -> e
let join = function Ok r -> r | Error _ as e -> e
let ( >>= ) = bind

let process_file f =
  let ic = open_in (Fpath.to_string f) in
  let result = OpamFile.OPAM.read_from_channel ic in
  close_in ic;
  Ok result

let find package =
  let path = Package.prep_path package in
  Bos.OS.Dir.fold_contents ~dotfiles:true
    (fun p acc ->
      let _, name = Fpath.split_base p in
      if name = Fpath.v "opam" then Ok p else acc)
    (Error (`Msg "No opam file found"))
    path
  |> join
