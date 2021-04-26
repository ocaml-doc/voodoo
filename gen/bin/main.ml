open Cmdliner

let docs = "ARGUMENTS"

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

let generate output files = List.map (Odoc_thtml.render ~output) files

let cmd =
  let doc = "Generate HTML pages from odocl files" in
  ( Term.(const generate $ output $ files),
    Term.info "generate" ~version:"v0.0.1" ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval cmd)
