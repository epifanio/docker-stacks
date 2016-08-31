# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/gis-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

# R pre-requisites
RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc \
    python3-rpy2 \
    build-essential \
    gfortran \
    libblas-dev \
    liblapack-dev  \
    libzmq3-dev \
    python-rpy2 \
    r-recommended \
    libreadline6-dev \
    libcurl4-openssl-dev \
    gdebi \
    libgdal-dev \
    libssl1* \
    r-cran-rgl

# Calls R script to do install with feedback to stdout

RUN mkdir -p /usr/local/share/jupyter/kernels

# uncomment to build from src

#ADD installRpackages.r /tmp/installRpackages.r
#RUN Rscript /tmp/installRpackages.r

# R-studio-server
ADD install_rstudio-server.sh /tmp/install_rstudio-server.sh
RUN sh /tmp/install_rstudio-server.sh
#RUN ln -s /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.2 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0

RUN echo "nohup rstudio-server start >> rstudio.log &" >> /usr/local/bin/start_services.sh
RUN echo "nohup rstudio-server stop >> rstudio.log &" >> /usr/local/bin/stop_services.sh
#
#ADD installR-Spatial.r /tmp/installR-Spatial.r
#RUN Rscript /tmp/installR-Spatial.r
# pkg built on 20th Aug. 2016

RUN wget --progress=dot -P /tmp/ http://epinux.com/debs/R/rpackages_0.1.0_amd64.deb
RUN dpkg -i /tmp/rpackages_0.1.0_amd64.deb

ADD rpostgis.r /tmp/rpostgis.r
RUN Rscript /tmp/rpostgis.r

EXPOSE 8787

RUN rm -rf /tmp/*

USER epinux