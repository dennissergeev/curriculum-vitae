TEX = pandoc
srcold = template-old.tex details.yml
srcnew = template-new.tex details.yml deedy-resume-openfont.cls
outold = cv-sergeev-old.pdf
outnew = cv-sergeev-new.pdf
FLAGS = --pdf-engine=xelatex

all: $(outold) $(outnew)
	convert $(outold)[0] preview.png

old: $(outold)
	@xdg-open $(outold) > /dev/null 2>&1

new: $(outnew)
	@#xdg-open $(outnew) > /dev/null 2>&1

preview: $(outold)
	convert $(outold)[0] preview.png

$(outnew) : $(srcnew)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

$(outold) : $(srcold)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm $(outold) $(outnew)
