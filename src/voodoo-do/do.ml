(** This module defines a command line interface for a program called
    [voodoo-do].

    The program takes four optional arguments:

    - [-p] or [--package]: a string that specifies the name of the package to
      process
    - [-b] or [--blessed]: a flag that indicates whether the package should be
      marked as "blessed"
    - [-s] or [--switch]: a string that specifies the name of the Opam switch to
      use
    - [--failed]: a flag that indicates that the build was a failed

    The [run] function is defined to process the package according to these
    arguments. If no package name is specified, the function runs
    [Do.run_all()]. Otherwise, it runs [Do.run p blessed failed], where [p],
    [blessed], and [failed] are the values of the corresponding arguments. *)

open Voodoo_lib

[@@@ocaml.warning "-3"]

open Cmdliner

let run package blessed switch failed =
  Opam.switch := switch;
  match package with None -> Do.run_all () | Some p -> Do.run p blessed failed

let package =
  let doc = "Select the package to process" in
  Arg.(
    value & opt (some string) None & info [ "p"; "package" ] ~docv:"PKG" ~doc)

let blessed =
  let doc = "Mark the package as blessed" in
  Arg.(value & flag & info [ "b"; "blessed" ] ~doc)

let switch =
  let doc = "Opam switch to use. If not set, defaults to the current switch" in
  Arg.(
    value & opt (some string) None & info [ "s"; "switch" ] ~doc ~docv:"SWITCH")

let failed =
  let doc = "Indicate that the build was a failed" in
  Arg.(value & flag & info [ "failed" ] ~doc)

let cmd =
  let doc = "Process a prepped package" in
  ( Term.(const run $ package $ blessed $ switch $ failed),
    Term.info "voodoo-do" ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval cmd)
