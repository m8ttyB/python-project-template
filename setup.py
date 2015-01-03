#!/usr/bin/env python

from setuptools import setup
from pip.req import parse_requirements

install_reqs = parse_requirements('requirements.txt')
reqs = [str(ir.req) for ir in install_reqs]

setup(
    name = 'dummy-project',
    version = '0.0.1',
    description = 'Python script that does absolutely nothing except \
    to demonstrate setup.py.',
    author = 'Richard Pappalardo',
    author_email = 'rpappalax@gmail.com',
    url = 'https://github.com/rpappalax/dummy-project',
    install_requires = reqs,
    packages = [ 'dummyproj' ],
    entry_points={
        'console_scripts': [
            'dummy = dummyproj.dummy_handler:DummyHandler',
        ]
    },
    keywords = ['dummy', 'setup.py', 'project'],
    classifiers=[
        "Programming Language :: Python",
        "Programming Language :: Python :: 2",
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.2",
        "Programming Language :: Python :: 3.3",
    ],
)
