open Lwt
open Js_of_ocaml
open Js_of_ocaml_tyxml
module Html = Tyxml_js.Html5
module T = Tailwind

type versions = { 
  version : string;
  link : string;
  status : string;
} [@@deriving yojson]

type v_list = versions list [@@deriving yojson]


let error f =
  Printf.ksprintf
    (fun s ->
      Firebug.console##log (Js.string s))
    f

let by_id s = Dom_html.getElementById s

let replace_child p n =
  Js.Opt.iter p##.firstChild (fun c -> Dom.removeChild p c);
  Dom.appendChild p n

let versions vs =
  Html.ul
    ~a:[ Html.a_class T.[ ml 4; "test-orange" ] ]
    (List.map
       (fun { version; link; status=_} ->
         Html.li
           [
             Html.span
               ~a:
                 [
                   Html.a_class
                     T.
                       [
                         bg_green 400;
                         flex_shrink 0;
                         inline_block;
                         h 2;
                         w 2;
                         rounded_full;
                       ];
                 ]
               [];
             Html.a ~a:[ Html.a_href link; Html.a_class T.[ml 2] ] [ Html.txt version ];
           ])
       vs)
  |> Tyxml_js.To_dom.of_element

let update_versions json =
  Firebug.console##log (Printf.sprintf "update_version %s" json);
  Js_of_ocaml_lwt.XmlHttpRequest.get json >>= fun j ->
  match j.code with
  | 200 ->
      error "Got json: %s" j.content;
      let lex = Yojson.Safe.from_string j.content in
      let vs = match v_list_of_yojson lex with Ok x -> x | Error _ -> [] in
      let html = vs |> versions in
      error "got html";
      let container = by_id "versions_container" in
      error "found container";
      replace_child container html;
      error "replaced";
      Lwt.return ()
  | _ ->
      Js_of_ocaml.Firebug.console##log
        (Printf.sprintf "Failed to get versions json");
      Lwt.return ()

let _ =
  Js.export "Voodoo"
    (object%js
       method update_versions url = update_versions (Js.to_string url)
    end)
