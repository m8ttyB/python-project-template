#!/usr/bin/env python

from setuptools import setup

setup(
    name = 'python-project-template',
    version = '0.0.6',
    description = 'Python project template to demonstrate setup.py,'
                  'with Makefile build and sample unittests.',
    author = 'Richard Pappalardo',
    author_email = 'rpappalax@gmail.com',
    url = 'https://github.com/rpappalax/python-project-template',
    license = "MIT",
    install_requires = [ 'nose >= 1.3.4' ],
    keywords = ['demo', 'setup.py', 'project'],
    packages = [ 'demo' ],
    classifiers=[
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.2',
        'Programming Language :: Python :: 3.3',
    ],
    entry_points={

        'console_scripts': [ 'demo = demo.dummy_handler:main' ]
    },
)
