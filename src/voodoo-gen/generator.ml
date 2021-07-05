(*
 * Copyright (c) 2016 Thomas Refis <trefis@janestreet.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

open Odoc_document.Types
module Html = Tyxml.Html
module Doctree = Odoc_document.Doctree
module T = Voodoo_web.Tailwind

type any = Html_types.flow5

type item = Html_types.flow5_without_header_footer

type flow = Html_types.flow5_without_sectioning_heading_header_footer

type phrasing = Html_types.phrasing

type non_link_phrasing = Html_types.phrasing_without_interactive

let mk_anchor_link id prn =
  [
    Html.a
      ~a:
        [
          Html.a_href ("#" ^ id);
          Html.a_class T.[ "hover-link"; inline_block; ml (-7); pr prn ];
        ]
      [
        Html.span
          ~a:
            [
              Html.a_class
                T.
                  [
                    align_middle;
                    text_gray 200;
                    transition;
                    text_sm;
                    font_sans;
                    opacity 0;
                    hover @@ text_gray 700;
                  ];
            ]
          [ Html.txt "#" ];
      ];
  ]

let mk_anchor anchor =
  match anchor with
  | None -> ([], [], [])
  | Some { Odoc_document.Url.Anchor.anchor; _ } ->
      let link = mk_anchor_link anchor 7 in
      let attrib = [ Html.a_id anchor ] in
      let classes = [ "anchored" ] in
      (attrib, classes, link)

let class_ (l : Class.t) = if l = [] then [] else [ Html.a_class l ]

and raw_markup (t : Raw_markup.t) =
  let target, content = t in
  match Astring.String.Ascii.lowercase target with
  | "html" ->
      (* This is OK because we output *textual* HTML.
         In theory, we should try to parse the HTML with lambdasoup and rebuild
         the HTML tree from there.
      *)
      [ Html.Unsafe.data content ]
  | _ -> []

and source k ?a (t : Source.t) =
  let class_of_keyword = function
    | "keyword" -> [ "font-semibold" ]
    | "type-var" -> []
    | "arrow" -> []
    | "constructor" -> []
    | "exception" -> []
    | "extension" -> []
    | x -> failwith ("Missing keyword " ^ x)
  in
  let rec token (x : Source.token) =
    match x with
    | Elt i -> k i
    | Tag (None, l) ->
        let content = tokens l in
        if content = [] then [] else [ Html.span content ]
    | Tag (Some cls, l) ->
        [ Html.span ~a:[ Html.a_class (class_of_keyword cls) ] (tokens l) ]
  and tokens t = Utils.list_concat_map t ~f:token in
  let a' = match a with Some xs -> xs | None -> [] in
  let a = Html.a_class T.[ font_normal; text_sm ] :: a' in
  Utils.optional_elt Html.code ~a (tokens t)

and styled style ~emph_level =
  match style with
  | `Emphasis ->
      let a = if emph_level mod 2 = 0 then [] else [ Html.a_class [ "odd" ] ] in
      (emph_level + 1, Html.em ~a)
  | `Bold -> (emph_level, Html.b ~a:[])
  | `Italic -> (emph_level, Html.i ~a:[])
  | `Superscript -> (emph_level, Html.sup ~a:[])
  | `Subscript -> (emph_level, Html.sub ~a:[])

let rec internallink ~emph_level ~resolve (t : InternalLink.t) =
  match t with
  | Resolved (uri, content) ->
      let href = Link.href ~resolve uri in
      let a = [ Html.a_class T.[ cursor_pointer; "text-orange" ] ] in
      let elt =
        Html.a ~a:(Html.a_href href :: a) (inline_nolink ~emph_level content)
      in
      let elt = (elt :> phrasing Html.elt) in
      [ elt ]
  | Unresolved content ->
      (* let title =
       *   Html.a_title (Printf.sprintf "unresolved reference to %S"
       *       (ref_to_string ref)
       * in *)
      let a = [ Html.a_class [ "xref-unresolved" ] ] in
      let elt = Html.span ~a (inline ~emph_level ~resolve content) in
      let elt = (elt :> phrasing Html.elt) in
      [ elt ]

and internallink_nolink ~emph_level
    ~(a : Html_types.span_attrib Html.attrib list) (t : InternalLink.t) =
  match t with
  | Resolved (_, content) | Unresolved content ->
      [ Html.span ~a (inline_nolink ~emph_level content) ]

and inline ?(emph_level = 0) ~resolve (l : Inline.t) : phrasing Html.elt list =
  let one (t : Inline.one) =
    match t.desc with
    | Text "" -> []
    | Text s -> [ Html.txt s ]
    | Entity s -> [ Html.entity s ]
    | Linebreak -> [ Html.br ~a:[] () ]
    | Styled (style, c) ->
        let emph_level, app_style = styled style ~emph_level in
        [ app_style @@ inline ~emph_level ~resolve c ]
    | Link (href, c) ->
        let content = inline_nolink ~emph_level c in
        [
          Html.a
            ~a:
              [
                Html.a_href href;
                Html.a_class T.[ cursor_pointer; "text-orange" ];
              ]
            content;
        ]
    | InternalLink c -> internallink ~emph_level ~resolve c
    | Source c -> source (inline ~emph_level ~resolve) c
    | Raw_markup r -> raw_markup r
  in
  Utils.list_concat_map ~f:one l

and inline_nolink ?(emph_level = 0) (l : Inline.t) :
    non_link_phrasing Html.elt list =
  let one (t : Inline.one) =
    let a = class_ t.attr in
    match t.desc with
    | Text "" -> []
    | Text s ->
        if a = [] then [ Html.txt s ] else [ Html.span ~a [ Html.txt s ] ]
    | Entity s ->
        if a = [] then [ Html.entity s ] else [ Html.span ~a [ Html.entity s ] ]
    | Linebreak -> [ Html.br ~a () ]
    | Styled (style, c) ->
        let emph_level, app_style = styled style ~emph_level in
        [ app_style @@ inline_nolink ~emph_level c ]
    | Link (_, c) -> inline_nolink ~emph_level c
    | InternalLink c -> internallink_nolink ~emph_level ~a c
    | Source c -> source (inline_nolink ~emph_level) ~a c
    | Raw_markup r -> raw_markup r
  in
  Utils.list_concat_map ~f:one l

let heading ~resolve (h : Heading.t) =
  let a, anchor, extracls =
    match h.label with
    | Some id -> ([ Html.a_id id ], mk_anchor_link id 4, [ "anchored" ])
    | None -> ([], [], [])
  in
  let content = inline ~resolve h.title in
  let common = T.[ text_gray 800; font_sans ] @ extracls in
  let mk, classes =
    match h.level with
    | 0 ->
        ( Html.h1,
          T.[ text_3xl; mt 7; border_b `b2; border_gray 200; font_semibold ] )
    | 1 -> (Html.h2, T.[ text_2xl; my 4 ])
    | 2 -> (Html.h3, T.[ text_xl; my 4; text_gray 900 ])
    | 3 -> (Html.h4, T.[ text_lg; text_gray 900 ])
    | 4 -> (Html.h5, [])
    | _ -> (Html.h6, [])
  in
  mk ~a:(Html.a_class (classes @ common) :: a) (anchor @ content)

let rec block ~resolve (l : Block.t) : flow Html.elt list =
  let as_flow x = (x : phrasing Html.elt list :> flow Html.elt list) in
  let one (t : Block.one) =
    let a = class_ t.attr in
    match t.desc with
    | Inline i ->
        if a = [] then as_flow @@ inline ~resolve i
        else [ Html.span ~a (inline ~resolve i) ]
    | Paragraph i ->
        [ Html.p ~a:[ Html.a_class T.[ mt 4 ] ] (inline ~resolve i) ]
    | List (typ, l) ->
        let mk, cls =
          match typ with
          | Ordered -> (Html.ol, T.[ list_decimal; mt 2; mb 4 ])
          | Unordered -> (Html.ul, T.[ list_disc; mt 2; mb 4 ])
        in
        [
          mk ~a:[ Html.a_class cls ]
            (List.map
               (fun x ->
                 Html.li ~a:[ Html.a_class T.[ ml 4 ] ] (block ~resolve x))
               l);
        ]
    | Description l ->
        [
          (let item (i : Odoc_document.Types.Description.one) =
             let a = class_ i.attr in
             let term =
               (inline ~resolve i.key
                 : phrasing Html.elt list
                 :> flow Html.elt list)
             in
             let def = block ~resolve i.definition in
             Html.li ~a (term @ Html.txt " " :: def)
           in
           Html.ul ~a (List.map item l));
        ]
    | Raw_markup r -> raw_markup r
    | Verbatim s ->
        [
          Html.pre
            ~a:[ Html.a_class T.[ bg_gray 100; p 3; my 2; overflow_auto ] ]
            [ Html.txt s ];
        ]
    | Source c ->
        [
          Html.pre
            ~a:[ Html.a_class T.[ bg_gray 100; p 3; my 2; overflow_auto ] ]
            (source (inline ~resolve) c);
        ]
  in
  Utils.list_concat_map l ~f:one

(* This coercion is actually sound, but is not currently accepted by Tyxml.
   See https://github.com/ocsigen/tyxml/pull/265 for details
   Can be replaced by a simple type coercion once this is fixed
*)
let flow_to_item : flow Html.elt list -> item Html.elt list =
 fun x -> Html.totl @@ Html.toeltl x

let div : ([< Html_types.div_attrib ], [< item ], [> Html_types.div ]) Html.star
    =
  Html.Unsafe.node "div"

let spec_class = function [] -> [] | attr -> class_ ("spec" :: attr)

let spec_doc_div ~resolve = function
  | [] -> []
  | docs ->
      let a = [ Html.a_class [ "spec-doc" ] ] in
      [ div ~a (flow_to_item @@ block ~resolve docs) ]

let rec documentedSrc ~resolve (t : DocumentedSrc.t) : item Html.elt list =
  let open DocumentedSrc in
  let take_code l =
    Doctree.Take.until l ~classify:(function
      | Code code -> Accum code
      | Alternative (Expansion { summary; _ }) -> Accum summary
      | _ -> Stop_and_keep)
  in
  let take_descr l =
    Doctree.Take.until l ~classify:(function
      | Documented { attrs; anchor; code; doc; markers } ->
          Accum
            [ { DocumentedSrc.attrs; anchor; code = `D code; doc; markers } ]
      | Nested { attrs; anchor; code; doc; markers } ->
          Accum
            [ { DocumentedSrc.attrs; anchor; code = `N code; doc; markers } ]
      | _ -> Stop_and_keep)
  in
  let rec to_html t : item Html.elt list =
    match t with
    | [] -> []
    | (Code _ | Alternative _) :: _ ->
        let code, _, rest = take_code t in
        source (inline ~resolve) code @ to_html rest
    | Subpage subp :: _ -> subpage ~resolve subp
    | (Documented _ | Nested _) :: _ ->
        let l, _, rest = take_descr t in
        let one { DocumentedSrc.attrs; anchor; code; doc; markers } =
          let content =
            match code with
            | `D code -> (inline ~resolve code :> item Html.elt list)
            | `N n -> to_html n
          in
          let doc =
            match doc with
            | [] -> []
            | [ { desc = Block.Paragraph doc; _ } ] ->
                let opening, closing = markers in
                [
                  Html.td
                    ~a:(class_ T.[ "def-doc"; pl 4 ])
                    (Html.span ~a:(class_ T.[ sr_only ]) [ Html.txt opening ]
                     :: (inline ~resolve doc :> flow Html.elt list)
                    @ [
                        Html.span ~a:(class_ T.[ sr_only ]) [ Html.txt closing ];
                      ]);
                ]
            | _ -> []
            (* failwith "erk"*)
          in
          let a, classes, link = mk_anchor anchor in
          ignore attrs;
          let content =
            let c = link @ content in
            Html.td
              ~a:(class_ ((*attrs @*) classes @ T.[ pl 4 ]))
              (c :> any Html.elt list)
          in
          Html.tr ~a (content :: doc)
        in
        Html.table (List.map one l) :: to_html rest
  in
  to_html t

and subpage ~resolve (subp : Subpage.t) : item Html.elt list =
  items ~resolve subp.content.items

and items ~resolve l : item Html.elt list =
  let rec walk_items acc (t : Item.t list) : item Html.elt list =
    let continue_with rest elts =
      (walk_items [@tailcall]) (List.rev_append elts acc) rest
    in
    match t with
    | [] -> List.rev acc
    | Text _ :: _ as t ->
        let text, _, rest =
          Doctree.Take.until t ~classify:(function
            | Item.Text text -> Accum text
            | _ -> Stop_and_keep)
        in
        let content = flow_to_item @@ block ~resolve text in
        content |> (continue_with [@tailcall]) rest
    | Heading h :: rest ->
        [ heading ~resolve h ] |> (continue_with [@tailcall]) rest
    | Include { attr; anchor; doc; content = { summary; status; content } }
      :: rest ->
        let doc = spec_doc_div ~resolve doc in
        let included_html = (items content :> any Html.elt list) in
        let suffix =
          [
            Html.div
              ~a:
                [
                  Html.a_class
                    T.
                      [
                        absolute;
                        bg_gray 500;
                        opacity 10;
                        border_gray 500;
                        rounded_lg;
                        border_r `b8;
                        rounded_l_none;
                        top 0;
                        right (-6);
                        bottom 0;
                        w 5;
                      ];
                ]
              [];
          ]
        in
        let content =
          let details ~open' =
            let open' = if open' then [ Html.a_open () ] else [] in
            let cls = [ Html.a_class T.[ relative ] ] in
            let summary =
              let anchor_attrib, classes, anchor_link = mk_anchor anchor in
              let a =
                spec_class
                  (attr @ classes
                  @ T.
                      [
                        p 2;
                        text_sm;
                        rounded;
                        border_l `b4;
                        "border-orange";
                        my 3;
                        bg_gray 100;
                      ])
                @ anchor_attrib
              in
              Html.summary ~a @@ anchor_link @ source (inline ~resolve) summary
            in
            [ Html.details ~a:(open' @ cls) summary (included_html @ suffix) ]
          in
          match status with
          | `Inline -> included_html
          | `Closed -> details ~open':false
          | `Open -> details ~open':true
          | `Default -> details ~open':!Tree.open_details
        in
        let inc = [ Html.div ~a:[ Html.a_class T.[ mt 8 ] ] (doc @ content) ] in
        (continue_with [@tailcall]) rest inc
    | Declaration { Item.attr; anchor; content; doc } :: rest ->
        let anchor_attrib, classes, anchor_link = mk_anchor anchor in
        let a =
          spec_class
            (attr @ classes
            @ T.
                [
                  p 2;
                  text_sm;
                  rounded;
                  border_l `b4;
                  "border-orange";
                  my 3;
                  bg_gray 100;
                ])
          @ anchor_attrib
        in
        let content = anchor_link @ documentedSrc ~resolve content in
        let spec =
          let doc = spec_doc_div ~resolve doc in
          [ div ~a:[ Html.a_class T.[ mt 8 ] ] (div ~a content :: doc) ]
        in
        (continue_with [@tailcall]) rest spec
  and items l = walk_items [] l in
  items l

module Toc = struct
  open Odoc_document.Doctree

  let render_toc ~resolve (toc : Toc.t) =
    let rec section { Toc.url; text; children } =
      let text = inline_nolink text in
      let text =
        (text
          : non_link_phrasing Html.elt list
          :> Html_types.flow5_without_interactive Html.elt list)
      in
      let href = Link.href ~resolve url in
      let link =
        Html.a
          ~a:
            [
              Html.a_href href; Html.a_class T.[ cursor_pointer; "text-orange" ];
            ]
          text
      in
      match children with [] -> [ link ] | _ -> [ link; sections children ]
    and sections the_sections =
      the_sections
      |> List.map (fun the_section -> Html.li (section the_section))
      |> Html.ul
    in
    match toc with
    | [] -> []
    | _ ->
        [ Html.nav ~a:[ Html.a_class T.[ bg_gray 100; p 5 ] ] [ sections toc ] ]

  let on_sub : Subpage.status -> bool = function
    | `Closed | `Open | `Default -> false
    | `Inline -> true

  let from_items ~resolve ~path i =
    (render_toc ~resolve @@ Toc.compute path ~on_sub i :> any Html.elt list)
end

module Page = struct
  let on_sub = function
    | `Page _ -> None
    | `Include x -> (
        match x.Include.status with
        | `Closed | `Open | `Default -> None
        | `Inline -> Some 0)

  let rec include_ indent { Subpage.content; _ } = [ page indent content ]

  and subpages indent i =
    Utils.list_concat_map ~f:(include_ indent) @@ Doctree.Subpages.compute i

  and mktitle page_type path =
    let sep = Html.code ~a:[ Html.a_class T.[ font_mono ] ] [ Html.txt "." ] in
    let rec links =
      let link (name, link) =
        Html.a ~a:[ Html.a_href link ]
          [
            Html.code
              ~a:
                [
                  Html.a_class T.[ font_mono; text_orangedark; cursor_pointer ];
                ]
              [ Html.txt name ];
          ]
      in
      function
      | elt :: (_ :: _ as xs) -> link elt :: sep :: links xs
      | [ elt ] -> [ link elt ]
      | [] -> []
    in

    let h1 =
      Html.div
        ~a:[ Html.a_class T.[ relative; flex_1; h 20 ] ]
        [
          Html.h1
            ~a:
              [
                Html.a_class
                  T.
                    [
                      text_3xl;
                      absolute;
                      inset_x 0;
                      py 3;
                      bottom 0;
                      font_semibold;
                      text_gray 500;
                      font_sans;
                      w_full;
                      truncate;
                    ];
              ]
            (links path);
        ]
      ::
      (match page_type with
      | None -> []
      | Some t ->
          let width =
            match String.length t / 4 with
            | 0 -> 20
            | 1 -> 28
            | 2 -> 48
            | 3 -> 60
            | _ -> 72
          in
          [
            Html.div
              ~a:[ Html.a_class T.[ relative; flex_none; w width ] ]
              [
                Html.h1
                  ~a:
                    [
                      Html.a_class
                        T.
                          [
                            text_3xl;
                            absolute;
                            py 3;
                            bottom 0;
                            right 0;
                            font_semibold;
                            text_gray 500;
                            font_sans;
                          ];
                    ]
                  [ Html.txt t ];
              ];
          ])
    in
    Html.div
      ~a:
        [
          Html.a_class T.[ flex; h 20; relative; border_b `b1; border_gray 200 ];
        ]
      h1

  and title_of_url url =
    let rec inner u =
      match u.Link.Url.Path.kind with
      | "module" | "module-type" | "class" | "class-type" | "argument" -> (
          match u.parent with
          | Some p ->
              (u.name, Link.(page_href ~resolve:(Current url) u)) :: inner p
          | None -> assert false)
      | _ -> []
    in
    match List.rev (inner url) with
    | [] -> None
    | xs -> Some (xs, String.capitalize_ascii url.kind)

  and page indent ({ Page.title; header; items = i; url } as p) =
    let resolve = Link.Current url in
    let i = Doctree.Shift.compute ~on_sub i in
    let toc = (Toc.from_items ~resolve ~path:url i :> any Html.elt list) in
    let subpages = subpages indent p in
    let t = title_of_url url in
    let header =
      match t with
      | Some (ts, ty) ->
          let t = mktitle (Some ty) ts in
          (t :: items ~resolve (List.tl header) :> any Html.elt list)
      | _ -> (items ~resolve header :> any Html.elt list)
    in
    let content = (items ~resolve i :> any Html.elt list) in
    let page = Tree.make ~indent ~header ~toc ~url title content subpages in
    page
end

let render ~indent page = Page.page indent page

let doc ~xref_base_uri b =
  let resolve = Link.Base xref_base_uri in
  block ~resolve b
