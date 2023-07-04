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
  bos
  astring
  fpath
  (ppx_deriving_yojson
   (>= 3.6.0))
  sexplib
  yojson))

(package
 (name voodoo-prep)
 (synopsis "OCaml.org's package documentation generator (preparation step)")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation. voodoo-prep runs the preparation step.")
 (depends cmdliner fpath bos opam-format))

(package
 (name voodoo-do)
 (synopsis "OCaml.org's package documentation generator (compilation step)")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation. voodoo-do runs the compilation step.")
 (depends
  voodoo-lib
  ; odoc.2.2.0 pinned by the pipeline
  (odoc
   (>= 2.2.0))
  bos
  astring
  cmdliner
  yojson))

(package
 (name voodoo-gen)
 (synopsis "OCaml.org's package documentation generator (generation step)")
 (description
  "Voodoo is an odoc driver used to generate OCaml.org's package documentation. voodoo-gen generates the package documentation.")
 (depends
  (ocaml
   (>= 4.08.0))
  (omd
   (= 2.0.0~alpha3))
  voodoo-lib
  ; odoc.2.2.0 pinned by the pipeline
  (odoc
   (>= 2.2.0))
  conf-pandoc
  astring
  cmdliner
  yojson
  bos
  (ppx_deriving_yojson
   (>= 3.6.0))
  sexplib
  fpath
  olinkcheck
  (conf-jq :with-test)
  (ppx_deriving_yaml
   (and
    (= 0.2.1)
    :with-test))
  (base
   (and
    (= v0.15.1)
    :with-test))))
