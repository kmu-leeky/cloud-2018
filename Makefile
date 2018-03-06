target_name = abc2

all:
	pdflatex $(target_name)
	bibtex $(target_name)

tex:
	pdflatex $(target_name)

clean:
	rm $(target_name).aux $(target_name).log $(target_name).pdf $(target_name).bbl $(target_name).blg

run:
	make all
	open $(target_name).pdf

diff:
	git show HEAD:$(target_name).tex > $(target_name).head.tex
	latexdiff $(target_name).head.tex $(target_name).tex > $(target_name).diff.tex
	pdflatex $(target_name).diff.tex
	rm $(target_name).diff.tex $(target_name).diff.aux $(target_name).diff.log $(target_name).head.tex
	open $(target_name).diff.pdf
