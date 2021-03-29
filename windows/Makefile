PS = powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command
TYPEFACEPATH = '../src/Kunchithapatham.ttf'
BINDIR = ../bin

install:
	$(PS) ./install_typeface.ps1 -Path $(TYPEFACEPATH) -Name 'Kunchithapatham Regular'

regenerate_masters:
	$(PS) $(BINDIR)/generate_images.ps1 -Rasteriser $(BINDIR)/rasterise_text_windows.exe -OutputRoot ../windows_masters -TypeFace $(TYPEFACEPATH)

test:
	$(PS) $(BINDIR)/run_tests.ps1 -TypeFace $(TYPEFACEPATH) -Rasteriser $(BINDIR)/rasterise_text_windows.exe -MasterImages ../windows_masters

.PHONY: install regenerate_masters test clean
