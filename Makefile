all:
	dotnet build

test:
	dotnet test

doc: api.md
	@echo "Documentation is generated"

api.md: doc_out/xml moxygen/node_modules
	(cd moxygen; npx moxygen ../doc_out/xml -o ../api.md)

doc_out/xml:
	doxygen

moxygen/node_modules:
	(cd moxygen; npm i)

.PHONY: all test
