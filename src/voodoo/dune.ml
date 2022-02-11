(* Process dune-package *)
open Result

module Library = struct
  type wrapped_t = {
    main_module_name : string;
    modules : string list;
    alias_module : string;
  }

  type unwrapped_t = { modules : string list }
  type singleton_t = string

  type wrapping =
    | Wrapped of wrapped_t
    | Unwrapped of unwrapped_t
    | Singleton of singleton_t

  type t = { name : string; dependencies : string list; ty : wrapping }
end

type t = { name : string; version : string option; libraries : Library.t list }

let ( >>= ) m f = match m with Ok v -> f v | Error e -> Error e
let join = function Ok r -> r | Error _ as e -> e

let assoc_list = function
  | Sexplib.Sexp.List ls ->
      List.map
        (function
          | Sexplib.Sexp.List (Sexplib.Sexp.Atom x :: xs) -> Some (x, xs)
          | _ -> None)
        ls
      |> List.fold_left
           (fun acc x -> match x with Some y -> y :: acc | None -> acc)
           []
      |> List.rev
      |> fun x -> Ok x
  | _ -> Error (`Msg "Expecting list in assoc_list")

let string_of_atom = function
  | [ Sexplib.Sexp.Atom x ] -> Ok x
  | _ -> Error (`Msg "Expecting singleton atom in string_of_atom")

let assoc name l =
  try Ok (List.assoc name l)
  with _ ->
    Error
      (`Msg
        (Printf.sprintf "Expecting key '%s' in assoc - keys are: [%s]" name
           (String.concat ", " (List.map fst l))))

let process_wrapped_library d =
  assoc_list (Sexplib.Sexp.List d) >>= fun l ->
  assoc "main_module_name" l >>= string_of_atom >>= fun main_module_name ->
  assoc "modules" l >>= fun modules ->
  let modules = List.map assoc_list modules in
  let modules =
    List.fold_right
      (fun l acc ->
        let r = l >>= assoc "name" >>= string_of_atom in
        match r with Ok x -> x :: acc | Error _ -> acc)
      modules []
  in
  assoc "alias_module" l >>= fun alias_module ->
  assoc_list (Sexplib.Sexp.List alias_module) >>= fun l ->
  assoc "name" l >>= string_of_atom >>= fun alias_module ->
  Ok (Library.Wrapped { main_module_name; modules; alias_module })

let process_unwrapped_library l =
  let modules = List.map assoc_list l in
  let modules =
    List.fold_right
      (fun l acc ->
        let r = l >>= assoc "name" >>= string_of_atom in
        match r with Ok x -> x :: acc | Error _ -> acc)
      modules []
  in
  Ok (Library.Unwrapped { modules })

let process_singleton_library l =
  assoc_list (Sexplib.Sexp.List l) >>= fun l ->
  assoc "name" l >>= string_of_atom >>= fun name -> Ok (Library.Singleton name)

let process_library : Sexplib.Sexp.t -> (Library.t, [> `Msg of string ]) result
    =
 fun s ->
  assoc_list s >>= fun l ->
  assoc "name" l >>= string_of_atom >>= fun name ->
  assoc "modules" l >>= fun m ->
  (match m with
  | [ Sexplib.Sexp.List x ] -> Ok x
  | _ -> Error (`Msg (Printf.sprintf "modules wasn't a singleton list")))
  >>= fun m ->
  (match m with
  | Sexplib.Sexp.Atom "wrapped" :: l -> process_wrapped_library l
  | Sexplib.Sexp.Atom "unwrapped" :: l -> process_unwrapped_library l
  | Sexplib.Sexp.Atom "singleton" :: l -> process_singleton_library l
  | Sexplib.Sexp.Atom x :: _ ->
      Error (`Msg (Format.sprintf "Unexpected library type: %s\n%!" x))
  | _ -> Error (`Msg (Format.sprintf "Very unexpected library structure")))
  >>= fun ty ->
  let dependencies =
    match assoc "requires" l with
    | Ok deps ->
        List.fold_right
          (fun x acc ->
            match x with Sexplib.Sexp.Atom y -> y :: acc | _ -> acc)
          deps []
    | Error _ -> []
  in
  Ok Library.{ name; ty; dependencies }

let process_dune_package : Sexplib.Sexp.t -> (t, [> `Msg of string ]) result =
 fun s ->
  assoc_list s >>= fun l ->
  assoc "name" l >>= string_of_atom >>= fun name ->
  let version =
    match assoc "version" l >>= string_of_atom with
    | Ok x -> Some x
    | Error _ -> None
  in
  List.fold_right
    (fun (x, l) acc ->
      acc >>= fun acc ->
      match (x, l) with
      | "library", l -> (
          match process_library (Sexplib.Sexp.List l) with
          | Ok l -> Ok (l :: acc)
          | Error e -> Error e)
      | _ -> Ok acc)
    l (Ok [])
  >>= fun libraries -> Ok { name; version; libraries }

let sexp_of_file p =
  try
    let ic = open_in (Fpath.to_string p) in
    let lines = Util.lines_of_channel ic in
    close_in ic;
    Ok (Sexplib.Sexp.of_string ("(" ^ String.concat "\n" lines ^ ")"))
  with e ->
    Error
      (`Msg (Printf.sprintf "Error in process_file: %s" (Printexc.to_string e)))

let process_file p = sexp_of_file p >>= process_dune_package

let find package =
  let path = Package.prep_path package in
  Bos.OS.Dir.fold_contents ~dotfiles:true
    (fun p acc ->
      let _, name = Fpath.split_base p in
      if name = Fpath.v "dune-package" then Ok p else acc)
    (Error (`Msg "Missing"))
    path
  |> join
