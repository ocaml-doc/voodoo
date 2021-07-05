(* Components *)
module Html = Tyxml.Html
module T = Voodoo_web.Tailwind

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

let page url head contents footer_script =
  Html.html head
    (Html.body
       ~a:[ Html.a_class T.[ mx_auto; "max-w-screen-2xl" ] ]
       ([
          Main_header.v url;
          Html.div
            ~a:[ Html.a_class T.[ min_h_screen; flex; bg_white; font_sans ] ]
            [ contents ];
        ]
       @ Html.script (Html.txt "Voodoo.init()")
         ::
         (match footer_script with
         | Some s -> [ Html.script (Html.txt s) ]
         | None -> [])))
