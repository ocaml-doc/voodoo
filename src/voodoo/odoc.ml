(* Odoc *)

type compile_dep = { c_unit_name : string; c_digest : string }

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

let compile_deps file =
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
      let odoc = Bos.Cmd.v "odoc" in
      let lines =
        Util.lines_of_process
          Bos.Cmd.(odoc % "compile-deps" % Fpath.to_string file)
      in
      let tmp_file = Fpath.to_string (Fpath.add_ext "tmp" deps_file) in
      let oc = open_out tmp_file in
      List.iter (fun l -> Printf.fprintf oc "%s\n" l) lines;
      close_out oc;
      Unix.rename tmp_file (Fpath.to_string deps_file);
      lines
  in
  let deps = Compat.List.concat_map process_line lines in
  let _, lname = Fpath.(split_base (rem_ext file)) in
  let name = Astring.String.Ascii.capitalize (Fpath.to_string lname) in
  match List.partition (fun d -> d.c_unit_name = name) deps with
  | self :: _, deps ->
      let digest = self.c_digest in
      Some (name, digest, deps)
  | _ ->
      Format.eprintf "Failed to find digest for self (%s)\n%!" name;
      None

let link_deps dir =
  let deps_file = Fpath.(dir / "deps") in
  let process_line line =
    Format.eprintf "line: %s\n%!" line;
    match Astring.String.cuts ~sep:" " line with
    | [ parent_path; l_name; l_digest ] -> (
        match Astring.String.cuts ~sep:"/" parent_path with
        | "u" :: universe :: l_package :: l_version :: _ ->
            [
              {
                l_package;
                l_name;
                l_digest;
                l_version;
                l_universe = Some universe;
              };
            ]
        | "p" :: l_package :: l_version :: _ ->
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
        Util.lines_of_process
          Bos.Cmd.(v "odoc" % "link-deps" % Fpath.to_string dir)
      in
      let tmp_file = Fpath.to_string (Fpath.add_ext "tmp" deps_file) in
      let oc = open_out tmp_file in
      List.iter (fun l -> Printf.fprintf oc "%s\n" l) lines;
      close_out oc;
      Unix.rename tmp_file (Fpath.to_string deps_file);
      lines
  in
  Compat.List.concat_map process_line lines

let generate_targets odocl ty =
  let targets lang =
    Bos.Cmd.(
      v "odoc" % (lang ^ "-targets") % Fpath.to_string odocl % "--output-dir"
      % lang)
  in
  match ty with
  | `Html -> Util.lines_of_process (targets "html")
  | `Latex -> Util.lines_of_process (targets "latex")
  | `Man -> Util.lines_of_process (targets "man")

type child =
  | CModule of string (* module name, e.g. 'String' *)
  | CPage of string
(* page name, e.g. 'packages' *)

let compile ?parent ?output path ~includes ~children =
  let cmd = Bos.Cmd.(v "odoc" % "compile" % Fpath.to_string path) in
  let cmd =
    match output with
    | Some fpath -> Bos.Cmd.(cmd % "-o" % Fpath.to_string fpath)
    | None -> cmd
  in
  let cmd =
    match parent with
    | Some str -> Bos.Cmd.(cmd % "--parent" % Printf.sprintf "\"%s\"" str)
    | None -> cmd
  in
  let cmd =
    Fpath.Set.fold
      (fun i c -> Bos.Cmd.(c % "-I" % Fpath.to_string i))
      includes cmd
  in
  let cmd =
    List.fold_left
      (fun cmd c ->
        let arg =
          match c with
          | CModule m -> "module-" ^ m
          | CPage p -> "page-\"" ^ p ^ "\""
        in
        Bos.Cmd.(cmd % "--child" % arg))
      cmd children
  in
  Format.eprintf "compile command: %a\n%!" Bos.Cmd.pp cmd;
  Util.lines_of_process cmd

let link path ~includes ~output =
  let cmd =
    Bos.Cmd.(
      v "odoc" % "link" % Fpath.to_string path % "-o" % Fpath.to_string output)
  in
  let cmd =
    Fpath.Set.fold
      (fun i c -> Bos.Cmd.(c % "-I" % Fpath.to_string i))
      includes cmd
  in
  (* Format.eprintf "link: cmd=%a\n%!" Bos.Cmd.pp cmd; *)
  Util.lines_of_process cmd

let html output path =
  let cmd =
    Bos.Cmd.(
      v "odoc" % "html-generate" % "--indent" % Fpath.to_string path % "-o"
      % Fpath.to_string output)
  in
  Util.lines_of_process cmd |> ignore

let voodoo_gen output name version =
  let cmd =
    Bos.Cmd.(
      v "voodoo-gen" % "pkgver" % "-o" % Fpath.to_string output % "-n" % name
      % "--pkg-version" % version)
  in
  Format.eprintf "Odoc.gen: %a\n%!" Bos.Cmd.pp cmd;
  Util.lines_of_process cmd |> ignore
