# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Debian Jessie image released 2016 May 03.
FROM debian@sha256:32a225e412babcd54c0ea777846183c61003d125278882873fb2bc97f9057c51

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

RUN rm -rf /etc/apt/sources.list
ADD sources.list /etc/apt/sources.list
# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update
RUN apt-get install -y aptitude -o APT::Force-LoopBreak=1
RUN aptitude safe-upgrade -y
#RUN apt-get -o APT::Force-LoopBreak=1 dist-upgrade -y

RUN apt-get update && apt-get install -yq --no-install-recommends apt-utils \
    wget \
    bzip2 \
    python3 \
    python3-dev \
    python3-pip \
    ca-certificates \
    sudo \
    locales \
    mlocate \
    libzmq3-dev \
    python3-zmq \
    python3-setuptools \
    openssh-server

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.9.0/tini && \
    echo "faafbfb5b079303691a939a747d7f60591f2143164093727e870b289a44d9872 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

# Configure environment
ENV SHELL /bin/bash
ENV NB_USER epinux
ENV NB_UID 1000
ENV HOME /home/$NB_USER
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Create epinux user with UID=1000 and in the 'users' group
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p /opt/ && \
    chown epinux /opt/

USER epinux

# Setup epinux home directory
RUN mkdir /home/$NB_USER/work && \
    mkdir /home/$NB_USER/.jupyter && \
    mkdir -p -m 700 /home/$NB_USER/.local/share/jupyter && \
    echo "cacert=/etc/ssl/certs/ca-certificates.crt" > /home/$NB_USER/.curlrc

USER root

# Install JupyterHub to get the jupyterhub-singleuser startup script
RUN pip3 install 'jupyter'
RUN pip3 --default-timeout=100 install 'notebook'
RUN pip3 install 'jupyterhub'

# Configure container startup as root
EXPOSE 8888
WORKDIR /home/$NB_USER/work
ENTRYPOINT ["tini", "--"]
CMD ["start-notebook.sh"]

EXPOSE 22

# Add local files as late as possible to avoid cache busting
COPY start-notebook.sh /usr/local/bin/
COPY start-singleuser.sh /usr/local/bin/
COPY jupyter_notebook_config.py /home/$NB_USER/.jupyter/
RUN chown -R $NB_USER:users /home/$NB_USER/.jupyter

# Switch back to epinux to avoid accidental container runs as root

RUN echo "root:root" | chpasswd
RUN echo "epinux:epinux" | chpasswd
RUN echo "epinux     ALL=(ALL:ALL) ALL" >> /etc/sudoers

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER epinux
