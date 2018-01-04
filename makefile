TEX = pandoc
srcfull = template-full.tex details.yml
srcshort = template-short.tex details.yml
outfull = cv-sergeev-full.pdf
outshort = cv-sergeev-short.pdf
FLAGS = --pdf-engine=xelatex

all: $(outfull) $(outshort)
	convert $(outfull)[0] preview.png

full: $(outfull)
	xdg-open $(outfull)

short: $(outshort)
	xdg-open $(outshort)

preview: $(outfull)
	convert $(outfull)[0] preview.png

$(outshort) : $(srcshort)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

$(outfull) : $(srcfull)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm $(outfull) $(outshort)
