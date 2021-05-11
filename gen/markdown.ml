(* Markdown renderer *)
open Omd
open Result

let ( >>= ) = fun m f -> match m with | Ok x -> f x | Error y -> Error y


type intermediate =
  | Bl of Odoc_document.Types.Block.t
  | It of Odoc_document.Types.Item.t

let rec inline : inline -> Odoc_document.Types.Inline.t = function
  | { il_desc = Concat is; _ } -> inlines is
  | { il_desc = Text s; _ } -> [ { desc = Text s; attr = [] } ]
  | { il_desc = Emph s; _ } ->
      [ { desc = Styled (`Emphasis, inline s); attr = [] } ]
  | { il_desc = Strong s; _ } ->
      [ { desc = Styled (`Bold, inline s); attr = [] } ]
  | { il_desc = Code c; _ } ->
      [ { desc = Source [ Elt [ { desc = Text c; attr = [] } ] ]; attr = [] } ]
  | { il_desc = Hard_break; _ } -> [ { desc = Linebreak; attr = [] } ]
  | { il_desc = Soft_break; _ } -> [ { desc = Linebreak; attr = [] } ]
  | { il_desc = Link l; _ } ->
      [ { desc = Link (l.destination, inline l.label); attr = [] } ]
  | { il_desc = Image _; _ } -> []
  | { il_desc = Html h; _ } -> [ { desc = Raw_markup ("html", h); attr = [] } ]

and inlines xs = List.concat (List.map inline xs)

let rec block : block -> intermediate = function
  | { bl_desc = Paragraph p; _ } ->
      Bl [ { desc = Paragraph (inline p); attr = [] } ]
  | { bl_desc = List (Bullet _, _sp, items); _ } ->
      let i =
        List.map
          (fun items -> match blocks items with [ Bl x ] -> x | _ -> [])
          items
      in
      Bl [ { desc = List (Unordered, i); attr = [] } ]
  | { bl_desc = List (Ordered _, _sp, items); _ } ->
      let i =
        List.map
          (fun items -> match blocks items with [ Bl x ] -> x | _ -> [])
          items
      in
      Bl [ { desc = List (Ordered, i); attr = [] } ]
  | { bl_desc = Blockquote _bs; _ } -> Bl []
  | { bl_desc = Thematic_break; _ } -> Bl []
  | { bl_desc = Heading (n, i); _ } ->
      It (Heading { label = None; level = n; title = inline i })
  | { bl_desc = Code_block (_a, b); _ } ->
      Bl
        [
          { desc = Source [ Elt [ { desc = Text b; attr = [] } ] ]; attr = [] };
        ]
  | { bl_desc = Html_block _; _ } -> Bl []
  | { bl_desc = Definition_list _; _ } -> Bl []

and merge xs =
  List.fold_right
    (fun x (cur, acc) ->
      match x with Bl a -> (a @ cur, acc) | It _ -> ([], x :: Bl cur :: acc))
    xs ([], [])
  |> (fun (x, y) -> Bl x :: y)
  |> List.filter (function Bl [] -> false | _ -> true)

and blocks xs = List.map block xs |> merge

let read_md f url =
  let name = Fpath.basename f in
  Bos.OS.File.read f >>= fun content ->
  let md = Omd.of_string content in
  let intermediate = blocks md in
  let items = List.map (function It x -> x | Bl x -> Text x) intermediate in
  Ok
    (match items with
    | [] ->
        Odoc_document.Types.Page.{ title = name; header = []; items = []; url }
    | (Heading _ as x) :: rest ->
        Odoc_document.Types.Page.
          { title = name; header = [ x ]; items = rest; url }
    | _ ->
        Odoc_document.Types.Page.
          {
            title = name;
            header =
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

let read_plain f url =
  let name = Fpath.basename f in
  Bos.OS.File.read f >>= fun content ->
  Ok
    Odoc_document.Types.Page.
      {
        title = name;
        url;
        items = [ Text [ { desc = Verbatim content; attr = [] } ] ];
        header =
          [
            Heading
              {
                label = None;
                level = 1;
                title = [ { desc = Text name; attr = [] } ];
              };
          ];
      }
