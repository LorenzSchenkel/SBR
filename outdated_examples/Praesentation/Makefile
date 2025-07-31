#
#


.PHONY: PDF

PDF:
	./generateExamples.sh

clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.nav
	rm -f *.blg
	rm -f *.bbl
	rm -f *.out
	rm -f *.snm
	rm -f *.toc
	rm -f *.vrb

purge: clean
	rm -f examples/*.pdf
	rmdir examples
