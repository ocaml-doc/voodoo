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

let docs_ids parent docs =
  Root.read parent >>= fun root ->
  match root.file with
  | Page _ -> (
      Page.load parent >>= fun odoctree ->
      match odoctree.Odoc_model.Lang.Page.name with
      | `LeafPage _ -> Error (`Msg "Parent is a leaf!")
      | (`RootPage _ | `Page _) as parent_id ->
          let result =
            List.map
              (fun doc ->
                let id =
                  let basename = Fpath.basename doc in
                  `LeafPage
                    (parent_id, Odoc_model.Names.PageName.make_std basename)
                in
                (id, doc))
              docs
          in
          Ok result)
  | _ -> Error (`Msg "Parent is not a page!")

let render ~opam ~output ~namever ~parent ~otherdocs file =
  docs_ids parent otherdocs >>= fun docs ->
  Tree.opam := opam;
  Tree.namever := namever;
  Tree.otherdocs := docs;
  let f = Fs.File.of_string file in
  document_of_odocl ~syntax:Odoc_document.Renderer.OCaml f
  >>= render_document ~output

let render_text ~id ~output doc =
  let url = Odoc_document.Url.Path.from_identifier id in
  Markdown.read_plain doc url >>= render_document ~output

let render_markdown ~id ~output doc =
  let url = Odoc_document.Url.Path.from_identifier id in
  match Markdown.read_md doc url with
  | Ok page -> render_document ~output page
  | Error _ -> render_text ~id ~output doc

let render_other ~output ~parent ~otherdocs =
  docs_ids parent otherdocs >>= fun docs ->
  let errors =
    List.fold_left
      (fun acc (id, doc) ->
        let result =
          if Fpath.get_ext doc = ".md" then render_markdown ~output ~id doc
          else render_text ~output ~id doc
        in
        match result with Ok _ -> acc | Error (`Msg m) -> (doc, m) :: acc)
      [] docs
  in
  match errors with
  | [] -> Ok ()
  | _ ->
      Error
        (`Msg
          (String.concat "\n"
             (List.map
                (fun (doc, m) -> Format.asprintf "%a: %s" Fpath.pp doc m)
                errors)))
