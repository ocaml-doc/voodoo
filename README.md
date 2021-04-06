# Voodoo: Generate OCaml docs

This package likely requires the very latest odoc to be installed:

```bash
$ opam pin add -y odoc https://github.com/ocaml/odoc.git 
```

This package is intended to be used as part of an ocurrent pipeline. As such,
it's tricky to use in isolation. Having said that, there is some rudimentary
support for using it this way:

```bash
$ voodoo-prep
Warning: No universes have been specified: will generate dummy universes
$ voodoo-do -p ocaml-base-compiler -b
$ voodoo-do -p result -b
$ voodoo-do ...
```

If the packages are done out-of-order, voodoo-prep will alert that there are
missing dependencies:

```bash
$ voodoo-do -p odoc -b
...
Missing dependency: Stdlib c21c5d26416461b543321872a551ea0d
...
```

In this case, we need to run `voodoo-do -p ocaml-base-compiler -b` first.

Note that when being used in this mode, the `-b` (blessed) switch should
always be passed to `voodoo-do`




