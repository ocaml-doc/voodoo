open Cmdliner

let docs = "ARGUMENTS"

let process_opam_file f =
  let ic = open_in (Fpath.to_string f) in
  let result = OpamFile.OPAM.read_from_channel ic in
  close_in ic;
  result

let files = Arg.(non_empty & pos_all file [] & info [] ~docv:"FILE")

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

let opt_map f = function Some x -> Some (f x) | None -> None

type files = {
  opam : Fpath.t option;
  otherdocs : Fpath.t list;
  odocls : Fpath.t list;
}

let empty = { opam = None; otherdocs = []; odocls = [] }

let get_ok = function | Result.Ok x -> x | Error _ -> failwith "get_ok: Not OK"

let generate output name_filter version_filter =
  let linkedpath = Fpath.(v "linked") in
  match
    Bos.OS.Dir.fold_contents ~elements:`Dirs
      (fun p (pkgs, othervers) ->
        let optmatch opt v = match opt with Some x -> x = v | None -> true in
        match Fpath.segs p with
        | [ "linked"; "packages"; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name
               && optmatch version_filter pkg_version ->
            ((p, pkg_name, pkg_version) :: pkgs, othervers)
        | [ "linked"; "packages"; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name ->
            (pkgs, pkg_version :: othervers)
        | [ "linked"; "universes"; _; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name
               && optmatch version_filter pkg_version ->
            ((p, pkg_name, pkg_version) :: pkgs, othervers)
        | _ -> (pkgs, othervers))
      ([], []) linkedpath
  with
  | Error (`Msg m) ->
      Format.eprintf "Failed to find any packages: %s\n%!" m;
      exit 1
  | Ok (pkgs, vs) ->
      Format.eprintf "%d other versons, %d packages\n%!" (List.length vs)
        (List.length pkgs);
      let handle_package (pkg_path, pkg_name, ver) =
        match
          Bos.OS.Dir.fold_contents ~elements:`Files ~dotfiles:false
            (fun p files ->
              match Fpath.get_ext p with
              | ".odocl" -> { files with odocls = p :: files.odocls }
              | _ -> (
                  match Fpath.basename p with
                  | "opam" -> { files with opam = Some p }
                  | _ -> { files with otherdocs = p :: files.otherdocs }))
            empty pkg_path
        with
        | Error (`Msg m) ->
            Format.eprintf "Failed to handle package %s.%s: %s\n%!" pkg_name ver
              m;
            exit 1
        | Ok files ->
            let opam = opt_map process_opam_file files.opam in
            let namever = pkg_name ^ "." ^ ver in
            let parent = Fpath.(pkg_path / ".." / ("page-" ^ ver ^ ".odocl")) in
            let otherdocs = files.otherdocs in
            let files = parent :: files.odocls in
            Format.eprintf "Found %d files\n%!" (List.length files);
            ignore
            @@ List.map
                 (Odoc_thtml.render ~opam ~namever ~parent ~otherdocs ~vs
                    ~output)
                 files;
            Odoc_thtml.render_other ~parent ~otherdocs ~output |> get_ok;
            let foutput = Fpath.v (Odoc_odoc.Fs.Directory.to_string output) in
            Bos.OS.File.write Fpath.(foutput / "tailwind.css") Odoc_thtml.Static.tailwind_css |> get_ok;
            Bos.OS.File.write Fpath.(foutput / "extra.css") Odoc_thtml.Static.extra_css |> get_ok;
            Bos.OS.File.write Fpath.(foutput / "highlight.pack.js") Odoc_thtml.Static.highlight_pack_js |> get_ok;
            Bos.OS.File.write Fpath.(foutput / "colour-logo.svg") Odoc_thtml.Static.colour_logo_svg |> get_ok;
          
      in
      List.map handle_package pkgs

let package_name =
  let doc =
    "Package name (e.g. voodoo) - will only handle the named package if set"
  in
  Arg.(
    value
    & opt (some string) None
    & info ~docs ~docv:"NAME" ~doc [ "n"; "name" ])

let package_version =
  let doc =
    "Package version (e.g. 0.0.1) - will only handle the specified version \
     package if set"
  in
  Arg.(
    value
    & opt (some string) None
    & info ~docs ~docv:"VERSION" ~doc [ "pkg-version" ])

let cmd =
  let doc = "Generate HTML pages from odocl files" in
  ( Term.(const generate $ output $ package_name $ package_version),
    Term.info "generate" ~version:"v0.0.1" ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval cmd)
