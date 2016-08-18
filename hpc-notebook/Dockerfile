# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/r-spatial-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

RUN apt-get update && \
    apt-get install -y llvm-3.8 libedit-dev python3-tk r-cran-rgl


RUN ln -s /usr/bin/llvm-config-3.8 /usr/bin/llvm-config

ADD install_continuum.sh /tmp/install_continuum.sh
RUN /tmp/install_continuum.sh

USER epinux
