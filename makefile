TEX = pandoc
src = template_cv.tex details.yml deedy-resume-openfont.cls
outpdf = cv_sergeev.pdf
FLAGS = --pdf-engine=xelatex --from=markdown+yaml_metadata_block

all: $(outpdf)
	convert $(outpdf)[0] preview.png > /dev/null 2>&1

pdf: $(outpdf)
	@xdg-open $(outpdf) > /dev/null 2>&1

preview: $(outpdf)
	convert $(outpdf)[0] preview.png

$(outpdf) : $(src)
	$(TEX) $(filter-out $<,$^) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm $(outpdf)
