PICTURES = \
	common/logo-penguins.pdf \
	common/bootlin-logo.pdf

all: $(PICTURES)
	$(PDFLATEX_ENV) pdflatex -shell-escape raynal-weinberger-mtd-what-s-new.tex

%.pdf: %.svg
	inkscape -D -A $@ $<

%.pdf: %.eps
	epstopdf --outfile=$@ $^

%.eps: %.dia
	dia -e $@ -t eps $^

clean:
	$(RM) -r common/*.pdf *.pdf *.pyg *.snm *.toc *.vrb *.aux *.nav *.out *.dia~ *.log _minted*
