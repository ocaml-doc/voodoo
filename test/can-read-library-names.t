Install the package

  $ PKG=can-read-library-names
  $ opam install packages/$PKG --yes > /dev/null

Generate the can-read-library-names documentation

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes

  $ voodoo-do -p $PKG -b 2> /dev/null

  $ voodoo-gen -o output
  0 other versions, 1 packages
  Found 5 files

Generates a package.json file with the library names
  $ cat output/p/$PKG/1.0/package.json | jq .
  {
    "libraries": [
      {
        "name": "can-read-library-names.singleton",
        "modules": [
          {
            "name": "Singleton",
            "submodules": [],
            "kind": "module"
          }
        ],
        "dependencies": []
      },
      {
        "name": "can-read-library-names.unwrapped",
        "modules": [
          {
            "name": "Unwrapped_module2",
            "submodules": [],
            "kind": "module"
          },
          {
            "name": "Unwrapped_module1",
            "submodules": [],
            "kind": "module"
          }
        ],
        "dependencies": []
      },
      {
        "name": "can-read-library-names.wrapped",
        "modules": [
          {
            "name": "Wrapped",
            "submodules": [
              {
                "name": "Wrapped_module2",
                "submodules": [],
                "kind": "module"
              },
              {
                "name": "Wrapped_module1",
                "submodules": [],
                "kind": "module"
              }
            ],
            "kind": "module"
          }
        ],
        "dependencies": []
      }
    ]
  }

Converted the README.org file in HTML
  $ cat output/p/$PKG/1.0/README.org.html.json | jq '.content'
  cat: output/p/can-read-library-names/1.0/README.org.html.json: No such file or directory

Uninstall the package
  $ opam remove $PKG --yes > /dev/null
