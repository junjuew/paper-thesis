LATEX = pdflatex

all: thesis.pdf

SOURCES = $(wildcard *.tex) $(wildcard FIGS/*) citation-db.bib Makefile

OBJECTS = thesis.aux thesis.bib thesis.bbl thesis.blg thesis.log thesis.out thesis.pdf thesis.toc thesis.brf thesis.lof thesis.lot thesis.fdb_latexmk thesis.fls

clean:
	rm -f $(OBJECTS)

thesis.pdf: thesis.bbl $(SOURCES)
	$(LATEX) -interaction nonstopmode -file-line-error thesis
	$(LATEX) -interaction nonstopmode -file-line-error thesis
	latexmk -c thesis.tex

thesis.bbl: thesis.bib
	$(LATEX) -interaction nonstopmode -file-line-error thesis
	bibtex thesis
	bibtool -x thesis.aux -o thesis.bib
	bibtool -s -sort.format='{%s($type) %s($key)}' -i thesis.bib -o thesis.bib

thesis.bib: citation-db.bib
	bibtool -s -sort.format={$key} -i citation-db.bib -o thesis.bib