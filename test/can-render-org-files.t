Install the package

  $ PKG=can-render-org-files
  $ opam install packages/$PKG --yes > /dev/null

Generate the can-render-org-files documentation

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes

  $ voodoo-do -p $PKG -b 2> /dev/null

  $ voodoo-gen -o output
  0 other versions, 1 packages
  Found 2 files
  html-generate command: odoc html-generate --as-json --source-root
                           linked/p/can-render-org-files/1.0/src -o output/
                           linked/p/can-render-org-files/1.0/page-doc.odocl
  html-generate command: odoc html-generate --as-json --source-root
                           linked/p/can-render-org-files/1.0/src -o output/
                           linked/p/can-render-org-files/1.0/src-src.odocl

Generates a status.json file
  $ cat output/p/$PKG/1.0/status.json | jq .
  {
    "failed": false,
    "otherdocs": {
      "readme": [
        "linked/p/can-render-org-files/1.0/doc/README.org"
      ],
      "license": [],
      "changes": [],
      "others": [
        "linked/p/can-render-org-files/1.0/package.json"
      ]
    }
  }

Converted the README.org file in HTML
  $ cat output/p/$PKG/1.0/README.org.html.json | jq '.content'
  "<h3>Title 2</h3>"

Uninstall the package
  $ opam remove $PKG --yes > /dev/null
