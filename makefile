TEX = pandoc
src = details.yml deedy-resume-openfont.cls
tmpl_full = template_full.tex
tmpl_short = template_short.tex
full = cv_sergeev_full.pdf
short = cv_sergeev_short.pdf
FLAGS = --pdf-engine=xelatex --from=markdown+yaml_metadata_block

all: $(full) $(short)
	convert $(full)[0] preview.png > /dev/null 2>&1

pdf: $(full)
	@xdg-open $(full) > /dev/null 2>&1

preview: $(full)
	convert $(full)[0] preview.png

$(full) : $(tmpl_full) $(src)
	$(TEX) $(filter-out $<,$^) -o $@ --template=$< $(FLAGS)

$(short) : $(tmpl_short) $(src)
	$(TEX) $(filter-out $<,$^) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm $(full) $(short) preview.png
