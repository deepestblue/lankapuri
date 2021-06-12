PS = powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command
TYPEFACENAME1 = Kunchithapatham
SRCPATH1 = ../src/$(TYPEFACENAME1).ttf
BINDIR = ../alekhana_dist

install:
	$(PS) $(BINDIR)/install_typeface.ps1 -Path $(SRCPATH1) -Name 'Kunchithapatham Regular'

regenerate_masters:
	$(PS) $(BINDIR)/generate_images.ps1 -Rasteriser $(BINDIR)/rasterise_text_windows.exe -OutputRoot ../masters/windows/$(TYPEFACENAME1) -TypeFace $(SRCPATH1) -TestCases ../cases

test:
	$(PS) $(BINDIR)/run_tests.ps1 -TypeFace $(SRCPATH1) -Rasteriser $(BINDIR)/rasterise_text_windows.exe -MasterImages ../masters/windows/$(TYPEFACENAME1) -TestCases ../cases

.PHONY: install regenerate_masters test
