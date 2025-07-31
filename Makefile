DEST ?= $(shell kpsewhich -expand-var '$$TEXMFHOME')

.PHONY: release install manuals purge fullpurge examples package

# NOTE: Running mktexlsr or texhash is not required for installations
# into $TEXMFHOME
#

release: manuals examples 

package: release clean
	./generateRelease.sh
	texhash

install:
	l3build install

clean:
	git clean -x -e *.pdf -f

purge:
	git clean -x -f

manuals:
	cd manuals && make

examples:
	cd examples && make


