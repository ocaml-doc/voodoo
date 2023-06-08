(lang dune 2.8)

(name voodoo)

(version 0.0.0)

(generate_opam_files true)

(maintainers "nobody@nowhere.com")

(authors "Jon Ludlam" "Jules Aguillon")

(license ISC)

(source
 (github jonludlam/voodoo))

(package
 (name voodoo-lib)
 (synopsis "Voodoo library")
 (description "Voodoo library")
 (depends bos astring fpath opam-format ppx_yojson_conv sexplib yojson))

(package
 (name voodoo-prep)
 (synopsis "Voodoo prep")
 (description "Voodoo prep")
 (depends cmdliner fpath bos opam-format))

(package
 (name voodoo-do)
 (synopsis "Voodoo compilation step")
 (description "Voodoo compilation step")
 (depends
  voodoo-lib
  voodoo-web
  odoc ; = 2.2.0 pinned by the pipeline
  tyxml
  astring
  cmdliner
  yojson))

(package
 (name voodoo-gen)
 (synopsis "Voodoo tool to generate tailwind-style output")
 (description "Voodoo tool to generate tailwind-style output")
 (depends
  (omd
   (= 2.0.0~alpha3))
   voodoo-lib
  odoc  ; = 2.2.0 pinned by the pipeline
  tyxml
  conf-pandoc
  astring
  cmdliner
  yojson
  bos
  ppx_yojson_conv
  sexplib
  fpath
  (ppx_deriving_yaml :with-test)))

(package
 (name voodoo-web)
 (synopsis "Voodoo web library shared between client and server")
 (description
  "Contains everything that we'd like to reference in both the client and server contexts"))
