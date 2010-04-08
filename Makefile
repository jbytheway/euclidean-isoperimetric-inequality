NAME = euclideanIsoperimetricInequality

$(NAME).pdf: $(NAME).tex
	rubber -d $<

all: $(NAME).pdf $(NAME).ps

$(NAME).ps: $(NAME).dvi
	dvips $<

$(NAME).dvi: $(NAME).tex
	rubber $<

edit:
	gvim $(NAME).tex

spellcheck:
	aspell check $(NAME).tex --add-tex-command="nospellcheck p"

view: $(NAME).pdf
	okular $< 2>/dev/null &

clean:
	rubber -d --clean $(NAME).tex
	rubber -p --clean $(NAME).tex
	rubber --clean $(NAME).tex
	-rm -rf target current-count

.DELETE_ON_ERROR:

.PHONY: clean all view edit spellcheck

