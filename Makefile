VENVDIR = ./build/venv
BINDIR = $(VENVDIR)/bin
PYTHON = $(BINDIR)/python
PIP = $(BINDIR)/pip
INSTALL = $(PIP) install
MAKEFILE_LIST=Makefile
SPHINX_BUILDDIR = docs/_build


.PHONY: all build test run clean docs pypi testpypi pypi-register testpypi-register
all:	build test

build: $(VENVDIR)/COMPLETE
$(VENVDIR)/COMPLETE: requirements.txt
	virtualenv --no-site-packages --python=`which python` \
	    --distribute $(VENVDIR)
	$(INSTALL) -r ./requirements.txt
	$(PYTHON) ./setup.py develop
	touch $(VENVDIR)/COMPLETE

test:
	$(BINDIR)/nosetests
	tox

run:
	$(BINDIR)/demo

clean:
	rm -rf build
	rm -rf *egg*
	rm -rf dist
	rm -rf ./docs/_build
	rm -rf .tox
	find . -name '*.pyc' -exec rm -f {} +

docs:
	$(VENVDIR)/bin/sphinx-build -b html -d $(SPHINX_BUILDDIR)/doctrees docs $(SPHINX_BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(SPHINX_BUILDDIR)/html/index.html"


# for development branch only

# Create dist, egg dirs, upload package to pypi
pypi:
	$(PYTHON) setup.py sdist upload -r pypi
	$(PYTHON) setup.py bdist_egg upload -r pypi

# Create dist, egg dirs, upload package to testpypi
testpypi:
	# Create dist, egg dirs, upload package to testpypi
	$(PYTHON) setup.py sdist upload -r testpypi
	# creating 'dist/dummy_project-0.0.3-py2.7.egg' and
	#  adding 'build/bdist.macosx-10.9-intel/egg' to it
	$(PYTHON) setup.py bdist_egg upload -r testpypi

# Register this project to Python Package Index
pypi-register:
	$(PYTHON) setup.py register -r pypi

# Register this project to Test Python Package Index
testpypi-register:
	$(PYTHON) setup.py register -r testpypi
