# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Debian Jessie image released 2016 May 03.
FROM debian@sha256:32a225e412babcd54c0ea777846183c61003d125278882873fb2bc97f9057c51

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

RUN rm -rf /etc/apt/sources.list
ADD sources.list /etc/apt/sources.list
# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive

ADD scripts/system_upgrade.sh /tmp/system_upgrade.sh
RUN chmod ugo+rx /tmp/system_upgrade.sh; sync; /tmp/system_upgrade.sh

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
ADD scripts/install_jupyter.sh /tmp/install_jupyter.sh
RUN chmod ugo+rx /tmp/install_jupyter.sh; sync; /tmp/install_jupyter.sh

# Configure container startup as root
EXPOSE 9999
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

ADD scripts/set_passwd.sh /tmp/set_passwd.sh
RUN chmod ugo+rx /tmp/set_passwd.sh; sync; /tmp/set_passwd.sh

VOLUME /home/epinux/work/data
RUN chmod -R 777 /home/epinux/work/data

USER epinux
