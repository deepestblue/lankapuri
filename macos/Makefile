TYPEFACENAME := ../src/Kunchithapatham.ttf
BINDIR := ../bin

%.ttf: %.sfd
	../src/build.sh $@

build: ${TYPEFACENAME}

install: build
	install -C -m 644 ${TYPEFACENAME} ~/Library/Fonts/

regenerate_qt_masters: build
	$(BINDIR)/generate_images -d ../qt_masters -r ../bin/rasterise_text_qt -t ${TYPEFACENAME}

regenerate_coretext_masters: build
	$(BINDIR)/generate_images -d ../coretext_masters -r ../bin/rasterise_text_coretext -t ${TYPEFACENAME}

regenerate_masters: regenerate_qt_masters regenerate_coretext_masters

test: build
	$(BINDIR)/run_tests -e ../coretext_masters/ -r $(BINDIR)/rasterise_text_coretext -t ${TYPEFACENAME}
	$(BINDIR)/run_tests -e ../qt_masters/ -r $(BINDIR)/rasterise_text_qt -t ${TYPEFACENAME}

clean:
	${RM} ${TYPEFACENAME}.ttf
	-find ${TMPDIR} -iname 'run_tests*' -type d 2>/dev/null | xargs ${RM} -r

.PHONY: build install regenerate_masters regenerate_qt_masters regenerate_coretext_masters test build_and_test clean
