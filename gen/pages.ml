(* Pages - specific pages to render *)

module Html = Tyxml.Html
module T = Voodoo_web.Tailwind

module Package = struct
  type t = Html_types.html Html.elt

  let v : string -> t =
   fun name ->
    let url = Components.Urls.package_page name in
    let head = Components.head ~url name in
    let script = Some "Voodoo.update('package.json')" in
    let content =
      Html.div
        ~a:[ Html.a_class T.[ p 4; w_full ] ]
        [
          Html.h1
            ~a:
              [
                Html.a_class
                  T.[ text_xl; pb 4; mb 4; border_b `b1; border_gray 900 ];
              ]
            [ Html.txt name ];
          Html.ul ~a:[ Html.a_id "versions_container" ] [];
        ]
    in
    Components.page head content script
end

module Packages = struct
  type t = Html_types.html Html.elt

  let v : string list -> t =
   fun packages ->
    let url = Components.Urls.packages_page in
    let head = Components.head ~url "Packages" in
    let packages =
      List.map
        (fun pkg_name ->
          Html.li
            ~a:[ Html.a_class T.[ mx_auto ] ]
            [
              Html.a
                ~a:[ Html.a_href (Printf.sprintf "%s/index.html" pkg_name) ]
                [ Html.txt pkg_name ];
            ])
        packages
    in
    let content =
      Html.div
        ~a:[ Html.a_class T.[ p 4; w_full ] ]
        [
          Html.h1
            ~a:
              [
                Html.a_class
                  T.[ text_xl; pb 4; mb 4; border_b `b1; border_gray 900 ];
              ]
            [ Html.txt "Packages" ];
          Html.ul ~a:[ Html.a_id "packages_container" ] packages;
        ]
    in
    Components.page head content None
end
