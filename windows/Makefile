BINDIR = ../alekhana_dist
PS = powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command

TYPEFACENAME1 = Kunchithapatham
SRCPATH1 = ../src/$(TYPEFACENAME1).ttf
TYPEFACENAME2 = Kurukkal
SRCPATH2 = ../src/$(TYPEFACENAME2).ttf

install:
	$(PS) $(BINDIR)/install_typeface.ps1 -Path $(SRCPATH1) -Name '$(TYPEFACENAME1) Regular'
	$(PS) $(BINDIR)/install_typeface.ps1 -Path $(SRCPATH2) -Name '$(TYPEFACENAME2) Regular'

regenerate_masters:
	$(PS) $(BINDIR)/generate_images.ps1 -Rasteriser $(BINDIR)/rasterise_text_windows.exe -OutputRoot ../masters/windows/$(TYPEFACENAME1) -TypeFace $(SRCPATH1) -TestCases ../cases
	$(PS) $(BINDIR)/generate_images.ps1 -Rasteriser $(BINDIR)/rasterise_text_windows.exe -OutputRoot ../masters/windows/$(TYPEFACENAME2) -TypeFace $(SRCPATH2) -TestCases ../cases

test:
	$(PS) $(BINDIR)/run_tests.ps1 -TypeFace $(SRCPATH1) -Rasteriser $(BINDIR)/rasterise_text_windows.exe -MasterImages ../masters/windows/$(TYPEFACENAME1) -TestCases ../cases
	$(PS) $(BINDIR)/run_tests.ps1 -TypeFace $(SRCPATH2) -Rasteriser $(BINDIR)/rasterise_text_windows.exe -MasterImages ../masters/windows/$(TYPEFACENAME2) -TestCases ../cases

.PHONY: install regenerate_masters test
