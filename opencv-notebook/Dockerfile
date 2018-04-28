# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/base-extended-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-opencv

RUN apt-get install -y  build-essential autoconf libtool pkg-config python3-opengl
RUN pip3 install -U Pillow 
RUN pip3 install mahotas 
RUN pip3 install -U scikit-learn 
RUN pip3 install -U imutils
RUN pip3 install -U commentjson

RUN apt-get install -y python3-matplotlib
