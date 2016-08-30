#!/usr/bin/env bash

mkdir toc
cd toc
wget https://raw.githubusercontent.com/minrk/ipython_extensions/master/nbextensions/toc.js
wget https://raw.githubusercontent.com/minrk/ipython_extensions/master/nbextensions/toc.css
cd ..
jupyter-nbextension install toc
jupyter-nbextension enable toc/toc
rm -rf toc
jupyter nbextension install https://rawgithub.com/minrk/ipython_extensions/master/nbextensions/gist.js
jupyter nbextension enable gist