open Cmdliner

[@@@ocaml.warning "-3"]

module Fpath = struct
  include Fpath

  let t_of_yojson x = Fpath.v @@ string_of_yojson x
  let yojson_of_t x = yojson_of_string @@ Fpath.to_string x
end

type otherdocs = {
  readme : Fpath.t list;
  license : Fpath.t list;
  changes : Fpath.t list;
  others : Fpath.t list;
}
[@@deriving yojson]

type status = { failed : bool; otherdocs : otherdocs } [@@deriving yojson]

let docs = "ARGUMENTS"

let convert_directory ?(create = false) () :
    Odoc_odoc.Fs.Directory.t Arg.converter =
  let dir_parser, dir_printer = Arg.string in
  let odoc_dir_parser str =
    let () = if create then Odoc_odoc.Fs.Directory.(mkdir_p (of_string str)) in
    match dir_parser str with
    | `Ok res -> `Ok (Odoc_odoc.Fs.Directory.of_string res)
    | `Error e -> `Error e
  in
  let odoc_dir_printer fmt dir =
    dir_printer fmt (Odoc_odoc.Fs.Directory.to_string dir)
  in
  (odoc_dir_parser, odoc_dir_printer)

let output =
  let doc = "Output directory where the HTML tree is expected to be saved." in
  Arg.(
    required
    & opt (some (convert_directory ~create:true ())) None
    & info ~docs ~docv:"DIR" ~doc [ "o"; "output-dir" ])

type files = { otherdocs : Fpath.t list; odocls : Fpath.t list }

let empty = { otherdocs = []; odocls = [] }

let get_ok = function
  | Result.Ok x -> x
  | Error (`Msg m) ->
      Format.eprintf "get_ok: Failure! msg=%s\n%!" m;
      failwith "get_ok: Not OK"

let generate_pkgver output_dir name_filter version_filter =
  let linkedpath = Fpath.(v "linked") in
  match
    Bos.OS.Dir.fold_contents ~elements:`Dirs
      (fun p (pkgs, othervers) ->
        let optmatch opt v = match opt with Some x -> x = v | None -> true in
        match Fpath.segs p with
        | [ "linked"; "p"; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name
               && optmatch version_filter pkg_version ->
            ((p, None, pkg_name, pkg_version) :: pkgs, othervers)
        | [ "linked"; "p"; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name ->
            (pkgs, pkg_version :: othervers)
        | [ "linked"; "u"; universe; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name
               && optmatch version_filter pkg_version ->
            ((p, Some universe, pkg_name, pkg_version) :: pkgs, othervers)
        | _ -> (pkgs, othervers))
      ([], []) linkedpath
  with
  | Error (`Msg m) ->
      Format.eprintf "Failed to find any packages: %s\n%!" m;
      exit 1
  | Ok (pkgs, vs) ->
      Format.eprintf "%d other versions, %d packages\n%!" (List.length vs)
        (List.length pkgs);
      let handle_package (pkg_path, universe, pkg_name, ver) =
        let failed =
          Bos.OS.File.exists Fpath.(pkg_path / "failed") |> function
          | Ok x -> x
          | _ -> false
        in
        match
          Bos.OS.Dir.fold_contents ~elements:`Files ~dotfiles:false
            (fun p files ->
              match Fpath.get_ext p with
              | ".odocl" -> { files with odocls = p :: files.odocls }
              | _ -> (
                  match Fpath.basename p with
                  | "opam" -> files
                  | "content.tar" -> files
                  | _ -> { files with otherdocs = p :: files.otherdocs }))
            empty pkg_path
        with
        | Error (`Msg m) ->
            Format.eprintf "Failed to handle package %s.%s: %s\n%!" pkg_name ver
              m;
            exit 1
        | Ok files -> (
            let parent =
              List.find
                (fun p ->
                  let _, f = Fpath.split_base p in
                  f = Fpath.v "page-doc.odocl")
                files.odocls
            in
            let otherdocs = List.sort Fpath.compare files.otherdocs in
            let files = files.odocls in
            Format.eprintf "Found %d files\n%!" (List.length files);
            let output file_path =
              let p, ext = Fpath.split_ext ~multi:true file_path in
              let extensions = String.split_on_char '.' ext |> List.rev in
              let filename = Fpath.filename p |> String.uppercase_ascii in
              let output_path =
                match (filename, extensions) with
                | "README", "html" :: _ -> Fpath.set_ext "html" p ~multi:true
                | "README", "json" :: "toc" :: _ ->
                    Fpath.set_ext "toc.json" p ~multi:true
                | _ -> file_path
              in
              Fpath.normalize @@ Odoc_odoc.Fs.File.append output_dir output_path
            in
            let paths =
              List.rev_map (Rendering.render ~output) files
              |> List.rev_map get_ok |> List.flatten
            in
            let foutput =
              Fpath.v (Odoc_odoc.Fs.Directory.to_string output_dir)
            in
            let output_prefix =
              match universe with
              | None -> Fpath.(foutput / "p" / pkg_name / ver)
              | Some universe ->
                  Fpath.(foutput / "u" / universe / pkg_name / ver)
            in

            Package_info.gen ~input:parent ~output:output_prefix paths;
            Rendering.render_other ~parent ~otherdocs ~output |> get_ok;

            let otherdocs =
              let init =
                { readme = []; license = []; changes = []; others = [] }
              in
              List.fold_left
                (fun acc path ->
                  let _, file = Fpath.split_base path in
                  let file = Fpath.rem_ext file |> Fpath.to_string in
                  match file with
                  | "README" -> { acc with readme = path :: acc.readme }
                  | "LICENSE" -> { acc with license = path :: acc.license }
                  | "CHANGES" -> { acc with changes = path :: acc.changes }
                  | _ -> { acc with others = path :: acc.others })
                init otherdocs
            in
            let status = { failed; otherdocs } in
            if Option.is_none universe then
              Yojson.Safe.to_file
                Fpath.(output_prefix / "status.json" |> to_string)
                (status_to_yojson status);

            match
              Search_index.generate_index
                [
                  pkg_path |> Fpath.to_string
                  |> Odoc_odoc.Fs.Directory.of_string;
                ]
                Fpath.(output_prefix / "index.js")
            with
            | Ok () -> ()
            | Error (`Msg m) ->
                Format.eprintf "Error generating index for fuse: %s\n%!" m)
      in

      List.iter handle_package pkgs

module SMap = Map.Make (String)

let version = "v0.0.1"

let package_name_opt =
  let doc =
    "Package name (e.g. voodoo) - will only handle the named package if set"
  in
  Arg.(
    value
    & opt (some string) None
    & info ~docs ~docv:"NAME" ~doc [ "n"; "name" ])

let package_version_opt =
  let doc =
    "Package version (e.g. 0.0.1) - will only handle the specified version \
     package if set"
  in
  Arg.(
    value
    & opt (some string) None
    & info ~docs ~docv:"VERSION" ~doc [ "pkg-version" ])

let default_cmd =
  let doc = "Documentation generator" in
  ( Term.(
      const generate_pkgver $ output $ package_name_opt $ package_version_opt),
    Term.info "voodoo-gen" ~version ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval default_cmd)
