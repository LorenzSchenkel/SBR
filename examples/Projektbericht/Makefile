
.PHONY: PDF

PDF: Projektbericht.pdf

Projektbericht.pdf: Projektbericht.tex
	arara $<

clean:
	rm -f *.log
	rm -f *.aux
	rm -f *.out
	rm -f *.toc

purge: clean
	rm -f Projektbericht.pdf
