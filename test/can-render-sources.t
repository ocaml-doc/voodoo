Install the package

  $ PKG=can-render-tables
  $ opam install packages/$PKG --yes > /dev/null

Generate the can-render-tables documentation

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes

  $ voodoo-do -p $PKG -b 2> /dev/null

  $ voodoo-gen -o output
  0 other versions, 1 packages
  Found 2 files
  html-generate command: odoc html-generate --as-json --source-root
                           linked/p/can-render-tables/1.0/src -o output/
                           linked/p/can-render-tables/1.0/page-doc.odocl
  html-generate command: odoc html-generate --as-json --source-root
                           linked/p/can-render-tables/1.0/src -o output/
                           linked/p/can-render-tables/1.0/src-src.odocl

  $ ls linked/p/can-render-tables/1.0/src

  $ ls output/linked/p/can-render-tables/1.0/

Uninstall the package
  $ opam remove $PKG --yes > /dev/null
