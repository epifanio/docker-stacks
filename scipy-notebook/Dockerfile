# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/minimal-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# libav-tools for matplotlib anim
RUN apt-get update && \
    apt-get install -y --no-install-recommends libav-tools \
    dvipng ghostscript python3-matplotlib python3-pandas \
    python3-seaborn cython3 \
    python3-patsy python3-h5py python3-numexpr python3-skimage-lib \
    libyaml-dev python3-setuptools python-setuptools npm

RUN pip3 install --default-timeout=100 scikit-learn \
    sympy \
    statsmodels \
    cloudpickle \
    dill \
    qrcode \
    bqplot

# vispy
RUN git clone https://github.com/vispy/vispy.git && cd vispy && python setup.py install && python3 setup.py install && cd .. && rm -rf vispy

# Install Python 2 packages
RUN apt-get install -y --no-install-recommends \
python-pip python-zmq python-matplotlib python-pandas \
cython \
python-patsy python-h5py python-numexpr python-skimage-lib

RUN pip install --default-timeout=100 ipython \
    ipywidgets \
    scikit-learn \
    sympy \
    statsmodels \
    cloudpickle \
    dill \
    qrcode \
    bqplot

RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable --py bqplot --sys-prefix

# extra lib

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-mpld3 \
    python-mpld3 \
    python3-pygraphviz \
    python-pygraphviz \
    python3-seaborn \  
    python-seaborn \
    python-docutils \
    python3-docutils \
    python3-sklearn-pandas \
    python3-feather-format \
    python-sklearn-pandas \
    python-feather-format \
    python-sphinx \
    python3-sphinx && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
	
#bookeh

# Install Python 2 kernel spec globally to avoid permission problems when NB_UID
# switching at runtime.
RUN /usr/bin/python -m ipykernel install
RUN /usr/bin/python3 -m ipykernel install

USER epinux
