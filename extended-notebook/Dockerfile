# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/r-notebook

USER root

#RUN echo "alias python=python3" >> /root/.bashrc

RUN pip3 install bash_kernel
RUN python3 -m bash_kernel.install


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ruby-dev rubygems gforth octave python3-yaml python-yaml \
	python-psutil python3-psutil jq dh-autoreconf
	
RUN gem install gist fpm

RUN pip3 install octave_kernel
RUN python3 -m octave_kernel.install
RUN pip3 install ivisual

RUN pip3 install jq && pip install jq

RUN git clone https://github.com/brendan-rius/jupyter-c-kernel
RUN cd jupyter-c-kernel && python3 setup.py install && \
    cp -R resources/ /usr/local/lib/python3.5/dist-packages/jupyter_c_kernel-1.0.0-py3.5.egg/ &&  \
    jupyter-kernelspec install c_spec && cd ../ && rm -rf jupyter-c-kernel

RUN git clone https://github.com/ipython-contrib/IPython-notebook-extensions && cd IPython-notebook-extensions && \
    python3 setup.py install && cd ../ && rm -rf IPython-notebook-extensions

RUN git clone https://github.com/jdfreder/iforth && cd iforth && python3 setup.py install && python setup.py install && \
    cd ../ && rm -rf iforth

RUN pip install pythreejs && pip3 install pythreejs
RUN jupyter nbextension enable --py pythreejs --sys-prefix

RUN apt-get update && \
    apt-get install -y --no-install-recommends gnuplot

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER epinux

RUN echo "alias python=python3" >> /home/epinux/.bashrc