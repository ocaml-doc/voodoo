open Odoc_odoc
module Result = Bos_setup.R
open Result.Infix

let document_of_odocl ~syntax input =
  let open Odoc_document in
  Odoc_file.load input >>= fun unit ->
  match unit.content with
  | Odoc_file.Page_content odoctree ->
      Ok (Renderer.document_of_page ~syntax odoctree)
  | Unit_content odoctree ->
      Ok (Renderer.document_of_compilation_unit ~syntax odoctree)

let render_document ~output odoctree =
  let aux pages =
    Odoc_document.Renderer.traverse pages ~f:(fun file_path content ->
        let output_path = output file_path in
        let directory = Fs.File.dirname output_path in
        Fs.Directory.mkdir_p directory;
        let oc = open_out (Fs.File.to_string output_path) in
        let fmt = Format.formatter_of_out_channel oc in
        Format.fprintf fmt "%t@?" content;
        close_out oc)
  in
  aux
  @@ Odoc_html.Generator.render
       ~config:
         (Odoc_html.Config.v ~semantic_uris:false ~indent:false ~flat:false
            ~open_details:true ~as_json:true ())
       odoctree;
  Ok ()

let docs_ids parent docs =
  Odoc_file.load parent >>= fun root ->
  match root.content with
  | Page_content odoctree -> (
      match odoctree.Odoc_model.Lang.Page.name with
      | { iv = `LeafPage _; _ } -> Error (`Msg "Parent is a leaf!")
      | { iv = `Page (maybe_container_page, _); _ } as parent_id ->
          let result =
            List.map
              (fun doc ->
                let id =
                  let basename = Fpath.basename doc in
                  {
                    parent_id with
                    iv =
                      `LeafPage
                        ( maybe_container_page,
                          Odoc_model.Names.PageName.make_std basename );
                  }
                in
                (id, doc))
              docs
          in
          Ok result)
  | _ -> Error (`Msg "Parent is not a page!")

let render ~output file =
  let open Odoc_document in
  let f = Fs.File.of_string (Fpath.to_string file) in
  document_of_odocl ~syntax:Renderer.OCaml f >>= fun document ->
  render_document ~output document >>= fun () ->
  let urls =
    let rec get_subpages document =
      document
      :: (Doctree.Subpages.compute document
         |> List.map (fun (subpage : Types.Subpage.t) ->
                get_subpages subpage.content)
         |> List.flatten)
    in
    get_subpages document
  in
  Ok urls

let render_text ~id ~output doc =
  let url = Odoc_document.Url.Path.from_identifier id in
  Markdown.read_plain doc url >>= render_document ~output

let render_markdown ~id ~output doc =
  let url = Odoc_document.Url.Path.from_identifier id in
  match Markdown.read_md doc url with
  | Ok page -> render_document ~output page
  | Error _ -> render_text ~id ~output doc

let render_org ~id ~output doc =
  let url = Odoc_document.Url.Path.from_identifier id in
  match Markdown.read_org doc url with
  | Ok page -> render_document ~output page
  | Error _ -> render_text ~id ~output doc

let render_other ~output ~parent ~otherdocs =
  docs_ids parent otherdocs >>= fun docs ->
  let errors =
    List.fold_left
      (fun acc (id, doc) ->
        let result =
          match Fpath.get_ext doc with
          | ".md" -> render_markdown ~output ~id doc
          | ".org" -> render_org ~output ~id doc
          | _ -> render_text ~output ~id doc
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
