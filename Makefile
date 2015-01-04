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
	rm -rf dist

# dev branch only - below this line

.PHONY: pypi
pypi:
	# Upload the package to PyPi
	python setup.py sdist upload -r pypi
	python setup.py bdist_egg upload -r pypi

.PHONY: testpypi
testpypi:
	# Create a dist dir
	# Upload the package to PyPiTest
	python setup.py sdist upload -r pypitest
	# creating 'dist/dummy_project-0.0.3-py2.7.egg' and
	#  adding 'build/bdist.macosx-10.9-intel/egg' to it
	python setup.py bdist_egg upload -r pypitest

.PHONY: pypi-register
pypi-register:
	python setup.py register -r pypi

.PHONY: testpypi-register
testpypi-register:
	python setup.py register -r testpypi
