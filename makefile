TEX = pandoc
src = template.tex details.yml
out = output.pdf
FLAGS = --latex-engine=xelatex

open: $(out)
	evince $(out)

preview: $(out)
	convert $(out)[0] preview.png

$(out) : $(src)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm $(out)
