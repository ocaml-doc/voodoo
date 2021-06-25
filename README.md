# Voodoo: Generate OCaml docs

This package likely requires the very latest odoc to be installed:

```bash
$ opam pin add -y odoc https://github.com/ocaml/odoc.git 
```

This package is intended to be used as part of an
[ocurrent](https://github.com/ocurrent/ocurrent) pipeline, for example
via [ocaml-docs-ci](https://github.com/ocurrent/ocaml-docs-ci). As such,
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

> At this point, to view the output, use odoc to generate the support files:
> 
> ```bash
> $ odoc support-files -o html
> ```
> 
> and load the package index in your browser:
> 
> ```bash
> $ open html/packages/ocaml-base-compiler/4.11.1/index.html
> ```

An alternative to executing `voodoo-do -p ...` in order is simply to run
`voodoo-do` with no arguments. This naively executes voodoo-do in order
based on the current switch's dependencies, and is slow and inefficient.

To generate the website with the documentation, run:

```bash
$ voodoo-gen pkgver -o output/
$ voodoo-gen generate-json -o output/
$ voodoo-gen packages -o output/
```

And serve it with:

```bash
$ opam install dream-serve
$ dream-serve output/packages/
```
