# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/r-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root


RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    gmt gmt-gshhg-full \
    gmt-gshhg-high \
    gmt-gshhg-low \
    gmt-tutorial \
    libgmt5 \
    gmt-dcw \
    gmt-examples \
    gmt-doc \
    gmt-common \
    libgmt-dev \
    libfftw3-dev \
    libmotif-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    mesa-common-dev

RUN wget --progress=dot -P /tmp/ http://epinux.com/debs/mb-system/mb-system_5.x.r2281-1_amd64.deb
RUN dpkg -i /tmp/mb-system_5.x.r2281-1_amd64.deb

RUN apt-get clean && apt-get update && \
    apt-get install -y x11-apps x11vnc xvfb

RUN mkdir ~/.vnc
# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
ENV DISPLAY :0
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
CMD mbedit

EXPOSE 5900