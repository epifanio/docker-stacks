# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Debian Jessie image released 2016 May 03.
FROM epinux/baseimage:ubuntugis-grass

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

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

#ADD scripts/install_nvm.sh /tmp/install_nvm.sh
#RUN chmod ugo+rx /tmp/install_nvm.sh; sync; 

#ADD scripts/run_install_nvm.sh /tmp/run_install_nvm.sh
#RUN chmod ugo+rx /tmp/run_install_nvm.sh; sync; 

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install base dependencies

RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        python \
        rsync \
        software-properties-common \
        wget \
    && rm -rf /var/lib/apt/lists/*

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.0.0

# Install nvm with node and npm
#RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash \
#    && . $NVM_DIR/nvm.sh \
#    && nvm install $NODE_VERSION \
#    && nvm alias default $NODE_VERSION \
#    && nvm use default

#ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
#ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
#RUN ls /usr/local/nvm/versions/node/v8.0.0/bin/npm
#RUN chown -R epinux /usr/local
#RUN chown -R epinux /home/epinux/
#RUN chown -R $epinux:$(id -gn $epinux) /home/epinux/.config


ADD scripts/install_geostack.sh /tmp/install_geostack.sh
RUN chmod ugo+rx /tmp/install_geostack.sh; sync; /tmp/install_geostack.sh

ADD scripts/install_jupyter.sh /tmp/install_jupyter.sh
RUN chmod ugo+rx /tmp/install_jupyter.sh; sync; /tmp/install_jupyter.sh

# Configure container startup as root
EXPOSE 8888
WORKDIR /home/$NB_USER/work
ENTRYPOINT ["tini", "--"]
CMD ["start-notebook.sh"]

EXPOSE 22

ADD scripts/start_services.sh /usr/local/bin/start_services.sh
ADD scripts/stop_services.sh /usr/local/bin/stop_services.sh
RUN chmod a+x /usr/local/bin/start_services.sh /usr/local/bin/stop_services.sh

# Add local files as late as possible to avoid cache busting
COPY start.sh /usr/local/bin/
COPY start-notebook.sh /usr/local/bin/
COPY start-singleuser.sh /usr/local/bin/
COPY jupyter_notebook_config.py /home/$NB_USER/.jupyter/
RUN chown -R $NB_USER:users /home/$NB_USER/.jupyter

# Switch back to epinux to avoid accidental container runs as root

ADD scripts/set_passwd.sh /tmp/set_passwd.sh
RUN chmod ugo+rx /tmp/set_passwd.sh; sync; /tmp/set_passwd.sh

RUN chown -R epinux:users /home/epinux
RUN chmod -R 777 /home/epinux



#RUN mkdir -p /usr/local/share/jupyter/kernels
#ADD scripts/installRpackages.r /tmp/installRpackages.r
#RUN Rscript /tmp/installRpackages.r

#ADD scripts/installR-Spatial.r /tmp/installR-Spatial.r
#RUN Rscript /tmp/installR-Spatial.r

#RUN useradd -m -s /bin/bash postgres
#RUN echo "postgres:postgres" | chpasswd

#RUN apt-get clean && apt-get update && \
#    apt-get install -y --no-install-recommends \
#	postgresql-9.5 \
#	postgresql-client-9.5 \
#	postgresql-contrib-9.5 \
#	postgis \
#	postgresql-9.5-postgis-2.3 \
#	postgresql-9.5-postgis-scripts \
#	postgresql-contrib \
#	php-pgsql phppgadmin \
#	python-sqlalchemy \
#	python3-sqlalchemy python3-psycopg2 python-psycopg2 \
#	apache2

#ADD scripts/rpostgis.r /tmp/rpostgis.r
#RUN Rscript /tmp/rpostgis.r

#EXPOSE 8787

#ADD scripts/installRgrass7.r /tmp/installRgrass7.r
#RUN Rscript /tmp/installRgrass7.r


USER epinux
VOLUME /home/epinux/work/data

# GRASS STUFF
ENV PYTHONPATH /usr/lib/grass72/etc/python:$PYTHONPATH
ENV PATH /usr/lib/grass72/bin:/home/epinux/.grass7/addons/bin/:$PATH
ENV GRASS_PNG_AUTO_WRITE TRUE
ENV GRASS_PNG_COMPRESSION 9
ENV GRASS_TRANSPARENT TRUE
ENV GRASS_TRUECOLOR TRUE
ENV GISBASE /usr/lib/grass72
#ENV GISDBASE /home/epinux/grassdata
ENV GISRC /home/epinux/.grass7/rc
ENV LD_LIBRARY_PATH /usr/lib/grass72/lib/
ENV GRASS_ADDON_BASE=/home/epinux/.grass7/addons

#RUN Rscript -e "IRkernel::installspec()"

USER root
RUN mkdir /home/epinux/.grass7
RUN chown -R epinux:users /home/epinux/
ADD --chown=epinux:users GRASS/rc /home/epinux/.grass7/rc
COPY --chown=epinux:users GRASS/addons /home/epinux/.grass7/addons

