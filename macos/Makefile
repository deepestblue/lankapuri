BINDIR := ../alekhana_dist

TYPEFACENAME1 := Kunchithapatham
SRCPATH1 := ../src/${TYPEFACENAME1}.ttf
NAME_TA1 := குஞ்சிதபாதம்
NAME_SA1 := 𑌕𑍁𑌞𑍍𑌚𑌿𑌤𑌪𑌾𑌦𑌃

%.ttf: %.sfd
	../src/build.sh -f $@ -t ${NAME_TA1} -s ${NAME_SA1}

build: ${SRCPATH1}

install: build
	install -C -m 644 ${SRCPATH1} ~/Library/Fonts/

regenerate_qt_masters: build
	${BINDIR}/generate_images -d ../masters/qt/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_qt -t ${SRCPATH1} -c ../cases

regenerate_coretext_masters: build
	${BINDIR}/generate_images -d ../masters/coretext/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_coretext -t ${SRCPATH1} -c ../cases

regenerate_masters: regenerate_qt_masters regenerate_coretext_masters

test: build
	${BINDIR}/run_tests -e ../masters/coretext/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_coretext -t ${SRCPATH1} -c ../cases
	${BINDIR}/run_tests -e ../masters/qt/${TYPEFACENAME1} -r ${BINDIR}/rasterise_text_qt -t ${SRCPATH1} -c ../cases

clean:
	${RM} ${SRCPATH1}
	-find ${TMPDIR} -iname 'run_tests*' -type d 2>/dev/null | xargs ${RM} -r

.PHONY: build install regenerate_masters regenerate_qt_masters regenerate_coretext_masters test clean
