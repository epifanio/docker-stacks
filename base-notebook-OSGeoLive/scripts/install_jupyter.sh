#!/usr/bin/env bash

npm install -g install bower
npm install typescript -g

pip3 install --upgrade pip
pip3 install -U jupyter
pip3 install -U notebook
pip3 install -U jupyterlab
pip3 install -U ipywidgets
pip3 install -U ipyleaflet

jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build

git clone https://github.com/ellisonbg/ipyleaflet
cd ipyleaflet/jslab
npm install && jupyter labextension install .
cd ../..

jupyter nbextension enable --py --sys-prefix ipyleaflet

jupyter labextension install @jupyterlab/geojson-extension
jupyter labextension install @jupyterlab/json-extension
jupyter labextension install @jupyterlab/katex-extension

pip3 install bqplot
jupyter nbextension enable --py --sys-prefix bqplot

pip3 install pythreejs
jupyter nbextension enable --py --sys-prefix pythreejs

pip3 install beakerx
beakerx-install

pip3 install ipyvolume
jupyter nbextension enable --py --sys-prefix ipyvolume

pip3 install bokeh
jupyter labextension install jupyterlab_bokeh

jupyter labextension install @jupyterlab/google-drive
jupyter labextension install @jupyterlab/github

pip3 install jupyterlab_github
jupyter serverextension enable --sys-prefix --py jupyterlab_github

pip3 install bash_kernel
python3 -m bash_kernel.install

pip3 install jp_proxy_widget
jupyter nbextension enable --py --sys-prefix jp_proxy_widget

pip3 install vdom

