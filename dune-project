(lang dune 3.0)

(name voodoo)

(cram enable)

(generate_opam_files true)

(maintainers "Thibaut Mattio" "Sabine Schmaltz")

(authors "Jon Ludlam" "Jules Aguillon" "Lucas Pluvinage")

(license ISC)

(source
 (github ocaml-doc/voodoo))

(package
 (name voodoo)
 (synopsis "OCaml.org's package documentation generator")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation.")
 (depends
  (ocaml
   (>= 4.08.0))
  (omd
   (>= 2.0.0~alpha3))
  (odoc
   (>= 2.2.0))
  (opam-format
   (>= 2.1.0~beta2))
  (cmdliner
   (>= 1.1.0))
  astring
  yojson
  bos
  sexplib
  fpath
  (ppx_deriving_yaml :with-test)
  (base :with-test)
  (menhir :with-test)))
