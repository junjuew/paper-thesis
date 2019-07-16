LATEX = pdflatex

all: thesis.pdf

SOURCES = $(wildcard *.tex) $(wildcard FIGS/*) thesis.bib Makefile

OBJECTS = thesis.aux thesis.bbl thesis.blg thesis.log thesis.out thesis.pdf thesis.toc thesis.brf thesis.lof thesis.lot

clean:
	rm -f $(OBJECTS)

thesis.pdf: thesis.bbl $(SOURCES)
	$(LATEX) thesis
	$(LATEX) thesis

thesis.bbl: $(SOURCES)
	$(LATEX) thesis
	bibtex thesis
