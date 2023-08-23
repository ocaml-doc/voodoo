module M = Map.Make (Fpath)

type t = { installed : Fpath.t M.t; src : Fpath.t M.t }

open Sexplib.Sexp

let parse_dep = function
  | List [ Atom "File"; List [ Atom "In_build_dir"; Atom b ] ] ->
      Some (Fpath.v b)
  | List [ Atom "File"; List _ ] -> (* Not in build dir, this is OK *) None
  | List (Atom "glob" :: _) -> (* Fine, external glob *) None
  | _ -> None

let parse_deps = function [ List l ] -> List.filter_map parse_dep l | _ -> []
let parse_file = function Atom x -> Some (Fpath.v x) | _ -> None

let parse_files = function
  | List [ Atom "files"; List l ] -> List.filter_map parse_file l
  | List [ Atom "directories"; List _ ] -> [] (* This is fine *)
  | _ -> []

let parse_targets = function
  | [ List l ] -> List.map parse_files l |> List.flatten
  | _ -> []

let relativize p ~root = Fpath.(relativize ~root:(v root) p) |> Option.get

let read path =
  let init = { installed = M.empty; src = M.empty } in
  let p =
    match Dune.sexp_of_file path with
    | Ok p -> p
    | Error (`Msg m) ->
        Format.eprintf "Failed to read '%a' (%s)\n%!" Fpath.pp path m;
        List []
  in
  let rs = match p with List l -> l | _ -> [] in
  let vs =
    List.map (fun r -> Result.value ~default:[] (Dune.assoc_list r)) rs
  in
  List.fold_left
    (fun acc r ->
      try
        let deps = List.assoc "deps" r |> parse_deps in
        let targets = List.assoc "targets" r |> parse_targets in
        let is_install_rule =
          List.exists Fpath.(is_prefix (v "install/default")) targets
        in
        if is_install_rule then (
          Format.eprintf "install rule\n%!";
          match (targets, deps) with
          | [ target ], [ dep ] ->
              let t = relativize ~root:"install/default" target in
              let d = relativize ~root:"_build/default" dep in
              { acc with installed = M.add t d acc.installed }
          | _, _ ->
              Format.eprintf
                "install rule with unexpected number of deps/targets\n\
                 %a\n\
                 %a\n\
                 %!"
                pp_hum
                (List (List.assoc "deps" r))
                pp_hum
                (List (List.assoc "targets" r));
              acc)
        else
          let cmt_target =
            targets
            |> List.find (Fpath.has_ext ".cmt")
            |> relativize ~root:"default"
          in
          let ml_deps =
            List.find_all (Fpath.mem_ext [ ".ml"; ".ml-gen" ]) deps
          in
          match ml_deps with
          | [ ml_dep ] ->
              let ml_dep = relativize ~root:"_build/default" ml_dep in
              { acc with src = M.add cmt_target ml_dep acc.src }
          | _ ->
              Format.eprintf
                "Unhandled, multiple ml files for a cmt dependency found: %a"
                (Format.pp_print_list ~pp_sep:Format.pp_print_space Fpath.pp)
                ml_deps;
              acc
      with _ -> acc)
    init vs

let ml_of_cmt t cmt_path =
  try
    let build_path = M.find cmt_path t.installed in
    let src_path = M.find build_path t.src in
    Some src_path
  with _ -> None
