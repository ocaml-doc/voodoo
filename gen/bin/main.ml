open Cmdliner

let docs = "ARGUMENTS"

let process_file f =
  let ic = open_in f in
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

let generate output opam namever otherdocs parent files =
  let parent = Fpath.v parent in
  let otherdocs = List.map Fpath.v otherdocs in
  let opam = opt_map process_file opam in
  ignore
  @@ List.map
       (Odoc_thtml.render ~opam ~namever ~parent ~otherdocs ~output)
       files;
  ignore @@ Odoc_thtml.render_other ~parent ~otherdocs ~output

let opam =
  let doc = "Opam file from which to take metadata" in
  Arg.(value & opt (some file) None & info ~docs ~docv:"OPAM" ~doc [ "opam" ])

let package_name_ver =
  let doc = "Package name and version (e.g. voodoo.0.0.1)" in
  Arg.(
    required
    & opt (some string) None
    & info ~docs ~docv:"NAMEVER" ~doc [ "n"; "name" ])

let otherdocs =
  let doc = "Path to other documentation distributed with the package" in
  Arg.(value & opt_all file [] & info ~docs ~docv:"DOCFILE" ~doc [ "otherdoc" ])

let parent =
  let doc = "Parent odoc for other docs" in
  Arg.(
    required
    & opt (some file) None
    & info ~docs ~docv:"ODOCFILE" ~doc [ "parent" ])

let cmd =
  let doc = "Generate HTML pages from odocl files" in
  ( Term.(
      const generate $ output $ opam $ package_name_ver $ otherdocs $ parent
      $ files),
    Term.info "generate" ~version:"v0.0.1" ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval cmd)
