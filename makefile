TEX = pandoc
srclong = template-long.tex details.yml
srcshort = template-short.tex details.yml
outlong = cv-sergeev-long.pdf
outshort = cv-sergeev-short.pdf
FLAGS = -smart --pdf-engine=xelatex

all: $(outlong) $(outshort)
	convert $(outlong)[0] preview.png

long: $(outlong)
	xdg-open $(outlong)

short: $(outshort)
	xdg-open $(outshort)

preview: $(outlong)
	convert $(outlong)[0] preview.png

$(outshort) : $(srcshort)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

$(outlong) : $(srclong)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm $(outlong) $(outshort)
