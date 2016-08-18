# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/gis-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

RUN rm -rf /home/epinux/grassdata/project/PERMANENT/.gislock
RUN chown -R root /home/epinux/grassdata/project

RUN apt-get update && apt-get install -yq --no-install-recommends gdebi libgdal-dev libssl1* r-cran-rgl
# Calls R script to do install with feedback to stdout
ADD install_rstudio-server.sh /tmp/install_rstudio-server.sh
RUN sh /tmp/install_rstudio-server.sh



ADD installR-Spatial.r /tmp/installR-Spatial.r
RUN Rscript /tmp/installR-Spatial.r

# R-studio-server
RUN ln -s /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.2 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0

#ADD install-rgrass7.r /tmp/install-rgrass7.r
#RUN Rscript /tmp/install-rgrass7.r

#ADD install_extrapackages.r /tmp/install_extrapackages.r
#RUN Rscript /tmp/install_extrapackages.r

RUN chown -R epinux /home/epinux/

EXPOSE 8787

USER epinux
