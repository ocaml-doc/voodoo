module Urls = struct
  type leaf = File | Container_page

  let of_simple_list leaf l =
    let leaf_ty =
      match leaf with File -> `File | Container_page -> `Page
    in
    let rec inner = function
      | [] -> failwith "Bad path"
      | [ x ] -> [ (leaf_ty, x) ]
      | x :: xs -> (`Page, x) :: inner xs
    in
    let l = inner l in
    match Odoc_document.Url.Path.of_list l with
    | Some l -> l
    | None ->
        failwith "Fatal error"

  let package_page pkgname =
    of_simple_list Container_page [ "packages"; pkgname ]

  let packages_page = of_simple_list Container_page [ "packages" ]

  let package_json pkgname =
    of_simple_list File [ "packages"; pkgname; "package.json" ]

  let tailwind_css = of_simple_list File [ "packages"; "tailwind.css" ]

  let extra_css = of_simple_list File [ "packages"; "extra.css" ]

  let highlight_js = of_simple_list File [ "packages"; "highlight.pack.js" ]

  let voodoo_client_js = of_simple_list File [ "packages"; "voodoo_client.js" ]

  let caml_image_svg =
    of_simple_list File [ "packages"; "colour-transparent-icon.svg" ]
end

module Hrefs = struct
  let to_href ~url dest_page =
    let dest_url =
      Odoc_document.Url.from_path dest_page
    in
    Link.href ~resolve:(Current url) dest_url

  let package_json pkgname url = to_href ~url (Urls.package_json pkgname)

  let tailwind_css url = to_href ~url Urls.tailwind_css

  let extra_css url = to_href ~url Urls.extra_css

  let highlight_js url = to_href ~url Urls.highlight_js

  let voodoo_client_js url = to_href ~url Urls.voodoo_client_js

  let caml_image_svg url = to_href ~url Urls.caml_image_svg
end

include Hrefs
