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
 (name voodoo)
 (synopsis "Voodoo tool to generate tailwind-style output")
 (description "Voodoo tool to generate tailwind-style output")
 (depends
  (ocaml
   (>= 4.08.0))
  (omd
   (= 2.0.0~alpha2))
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
  fpath))
