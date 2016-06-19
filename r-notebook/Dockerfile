# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/scipy-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-rpy2 \
    build-essential gfortran libblas-dev liblapack-dev  \
    netcdf-bin libzmq3-dev python-rpy2 r-recommended libreadline6-dev

# Calls R script to do install with feedback to stdout

RUN mkdir -p /usr/local/share/jupyter/kernels
ADD installRpackages.r /tmp/installRpackages.r
RUN Rscript /tmp/installRpackages.r

USER epinux
