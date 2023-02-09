(* Markdown renderer *)
open Omd
open Result

let ( >>= ) m f = match m with Ok x -> f x | Error y -> Error y

type intermediate =
  | Bl of Odoc_document.Types.Block.t
  | It of Odoc_document.Types.Item.t

let rec inline : 'attr inline -> Odoc_document.Types.Inline.t = function
  | Concat (_, is) -> inlines is
  | Text (_, s) -> [ { desc = Text s; attr = [] } ]
  | Emph (_, s) -> [ { desc = Styled (`Emphasis, inline s); attr = [] } ]
  | Strong (_, s) -> [ { desc = Styled (`Bold, inline s); attr = [] } ]
  | Code (_, c) ->
      [ { desc = Source [ Elt [ { desc = Text c; attr = [] } ] ]; attr = [] } ]
  | Hard_break _ -> [ { desc = Linebreak; attr = [] } ]
  | Soft_break _ -> [ { desc = Linebreak; attr = [] } ]
  | Link (_, l) ->
      [ { desc = Link (l.destination, inline l.label); attr = [] } ]
  | Image _ -> []
  | Html (_, h) -> [ { desc = Raw_markup ("html", h); attr = [] } ]

and inlines xs = List.concat (List.map inline xs)

let rec block : 'attr block -> intermediate = function
  | Paragraph (_, p) -> Bl [ { desc = Paragraph (inline p); attr = [] } ]
  | List (_, Bullet _, _sp, items) ->
      let i =
        List.map
          (fun items -> match blocks items with [ Bl x ] -> x | _ -> [])
          items
      in
      Bl [ { desc = List (Unordered, i); attr = [] } ]
  | List (_, Ordered _, _sp, items) ->
      let i =
        List.map
          (fun items -> match blocks items with [ Bl x ] -> x | _ -> [])
          items
      in
      Bl [ { desc = List (Ordered, i); attr = [] } ]
  | Blockquote (_, _bs) -> Bl []
  | Thematic_break _ -> Bl []
  | Heading (_, n, i) ->
      It (Heading { label = None; level = n; title = inline i })
  | Code_block (_, _a, b) ->
      Bl
        [
          {
            desc = Source ("markdown", [ Elt [ { desc = Text b; attr = [] } ] ]);
            attr = [];
          };
        ]
  | (Html_block _ | Definition_list _ | Table (_, _, _)) as elt ->
      let html = Omd.to_html [ elt ] in
      Bl [ { desc = Raw_markup ("html", html); attr = [] } ]

and merge xs =
  List.fold_right
    (fun x (cur, acc) ->
      match x with Bl a -> (a @ cur, acc) | It _ -> ([], x :: Bl cur :: acc))
    xs ([], [])
  |> (fun (x, y) -> Bl x :: y)
  |> List.filter (function Bl [] -> false | _ -> true)

and blocks xs = List.map block xs |> merge

let of_content content ~name ~url =
  let md = Omd.of_string content in
  let intermediate = blocks md in
  let items = List.map (function It x -> x | Bl x -> Text x) intermediate in
  Ok
    (match items with
    | [] -> Odoc_document.Types.Page.{ preamble = []; items = []; url }
    | (Heading _ as x) :: rest ->
        Odoc_document.Types.Page.{ preamble = [ x ]; items = rest; url }
    | _ ->
        Odoc_document.Types.Page.
          {
            preamble =
              [
                Heading
                  {
                    label = None;
                    level = 1;
                    title = [ { desc = Text name; attr = [] } ];
                  };
              ];
            items;
            url;
          })

let read_org f url =
  let name = Fpath.basename f in
  let fname = Fpath.to_string f in
  let cmd =
    Bos.Cmd.(
      v "pandoc" % "--wrap" % "none" % "--from" % "org" % "--to" % "markdown"
      % fname)
  in
  Bos.OS.Cmd.(run_out cmd |> to_string) >>= fun content ->
  of_content content ~name ~url

let read_md f url =
  let name = Fpath.basename f in
  Bos.OS.File.read f >>= fun content -> of_content content ~name ~url

let read_plain f url =
  let name = Fpath.basename f in
  Bos.OS.File.read f >>= fun content ->
  Ok
    Odoc_document.Types.Page.
      {
        url;
        items = [ Text [ { desc = Verbatim content; attr = [] } ] ];
        preamble =
          [
            Heading
              {
                label = None;
                level = 1;
                title = [ { desc = Text name; attr = [] } ];
              };
          ];
      }
