NAME=Prohaupt

all: $(NAME).pdf

$(NAME).pdf: $(NAME).tex
	pdflatex $(NAME).tex
	bibtex $(NAME)
	pdflatex $(NAME).tex
	pdflatex $(NAME).tex
	make clean
clean: 
	rm -f $(NAME).aux
	rm -f $(NAME).bbl
	rm -f $(NAME).blg
	rm -f $(NAME)-blx.bib
	rm -f $(NAME).log
	rm -f $(NAME).out
	rm -f $(NAME).run.xml
	rm -f $(NAME).toc
