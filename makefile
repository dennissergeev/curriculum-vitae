TEX = pandoc
srcold = template-old.tex details.yml
srcnew = template-new.tex details.yml deedy-resume-openfont.cls
outold = cv-sergeev-old.pdf
outnew = cv-sergeev-new.pdf
FLAGS = --latex-engine=xelatex

all: $(outnew)
	convert $(outnew)[0] preview.png

new: $(outnew)
	@xdg-open $(outnew) > /dev/null 2>&1

preview: $(outnew)
	convert $(outnew)[0] preview.png

$(outnew) : $(srcnew)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

$(outold) : $(srcold)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm $(outold) $(outnew)
