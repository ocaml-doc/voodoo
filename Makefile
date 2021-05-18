.PHONY: default clean promote

default:
	dune build

clean:
	dune clean

promote:
	dune build client/voodoo_client.bc.js --profile release
	cp _build/default/client/voodoo_client.bc.js gen/static/voodoo_client.bc.js


