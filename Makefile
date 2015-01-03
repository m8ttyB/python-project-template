VENVDIR = ./build/venv
BINDIR = $(VENVDIR)/bin
PYTHON = $(BINDIR)/python
PIP = $(BINDIR)/pip
INSTALL = $(PIP) install

.PHONY: all
all:	build

.PHONY: build
build: $(VENVDIR)/COMPLETE
$(VENVDIR)/COMPLETE: requirements.txt
	virtualenv --no-site-packages --python=`which python` --distribute $(VENVDIR)
	$(INSTALL) -r ./requirements.txt
	$(PYTHON) ./setup.py develop
	touch $(VENVDIR)/COMPLETE

.PHONY: clean
clean:
	rm -rf build

.PHONY: clobber
clobber: clean
	rm -rf $(VENVDIR)
	rm -rf *egg*
