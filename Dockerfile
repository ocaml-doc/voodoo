FROM ocaml/opam:ubuntu-22.04-ocaml-4.14@sha256:cdc3ec85f42f2daaea17db5024405a9f8f0c83766d35626078eb0c33aa1a8b53 AS build
RUN sudo apt-get update && sudo apt-get install libev-dev capnproto libcapnp-dev m4 pkg-config libsqlite3-dev libgmp-dev -y --no-install-recommends
RUN sudo ln -f /usr/bin/opam-2.1 /usr/bin/opam && opam init --reinit -ni
RUN cd ~/opam-repository && git fetch -q origin master && git reset --hard 99c704701437f5a9674b58cc5fbbb593653d0a3a && opam update
COPY --chown=opam voodoo-do.opam voodoo-gen.opam voodoo-lib.opam voodoo-prep.opam voodoo-web.opam /src/
WORKDIR /src
RUN opam install -y --deps-only .
ADD --chown=opam . .
RUN opam exec -- dune subst
RUN opam exec -- dune build ./_build/install/default/bin/voodoo-do ./_build/install/default/bin/voodoo-gen ./_build/install/default/bin/voodoo-prep

FROM ubuntu:jammy-20221130
RUN apt-get update
WORKDIR /var/lib/voodoo
# ENTRYPOINT ["/usr/local/bin/voodoo-prep"]
ENV PROGRESS_NO_TRUNC=1
COPY --from=build /src/_build/install/default/bin/voodoo-do /src/_build/install/default/bin/voodoo-gen /src/_build/install/default/bin/voodoo-prep /usr/local/bin/
