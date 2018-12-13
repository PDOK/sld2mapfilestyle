#!/bin/usr/env python3

from distutils.core import setup

setup(
    name='sld2mapfilestyle',
    version='0.1',
    description='Python module to export SLD\'s to MapServer mapfile styles',
    author='Anton Bakker',
    author_email='anton.bakker@kadaster.nl',
    packages=['sld2mapfilestyle'],
    include_package_data = True,
    install_requires=[
          'lxml',
    ]
)