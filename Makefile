SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
DOCX=$(SRC:.md=.docx)

all:    clean $(PDFS) $(HTML) $(DOCX)

pdf:   clean $(PDFS)
html:  clean $(HTML)
docx:  clean $(DOCX)

%.html: %.md
	pandoc $< -S -s -t html -c templates/cv.css -o $@

%.pdf:  %.md
	pandoc $< -S --template=default.latex -H templates/header.tex -V papersize=a4paper -o $@

%.docx:  %.md
	pandoc $< -S --reference-docx=templates/reference.docx -o $@

clean:
	rm -f *.html *.pdf *.docx
