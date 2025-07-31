
.PHONY: PDF

PDF: Testbrief1.pdf

Testbrief1.pdf: Testbrief1.tex
	arara $<

clean:
	rm -f *.log
	rm -f *.aux
	rm -f *.out
	rm -f *.toc

purge: clean
	rm -f Testbrief1.pdf
