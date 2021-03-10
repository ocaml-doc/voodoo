(* Odoc *)
open Listm

type compile_dep = { c_unit_name : string; c_digest : Digest.t }
(** The name and optional digest of a dependency. Modules compiled with --no-alias-deps don't have
    digests for purely aliased modules *)

type link_dep = {
  l_package : string;
  l_name : string;
  l_digest : Digest.t;
  l_version : string;
  l_universe : string option;
}

let pp_link_dep fmt l =
  Format.fprintf fmt "{ %s %s %s %s}" l.l_package l.l_name l.l_version
    (match l.l_universe with Some u -> Printf.sprintf "(%s)" u | None -> "")

let lines_of_process p =
  let ic = Unix.open_process_in p in
  let lines =
    Util.protect
      ~finally:(fun () -> ignore (Unix.close_process_in ic))
      (fun () ->
        let rec inner acc =
          try
            let l = input_line ic in
            inner (l :: acc)
          with End_of_file -> List.rev acc
        in
        inner [])
  in
  lines

let compile_deps version file =
  let deps_file = Fpath.add_ext "deps" file in
  let process_line line =
    match Astring.String.cuts ~sep:" " line with
    | [ c_unit_name; c_digest ] -> [ { c_unit_name; c_digest } ]
    | _ -> []
  in
  let exists = Sys.file_exists (Fpath.to_string deps_file) in
  let lines =
    if exists then (
      let ic = open_in (Fpath.to_string deps_file) in
      let lines = Util.lines_of_channel ic in
      close_in ic;
      lines)
    else
      let home = Sys.getenv "HOME" in
      let lines =
        lines_of_process
          (Format.asprintf "%s/.opam/%s/bin/odoc compile-deps %a" home version
             Fpath.pp file)
      in
      let tmp_file = Fpath.to_string (Fpath.add_ext "tmp" deps_file) in
      let oc = open_out tmp_file in
      List.iter (fun l -> Printf.fprintf oc "%s\n" l) lines;
      close_out oc;
      Unix.rename tmp_file (Fpath.to_string deps_file);
      lines
  in
  lines >>= process_line

let link_deps dir =
  let deps_file = Fpath.(dir / "deps") in
  let process_line line =
    Format.eprintf "line: %s\n%!" line;
    match Astring.String.cuts ~sep:" " line with
    | [ parent_path; l_name; l_digest ] -> (
        match Astring.String.cuts ~sep:"/" parent_path with
        | "universes" :: universe :: l_package :: l_version :: _ ->
            [
              {
                l_package;
                l_name;
                l_digest;
                l_version;
                l_universe = Some universe;
              };
            ]
        | "packages" :: l_package :: l_version :: _ ->
            [ { l_package; l_name; l_digest; l_version; l_universe = None } ]
        | _ -> [])
    | _ -> []
  in
  let exists = Sys.file_exists (Fpath.to_string deps_file) in
  let lines =
    if exists then (
      let ic = open_in (Fpath.to_string deps_file) in
      let lines = Util.lines_of_channel ic in
      close_in ic;
      lines)
    else
      let lines =
        lines_of_process (Format.asprintf "odoc link-deps %a" Fpath.pp dir)
      in
      let tmp_file = Fpath.to_string (Fpath.add_ext "tmp" deps_file) in
      let oc = open_out tmp_file in
      List.iter (fun l -> Printf.fprintf oc "%s\n" l) lines;
      close_out oc;
      Unix.rename tmp_file (Fpath.to_string deps_file);
      lines
  in
  lines >>= process_line

let generate_targets odocl ty =
  match ty with
  | `Html ->
      lines_of_process
        (Format.asprintf "odoc html-targets %a --output-dir html" Fpath.pp odocl)
  | `Latex ->
      lines_of_process
        (Format.asprintf "odoc latex-targets %a --output-dir latex" Fpath.pp
           odocl)
  | `Man ->
      lines_of_process
        (Format.asprintf "odoc man-targets %a --output-dir man" Fpath.pp odocl)
