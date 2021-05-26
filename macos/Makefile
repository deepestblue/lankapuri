TYPEFACENAME := ../src/Kunchithapatham.ttf
BINDIR := ../alekhana_dist

NAME_TA := குஞ்சிதபாதம்
NAME_SA := 𑌕𑍁𑌞𑍍𑌚𑌿𑌤𑌪𑌾𑌦𑌃

%.ttf: %.sfd
	../src/build.sh -f $@ -t ${NAME_TA} -s ${NAME_SA}

build: ${TYPEFACENAME}

install: build
	install -C -m 644 ${TYPEFACENAME} ~/Library/Fonts/

regenerate_qt_masters: build
	$(BINDIR)/generate_images -d ../masters/qt -r $(BINDIR)/rasterise_text_qt -t ${TYPEFACENAME}

regenerate_coretext_masters: build
	$(BINDIR)/generate_images -d ../masters/coretext -r $(BINDIR)/rasterise_text_coretext -t ${TYPEFACENAME}

regenerate_masters: regenerate_qt_masters regenerate_coretext_masters

test: build
	$(BINDIR)/run_tests -e ../masters/coretext/ -r $(BINDIR)/rasterise_text_coretext -t ${TYPEFACENAME}
	$(BINDIR)/run_tests -e ../masters/qt/ -r $(BINDIR)/rasterise_text_qt -t ${TYPEFACENAME}

clean:
	${RM} ${TYPEFACENAME}
	-find ${TMPDIR} -iname 'run_tests*' -type d 2>/dev/null | xargs ${RM} -r

.PHONY: build install regenerate_masters regenerate_qt_masters regenerate_coretext_masters test clean
