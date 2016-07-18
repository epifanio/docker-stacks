#!/usr/bin/env bash

mkdir toc
cd toc
wget https://raw.githubusercontent.com/minrk/ipython_extensions/master/nbextensions/toc.js
wget https://raw.githubusercontent.com/minrk/ipython_extensions/master/nbextensions/toc.css
cd ..
jupyter-nbextension install --sys toc
jupyter-nbextension enable toc/toc
rm -rf toc