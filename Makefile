VENVDIR = ./build/venv
BINDIR = $(VENVDIR)/bin
PYTHON = $(BINDIR)/python
PIP = $(BINDIR)/pip
INSTALL = $(PIP) install

.PHONY: all
all:	build test

.PHONY: build
build: $(VENVDIR)/COMPLETE
$(VENVDIR)/COMPLETE: requirements.txt
	virtualenv --no-site-packages --python=`which python` --distribute $(VENVDIR)
	virtualenv ./build/venv
	$(INSTALL) -r ./requirements.txt
	$(PYTHON) ./setup.py develop
	touch $(VENVDIR)/COMPLETE

.PHONY: test
test:
	$(BINDIR)/nosetests

.PHONY: clean
clean:
	rm -rf build
	rm -rf *egg*
	rm -rf dist

# for dev branch only

.PHONY: pypi
pypi:
	# Create dist, egg dirs, upload package to pypi
	$(PYTHON) setup.py sdist upload -r pypi
	$(PYTHON) setup.py bdist_egg upload -r pypi

.PHONY: testpypi
testpypi:
	# Create dist, egg dirs, upload package to testpypi
	$(PYTHON) setup.py sdist upload -r testpypi
	# creating 'dist/dummy_project-0.0.3-py2.7.egg' and
	#  adding 'build/bdist.macosx-10.9-intel/egg' to it
	$(PYTHON) setup.py bdist_egg upload -r testpypi

.PHONY: pypi-register
pypi-register:
	$(PYTHON) setup.py register -r pypi

.PHONY: testpypi-register
testpypi-register:
	$(PYTHON) setup.py register -r testpypi
