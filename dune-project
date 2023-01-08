(lang dune 2.8)

(name voodoo)

(version 0.0.0)

(cram enable)

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
 (depends bos astring fpath opam-format sexplib yojson))

(package
 (name voodoo-prep)
 (synopsis "Voodoo prep")
 (description "Voodoo prep")
 (depends cmdliner fpath bos opam-format))

(package
 (name voodoo-do)
 (synopsis "Voodoo compilation step")
 (description "Voodoo compilation step")
 (depends voodoo-lib odoc tyxml astring cmdliner yojson))

(package
 (name voodoo-gen)
 (synopsis "Voodoo tool to generate tailwind-style output")
 (description "Voodoo tool to generate tailwind-style output")
 (depends
  (ocaml
   (>= 4.08.0))
  (omd
   (= 2.0.0~alpha2))
  voodoo-lib
  (odoc
   (and
    (>= 2.1.0)
    (< 2.2.0)))
  (opam-format
   (>= 2.1.0~beta2))
  tyxml
  astring
  cmdliner
  yojson
  bos))
