enoch :
	latexmk -xelatex enoch.tex

enoch-handout :
	latexmk -xelatex enoch-handout.tex

all : enoch enoch-handout

clean :
	latexmk -c -silent enoch.tex
	latexmk -c -silent enoch-handout.tex
	rm -f *.nav
	rm -f *.snm
	rm -f *.vrb
