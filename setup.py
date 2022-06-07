#!/bin/usr/env python3

from distutils.core import setup
# read the contents of your README file
from os import path

basedir = path.abspath(path.dirname(__file__))
with open(path.join(basedir, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='sld2mapfilestyle',
    version='0.9',
    description='CLI tool to convert Styled Layer Descriptor (SLD) files to MapServer Mapfile style file',
    long_description=long_description,
    long_description_content_type='text/markdown',
    author='Anton Bakker',
    author_email='anton.bakker@kadaster.nl',
    packages=['sld2mapfilestyle'],
    include_package_data=True,
    install_requires=['lxml'],
    entry_points={
        'console_scripts':[
            'sld2mapfilestyle = sld2mapfilestyle.main:_cli',
        ]
    }
)
