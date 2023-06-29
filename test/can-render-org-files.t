Generate the base documentation

  $ voodoo-prep 2> /dev/null

  $ voodoo-do -p base -b 2> /dev/null

  $ voodoo-gen -o output
  0 other versions, 1 packages
  Found 6 files
  Warning, resolved hidden path: Base__.Hash_set_intf.M_sexp_grammar
  Warning, resolved hidden path: Base__.Hash_set_intf.M_sexp_grammar
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t

Generates a status.json file
  $ cat output/p/base/v0.15.1/status.json | jq .
  {
    "failed": false,
    "otherdocs": {
      "readme": [
        "linked/p/base/v0.15.1/doc/README.org"
      ],
      "license": [
        "linked/p/base/v0.15.1/doc/LICENSE.md"
      ],
      "changes": [
        "linked/p/base/v0.15.1/doc/CHANGES.md"
      ],
      "others": [
        "linked/p/base/v0.15.1/package.json"
      ]
    }
  }

Converted the README.org file in markdown
  $ ls output/p/base/v0.15.1/
  CHANGES.md.html.json
  LICENSE.md.html.json
  README.org.html.json
  doc
  index.js
  package.json
  package.json.html.json
  status.json
