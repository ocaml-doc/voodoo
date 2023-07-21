Install the package

  $ PKG=can-render-tables
  $ opam install packages/$PKG --yes > /dev/null

Generate the can-render-tables documentation

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
        "linked/p/can-render-tables/1.0/doc/README.md"
      ],
      "license": [],
      "changes": [],
      "others": [
        "linked/p/can-render-tables/1.0/package.json"
      ]
    }
  }

Generate a README.md file with the tables formatted in HTML
  $ cat output/p/$PKG/1.0/README.md.html.json | jq '.content'
  "<table>\n<thead>\n<tr>\n<th>x</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>y</td>\n</tr>\n</tbody>\n</table>\n"

Uninstall the package
  $ opam remove $PKG --yes > /dev/null
