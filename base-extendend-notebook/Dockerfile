



# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/base-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

#RUN echo "alias python=python3" >> /root/.bashrc


RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    ruby-dev rubygems libmagickwand-dev git # gforth octave python3-yaml python-yaml git \
    python3-mapnik mapnik
#	python-psutil python3-psutil jq dh-autoreconf gnuplot
	
RUN gem install gist

RUN pip3 install bash_kernel && pip3 install ivisual # && pip3 install octave_kernel && pip3 install jq && pip install jq

#RUN git clone https://github.com/brendan-rius/jupyter-c-kernel
#RUN cd jupyter-c-kernel && python3 setup.py install && \
#    cp -R resources/ /usr/local/lib/python3.5/dist-packages/jupyter_c_kernel-1.0.0-py3.5.egg/ &&  \
#    jupyter-kernelspec install c_spec && cd ../ && rm -rf jupyter-c-kernel



#RUN git clone https://github.com/jdfreder/iforth && cd iforth && python3 setup.py install && python setup.py install && \
#    cd ../ && rm -rf iforth

RUN pip3 install pythreejs
#_python3 -m octave_kernel.install
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

USER epinux
RUN jupyter nbextensions_configurator enable --user
RUN jupyter contrib nbextension install --user


RUN jupyter nbextension enable tree-filter/index && \
jupyter nbextension enable collapsible_headings/main && \
jupyter nbextension enable hide_input_all/main && \
jupyter nbextension enable codefolding/edit && \
jupyter nbextension enable codefolding/main



#RUN jupyter contrib nbextension install --user

RUN echo "alias python=python3" >> /home/epinux/.bashrc
