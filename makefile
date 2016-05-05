TEX = pandoc
src = template.tex details.yml
FLAGS = --latex-engine=xelatex

open: output.pdf
	xdg-open output.pdf > pdf_open.log

output.pdf : $(src)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm output.pdf
