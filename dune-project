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
   ))

(package
 (name voodoo-prep)
 (synopsis "Voodoo prep")
 (description "Voodoo prep")
 (depends
   voodoo-lib
   cmdliner))

(package
 (name voodoo-do)
 (synopsis "Voodoo compilation step")
 (description "Voodoo compilation step")
 (depends
   voodoo-lib
   astring
   cmdliner))

  


