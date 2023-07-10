open Cmdliner

[@@@ocaml.warning "-3"]

module Common = struct
  let switch =
    let doc =
      "Opam switch to use. If not set, defaults to the current switch"
    in
    Arg.(
      value
      & opt (some string) None
      & info [ "s"; "switch" ] ~doc ~docv:"SWITCH")
end

module Prep = struct
  let prep switch universes ref_universes =
    Opam.switch := switch;
    Prep.run universes ref_universes

  let universes =
    let doc = "Provide universe spec as 'package:universe_id' couples" in
    Arg.(
      value
      & opt (list (pair ~sep:':' string string)) []
      & info [ "u"; "universes" ] ~doc)

  let ref_universes =
    let doc =
      "Provide extra universes as 'package:universe_id' couples. These will \
       not be prepped but can be referenced by jsoo toplevels."
    in
    Arg.(
      value
      & opt (list (pair ~sep:':' string string)) []
      & info [ "r"; "ref-universes" ] ~doc)

  let cmd = Term.(const prep $ Common.switch $ universes $ ref_universes)
  let info = Term.info "prep" ~doc:"Prep a directory tree for compiling"
end

module Jsoo_cmd = struct
  let jsoo switch package =
    Opam.switch := switch;
    Jsoo.run Paths.prep package

  let package =
    let doc = "Restrict processing to a particular package" in
    Arg.(
      value & opt (some string) None & info [ "p"; "package" ] ~doc ~docv:"PKG")

  let cmd = Term.(const jsoo $ Common.switch $ package)
  let info = Term.info "jsoo" ~doc:"Make jsoo toplevels"
end

let _ =
  Logs.set_reporter (Logs_fmt.reporter ());
  Logs.set_level (Some Logs.App);
  match
    Term.eval_choice ~err:Format.err_formatter
      Prep.(Term.term_result @@ cmd, info)
      [ Jsoo_cmd.(Term.term_result @@ cmd, info) ]
  with
  | `Error _ ->
      Format.pp_print_flush Format.err_formatter ();
      exit 2
  | _ -> ()
