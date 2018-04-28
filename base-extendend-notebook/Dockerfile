# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/base-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    ruby-dev rubygems libmagickwand-dev git nodejs npm 

RUN npm install -g npm	

RUN apt-get update && apt-get install -y curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN gem install gist

RUN pip3 install bash_kernel && pip3 install ivisual # && pip3 install octave_kernel && pip3 install jq && pip install jq

#RUN git clone https://github.com/brendan-rius/jupyter-c-kernel
#RUN cd jupyter-c-kernel && python3 setup.py install && \
#    cp -R resources/ /usr/local/lib/python3.5/dist-packages/jupyter_c_kernel-1.0.0-py3.5.egg/ &&  \
#    jupyter-kernelspec install c_spec && cd ../ && rm -rf jupyter-c-kernel

RUN pip3 install -U matplotlib
RUN pip3 install -U bokeh


#RUN git clone https://github.com/jdfreder/iforth && cd iforth && python3 setup.py install && python setup.py install && \
#    cd ../ && rm -rf iforth

RUN pip3 install pythreejs
# python3 -m octave_kernel.install
RUN python3 -m bash_kernel.install && jupyter nbextension enable --py pythreejs --sys-prefix

ADD install_extensions.sh /tmp/install_extensions.sh
RUN chmod ugo+rx /tmp/install_extensions.sh; sync; /tmp/install_extensions.sh

RUN pip3 install RISE 
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix

RUN pip3 install jupyterlab

RUN jupyter serverextension enable --py jupyterlab --sys-prefix

RUN chmod -R 777 /home/epinux
RUN chown -R epinux /home/epinux

RUN pip3 install pdvega
RUN jupyter nbextension install --sys-prefix --py vega3

RUN pip3 install qgrid
RUN jupyter nbextension enable --py --sys-prefix qgrid

RUN pip3 install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension

RUN pip3 install ipympl
RUN jupyter nbextension enable --py --sys-prefix ipympl

# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

# RUN jupyter labextension install --debug --no-build @jupyter-widgets/jupyterlab-manager

# ADD install_lab_extensions.sh /tmp/install_lab_extensions.sh
# RUN chmod ugo+rx /tmp/install_lab_extensions.sh; sync; /tmp/install_lab_extensions.sh

#RUN pip3 install ipyleaflet
#RUN jupyter nbextension enable --py --sys-prefix ipyleaflet 
#RUN jupyter labextension install jupyter-leaflet

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
ADD install_lab_extensions.sh /tmp/install_lab_extensions.sh
RUN chmod ugo+rx /tmp/install_lab_extensions.sh; sync; /tmp/install_lab_extensions.sh

RUN pip3 install ipyleaflet
RUN jupyter nbextension enable --py --sys-prefix ipyleaflet
RUN jupyter labextension install jupyter-leaflet

RUN jupyter labextension install jupyterlab-drawio
RUN jupyter lab build

#RUN sudo chown -R epinux:$(id -gn epinux) /home/epinux/.config

#RUN apt-get update && apt-get install -y curl
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get update && apt-get install -y yarn

#RUN git clone https://github.com/jupyterlab/jupyterlab-monaco
#RUN cd jupyterlab-monaco && yarn install && yarn run build && jupyter labextension link .

#RUN chmod -R 777 /home/epinux/*
#RUN chown -R epinux /home/epinux/*

USER epinux
RUN jupyter nbextensions_configurator enable --user
RUN jupyter contrib nbextension install --user

RUN jupyter nbextension enable tree-filter/index && \
jupyter nbextension enable collapsible_headings/main && \
jupyter nbextension enable hide_input_all/main && \
jupyter nbextension enable codefolding/edit && \
jupyter nbextension enable codefolding/main

#RUN echo "alias python=python3" >> /home/epinux/.bashrc

#RUN git clone https://github.com/jupyterlab/jupyterlab-monaco
#RUN cd jupyterlab-monaco && yarn install && yarn run build && jupyter labextension link .

USER root

ADD install_lab_monaco.sh /tmp/install_lab_monaco.sh
RUN chmod ugo+rx /tmp/install_lab_monaco.sh; sync; /tmp/install_lab_monaco.sh

#RUN cd jupyterlab-monaco && jupyter labextension link .

#RUN updatedb

RUN chown -R epinux:$(id -gn epinux) /home/epinux/.config
RUN chmod -R 777 /home/epinux/*

USER epinux


