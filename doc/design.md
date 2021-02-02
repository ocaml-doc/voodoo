# Initial design

## Voodoo

- outline the whole process



This may be an ocurrent pipeline or a shell script.

- `voodoo-submit`
  Expect its output in a `prep` directory.
- `voodoo-assemble`
  + Deeply copy `prep` into `assemble`
    To make sure we don't loose data when doing changes to assemble
    This can be optimized (eg. symlinks)
  + TODO: add a CLI to assemble
  + `voodoo-assemble assemble`
    (will mutate the assemble tree)
- Generate the "compile" Makefile
  + `cd compile; odocmkgen gen ../assemble > Makefile`
    (the `cd` weird thing is because paths are relative in the generated Makefile)
    We place the generated Makefile into a `compile` directory
- Run the compilation
  + `make -C compile`
- Generate the "generate" Makefile
  + `cd generate; odocmkgen generate ../compile/odocl > Makefile`
- Run generate
  + `make -C generate`

### Dependency universes

A package in not just defined by the tuple of package name and package version. Additionally, it may be dependent on any of the packages it depends upon - for example, consider a package containing an mli file such as:

```ocaml
module M : Set.S with type elt = int
```

The expansion of this will depend on which version of the standard library it was compiled against.

A particular package is therefore specified by the triple of the package name, the package version, and the 'dependency universe hash'. This has is computed in the following way:

1. Find all dependencies (including transitive dependencies) using opam.
2. Sort and write them to a string, one package per line, in the format `<package name>.<version>`
3. Compute md5 hash of the string.

For example:

```
conf-m4.1
ocaml.4.11.1
ocamlbuild.0.14.0
ocamlfind.1.8.1
topkg.1.0.3
```

which are the dependencies on this particular system for the package `astring.0.8.5`. The hash of this should be `92edc0c1c4ec93b2f61fdd7fc9491460`

The type to uniquely identify a package is therefore given by:

```ocaml
type universe_id = Digest.t
type package_name = string
type package_version = string

type package = universe_id * package_name * package_version
```


### Handling packages, sub-packages and libraries

Because odoc handles include paths in the same way that OCaml does, and because we would like references to behave in the same familiar way that normal OCaml paths do, it makes sense to keep the `odoc` files in the identical directory structure to that of the associated `cmt`, `cmti` and `cmi` files. This does _not_ imply that the directory structure of the output `html` files (or man/latex files) must mirror this. The implication of this is that we _cannot_ determine parent/child hierarchy by simple directory structure (in general).

As an example of the various ways complex packages are layed out, we have the following two case studies:

#### Case study: yaml

- Compiled with dune. 
- Contains multiple packages, including a sub-sub-package:

```
yaml
yaml.bindings
yaml.bindings.types
yaml.c 
yaml.ffi 
yaml.types 
yaml.unix 
```

- Each sub-package corresponds with precisely one META file
- Each sub-package corresponds with precisely one archive
- Each package has an isolated include directory
- All subdirs are underneath ~/.opam/$switch/lib/yaml

#### Case study: oasis

- Not compiled with dune
- Contains multiple packages:

```
oasis
oasis.base
oasis.builtin-plugins
oasis.cli
oasis.dynrun
```

- Two META files - one in ~/.opam/$switch/lib/plugin-loader and the other in ~/.opam/$switch/lib/oasis
- Each sub-package corresponds with precisely one archive
- Multiple packages share the same directory

#### Case study: dose3

- Not compiled with dune
- Contains multiple packages:

```
dose3
dose3.algo
dose3.common
dose3.csw
dose3.debian
dose3.doseparse
dose3.doseparseNoRpm
dose3.npm
dose3.opam
dose3.pef
dose3.rpm
dose3.versioning
```

- One META file, in ~/.opam/$switch/lib/dose3
- The dose3 package contains multiple archives - `"common.cma algo.cma versioning.cma pef.cma debian.cma csw.cma opam.cma npm.cma"`
- Sub-packages also contain the same archives - e.g. dose3.algo specifies `algo.cma`


#### Observations

Different sub-packages containing the same libraries is unusual.

Suggested layout:

```
/packages/$package/$version/TopLevelModules/index.html
/packages/$package/$version/$subpackge/SubPackageModule/index.html
```

For example for `yaml`:

```
/packages/yaml/2.1.0/Yaml/index.html
/packages/yaml/2.1.0/Yaml/Stream/index.html
/packages/yaml/2.1.0/yaml.bindings/Yaml_bindings/index.html
/packages/yaml/2.1.0/yaml.bindings.types/Yaml_bindings_types/index.html
```

Questions:

- What do we do for something like dose3?
    - Can we just do nice docs for dune-based projects? probably not, not least due to Daniel's packages
    - How do we figure out which packages can be documented nicely? (e.g. no overlapping archives)

- What do we do for the OCaml libraries (stdlib, seq, raw_spacetime, str etc -- these don't have opam packages -- mostly the META files come from the `ocamlfind` package)

- What other packages will be painful? We have the 'corpus' compiled already, but missing files like META, dune-packages and so on.

## Voodoo-submit

Inputs: opam repository, s3 credentials, ocluster submission cap file

### First run

- Uses 0install opam solver to obtain solutions for all versions of all packages with necessary constraints (e.g. ocaml > 4.02.3) and stores them
- Submits jobs to ocluster embedding credentials for S3 storage of artefacts
  - each job is given the list of packages to install
  - each job is notified that one particular package is the 'target' package

### Subsequent runs

- Finds new package/versions since last run
- Submits required new jobs

## Voodoo-prep

Repo: https://github.com/jonludlam/voodoo-prep

This contains:
- voodoo-prep (the tool)
- odoc-upload.sh

The job as submitted by voodoo-submit will install a specific set of packages.
Once the job has completed, voodoo-prep, the binary, will be executed, and given the 'target' package on the command line.

### Voodoo-prep (the tool)

Input: An opam environment
Output: Opam packages compiled into a directory tree (voodoo-assemble's input)

We iterate through all of the packages installed in the opam environment, and go through the files installed as part of each package, as recorded by `~/.opam/<switch>/.opam-switch/install/<package>.changes`. All typedtree and compiled interface files (.cmt, cmti and .cmi) files are copied into the following path:

```
prep/universes/<hash>/<package>/<version>/lib/...
```

where the `...` represents the identical path the files appear under `~/.opam/<switch>/lib` and `~/.opam/<switch>/doc`. hash, package and version are the triple that uniquely identifies a package as described above.

and all docs installed are copied into a similar path (TODO):

```
prep/universes/<hash>/<package>/<version>/doc/...
```

The tool will also pick up `dune-package`, `META` and `opam` files.

Additionally, the tool will run `odoc compile-depend` to record intra-package dependencies, and record the paths required for compilation for inter-package dependencies - that is, it will note that the package `foo` in universe `abc` depends upon package `bar` in universe `def`. 

We also collect the non-hidden modules contained in `cmxa/cma` libraries installed as part of the package. This is done as follows

```
ocamlobjinfo <lib>.cma | grep -E "^Unit name" | grep -v "__"
```

The data we collect per package looks like:

```ocaml
(* Dependencies between cmt, cmti and cmi files that are all within this package *)
type intra_dep = {
    source_file : string;
    deps : string list;
}

type deps = {
    intra : intra_dep list
    packages : (package * string list) list; 
    (* string list indicates directories containing required units within that
       package *)
}

type libaries = {
    name : string; (* stdlib -- from stdlib.cma *)
    modules : string list; (* ["Stdlib"; "CamlinternalOO"; ... ] *)
}

type meta = {
    libraries : libraries;
    deps : deps;
    blessed : bool;
}
```

where `universe_id`, `package_name` and `package_version` correspond with the values in the path into which the `cm{t,ti,i}` files have been copied. The field 'blessed' is true if the package is the 'target' package and false otherwise. The `meta` type will be marshalled to an s-expression stored in the path

```
prep/universes/<hash>/<package>/<version>/meta.sexp
```




## Voodoo-assemble

Input: Voodoo-prep's output
Output: A directory tree ready to be consumed by odocmkgen (modifying the input tree)

The output of voodoo-prep is a set of tarballs uploaded to an S3 bucket. Once these have all been created, they should be unpacked into a single tree containing one top-level directory: `prep`.

This tool loads all of the metadata s-expressions created by `prep` to find a complete set of all universes/packages/versions that have been built.

It then checks that for each package/version, we have exactly one 'blessed' universe. This step may need to add new ones - for example, for the `ocaml` package, for which we don't ever run voodoo-prep for explicitly. As a consequence, for each triple `(universe * package * version)`
there will be exactly one that is 'blessed' and potentially many that are not.

For each `(universe * package * version)` triple, we construct a directory tree and intermediate `mld` files. If the triple is 'blessed', we create the tree:

```
assemble/packages/<package>/<version>/
```

and corresponding mld files:

```
assemble/packages.mld
assemble/packages/<package>.mld
assemble/packages/<package>/<version>.mld
```

Note that `version.mld` should contain the contents of `index.mld` if it exists in the package's `doc` dir.

If the triple is not 'blessed', we construct the tree:

```
assemble/universes/<universe>/<package>/<version>/
```

and corresponding mld files:

```
assemble/universes.mld
assemble/universes/<universe>.mld
assemble/universes/<universe>/<package>.mld
assemble/universes/<universe>/<package>/<version>.mld
```

as before `version.mld` should be overriden by `index.mld` if it exists.

The contents of these `mld` files must, at minimum, contain the `{!childpage}` or `{!childmodule}` references. The should also contain much more!


This step goes through the tree created by voodoo-prep and adds:
- Listing pages
  Universes, packages within universes, versions of packages
- Package pages
  TODO: When the package contains an "index.mld" page, it should be used instead
  Entry page for packages (lists modules, TODO: list more informations)

Informations that would be nice to display (TODO):
- User's doc pages
- README, LICENSE, CHANGES
- Various stuff from `dune-package` and `opam` files
- Other files (`example.ml`)
- Ensures that the user's package page contains the list of child pages/modules.
  Maybe by concatenating at the beginning of the user's page, a common header shared by default package pages.

## Odocmkgen

It's also the "reference driver" for Odoc. For now, it's generic enough but we might choose to rename it voodoo- something if we need more specific features.

Input: A directory tree in a specific format
Output: A makefile describing the "compile" and "link" steps

### The directory tree format

- Each intermediate directory is a "node"
- Nodes can have a parent page, the "parent" of everything in that directory. Example:
  ```
  root/
      thing.mld
      thing/
          a/
              ...
          b.mld
          b/
              ...
      ...
  ```
  `thing.mld` is the parent page of the directory `thing`.
  `thing/b.mld` is the parent page of `thing/b`.
- For nodes without parent, the grandparent is used.
  In the example above, `thing.mld` is also the parent page of `thing/a`.
- Every `.mld`, `.cmti`, `.cmt`, `.cmi` are picked as compilation unit, other files are ignored
  The preference order is `.cmti`, `.cmt` and `.cmi`.
  There cannot be a name conflict between pages and modules because Odoc enforces a `page-` prefix.

- TODO: "thing.dep" files to specify dependencies.
  The format is `(uni1 dep1 dep2 ...) (unit2 ...) ...`. Won't try to guess missing informations.
  By default, dependencies are queried with `odoc compile-deps` for every modules.

### Dependencies

Dependencies are either queried with `odoc compile-deps` or specified in `.dep` files.
They are extended to entire node (eg. if `a/a.cmti` depends on `b/b.cmti` and `c/c.cmti`, the entire node `a` depends on the nodes `b` and `c`). Inside a node, exact dependencies are needed.
The parent page is added to dependencies but not children.
Direct dependencies are used when compiling but transitive dependencies are used for linking.
Link-dependencies also include "--child" dependencies, recursively.

### The generated Makefile

Compile step:
- Every nodes have a corresponding "compile-<mangled_path>" PHONY rule that depends on units in the node. It is requested by link rules and the "compile" rule.
  Dependencies sometimes don't need to be more precise than entire nodes, this is useful to reduce drastically the size of the Makefile.
- `odoc compile` is used to compile OCaml object files and mld pages into `.odoc` files.
  The corresponding parent page is specified by the `--parent` option and include paths by `-I`.
  Every dependencies are added to the include paths (`-I`)
- When building a parent page, every children are listed using the `--child` option.

Link step:
- "compile-" rules are used to depend on compilation, link rules are independant.
- `odoc link` is used to generate `.odol` files. The search paths (`-I`) points to the parent, children and transitive dependencies.

The default targets will run both the compile and link steps. Object files will be stored in `odoc` and `odocl` directories (relative to the Makefile location).

It also have a "generate" subcommand working on a tree of `.odocl`that outputs a Makefile describing the rules to build the final HTML (also man, latex).

## Voodoo-link
