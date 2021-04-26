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

let hdr = ref (Some "")

type uri = Absolute of string | Relative of string

let page_creator ?(theme_uri = Relative "./") ~url name header toc content =
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
                [
                  "ml-4";
                  "text-sm";
                  "font-medium";
                  "text-black";
                  "hover:text-gray-500";
                ];
            ]
          [ Html.txt url'.Link.Url.Path.name ]
      in
      let icon =
        Html.Unsafe.data
          {|
      <svg class="flex-shrink-0 w-6 h-full text-black" viewBox="0 0 24 44" preserveAspectRatio="none" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path d="M.293 0l22 22-22 22h1.414l22-22-22-22H.293z" />
        </svg>
      |}
      in
      let div =
        Html.div ~a:[ Html.a_class [ "flex"; "items-center" ] ] [ icon; link ]
      in
      let li = Html.li ~a:[ Html.a_class [ "flex" ] ] [ div ] in
      match url'.Link.Url.Path.parent with
      | Some p -> li :: handle p
      | None -> [ li ]
    in
    Html.div
      ~a:[ Html.a_class [ "flex-row"; "flex-1" ] ]
      [
        Html.nav
          ~a:
            [
              Html.a_class
                [
                  "bg-yellow-500";
                  "border-t";
                  "border-b";
                  "border-yellow-700";
                  "flex";
                  "flex-row";
                ];
            ]
          [
            Html.ol
              ~a:
                [
                  Html.a_class
                    [
                      "max-w-screen-xl";
                      "w-full";
                      "px-4";
                      "flex";
                      "space-x-4";
                      "sm:px-6";
                      "lg:px-8";
                    ];
                ]
              (handle url |> List.rev);
          ];
      ]
  in

  let toc_div =
    Html.div
      ~a:
        [
          Html.a_class
            [ "w-72"; "bg-gray-100"; "h-screen"; "border-r"; "border-gray-200" ];
        ]
      [
        Html.div
          ~a:[ Html.a_class [ "flex"; "h-20"; "border-b"; "relative" ] ]
          [
            Html.h2
              ~a:
                [
                  Html.a_class
                    [
                      "text-xl";
                      "absolute";
                      "inset-x-0";
                      "p-3";
                      "px-5";
                      "bottom-0";
                      "mt-7";
                      "border-gray-200";
                      "font-semibold";
                      "text-gray-500";
                      "font-sans";
                    ];
                ]
              [ Html.txt "On this page" ];
          ];
        toc;
      ]
  in

  let opam_container =
    Html.div
      ~a:[ Html.a_class [ "flex"; "flex-1"; "flex-col"; "lg:flex-row" ] ]
      [
        Html.div
          ~a:[ Html.a_class [ "flex-1" ] ]
          [
            Html.div
              ~a:[ Html.a_class [ "lg:max-w-5xl"; "mx-auto" ] ]
              (header @ content);
          ];
        Html.div
          ~a:
            [
              Html.a_class
                [
                  "w-full"; "lg:w-64"; "border-t"; "lg:border-l"; "bg-gray-100";
                ];
            ]
          [];
      ]
  in

  let content_div =
    Html.div
      ~a:[ Html.a_class [ "flex"; "flex-row"; "h-full"; "w-full" ] ]
      [ toc_div; opam_container ]
  in

  let main_div =
    Html.div
      ~a:[ Html.a_class [ "flex"; "flex-col"; "w-full" ] ]
      [ breadcrumbs; content_div ]
  in
  let body = [ toc_div; main_div ] in
  Html.html head
    (Html.body ~a:[ Html.a_class [] ]
       [
         Html.div
           ~a:
             [
               Html.a_class
                 [
                   "h-screen";
                   "flex";
                   "overflow-hidden";
                   "bg-white";
                   "font-serif";
                 ];
             ]
           body;
       ])

let make ?theme_uri ~indent ~url ~header ~toc title content children =
  let filename = Link.Path.as_filename url in
  let html = page_creator ?theme_uri ~url title header toc content in
  let content ppf = (Html.pp ~indent ()) ppf html in
  { Odoc_document.Renderer.filename; content; children }

let open_details = ref true
