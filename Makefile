.DEFAULT_GOAL := all

ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(ARGS):;@:)

.PHONY: all
all:
	opam exec -- dune build --root . @install

.PHONY: deps
deps: ## Install development dependencies
	opam install --deps-only --with-test --with-doc -y .

.PHONY: create_switch
create_switch:
	opam switch create . --no-install

.PHONY: switch
switch: create_switch deps ## Create an opam switch and install development dependencies

.PHONY: lock
lock: ## Generate a lock file
	opam lock -y .

.PHONY: build
build: ## Build the project, including non installable libraries and executables
	opam exec -- dune build --root .

.PHONY: install
install: all ## Install the packages on the system
	opam exec -- dune install --root .

.PHONY: test
test: ## Run the unit tests
	opam exec -- dune test --root .

.PHONY: clean
clean: ## Clean build artifacts and other generated files
	opam exec -- dune clean --root .

.PHONY: doc
doc: ## Generate odoc documentation
	opam exec -- dune build --root . @doc

.PHONY: fmt
fmt: ## Format the codebase with ocamlformat
	opam exec -- dune build --root . --auto-promote @fmt

.PHONY: watch
watch: ## Watch for the filesystem and rebuild on every change
	opam exec -- script/watch.sh

.PHONY: utop
utop: ## Run a REPL and link with the project's libraries
	opam exec -- dune utop --root . lib -- -implicit-bindings

.PHONY: promote
promote: ## Promote files to the source directory
	dune build client/voodoo_client.bc.js --profile release
	cp _build/default/client/voodoo_client.bc.js src/voodoo-gen/static/voodoo_client.bc.js

.PHONY: example
example: all ## Build an sample output
	rm -rf _generated; mkdir _generated
	cd _generated; opam exec -- dune exec -- voodoo-prep
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
