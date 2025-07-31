
.PHONY: PDF

PDF: OTHRtex.pdf

OTHRtex.pdf: OTHRtex.tex
	arara $<

clean:
	rm -f *.log
	rm -f *.aux
	rm -f *.out
	rm -f *.toc

purge: clean
	rm -f OTHRtex.pdf
