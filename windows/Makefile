PS = powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command
TYPEFACEPATH = '../src/Kunchithapatham.ttf'
BINDIR = ../alekhana_dist

install:
	$(PS) $(BINDIR)/install_typeface.ps1 -Path $(TYPEFACEPATH) -Name 'Kunchithapatham Regular'

regenerate_masters:
	$(PS) $(BINDIR)/generate_images.ps1 -Rasteriser $(BINDIR)/rasterise_text_windows.exe -OutputRoot ../masters/windows -TypeFace $(TYPEFACEPATH) -TestCases ../cases

test:
	$(PS) $(BINDIR)/run_tests.ps1 -TypeFace $(TYPEFACEPATH) -Rasteriser $(BINDIR)/rasterise_text_windows.exe -MasterImages ../masters/windows -TestCases ../cases

.PHONY: install regenerate_masters test
