LATEX = pdflatex

all: thesis.pdf

SOURCES = $(wildcard *.tex) $(wildcard FIGS/*) thesis.bib Makefile

OBJECTS = thesis.aux thesis.bbl thesis.blg thesis.log thesis.out thesis.pdf thesis.toc thesis.brf thesis.lof thesis.lot thesis.fdb_latexmk thesis.fls

clean:
	rm -f $(OBJECTS)

thesis.pdf: thesis.bbl $(SOURCES)
	$(LATEX) -interaction nonstopmode -file-line-error thesis
	$(LATEX) -interaction nonstopmode -file-line-error thesis

thesis.bbl: $(SOURCES)
	$(LATEX) -interaction nonstopmode -file-line-error thesis
	bibtex thesis
