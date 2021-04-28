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

module Html = Tyxml.Html
module T = Tailwind

let opam : OpamFile.OPAM.t option ref = ref None

let namever : string ref = ref ""

let otherdocs : (Odoc_model.Paths.Identifier.t * Fpath.t) list ref = ref []

type uri = Absolute of string | Relative of string

let page_creator ?(theme_uri = Relative "./") ~url name header
    (toc : Html_types.flow5 Html.elt list) content =
  let is_leaf_page = Link.Path.is_leaf_page url in
  let path = Link.Path.for_printing url in
  let rec add_dotdot ~n acc =
    if n <= 0 then acc else add_dotdot ~n:(n - 1) ("../" ^ acc)
  in
  let resolve_relative_uri uri =
    (* Remove the first "dot segment". *)
    let uri =
      if String.length uri >= 2 && String.sub uri 0 2 = "./" then
        String.sub uri 2 (String.length uri - 2)
      else uri
    in
    (* How deep is this page? *)
    let n =
      List.length path
      - if (* This is just horrible. *)
           is_leaf_page then 1 else 0
    in
    add_dotdot uri ~n
  in

  let head : Html_types.head Html.elt =
    let title_string = Printf.sprintf "%s (%s)" name (String.concat "." path) in

    let theme_uri =
      match theme_uri with
      | Absolute uri -> uri
      | Relative uri -> resolve_relative_uri uri
    in

    let support_files_uri = resolve_relative_uri "./" in

    let odoc_css_uri = theme_uri ^ "tailwind.css" in
    let odoc_css_extra = theme_uri ^ "extra.css" in

    let highlight_js_uri = support_files_uri ^ "highlight.pack.js" in
    let alpine_js_uri =
      "https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
    in

    Html.head
      (Html.title (Html.txt title_string))
      [
        Html.link ~rel:[ `Stylesheet ] ~href:odoc_css_uri ();
        Html.link ~rel:[ `Stylesheet ] ~href:odoc_css_extra ();
        Html.meta ~a:[ Html.a_charset "utf-8" ] ();
        Html.meta
          ~a:[ Html.a_name "generator"; Html.a_content "odoc %%VERSION%%" ]
          ();
        Html.meta
          ~a:
            [
              Html.a_name "viewport";
              Html.a_content "width=device-width,initial-scale=1.0";
            ]
          ();
        Html.script ~a:[ Html.a_src highlight_js_uri ] (Html.txt "");
        Html.script (Html.txt "hljs.initHighlightingOnLoad();");
        Html.script
          ~a:[ Html.a_src alpine_js_uri; Html.a_defer () ]
          (Html.txt "");
      ]
  in

  let breadcrumbs =
    let rec handle url' =
      let link =
        Html.a
          ~a:
            [
              Html.a_href
                (Link.href ~resolve:(Current url)
                   { Link.Url.Anchor.page = url'; anchor = ""; kind = "" });
              Html.a_class
                T.
                  [
                    ml 4;
                    text_sm;
                    font_medium;
                    text_gray 100;
                    hover @@ text_gray 500;
                  ];
            ]
          [ Html.txt url'.Link.Url.Path.name ]
      in
      let icon =
        Html.Unsafe.data
          {|
      <svg class="flex-shrink-0 w-6 h-full text-gray-100" viewBox="0 0 24 44" preserveAspectRatio="none" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path d="M.293 0l22 22-22 22h1.414l22-22-22-22H.293z" />
        </svg>
      |}
      in
      let div =
        Html.div
          ~a:[ Html.a_class T.[ flex; items_center; text_gray 100 ] ]
          [ icon; link ]
      in
      let li = Html.li ~a:[ Html.a_class T.[ flex ] ] [ div ] in
      match url'.Link.Url.Path.parent with
      | Some p -> li :: handle p
      | None -> [ li ]
    in
    let home_svg =
      Html.Unsafe.data
        {|
    <svg class="flex-shrink-0 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
          </svg>
    |}
    in
    let home_link =
      Html.a
        ~a:
          [
            Html.a_href "#";
            Html.a_class T.[ text_gray 100; hover @@ text_gray 500 ];
          ]
        [
          home_svg;
          Html.span ~a:[ Html.a_class T.[ sr_only ] ] [ Html.txt "Home" ];
        ]
    in
    let home_div =
      Html.div ~a:[ Html.a_class T.[ flex; items_center ] ] [ home_link ]
    in
    let home_li = Html.li ~a:[ Html.a_class T.[ flex ] ] [ home_div ] in
    Html.div
      ~a:[ Html.a_class T.[ flex_row; flex_1 ] ]
      [
        Html.nav
          ~a:
            [
              Html.a_class
                T.
                  [
                    bg_gray 900;
                    border_t;
                    border_b;
                    border_gray 700;
                    flex;
                    flex_row;
                  ];
            ]
          [
            Html.ol
              ~a:
                [
                  Html.a_class
                    T.
                      [
                        max_w_screen_xl;
                        w_full;
                        px 4;
                        flex;
                        space_x 4;
                        sm @@ px 6;
                        lg @@ px 8;
                      ];
                ]
              (home_li :: (handle url |> List.rev));
          ];
      ]
  in

  let toc_div =
    Html.div
      ~a:
        [
          Html.a_class
            T.
              [
                w 72;
                flex_none;
                bg_gray 100;
                h_screen;
                border_r;
                border_gray 200;
                sticky;
                top 0;
                hidden;
                lg block;
              ];
        ]
      (Html.div
         ~a:[ Html.a_class T.[ flex; h 20; border_b; relative ] ]
         [
           Html.h2
             ~a:
               [
                 Html.a_class
                   T.
                     [
                       text_xl;
                       absolute;
                       inset_x 0;
                       p 3;
                       px 5;
                       bottom 0;
                       mt 7;
                       border_gray 200;
                       font_semibold;
                       text_gray 500;
                       font_sans;
                     ];
               ]
             [ Html.txt "On this page" ];
         ]
       :: toc)
  in

  let metadata =
    match !opam with
    | None -> [ Html.txt "No opam file" ]
    | Some o -> Metadata.v url o !otherdocs !namever
  in

  let opam_container =
    Html.div
      ~a:[ Html.a_class T.[ flex; flex_1; flex_col; lg flex_row ] ]
      [
        Html.div
          ~a:[ Html.a_class T.[ flex_1 ] ]
          [
            Html.div
              ~a:[ Html.a_class T.[ lg max_w_5xl; mx_auto; px 10 ] ]
              (header @ content);
          ];
        Html.div
          ~a:
            [
              Html.a_class
                T.
                  [
                    w_full;
                    flex_none;
                    lg @@ w 72;
                    border_t;
                    lg border_l;
                    bg_gray 100;
                  ];
            ]
          metadata;
      ]
  in

  let content_div =
    Html.div
      ~a:[ Html.a_class T.[ flex; flex_row; flex_1 ] ]
      [ toc_div; opam_container ]
  in

  let main_div =
    Html.div
      ~a:[ Html.a_class T.[ flex; flex_col; w_full; h_full ] ]
      [ breadcrumbs; content_div ]
  in
  Html.html head
    (Html.body ~a:[ Html.a_class [] ]
       [
         Main_header.v;
         Html.div
           ~a:[ Html.a_class T.[ h_screen; flex; bg_white; font_sans ] ]
           [ main_div ];
       ])

let make ?theme_uri ~indent ~url ~header ~(toc : Html_types.flow5 Html.elt list)
    title content children =
  let filename = Link.Path.as_filename url in
  let html = page_creator ?theme_uri ~url title header toc content in
  let content ppf = (Html.pp ~indent ()) ppf html in
  { Odoc_document.Renderer.filename; content; children }

let open_details = ref true
