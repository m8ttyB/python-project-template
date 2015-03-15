#!/usr/bin/env python

# from setuptools import setup

import os
from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))

with open(os.path.join(here, 'README.rst')) as f:
    README = f.read()

REQUIREMENTS = [
    'nose >= 1.3.4',
    'tox >= 1.9.0',
    'flake8==2.4.0'
]

KEYWORDS = [
    'demo',
    'setup.py',
    'project',
    'tox'
]

setup(
    name='python-project-template',
    version='0.1.0',
    description='python-project-template',
    long_description=README,
    author='Richard Pappalardo',
    author_email='rpappalax@gmail.com',
    url='https://github.com/rpappalax/python-project-template',
    license="MIT",
    install_requires=REQUIREMENTS,
    keywords=KEYWORDS,
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
