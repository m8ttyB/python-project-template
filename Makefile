VENVDIR = ./build/venv
BINDIR = $(VENVDIR)/bin
PYTHON = $(BINDIR)/python
PIP = $(BINDIR)/pip
INSTALL = $(PIP) install
MAKEFILE_LIST=Makefile
SPHINX_BUILDDIR = docs/_build

help:
	@echo ""
	@echo "HELP"
	@echo "========================================"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'  |  \
	    awk '{print "$ make "$$2 " # "substr($$0, index($$0,$$3))}'
	@echo ""


.PHONY: all ## Build all
all:	build test

.PHONY: build  ## Setup virtualenv and install
build: $(VENVDIR)/COMPLETE
$(VENVDIR)/COMPLETE: requirements.txt
	virtualenv --no-site-packages --python=`which python` \
	    --distribute $(VENVDIR)
	$(INSTALL) -r ./requirements.txt
	$(PYTHON) ./setup.py develop
	touch $(VENVDIR)/COMPLETE

.PHONY: test ## Run tests
test:
	$(BINDIR)/nosetests

.PHONY: run ## Run script: $ ./build/venv/bin/demo
run:
	$(BINDIR)/demo

.PHONY: clean ## Clean all build and pyc files
clean:
	rm -rf build
	rm -rf *egg*
	rm -rf dist
	find . -name '*.pyc' -exec rm -f {} +

.PHONY: docs ## Generate docs
docs:
	$(VENVDIR)/bin/sphinx-build -b html -d $(SPHINX_BUILDDIR)/doctrees docs $(SPHINX_BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(SPHINX_BUILDDIR)/html/index.html"


# for development branch only

.PHONY: pypi ## Create dist, egg dirs, upload package to pypi
pypi:
	$(PYTHON) setup.py sdist upload -r pypi
	$(PYTHON) setup.py bdist_egg upload -r pypi

.PHONY: testpypi ## Create dist, egg dirs, upload package to testpypi
testpypi:
	# Create dist, egg dirs, upload package to testpypi
	$(PYTHON) setup.py sdist upload -r testpypi
	# creating 'dist/dummy_project-0.0.3-py2.7.egg' and
	#  adding 'build/bdist.macosx-10.9-intel/egg' to it
	$(PYTHON) setup.py bdist_egg upload -r testpypi

.PHONY: pypi-register ## Register the project to Python package index
pypi-register:
	$(PYTHON) setup.py register -r pypi

.PHONY: testpypi-register ## Register this project to Test Python package index
testpypi-register:
	$(PYTHON) setup.py register -r testpypi
