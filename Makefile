.PHONY: release install manuals purge fullpurge examples package

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
