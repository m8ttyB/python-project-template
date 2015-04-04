#!/usr/bin/env python

import os
from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))

with open(os.path.join(here, 'README.rst')) as f:
    README = f.read()

REQUIREMENTS = [
    'requests>=2.6.0',
    'mock>=1.0.1',
    'nose>=1.3.4',
    'tox>=1.9.0',
    'flake8>=2.4.0',
    'Sphinx>=1.3',
    'sphinx_rtd_theme>=0.1.7',
]

setup(
    name='python-project-template',
    version='0.1.4',
    description='python-project-template',
    long_description=README,
    author='Richard Pappalardo',
    author_email='rpappalax@gmail.com',
    url='https://github.com/rpappalax/python-project-template',
    license="MIT",
    install_requires=REQUIREMENTS,
    keywords=['demo', 'setup.py', 'project', 'tox'],
    packages=find_packages(),
    classifiers=[
        'Programming Language :: Python',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.3',
    ],
    entry_points={
        'console_scripts': ['demo = demo.demo_handler:main']
    },
)
