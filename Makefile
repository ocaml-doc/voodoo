_generated:
	rm -rf _generated; mkdir _generated

.PHONY: support
support:
	odoc support-files -o _generated/html

.PHONY: prep
prep: _generated
	cd _generated; opam exec -- dune exec -- voodoo-prep

.PHONY: example
example: all prep ## Build an sample output
	cd _generated; opam exec -- dune exec -- voodoo-do -p ocaml-base-compiler -b
	cd _generated; opam exec -- dune exec -- voodoo-gen -o output

.PHONY: gen
gen:
	cd _generated; rm -rf output
	cd _generated; opam exec -- dune exec -- voodoo-gen -o output

.PHONY: serve
serve:
	opam exec -- dream-serve _generated/html

.DEFAULT:
	cd _generated; opam exec -- dune exec -- voodoo-do -p $@ -b
