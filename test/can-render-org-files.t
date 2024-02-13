Install the package

  $ PKG=can-render-org-files
  $ opam install packages/$PKG --yes > /dev/null

Generate the can-render-org-files documentation

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes

  $ voodoo-do -p $PKG -b 2> /dev/null

  $ voodoo-gen -o output
  0 other versions, 1 packages
  Found 1 files

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

Content of automatically generated Index.mld is fine
  $ cat output/p/$PKG/1.0/doc/index.html.json | jq .
  {
    "type": "documentation",
    "uses_katex": false,
    "breadcrumbs": [
      {
        "name": "p",
        "href": "../../../index.html",
        "kind": "page"
      },
      {
        "name": "can-render-org-files",
        "href": "../../index.html",
        "kind": "page"
      },
      {
        "name": "1.0",
        "href": "../index.html",
        "kind": "page"
      },
      {
        "name": "doc",
        "href": "#",
        "kind": "page"
      }
    ],
    "toc": [],
    "source_anchor": null,
    "preamble": "<h1 id=\"can-render-org-files-1.0\"><a href=\"#can-render-org-files-1.0\" class=\"anchor\"></a>can-render-org-files 1.0</h1>",
    "content": ""
  }

Uninstall the package
  $ opam remove $PKG --yes > /dev/null
