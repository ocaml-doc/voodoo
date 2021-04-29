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

type any = Html_types.flow5

type item = Html_types.flow5_without_header_footer

type flow = Html_types.flow5_without_sectioning_heading_header_footer

type phrasing = Html_types.phrasing

type non_link_phrasing = Html_types.phrasing_without_interactive

let mk_anchor_link id pr =
  [
    Html.a
      ~a:
        [
          Html.a_href ("#" ^ id);
          Html.a_class
            [ "hover-link"; "inline-block"; "-ml-7"; "pr-" ^ string_of_int pr ];
        ]
      [
        Html.span
          ~a:
            [
              Html.a_class
                [
                  "align-middle";
                  "text-gray-200";
                  "transition";
                  "text-base";
                  "font-serif";
                  "opacity-0";
                  "hover:text-gray-700";
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
  let a = Html.a_class [ "font-normal"; "text-base" ] :: a' in
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
      let a = [ Html.a_class [ "cursor-pointer"; "text-blue-500" ] ] in
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
                Html.a_class [ "cursor-pointer"; "text-blue-500" ];
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
  let common = [ "text-gray-800"; "font-sans" ] @ extracls in
  let mk, classes =
    match h.level with
    | 0 ->
        ( Html.h1,
          [
            "text-3xl"; "mt-7"; "border-b-2"; "border-gray-200"; "font-semibold";
          ] )
    | 1 -> (Html.h2, [ "text-2xl"; "my-4" ])
    | 2 -> (Html.h3, [ "text-xl"; "my-4"; "text-gray-900" ])
    | 3 -> (Html.h4, [ "text-lg"; "text-gray-900" ])
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
        [ Html.p ~a:[ Html.a_class [ "mt-4" ] ] (inline ~resolve i) ]
    | List (typ, l) ->
        let mk, cls =
          match typ with
          | Ordered -> (Html.ol, [ "list-decimal"; "mt-2"; "mb-4" ])
          | Unordered -> (Html.ul, [ "list-disc"; "mt-2"; "mb-4" ])
        in
        [
          mk ~a:[ Html.a_class cls ]
            (List.map
               (fun x ->
                 Html.li ~a:[ Html.a_class [ "ml-6" ] ] (block ~resolve x))
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
            ~a:
              [ Html.a_class [ "bg-gray-100"; "p-3"; "my-2"; "overflow-auto" ] ]
            [ Html.txt s ];
        ]
    | Source c ->
        [
          Html.pre
            ~a:
              [ Html.a_class [ "bg-gray-100"; "p-3"; "my-2"; "overflow-auto" ] ]
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
                    ~a:(class_ [ "def-doc"; "pl-4" ])
                    (Html.span ~a:(class_ [ "sr-only" ]) [ Html.txt opening ]
                     :: (inline ~resolve doc :> flow Html.elt list)
                    @ [
                        Html.span ~a:(class_ [ "sr-only" ]) [ Html.txt closing ];
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
              ~a:(class_ ((*attrs @*) classes @ [ "pl-4" ]))
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
                    [
                      "absolute";
                      "bg-gray-500";
                      "opacity-10";
                      "border-gray-500";
                      "rounded-lg";
                      "border-r-8";
                      "rounded-l-none";
                      "top-1";
                      "-right-5";
                      "bottom-1 w-4";
                    ];
                ]
              [];
          ]
        in
        let content =
          let details ~open' =
            let open' = if open' then [ Html.a_open () ] else [] in
            let cls = [ Html.a_class [ "relative" ] ] in
            let summary =
              let anchor_attrib, classes, anchor_link = mk_anchor anchor in
              let a = spec_class (attr @ classes) @ anchor_attrib in
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
        let inc =
          [ Html.div ~a:[ Html.a_class [ "odoc-include" ] ] (doc @ content) ]
        in
        (continue_with [@tailcall]) rest inc
    | Declaration { Item.attr; anchor; content; doc } :: rest ->
        let anchor_attrib, classes, anchor_link = mk_anchor anchor in
        let a =
          spec_class
            (attr @ classes
            @ [
                "p-2";
                "text-base";
                "rounded";
                "border-l-4";
                "border-blue-500";
                "my-3";
                "bg-gray-100";
              ])
          @ anchor_attrib
        in
        let content = anchor_link @ documentedSrc ~resolve content in
        let spec =
          let doc = spec_doc_div ~resolve doc in
          [ div ~a:[ Html.a_class [ "mt-8" ] ] (div ~a content :: doc) ]
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
              Html.a_href href;
              Html.a_class [ "cursor-pointer"; "text-blue-500" ];
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
        [
          Html.nav ~a:[ Html.a_class [ "bg-gray-100"; "p-5" ] ] [ sections toc ];
        ]

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

  let rec include_ ?theme_uri indent { Subpage.content; _ } =
    [ page ?theme_uri indent content ]

  and subpages ?theme_uri indent i =
    Utils.list_concat_map ~f:(include_ ?theme_uri indent)
    @@ Doctree.Subpages.compute i

  and mktitle page_type title =
    let h1 =
      Html.h1
        ~a:
          [
            Html.a_class
              [
                "text-3xl absolute inset-x-0 py-3 mt-7 border-b bottom-0 \
                 border-gray-200 font-semibold text-gray-500 font-sans";
              ];
          ]
        (Html.code
           ~a:[ Html.a_class [ "font-mono"; "text-gray-800" ] ]
           [ Html.txt title ]
         ::
         (match page_type with
         | None -> []
         | Some t ->
             [ Html.span ~a:[ Html.a_class [ "float-right" ] ] [ Html.txt t ] ]))
    in
    Html.div ~a:[ Html.a_class [ "flex"; "h-20"; "relative" ] ] [ h1 ]

  and unparse_header h =
    let open Odoc_document.Types in
    match h with
    | Item.Heading
        {
          level = _;
          label = _;
          title =
            { Inline.attr = []; desc = Inline.Text ty }
            :: {
                 Inline.attr = [];
                 desc =
                   Inline.Source
                     [
                       Source.Tag
                         ( None,
                           [
                             Source.Elt [ _ ];
                             Source.Elt
                               [ { Inline.attr = []; desc = Inline.Text name } ];
                           ] );
                       _;
                     ];
               }
               :: _;
        }
      :: rest ->
        Some (Astring.String.trim ty, name, rest)
    | Item.Heading
        {
          level = _;
          label = _;
          title = { Inline.attr = _; desc = Inline.Text name } :: _;
        }
      :: rest ->
        Some ("", name, rest)
    | _ -> None

  and page ?theme_uri indent ({ Page.title; header; items = i; url } as p) =
    let resolve = Link.Current url in
    let i = Doctree.Shift.compute ~on_sub i in
    let toc = (Toc.from_items ~resolve ~path:url i :> any Html.elt list) in
    let subpages = subpages ?theme_uri indent p in
    let header =
      match unparse_header header with
      | Some (ty, name, rest) ->
          let t = mktitle (Some ty) name in
          (t :: items ~resolve rest :> any Html.elt list)
      | None -> (items ~resolve header :> any Html.elt list)
    in
    let content = (items ~resolve i :> any Html.elt list) in
    let page =
      Tree.make ?theme_uri ~indent ~header ~toc ~url title content subpages
    in
    page
end

let render ?theme_uri ~indent page = Page.page ?theme_uri indent page

let doc ~xref_base_uri b =
  let resolve = Link.Base xref_base_uri in
  block ~resolve b
