# Voodoo

Voodoo is the OCaml documentation generator.

## Getting started

This package is intended to be used as part of an
[ocurrent](https://github.com/ocurrent/ocurrent) pipeline, for example
via [ocaml-docs-ci](https://github.com/ocurrent/ocaml-docs-ci). As such,
it's tricky to use in isolation.

Having said that, there is some rudimentary support for using it this way. The steps below will guide you to build to build a small documentation website locally.

### Setup your development environment

You need Opam, you can install it by following [Opam's documentation](https://opam.ocaml.org/doc/Install.html).

With Opam installed, you can install the dependencies in a new local switch with:

```bash
make switch
```

Then, build the project with:

```bash
make build
```

### Generating an example

To create an example, run:

```bash
make example
```

This will create a sample website with the documentation of `ocaml-base-compiler` in `_generated/output/p`.

Here are some commands that will be executed when running the above:

```bash
$ mkdir _generated
$ cd _generated; opam exec -- dune exec -- voodoo-prep
$ cd _generated; opam exec -- dune exec -- voodoo-do -p ocaml-base-compiler -b
$ cd _generated; opam exec -- dune exec -- voodoo-gen -o output
```

Read further for the detailed version of the above commands.

```bash
$ cd _generated
$ opam exec -- dune exec -- voodoo-prep
Warning: No universes have been specified: will generate dummy universes
$ opam exec -- dune exec -- voodoo-do -p ocaml-base-compiler -b
$ opam exec -- dune exec -- voodoo-do -p result -b
$ opam exec -- dune exec -- voodoo-do ...
```

When new packages are installed in the current switch `voodoo-prep` needs to be executed in
for `voodoo-do` to be able to process them. If the packages are done out of dependency order,
 `voodoo-prep` will alert that there are missing dependencies:

```bash
$ opam exec -- dune exec -- voodoo-do -p odoc -b
...
Missing dependency: Stdlib c21c5d26416461b543321872a551ea0d
...
```

In this case, we need to run `voodoo-do -p ocaml-base-compiler -b` first.

Note that when being used in this mode, the `-b` (blessed) switch should
always be passed to `voodoo-do`.

At this point, to view the output, use `odoc` to generate the support files (mostly: copying `highlight.js` from https://highlightjs.org and `odoc.css`):

```bash
$ cd ..
$ odoc support-files -o _generated/html
```

and load the package index in your browser (adjust `x.y.z` according to the current switch):

```bash
$ open _generated/html/p/ocaml-base-compiler/4.14.0/doc/index.html
```

~~An alternative to executing `voodoo-do -p ...` in order is simply to run
`voodoo-do` with no arguments. This naively executes `voodoo-do` in order
based on the current switch's dependencies, and is slow and inefficient.~~

To generate the website with the documentation, run:

```bash
$ opam exec -- dune exec -- voodoo-gen -o output
```

And serve it with:

```bash
$ opam install dream-serve
$ dream-serve _generated/html
```

Load the package index in your browser (adjust `x.y.z` according to the current switch):

```bash
$ open http://localhost:8080/p/ocaml-base-compiler/4.14.0/doc/index.html
```

You may use the `.DEFAULT` target from the `Makefile` to generate additional
documentation:

```
make odoc
```

### Summary

1. Install packages to be documented in the current switch using `opam`
1. Create `_generated` directory
1. Run `voodoo-prep`. This creates the _ad-hoc_ directory structure inside `_generated` and populates it with `.cmt`, `.cmi`, `.cmti`, `.mld` from the current switch. Documentation files such as `.md`, `.html` and others are also copied.
1. Run `voodoo-do` on each package or all at once. This triggers Odoc to generate the actual HTML documentation files.
1. Run `voodoo-gen` to create the `_generated/output` directory
1. Run `doc support-files -o _generated/html` to add css and styling to the `html` subdirectory
1. Serve `_generated/html`

`voodoo-*` commands must be called from the `_generated` directory.
