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
module T = Voodoo_web.Tailwind

let opam : OpamFile.OPAM.t option ref = ref None

let namever : string ref = ref ""

let otherdocs : (Odoc_model.Paths.Identifier.t * Fpath.t) list ref = ref []

let othervers : Odoc_model.Paths.Identifier.t list ref = ref []

let pkgname = ref ""

type uri = Absolute of string | Relative of string

let page_creator ~url name header (toc : Html_types.flow5 Html.elt list) content
    =
  let path = Link.Path.for_printing url in
  let package_json =
    try Some (Hrefs.package_json !pkgname url) with _ -> None
  in
  let title_string = Printf.sprintf "%s (%s)" name (String.concat "." path) in
  let head = Components.head ~url title_string in

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
                min_h_screen;
                border_r `b1;
                border_gray 200;
                sticky;
                top 0;
                hidden;
                lg block;
              ];
        ]
      (Html.div
         ~a:
           [
             Html.a_class T.[ flex; h 20; border_b `b1; relative; border_t `b1 ];
           ]
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
    | Some o -> Metadata.v url o !othervers !otherdocs !namever
  in

  let opam_container =
    Html.div
      ~a:[ Html.a_class T.[ flex; flex_1; flex_col; lg flex_row ] ]
      [
        Html.div
          ~a:[ Html.a_class T.[ flex_1 ] ]
          [
            Html.div
              ~a:
                [
                  Html.a_class
                    T.
                      [
                        lg max_w_5xl; mx_auto; px 3; lg @@ px 10; mb 10; text_sm;
                      ];
                ]
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
                    border_t `b1;
                    lg @@ border_l `b1;
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
      [ content_div ]
  in
  let footer_script =
    match package_json with
    | Some vjs -> Some (Printf.sprintf "Voodoo.update('%s')" vjs)
    | _ -> None
  in
  Components.page url head main_div footer_script

let make ~indent ~url ~header ~(toc : Html_types.flow5 Html.elt list) title
    content children =
  let filename = Link.Path.as_filename url in
  let html = page_creator ~url title header toc content in
  let content ppf = (Html.pp ~indent ()) ppf html in
  { Odoc_document.Renderer.filename; content; children }

let open_details = ref true
