# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/gis-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

RUN update && apt-get install -yq --no-install-recommends gdebi
# Calls R script to do install with feedback to stdout
ADD install_rstudio-server.sh /tmp/install_rstudio-server.sh
RUN sh /tmp/install_rstudio-server.sh
ADD installR-Spatial.r /tmp/installR-Spatial.r
RUN Rscript /tmp/installR-Spatial.r

USER epinux
