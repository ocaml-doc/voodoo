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

let othervers : Odoc_model.Paths.Identifier.t list ref = ref []

let pkgname = ref ""

type uri = Absolute of string | Relative of string

module Urls = struct
  let of_simple_list ~url l =
    let rec inner = function
      | [] -> failwith "Bad path"
      | [ x ] -> [ ("file", x) ]
      | x :: xs -> ("container-page", x) :: inner xs
    in
    let get_some = function Some x -> x | None -> failwith "Bad path" in
    let page = inner l |> Link.Path.of_list |> get_some in
    Link.page_href ~resolve:(Link.Current url) page

  let version_json url =
    of_simple_list ~url [ "packages"; !pkgname; "version.json" ]

  let tailwind_css url = of_simple_list ~url [ "packages"; "tailwind.css" ]

  let extra_css url = of_simple_list ~url [ "packages"; "extra.css" ]

  let highlight_js url = of_simple_list ~url [ "packages"; "highlight.pack.js" ]

  let voodoo_client_js url =
    of_simple_list ~url [ "packages"; "voodoo_client.js" ]
end

let page_creator ~url name header (toc : Html_types.flow5 Html.elt list) content
    =
  let path = Link.Path.for_printing url in
  let version_js = try Some (Urls.version_json url) with _ -> None in

  let head : Html_types.head Html.elt =
    let title_string = Printf.sprintf "%s (%s)" name (String.concat "." path) in

    let odoc_css_uri = Urls.tailwind_css url in
    let odoc_css_extra = Urls.extra_css url in

    let highlight_js_uri = Urls.highlight_js url in
    let voodoo_client_uri = Urls.voodoo_client_js url in

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
        Html.script ~a:[ Html.a_src voodoo_client_uri ] (Html.txt "");
        Html.script
          ~a:[ Html.a_src alpine_js_uri; Html.a_defer () ]
          (Html.txt "");
      ]
  in

  let breadcrumbs_data =
    let rec loop url' =
      let link =
        Link.href ~resolve:(Current url)
          { Link.Url.Anchor.page = url'; anchor = ""; kind = "" }
      in
      let text = url'.Link.Url.Path.name in
      match url'.Link.Url.Path.parent with
      | Some p -> (text, link) :: loop p
      | None -> [ (text, link) ]
    in
    loop url |> List.rev
  in

  let breadcrumbs = Breadcrumbs.breadcrumbs "#" breadcrumbs_data in

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
                border_r `b1;
                border_gray 200;
                sticky;
                top 0;
                hidden;
                lg block;
              ];
        ]
      (Html.div
         ~a:[ Html.a_class T.[ flex; h 20; border_b `b1; relative ] ]
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
      [ breadcrumbs; content_div ]
  in
  Html.html head
    (Html.body
       ~a:[ Html.a_class T.[ mx_auto; "max-w-screen-2xl" ] ]
       ([
          Main_header.v;
          Html.div
            ~a:[ Html.a_class T.[ h_screen; flex; bg_white; font_sans ] ]
            [ main_div ];
        ]
       @
       match version_js with
       | Some vjs ->
           [ Html.script (Html.txt (Printf.sprintf "Voodoo.update('%s')" vjs)) ]
       | None -> []))

let make ~indent ~url ~header ~(toc : Html_types.flow5 Html.elt list) title
    content children =
  let filename = Link.Path.as_filename url in
  let html = page_creator ~url title header toc content in
  let content ppf = (Html.pp ~indent ()) ppf html in
  { Odoc_document.Renderer.filename; content; children }

let open_details = ref true
