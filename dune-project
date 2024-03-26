(lang dune 3.0)

(name voodoo)

(generate_opam_files true)

(cram enable)

(maintainers "Thibaut Mattio" "Sabine Schmaltz")

(authors "Jon Ludlam" "Jules Aguillon" "Lucas Pluvinage")

(license ISC)

(source
 (github ocaml-doc/voodoo))

(package
 (name voodoo-lib)
 (synopsis "OCaml.org's package documentation generator (library)")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation. voodoo-lib is the base library.")
 (depends
  (alcotest
   (and
    :with-test
    (>= 0.7.0)))
  bos
  astring
  fpath
  sexplib
  (yojson
   (>= 1.6.0))))

(package
 (name voodoo-prep)
 (synopsis "OCaml.org's package documentation generator (preparation step)")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation. voodoo-prep runs the preparation step.")
 (depends
  cmdliner
  fpath
  bos
  (opam-format
   (>= 2.0.0))))

(package
 (name voodoo-do)
 (synopsis "OCaml.org's package documentation generator (compilation step)")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation. voodoo-do runs the compilation step.")
 (depends
  voodoo-lib
  ; odoc.2.4.1 pinned by the pipeline
  (odoc
   (>= 2.4.1))
  bos
  astring
  cmdliner
  (yojson
   (>= 1.6.0))))

(package
 (name voodoo-gen)
 (synopsis "OCaml.org's package documentation generator (generation step)")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation. voodoo-gen generates the package documentation.")
 (depends
  (omd
   (= 2.0.0~alpha3))
  voodoo-lib
  ; odoc.2.4.1 pinned by the pipeline
  (odoc
   (>= 2.4.1))
  conf-pandoc
  astring
  cmdliner
  (yojson
   (>= 1.6.0))
  bos
  sexplib
  fpath
  (conf-jq :with-test)))
