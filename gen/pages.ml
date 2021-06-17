(* Pages - specific pages to render *)

module Html = Tyxml.Html
module T = Voodoo_web.Tailwind

module Package = struct
  type t = Html_types.html Html.elt

  let v : string -> t =
   fun name ->
    let url = Hrefs.Urls.package_page name in
    let head = Components.head ~url name in
    let script = Some "Voodoo.update('package.json')" in
    let content =
      Html.div
        ~a:[ Html.a_class T.[ p 4; w_full; px 10; bg_gray 100 ] ]
        [
          Html.h1
            ~a:
              [
                Html.a_class
                  T.[ text_3xl; pb 4; mb 4; border_b `b1; border_gray 500; font_extrabold ];
              ]
            [ Html.txt name ];
          Html.p ~a:[ Html.a_class T.[my 5;]] [Html.txt (Printf.sprintf "Some blurb about the package '%s' goes here!" name)];
          Html.ul ~a:[ Html.a_id "versions_container" ] [];
        ]
    in
    Components.page url head content script
end

module Packages = struct
  type t = Html_types.html Html.elt

  let v : string list -> t =
   fun packages ->
    let url = Hrefs.Urls.packages_page in
    let head = Components.head ~url "Packages" in
    let package_li pkg_name =
      Html.li
        ~a:[ Html.a_class T.[ mx_auto; text_gray 800; ] ]
        [
          Html.a
            ~a:[ Html.a_href (Printf.sprintf "%s/index.html" pkg_name); Html.a_class T.[cursor_pointer; "text-orange" ] ]
            [ Html.txt pkg_name ];
        ]
    in
    let interpose_alphabet packages =
      let alpha_heading name =
        Html.h2
          ~a:
            [
              Html.a_class
                T.[ text_lg; font_semibold; py 6; pb 2; text_gray 600 ];
            ]
          [
            Html.txt
              (Printf.sprintf "%c" (Astring.Char.Ascii.uppercase name.[0]));
          ]
      in

      let rec inner ps cur =
        match ps with
        | na :: nb :: rest ->
            let li = package_li na in
            if
              Astring.Char.Ascii.uppercase na.[0]
              <> Astring.Char.Ascii.uppercase nb.[0]
            then
              Html.ul (List.rev (li :: cur))
              :: alpha_heading nb :: inner (nb :: rest) []
            else inner (nb :: rest) (li :: cur)
        | [ na ] ->
            let li = package_li na in
            [ Html.ul (List.rev (li :: cur)) ]
        | [] -> []
      in
      let first = List.hd packages in
      alpha_heading first :: inner packages []
    in

    let list_content =
      interpose_alphabet
        (List.sort
           (fun c1 c2 ->
             String.compare
               (Astring.String.Ascii.uppercase c1)
               (Astring.String.Ascii.uppercase c2))
           packages)
    in
    let content =
      Html.div
        ~a:[ Html.a_class T.[ p 4; w_full; px 10; bg_gray 100 ] ]
        [
          Html.h1
            ~a:
              [
                Html.a_class
                  T.[ text_3xl; pb 4; mb 4; border_b `b1; border_gray 500; font_extrabold ];
              ]
            [ Html.txt "Packages" ];
          Html.div ~a:[ Html.a_id "packages_container"; ] list_content;
        ]
    in
    Components.page url head content None
end
