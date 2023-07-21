(* Odoc documentation generator

*)
open Cmdliner

[@@@ocaml.warning "-3"]

module Prep = struct
  let switch =
    let doc =
      "Opam switch to use. If not set, defaults to the current switch"
    in
    Arg.(
      value
      & opt (some string) None
      & info [ "s"; "switch" ] ~doc ~docv:"SWITCH")

  let prep switch universes =
    Opam.switch := switch;
    Prep.run universes

  let universes =
    let doc = "Provide universe spec as 'package=universe id' couples" in
    Arg.(
      value
      & opt (list (pair ~sep:':' string string)) []
      & info [ "u"; "universes" ] ~doc)

  let cmd = Term.(const prep $ switch $ universes)
  let info = Term.info "prep" ~doc:"Prep a directory tree for compiling"
end

let _ =
  match Term.eval_choice ~err:Format.err_formatter Prep.(cmd, info) [] with
  | `Error _ ->
      Format.pp_print_flush Format.err_formatter ();
      exit 2
  | _ -> ()
