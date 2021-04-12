(* do! *)

open Voodoo_lib
open Cmdliner

let run package blessed =
  match package with None -> Do.run_all () | Some p -> Do.run p blessed

let package =
  let doc = "Select the package to process" in
  Arg.(
    value & opt (some string) None & info [ "p"; "package" ] ~docv:"PKG" ~doc)

let blessed =
  let doc = "Mark the package as blessed" in
  Arg.(value & flag & info [ "b"; "blessed" ] ~doc)

let cmd =
  let doc = "Process a prepped package" in
  ( Term.(const run $ package $ blessed),
    Term.info "voodoo-do" ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval cmd)
