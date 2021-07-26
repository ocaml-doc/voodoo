(* do! *)

open Voodoo_lib
open Cmdliner

let run package blessed switch redirect failed =
  Opam.switch := switch;
  match package with
  | None -> Do.run_all ()
  | Some p -> Do.run p blessed redirect failed

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

let gen_redirect =
  let doc =
    "Generate redirect page in the package directory. Set if this is the \
     latest version"
  in
  Arg.(value & flag & info [ "r"; "redirect" ] ~doc)

let failed =
  let doc = "Indicate that the build was a failed" in
  Arg.(value & flag & info [ "failed" ] ~doc)

let cmd =
  let doc = "Process a prepped package" in
  ( Term.(const run $ package $ blessed $ switch $ gen_redirect $ failed),
    Term.info "voodoo-do" ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval cmd)
