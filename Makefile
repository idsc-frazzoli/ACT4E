all:
	@echo
	@echo Compile using \"make ready\" or \"make full\".
	@echo
	@echo Create the chached tikz using \"make tikz\".


tmpdir=tmp

#%.pdf: %.tex
#	rm -f $*.aux $(tmpdir)/$*.aux
#	latexmk -pdflatex -outdir=$(tmpdir) -f $<
#	cp $(tmpdir)/$*.pdf $@

%.pdf: %.tex
	#rm -f $*.aux
	latexmk -pdflatex   -f $<

clean:
	rm -f *.fdb_latexmk *.fls *.log  *.aux *.dvi *.out *.maf *.mtc* *.ptc* *-blx.bib *.run.xml *.idx *.toc *.bbl *.blg *.ind *.ilg   *.ptc* *.mtc*


ready: ACT4E-ready.pdf
full: ACT4E-full.pdf
full-fast: ACT4E-full-fast.pdf

ACT4E-ready.pdf::  chapters/*.tex utils/*.tex common.tex

ACT4E-full.pdf::  chapters/*.tex utils/*.tex  common.tex

ACT4E-full-fast.pdf::  chapters/*.tex utils/*.tex  common.tex


tikz:
	touch sag/*pdf
	make -C sag -j
#
#standalone:\
#	./chapters/specialization/standalone.tex\
#	./chapters/failures/standalone.tex\
#	./chapters/design/standalone.tex\
#	./chapters/parallelism/standalone.tex\
#	./chapters/relation/standalone.tex\
#	./chapters/design-problems/standalone.tex\
#	./chapters/wiring-diagrams/standalone.tex\
#	./chapters/linear-dps/standalone.tex\
#	./chapters/connection/standalone.tex\
#	./chapters/universal/standalone.tex\
#	./chapters/recursion/standalone.tex\
#	./chapters/combination/standalone.tex\
#	./chapters/functors/standalone.tex\
#	./chapters/introduction/standalone.tex\
#	./chapters/up-the-ladder/standalone.tex\
#	./chapters/construct-dp/standalone.tex\
#	./chapters/negative/standalone.tex\
#	./chapters/poset-build/standalone.tex\
#	./chapters/tradeoffs/standalone.tex\
#	./chapters/feedback/standalone.tex\
#	./chapters/sameness/standalone.tex\
#	./chapters/temporal-dps/standalone.tex\
#	./chapters/naturality/standalone.tex\
#	./chapters/ordering/standalone.tex\
#	./chapters/solving/standalone.tex\
#	./chapters/monotonicity/standalone.tex\
#	./chapters/profunctors/standalone.tex\
#	./chapters/higher-design/standalone.tex\
#	./chapters/enrichment/standalone.tex\
#	./chapters/feasibility/standalone.tex\
#	./chapters/computing/standalone.tex\
#	./chapters/duality/standalone.tex\
#	./chapters/operads/standalone.tex\
#	./chapters/transmutation/standalone.tex\
#	./chapters/overview/standalone.tex\
#	./chapters/from-math-to-imp/standalone.tex\
#	./chapters/uncertainty/standalone.tex\
#	./chapters/adjunctions/standalone.tex\
#	./chapters/culture/standalone.tex\
#	./chapters/linear-logic/standalone.tex\

%/standalone.tex:
	cp template-standalone.tex $@


mains=$(wildcard volumes/vol*/part*/*/main.tex)
standalones=$(subst main.tex,standalone.tex,$(mains))

standalone: $(standalones)


twovolumes:
	make -B ACT4E-vol1.pdf
	make -B ACT4E-vol2.pdf
	make -B ACT4E-vol1.pdf
	make -B ACT4E-vol2.pdf

