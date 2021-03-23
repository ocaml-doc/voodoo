(lang dune 2.8)
(name voodoo)
(version 0.0.0)
(generate_opam_files true)

(maintainers "nobody@nowhere.com")
(authors "Jon Ludlam" "Jules Aguillon")
(license ISC)
(source (github jonludlam/voodoo))


(package
 (name voodoo)
 (synopsis "Tools to build docs.ocaml.org")
 (description "Description")
 (depends
  voodoo_lib
  astring
  cmdliner))

(package
 (name voodoo_lib)
 (synopsis "Voodoo library")
 (description "Voodoo library")
 (depends
   bos
   astring
   sexplib
   fpath
   opam-format
   ppx_sexp_conv))

(package
 (name voodoo_prep)
 (synopsis "Voodoo prep")
 (description "Voodoo prep")
 (depends
   voodoo_lib
   cmdliner))

  


