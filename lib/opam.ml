(* opam *)

let switch = ref None

type package = {
  name : string;
  version : string;
}

let of_string str =
  match Astring.String.cut ~sep:"." str with
  | Some (name, version) -> Some { name; version }
  | _ -> None

let rec get_switch () =
  match !switch with
  | None ->
    let cmd = "opam switch show" in
    let cur_switch = Util.lines_of_process cmd |> List.hd in
    switch := Some cur_switch;
    get_switch ()
  | Some s ->
    s

let pp_package fmt package =
    Format.fprintf fmt "%s.%s" package.name package.version

let sexp_of v =
  let open Sexplib.Sexp in
  List [
    List [ Atom "name"; Atom v.name ];
    List [ Atom "version"; Atom v.version ];
  ]

let of_sexp s =
  let open Sexplib.Sexp in
  match s with
  | List [
      List [ Atom "name"; Atom name ];
      List [ Atom "version"; Atom version ];
    ] -> { name; version }
  | _ -> failwith "bad sexp"

let save fname v =
  let oc = open_out (Fpath.to_string fname) in
  let fmt = Format.formatter_of_out_channel oc in
  Format.fprintf fmt "%a%!" Sexplib.Sexp.pp_hum (sexp_of v);
  close_out oc

let load fname =
  let ic = open_in (Fpath.to_string fname) in
  let contents = String.concat "\n" (Util.lines_of_channel ic) in
  let sexp = Sexplib.Sexp.of_string contents in
  close_in ic;
  of_sexp sexp

module S = Set.Make(struct type t = package let compare x y = compare x y end)
let deps_of_opam_result =
  fun line -> match Astring.String.fields ~empty:false line with | [name; version] -> [{name; version} ] | _ -> []

let dependencies package =
  let open Listm in
  if package.name = "ocaml" then [] else
  let cmd = Format.asprintf "opam list --switch %s --required-by %a --columns=name,version --color=never --short" (get_switch ()) pp_package package in
  Util.lines_of_process cmd >>= deps_of_opam_result

let all_opam_packages () =
  let open Listm in
  let cmd = Format.asprintf "opam list --switch %s --columns=name,version --color=never --short" (get_switch ()) in
  Util.lines_of_process cmd >>= deps_of_opam_result

let lib () =
  let cmd = Format.asprintf "opam var --switch %s lib" (get_switch ()) in
  Util.lines_of_process cmd |> List.hd


