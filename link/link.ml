(* Odoc makefile generator *)

open Voodoo_lib
open Cmdliner

(** Example: [conv_compose Fpath.of_string Fpath.to_string Arg.dir] *)
let conv_compose ?docv parse to_string c =
  let open Arg in
  let docv = match docv with Some v -> v | None -> conv_docv c in
  let parse v = match conv_parser c v with Ok x -> parse x | Error _ as e -> e
  and print fmt t = conv_printer c fmt (to_string t) in
  conv ~docv (parse, print)

(* Just to find the location of all relevant ocaml cmt/cmti/cmis *)
let read_lib_dir () = Opam.lib ()

module Default = struct
  let default whitelist lib_dir switch =
    Opam.switch := switch;
    let lib_dir =
      match lib_dir with [] -> [ read_lib_dir () ] | _ -> lib_dir
    in
    let pp_whitelist fmt = function
      | [] -> ()
      | wl -> Format.fprintf fmt " -w %s" (String.concat "," wl)
    in
    let pp_libdir fmt l =
      List.iter (fun lib -> Format.fprintf fmt " -L %s" lib) l
    in
    let pp_switch fmt s =
      match s with None -> () | Some s -> Format.fprintf fmt " -s %s" s
    in
    Format.printf
      {|
default: generate
.PHONY: compile link generate clean html latex man
compile: odocs
link: compile odocls
Makefile.gen : Makefile
	odocmkgen compile%a%a%a
generate: link
odocs:
	mkdir odocs
odocls:
	mkdir odocls
clean:
	rm -rf odocs odocls html latex man Makefile.*link Makefile.gen Makefile.*generate
html: html/odoc.css
html/odoc.css:
	odoc support-files --output-dir html
ifneq ($(MAKECMDGOALS),clean)
-include Makefile.gen
endif
|}
      pp_whitelist whitelist pp_libdir lib_dir pp_switch switch

  let whitelist = Arg.(value & opt (list string) [] & info [ "w"; "whitelist" ])

  let lib_dir =
    let doc =
      "Path to libraries. If not set, defaults to the global environment by \
       querying $(b,ocamlfind)."
    in
    (* [some string] and not [some dir] because we don't need it to exist yet. *)
    Arg.(value & opt_all string [] & info [ "L" ] ~doc ~docv:"LIB_DIR")

  let switch =
    let doc =
      "Opam switch to use. If not set, defaults to the current switch"
    in
    Arg.(
      value
      & opt (some string) None
      & info [ "s"; "switch" ] ~doc ~docv:"SWITCH")

  let cmd = Term.(const default $ whitelist $ lib_dir $ switch)

  let info = Term.info ~version:"%%VERSION%%" "odocmkgen"
end

module Compile = struct
  let compile _whitelist _lib_dir switch =
    Opam.switch := switch;
    (* Compile.run whitelist lib_dir*) ()

  let whitelist = Arg.(value & opt (list string) [] & info [ "w"; "whitelist" ])

  let lib_dir =
    let doc =
      "Path to libraries. If not set, defaults to the global environment by \
       querying $(b,ocamlfind)."
    in
    let fpath_dir = conv_compose Fpath.of_string Fpath.to_string Arg.dir in
    (* [some string] and not [some dir] because we don't need it to exist yet. *)
    Arg.(value & opt_all fpath_dir [] & info [ "L" ] ~doc ~docv:"LIB_DIR")

  let cmd = Term.(const compile $ whitelist $ lib_dir $ Default.switch)

  let info =
    Term.info "compile" ~doc:"Produce a makefile for compiling odoc files"
end

module Prep = struct
  let prep whitelist lib_dir switch =
    Opam.switch := switch;
    Prep.run whitelist lib_dir

  let whitelist = Arg.(value & opt (list string) [] & info [ "w"; "whitelist" ])

  let lib_dir =
    let doc =
      "Path to libraries. If not set, defaults to the global environment by \
       querying $(b,ocamlfind)."
    in
    let fpath_dir = conv_compose Fpath.of_string Fpath.to_string Arg.dir in
    (* [some string] and not [some dir] because we don't need it to exist yet. *)
    Arg.(value & opt_all fpath_dir [] & info [ "L" ] ~doc ~docv:"LIB_DIR")

  let cmd = Term.(const prep $ whitelist $ lib_dir $ Default.switch)

  let info = Term.info "prep" ~doc:"Prep a directory tree for compiling"
end

module Link = struct
  let link package = Link.run (Fpath.v "odocs") package

  let package =
    let doc = "Select the package to examine" in
    Arg.(
      required
      & opt (some string) None
      & info [ "p"; "package" ] ~docv:"PKG" ~doc)

  let cmd = Term.(const link $ package)

  let info = Term.info "link" ~doc:"Produce a makefile for linking odoc files"
end

let _ =
  match
    Term.eval_choice ~err:Format.err_formatter
      Default.(cmd, info)
      [ Compile.(cmd, info); Link.(cmd, info); Prep.(cmd, info) ]
  with
  | `Error _ ->
      Format.pp_print_flush Format.err_formatter ();
      exit 2
  | _ -> ()

(* let packages = Findlib.read_all () in *)
(* let extra_threads =
     let ocaml_package = List.find (fun p -> p.Findlib.package = "threads") packages in
     let threads_dir = Fpath.(ocaml_package.Findlib.dir / "threads") in
     threads_dir
   in *)
(* let resolved_infos = resolve_deps extra_threads packages infos in
   let deptree = List.map (fun info -> info.digest, info.deps >>= fun d -> match d.dep_digest with | Some x -> [x] | None -> []) in *)
(* let hashes = List.map (get_hash deptree) (List.map fst deptree) in
   List.iter2 (fun info hash -> Format.printf "%s %s\n" (Digest.to_hex info.digest) (Digest.to_hex hash)) resolved_infos hashes; *)
