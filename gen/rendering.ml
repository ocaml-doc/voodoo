open Odoc_odoc

let ( >>= ) r f = match r with Ok v -> f v | Error _ as e -> e

let document_of_odocl ~syntax input =
  let open Odoc_document in
  Root.read input >>= fun root ->
  match root.file with
  | Page _ ->
      Page.load input >>= fun odoctree ->
      Ok (Renderer.document_of_page ~syntax odoctree)
  | Compilation_unit _ ->
      Compilation_unit.load input >>= fun odoctree ->
      Ok (Renderer.document_of_compilation_unit ~syntax odoctree)

let render_document ~output:root_dir odoctree =
  let pages = Generator.render ~indent:false odoctree in
  Odoc_document.Renderer.traverse pages ~f:(fun filename content ->
      let filename = Fpath.normalize @@ Fs.File.append root_dir filename in
      let directory = Fs.File.dirname filename in
      Fs.Directory.mkdir_p directory;
      let oc = open_out (Fs.File.to_string filename) in
      let fmt = Format.formatter_of_out_channel oc in
      Format.fprintf fmt "%t@?" content;
      close_out oc);
  Ok ()

let render ~opam ~output ~namever file =
  Tree.opam := opam;
  Tree.namever := namever;
  let f = Fs.File.of_string file in
  document_of_odocl ~syntax:Odoc_document.Renderer.OCaml f
  >>= render_document ~output
