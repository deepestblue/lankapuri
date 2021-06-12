BINDIR := ../alekhana_dist

TYPEFACENAME1 := Kunchithapatham
SRCPATH1 := ../src/${TYPEFACENAME1}.ttf
TYPEFACENAME2 := Kurukkal
SRCPATH2 := ../src/${TYPEFACENAME2}.ttf

%.ttf: %.sfd
	../src/build.sh -f $@ -t "\ " -s "\ "

build: ${SRCPATH1} ${SRCPATH2}

install: build
	install -C -m 644 ${SRCPATH1} ~/Library/Fonts/
	install -C -m 644 ${SRCPATH2} ~/Library/Fonts/

regenerate_qt_masters: build
	${BINDIR}/generate_images -d ../masters/qt/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_qt -t ${SRCPATH1} -c ../cases
	${BINDIR}/generate_images -d ../masters/qt/${TYPEFACENAME2} -r ${BINDIR}/rasterise_text_qt -t ${SRCPATH2} -c ../cases

regenerate_coretext_masters: build
	${BINDIR}/generate_images -d ../masters/coretext/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_coretext -t ${SRCPATH1} -c ../cases
	${BINDIR}/generate_images -d ../masters/coretext/${TYPEFACENAME2} -r ${BINDIR}/rasterise_text_coretext -t ${SRCPATH2} -c ../cases

regenerate_masters: regenerate_qt_masters regenerate_coretext_masters

test: build
	${BINDIR}/run_tests -e ../masters/coretext/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_coretext -t ${SRCPATH1} -c ../cases
	${BINDIR}/run_tests -e ../masters/coretext/${TYPEFACENAME2} -r ${BINDIR}/rasterise_text_coretext -t ${SRCPATH2} -c ../cases
	${BINDIR}/run_tests -e ../masters/qt/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_qt -t ${SRCPATH1} -c ../cases
	${BINDIR}/run_tests -e ../masters/qt/${TYPEFACENAME2} -r ${BINDIR}/rasterise_text_qt -t ${SRCPATH2} -c ../cases

clean:
	${RM} ${SRCPATH1} ${SRCPATH2}
	-find ${TMPDIR} -iname 'run_tests*' -type d 2>/dev/null | xargs ${RM} -r

.PHONY: build install regenerate_masters regenerate_qt_masters regenerate_coretext_masters test clean
