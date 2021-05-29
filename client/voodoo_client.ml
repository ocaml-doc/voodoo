open Lwt
open Js_of_ocaml
open Js_of_ocaml_tyxml
module Html = Tyxml_js.Html5
module T = Tailwind

type versions_state = Built | Failed | Unknown

type versions = {
  version : string;
  link : string;
  status_url : string;
  status : versions_state;
}

let versions : versions list ref = ref []

let error f = Printf.ksprintf (fun s -> Firebug.console##log (Js.string s)) f

let by_id s = Dom_html.getElementById s

let replace_child p n =
  Js.Opt.iter p##.firstChild (fun c -> Dom.removeChild p c);
  Dom.appendChild p n

let versions_html vs =
  Html.ul
    ~a:[ Html.a_class T.[ ml 4; "test-orange" ] ]
    (List.map
       (fun { version; link; status_url = _; status } ->
         Html.li
           [
             Html.span
               ~a:
                 [
                   Html.a_class
                     T.
                       [
                         (match status with
                         | Built -> bg_green 400
                         | Failed -> bg_red 400
                         | Unknown -> bg_yellow 400);
                         flex_shrink 0;
                         inline_block;
                         h 2;
                         w 2;
                         rounded_full;
                       ];
                 ]
               [];
             Html.a
               ~a:[ Html.a_href link; Html.a_class T.[ ml 2 ] ]
               [ Html.txt version ];
           ])
       vs)
  |> Tyxml_js.To_dom.of_element

let update_html () =
  let html = versions_html !versions in
  let container = by_id "versions_container" in
  replace_child container html;
  Lwt.return ()

let update_versions json =
  Firebug.console##log (Printf.sprintf "update_version %s" json);
  Js_of_ocaml_lwt.XmlHttpRequest.get json >>= fun j ->
  match j.code with
  | 200 ->
      error "Got json: %s" j.content;
      let stem = String.sub json 0 (String.rindex json '/') in
      let lex = Yojson.Safe.from_string j.content in
      let vs =
        match lex with
        | `List ls ->
            List.fold_right
              (fun v acc ->
                match v with
                | `String version ->
                    let link = Printf.sprintf "%s/%s/index.html" stem version in
                    let status_url =
                      Printf.sprintf "%s/%s/status.json" stem version
                    in
                    let status = Unknown in
                    { version; link; status_url; status } :: acc
                | _ -> acc)
              ls []
        | _ -> []
      in
      versions := vs;
      List.iter
        (fun v ->
          let th =
            Js_of_ocaml_lwt.XmlHttpRequest.get v.status_url >>= fun j ->
            let status =
              match j.code with
              | 200 -> (
                  match Yojson.Safe.from_string j.content with
                  | `String "Built" -> Built
                  | `String "Failed" -> Failed
                  | _ -> Unknown)
              | _ -> Unknown
            in
            let vs =
              List.map
                (fun v' ->
                  if v.version = v'.version then { v' with status } else v')
                !versions
            in
            versions := vs;
            update_html ()
          in
          ignore th)
        vs;

      update_html ()
  | _ ->
      Js_of_ocaml.Firebug.console##log
        (Printf.sprintf "Failed to get versions json");
      Lwt.return ()

let _ =
  Js.export "Voodoo"
    (object%js
       method update_versions url = update_versions (Js.to_string url)
    end)
