cain :
	latexmk -xelatex cain.tex

cain-print :
	latexmk -xelatex cain-print.tex

cain-screen :
	latexmk -xelatex cain-screen.tex

all : cain cain-print cain-screen

clean :
	latexmk -c -silent cain.tex
	latexmk -c -silent cain-print.tex
	latexmk -c -silent cain-screen.tex
	rm -f *.aux
	rm -f cain*.bbl
	rm -f cain*.run.xml
