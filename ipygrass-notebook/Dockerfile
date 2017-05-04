# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM epinux/base-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get clean && apt-get update && apt-get install -yq --no-install-recommends \
    git \
    nano \
    build-essential \
    python-dev \
    unzip \
    libsm6 \
    pandoc \
	texlive-xetex \
    netcdf-bin \
    grass-core \
    gdal-bin \
    mapserver-bin \
	libgdal-grass \
	python3-dev \
	python-netcdf4 \
	python3-netcdf4 \
	ruby-dev rubygems \
    python-gdal \
    python3-gdal \
	cgi-mapserver \
	python3-tables python-tables \
	python3-scipy python3-pandas cython3 python3-pip python-pip python3-setuptools python-setuptools
	
	
RUN pip3 install --default-timeout=100 scikit-learn \
    sympy \
    statsmodels \
    cloudpickle \
    dill \
    qrcode \
    bqplot \
    dask \
    partd \
    distributed \
    feather-format \
    xarray \
    datashape \
    pillow \
    prettypandas \
    arrow

RUN gem install gist

RUN pip install pythreejs && pip3 install pythreejs && jupyter nbextension enable --py pythreejs --sys-prefix 
	
RUN pip install -U ipyleaflet
RUN pip3 install -U ipyleaflet

RUN jupyter nbextension install --py --sys-prefix ipyleaflet
RUN jupyter nbextension enable --py --sys-prefix ipyleaflet

RUN pip3 install RISE && pip install RISE 
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix

RUN pip3 install jupyterlab
#RUN jupyter serverextension enable --py jupyterlab --sys-prefix

RUN pip3 install jupyter_contrib_nbextensions
RUN pip3 install jupyter_nbextensions_configurator

# Switch back to jovyan to avoid accidental container runs as root
USER epinux
RUN jupyter nbextensions_configurator enable --user
RUN jupyter contrib nbextension install --user


USER epinux

ENV PATH /usr/lib/grass72/bin:$PATH
ENV GRASS_PNG_AUTO_WRITE TRUE
ENV GRASS_PNG_COMPRESSION 9
ENV GRASS_TRANSPARENT TRUE
ENV GRASS_TRUECOLOR TRUE
ENV GISBASE /usr/lib/grass72
ENV GISDBASE /home/epinux/grassdata
ENV GISRC /home/epinux/.grass7/rc
ENV LD_LIBRARY_PATH /usr/lib/grass72/lib/

RUN mkdir /home/epinux/.grass7
ADD GRASS/rc /home/epinux/.grass7/rc
COPY GRASS/addons /home/epinux/.grass7/addons

USER root

RUN wget http://epinux.com/grassdata.zip && \
unzip grassdata.zip && \
rm -rf grassdata.zip

RUN chown -R epinux /home/epinux
RUN updatedb

USER epinux
