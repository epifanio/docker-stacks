# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM epinux/base-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    git \
    vim \
    jed \
    emacs \
    build-essential \
    python-dev \
    unzip \
    libsm6 \
    pandoc \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    libxrender1

# Switch back to jovyan to avoid accidental container runs as root
USER epinux
