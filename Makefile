.PHONY: all
all: chapterEnv.dtx chapterEnv.ins
	latex chapterEnv.ins

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


chapterEnv.dvi: chapterEnv.dtx chapterEnv.ind
	latex chapterEnv.dtx

chapterEnv.ind: chapterEnv.idx
	makeindex -s gind.ist -o chapterEnv.ind chapterEnv.idx

chapterEnv.idx: chapterEnv.dtx
	latex chapterEnv.dtx
