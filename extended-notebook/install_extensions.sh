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

git clone https://github.com/Jupyter-contrib/jupyter_contrib_core
pip3 install -e jupyter_contrib_core

git clone https://github.com/ipython-contrib/IPython-notebook-extensions
pip3 install -e jupyter_contrib_nbextensions

jupyter contrib nbextension install

pip2 install jupyter_nbextensions_configurator
pip3 install jupyter_nbextensions_configurator

jupyter nbextensions_configurator enable --system

rm -rf IPython-notebook-extensions
rm -rf jupyter_contrib_core