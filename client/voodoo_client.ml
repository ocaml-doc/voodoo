open Lwt
open Js_of_ocaml
open Js_of_ocaml_tyxml
module H = Tyxml_js.Html5
module T = Voodoo_web.Tailwind

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
  H.ul
    ~a:[ H.a_class T.[ ml 4; "test-orange" ] ]
    (List.map
       (fun { version; link; status_url = _; status } ->
         H.li
           [
             H.span
               ~a:
                 [
                   H.a_class
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
             H.a ~a:[ H.a_href link; H.a_class T.[ ml 2 ] ] [ H.txt version ];
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
      let stem =
        try String.sub json 0 (String.rindex json '/' + 1) with _ -> ""
      in
      let lex = Yojson.Safe.from_string j.content in
      error "Got lex";
      let vs =
        match lex with
        | `List ls ->
            List.fold_right
              (fun v acc ->
                match v with
                | `String version ->
                    error "version: %s" version;
                    let link = Printf.sprintf "%s%s/index.html" stem version in
                    let status_url =
                      Printf.sprintf "%sπ%s/status.json" stem version
                    in
                    let status = Unknown in
                    { version; link; status_url; status } :: acc
                | _ ->
                    error "Not a string";
                    acc)
              ls []
        | _ ->
            error "Not a list";
            []
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
              | _ ->
                  error "Bad code: %d" j.code;
                  Unknown
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

(* Menu functions *)
let init () =
  let opened = ref None in
  let aria_expanded = Js.string "aria-expanded" in
  let s_true = Js.string "true" in
  let s_false = Js.string "false" in
  let alter fn which =
    let id = Voodoo_web.Menu.Section.menu_id_of which in
    let elt = by_id id in
    let classes = elt##.classList in
    classes##remove (Js.string "hidden");
    fn elt classes
  in
  let close x =
    alter
      (fun elt classes ->
        classes##add (Js.string "hidden");
        elt##setAttribute aria_expanded s_false)
      x;

    opened := None
  in
  let open_ x =
    alter
      (fun elt _classes ->
        ();
        elt##setAttribute aria_expanded s_true)
      x;
    opened := Some x
  in
  let toggle which =
    match !opened with
    | Some x when x = which -> close which
    | Some y ->
        close y;
        open_ which
    | None -> open_ which
  in
  List.iter
    (fun (x, _) ->
      let button_id = Voodoo_web.Menu.Section.button_id_of x in
      error "Setting handler on id: %s" button_id;
      let elt = by_id button_id in
      elt##.onclick :=
        Dom_html.handler (fun _ ->
            error "handler fired!";
            toggle x;
            Js._true))
    Voodoo_web.Menu.menu

let _ =
  Js.export "Voodoo"
    (object%js
       method init = init ()

       method update_versions url = update_versions (Js.to_string url)
    end)
