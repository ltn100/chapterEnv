.PHONY: all
all: chapterEnv.sty

.PHONY: docs
docs: chapterEnv.dvi

.PHONY: clean
clean:
	rm -f *.sty
	rm -f WinEdt*
	rm -f *.aux
	rm -f *.dvi
	rm -f *.glo
	rm -f *.idx
	rm -f *.log
	rm -f *.ilg
	rm -f *.ind
	rm -f example.tex

.PHONY: example
example: example.dvi


chapterEnv.sty: chapterEnv.dtx chapterEnv.ins
	latex chapterEnv.ins

chapterEnv.dvi: chapterEnv.dtx chapterEnv.ind
	latex chapterEnv.dtx

chapterEnv.ind: chapterEnv.idx
	makeindex -s gind.ist -o chapterEnv.ind chapterEnv.idx

chapterEnv.idx: chapterEnv.dtx
	latex chapterEnv.dtx

example.dvi: example.tex
	latex example.tex

example.tex: chapterEnv.dtx chapterEnv.ins
	latex chapterEnv.ins
