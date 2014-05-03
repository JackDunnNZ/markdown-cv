SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)

all:    clean $(PDFS) $(HTML)

pdf:   clean $(PDFS)
html:  clean $(HTML)

%.html: %.md
	pandoc $< -S -t html -c cv.css -o $@

%.pdf:  %.md
	pandoc $< -S --template=default.latex -H header.tex -V papersize=a4paper -o $@

clean:
	rm -f *.html *.pdf
