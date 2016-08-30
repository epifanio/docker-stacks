![docker pulls](https://img.shields.io/docker/pulls/epinux/minimal-notebook.svg) ![docker stars](https://img.shields.io/docker/stars/epinux/minimal-notebook.svg)

# Minimal Jupyter Notebook Stack

Small image for working in the notebook and installing your own libraries

## This fork differs from the original repository [jupyter/docker-stacks](https://github.com/jupyter/docker-stacks) for:
* upgrade the OS to debian SID
* replace the conda python environment with the system python (2/3) 
* **Username** ```epinux``` **PASSWORD** ```epinux``` (root acces as default)

## What it Gives You

* Starting point: [base-notebook](../base-notebook/README.md) plus:
* git
* vim, emacs, nano, jed
* essential build toolkit
* python 2/3 development files 
* pandoc 
* full texlive environmnet
