(* Components *)
module Html = Tyxml.Html
module T = Voodoo_web.Tailwind

module Urls = struct
  type leaf = File | Container_page

  let of_simple_list leaf l =
    let leaf_ty =
      match leaf with File -> "file" | Container_page -> "container-page"
    in
    let rec inner = function
      | [] -> failwith "Bad path"
      | [ x ] -> [ (leaf_ty, x) ]
      | x :: xs -> ("container-page", x) :: inner xs
    in
    let l = inner l in
    match Link.Path.of_list l with
    | Some l -> l
    | None ->
        Format.eprintf "Failed to convert list to url: [%a]\n%!"
          Link.Path.list_pp l;
        failwith "Fatal error"

  let package_page pkgname =
    of_simple_list Container_page [ "packages"; pkgname ]

  let packages_page = of_simple_list Container_page [ "packages" ]

  let version_json pkgname =
    of_simple_list File [ "packages"; pkgname; "version.json" ]

  let tailwind_css = of_simple_list File [ "packages"; "tailwind.css" ]

  let extra_css = of_simple_list File [ "packages"; "extra.css" ]

  let highlight_js = of_simple_list File [ "packages"; "highlight.pack.js" ]

  let voodoo_client_js = of_simple_list File [ "packages"; "voodoo_client.js" ]
end

module Hrefs = struct
  let to_href ~url dest_page =
    let dest_url =
      Odoc_document.Url.Anchor.{ page = dest_page; kind = ""; anchor = "" }
    in
    Link.href ~resolve:(Current url) dest_url

  let version_json pkgname url = to_href ~url (Urls.version_json pkgname)

  let tailwind_css url = to_href ~url Urls.tailwind_css

  let extra_css url = to_href ~url Urls.extra_css

  let highlight_js url = to_href ~url Urls.highlight_js

  let voodoo_client_js url = to_href ~url Urls.voodoo_client_js
end

let head ~url title : Html_types.head Html.elt =
  let odoc_css_uri = Hrefs.tailwind_css url in
  let odoc_css_extra = Hrefs.extra_css url in

  let highlight_js_uri = Hrefs.highlight_js url in
  let voodoo_client_uri = Hrefs.voodoo_client_js url in

  let alpine_js_uri =
    "https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
  in

  Html.head
    (Html.title (Html.txt title))
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
      Html.script ~a:[ Html.a_src alpine_js_uri; Html.a_defer () ] (Html.txt "");
    ]

let page head contents footer_script =
  Html.html head
    (Html.body
       ~a:[ Html.a_class T.[ mx_auto; "max-w-screen-2xl" ] ]
       ([
          Main_header.v;
          Html.div
            ~a:[ Html.a_class T.[ h_screen; flex; bg_white; font_sans ] ]
            [ contents ];
        ]
       @ Html.script (Html.txt "Voodoo.init()")
         ::
         (match footer_script with
         | Some s -> [ Html.script (Html.txt s) ]
         | None -> [])))
