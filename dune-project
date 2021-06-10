(lang dune 2.8)
(name voodoo)
(version 0.0.0)
(generate_opam_files true)

(maintainers "nobody@nowhere.com")
(authors "Jon Ludlam" "Jules Aguillon")
(license ISC)
(source (github jonludlam/voodoo))

(package
 (name voodoo-lib)
 (synopsis "Voodoo library")
 (description "Voodoo library")
 (depends
   bos
   astring
   fpath
   opam-format
   sexplib
   ))

(package
 (name voodoo-prep)
 (synopsis "Voodoo prep")
 (description "Voodoo prep")
 (depends
   cmdliner
   fpath
   bos
   opam-format))

(package
 (name voodoo-do)
 (synopsis "Voodoo compilation step")
 (description "Voodoo compilation step")
 (depends
   voodoo-lib
   voodoo-web
   odoc
   tyxml
   astring
   cmdliner
   yojson))

(package
 (name voodoo-client)
 (synopsis "Voodoo client javascript")
 (description "Voodoo client javascript")
 (depends
  js_of_ocaml
  js_of_ocaml-ppx
  js_of_ocaml-tyxml
  yojson
  voodoo-web
  ppx_deriving_yojson))

(package
 (name voodoo-gen)
 (synopsis "Voodoo tool to generate tailwind-style output")
 (description "Voodoo tool to generate tailwind-style output")
 (depends
   voodoo-lib
   voodoo-web
   odoc
   tyxml
   astring
   cmdliner
   yojson
   bos))

(package
 (name voodoo-web)
 (synopsis "Voodoo web library shared between client and server")
 (description "Contains everything that we'd like to reference in both the client and server contexts")
)

