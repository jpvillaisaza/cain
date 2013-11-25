cain :
	latexmk -xelatex cain.tex

cain-print :
	latexmk -xelatex cain-print.tex

all : cain cain-print

clean :
	latexmk -c -silent cain.tex
	latexmk -c -silent cain-print.tex
	rm -f *.aux
	rm -f cain*.bbl
	rm -f cain*.run.xml
