TEX = pandoc
src = template.tex details.yml
FLAGS = --latex-engine=xelatex

open: output.pdf
	evince output.pdf

output.pdf : $(src)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm output.pdf
