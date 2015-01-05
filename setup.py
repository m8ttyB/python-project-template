#!/usr/bin/env python

from setuptools import setup

setup(
    name = 'dummy-project',
    version = '0.0.3',
    description = 'Python script that does absolutely nothing except \
    to demonstrate setup.py.',
    author = 'Richard Pappalardo',
    author_email = 'rpappalax@gmail.com',
    url = 'https://github.com/rpappalax/dummy-project',
    license = "MIT",
    install_requires = [ 'nose >= 1.3.4',
                         'wsgiref==0.1.2',
    ],
    keywords = ['dummy', 'setup.py', 'project'],
    packages = [ 'dummyproj' ],
    classifiers=[
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.2',
        'Programming Language :: Python :: 3.3',
    ],
    entry_points={
        'console_scripts': [
            'dummyproj = dummyproj.dummy_handler:DummyHandler',
        ]
    },
)
