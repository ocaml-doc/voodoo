<h1 align="center">
  voodoo
</h1>

<p align="center">
  <strong>Voodoo is the OCaml documentation generator.</strong>
</p>

<p align="center">
  <a href="https://ocaml.ci.dev/github/ocaml-doc/voodoo">
    <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fci.ocamllabs.io%2Fbadge%2Focaml-doc%2Fvoodoo%2Fmain&logo=ocaml" alt="OCaml-CI Build Status" />
  </a>
</p>

## :rocket: Getting started

**voodoo** is intended to be used as part of an
[ocurrent](https://github.com/ocurrent/ocurrent) pipeline, for example
via [ocaml-docs-ci](https://github.com/ocurrent/ocaml-docs-ci).

You need `opam`, you can install it by following [Opam's documentation](https://opam.ocaml.org/doc/Install.html).

With `opam` installed, you can install the dependencies in a new local switch with:

```bash
make switch
```

Then, build the project with:

```bash
make build
```

**voodoo** is run in three successive steps detailed below.

## :seedling: 1. Prepare the packages: voodoo-prep

To prepare the packages just run:

```sh
voodoo-prep [-u <UNIVERSES>]
```

Where `<UNIVERSES>` is a comma-separated list of packages and universes `pkg1:unv1,pkg2:unv2,...`.

When you don't provide a universe explicitly, each package installed in the current switch will be prepared (prepped) for the compiling step.

This creates an ad-hoc directory structure and populates it with `.cmt`, `.cmi`, `.cmti`, `.mld` from the current switch.
The `ocamlobjinfo` of the `.cma` files are also copied, as well as the documentation files such as `.md`, `.html` and others (such as the `opam` files). 


## :sweat_drops: 2. Compiling and linking the packages: voodoo-do

Once `voodoo-prep` has run, `voodoo-do` is able to process packages. Simply run:

```sh
voodoo-do -p <PACKAGE> [-b] [--failed]
```

This command runs `odoc compile` and `odoc link` on the package specified after `-p`.
If the `--failed` flag is set, a file named `failed` containing `"failed"` is also generated.

If the packages are processed out of dependency order, `voodoo-do` will alert that there are missing dependencies.

```sh
voodoo-do -p odoc -b
...
Missing dependency: Stdlib c21c5d26416461b543321872a551ea0d
...
```

In this case, we need to run `voodoo-do -p ocaml-base-compiler -b` first.

Note that when being used in this mode, the `-b` flag should always be passed to `voodoo-do`.

At this point, to view the output, use `odoc` to generate the support files (mostly: copying `highlight.js` from https://highlightjs.org and `odoc.css`):

```bash
cd ..
odoc support-files -o html
```

You can load the package index in your browser:

```sh
open ./html/p/<PACKAGE>/<VERSION>/doc/index.html
```

## :deciduous_tree: 3. Rendering the packages: voodoo-gen

Once `voodoo-do` has run, you can generate the website with the documentation, run:

```bash
voodoo-gen -o <DIR> [-n <PACKAGE>] [--pkg-version <VERSION>]
```

This command runs `odoc html-generate` to render the files of the specified package as html.

You can serve it with:

```bash
opam install dream-serve
dream-serve ./html
```

Load the package index in your browser:

```bash
$ open http://localhost:8080/p/<PACKAGE>/<VERSION>/doc/index.html
```

## :horse_racing: TLDR

1. Install packages to be documented in the current switch using `opam`
1. Create `_generated` directory
1. Run `voodoo-prep`. This creates the _ad-hoc_ directory structure inside `_generated` and populates it with `.cmt`, `.cmi`, `.cmti`, `.mld` from the current switch. Documentation files such as `.md`, `.html` and others are also copied.
1. Run `voodoo-do` on each package to compile and link the odoc files.
1. Run `voodoo-gen` to create the `_generated/output` directory and generate the HTML files.
1. Run `odoc support-files -o _generated/html` to add css and styling to the `html` subdirectory
1. Serve `_generated/html`

`voodoo-*` commands must be called from the `_generated` directory.

```sh
mkdir _generated
cd _generated
opam exec -- dune exec -- voodoo-prep
opam exec -- dune exec -- voodoo-do -p <PACKAGE> -b
opam exec -- dune exec -- voodoo-gen -o output
cd ..
odoc support-files -o _generated/html
dream-serve _generated/html
```
