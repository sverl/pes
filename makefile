.PHONY: all clean

all: pes.pdf

doc: *.pdf

README: pes.dtx
	@tex pes.dtx

%.sty: %.dtx
	@tex $*.dtx

%.dvi: %.dtx
	@latex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@latex $*.dtx

%.pdf: %.dvi
	@dvipdf $*.dvi $*.pdf

clean:
	@$(RM) *.aux *.glo *.gls *.hd *.idx *.ilg *.ind *.ins *.log *.out *.tmp *.toc pes-pes.bib
