(* Odoc documentation generator *)
open Cmdliner

[@@@ocaml.warning "-3"]

(** Example: [conv_compose Fpath.of_string Fpath.to_string Arg.dir] *)
let conv_compose ?docv parse to_string c =
  let open Arg in
  let docv = match docv with Some v -> v | None -> conv_docv c in
  let parse v = match conv_parser c v with Ok x -> parse x | Error _ as e -> e
  and print fmt t = conv_printer c fmt (to_string t) in
  conv ~docv (parse, print)

(* Just to find the location of all relevant ocaml cmt/cmti/cmis *)
let read_lib_dir () = Opam.lib ()

module Prep = struct
  let switch =
    let doc =
      "Opam switch to use. If not set, defaults to the current switch"
    in
    Arg.(
      value
      & opt (some string) None
      & info [ "s"; "switch" ] ~doc ~docv:"SWITCH")

  let prep lib_dir switch universes =
    Opam.switch := switch;
    Main.run lib_dir universes

  let lib_dir =
    let doc =
      "Path to libraries. If not set, defaults to the global environment by \
       querying $(b,ocamlfind)."
    in
    let fpath_dir = conv_compose Fpath.of_string Fpath.to_string Arg.dir in
    (* [some string] and not [some dir] because we don't need it to exist
       yet. *)
    Arg.(value & opt_all fpath_dir [] & info [ "L" ] ~doc ~docv:"LIB_DIR")

  let universes =
    let doc = "Provide universe spec as 'package=universe id' couples" in
    Arg.(
      value
      & opt (list (pair ~sep:':' string string)) []
      & info [ "u"; "universes" ] ~doc)

  let cmd = Term.(const prep $ lib_dir $ switch $ universes)
  let info = Term.info "prep" ~doc:"Prep a directory tree for compiling"
end

let _ =
  match Term.eval_choice ~err:Format.err_formatter Prep.(cmd, info) [] with
  | `Error _ ->
      Format.pp_print_flush Format.err_formatter ();
      exit 2
  | _ -> ()
