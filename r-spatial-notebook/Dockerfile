# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/gis-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends gdebi
# Calls R script to do install with feedback to stdout
ADD install_rstudio-server.sh /tmp/install_rstudio-server.sh
RUN sh /tmp/install_rstudio-server.sh
ADD installR-Spatial.r /tmp/installR-Spatial.r
RUN Rscript /tmp/installR-Spatial.r

# R-studio-server
RUN ln -s /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.2 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0
RUN apt-get install libssl1.0.0

EXPOSE 8787

USER epinux
