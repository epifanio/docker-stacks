# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/scipy-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    julia \
    libnettle*

# Install IJulia packages as epinux and then move the kernelspec out
# to the system share location. Avoids problems with runtime UID change not
# taking effect properly on the .local folder in the epinux home dir.
RUN chown -R epinux /home/epinux/.local/

USER epinux

RUN julia -e 'Pkg.add("IJulia")' && julia -e 'Pkg.add("Gadfly")' && julia -e 'Pkg.add("RDatasets")' \
    && julia -F -e 'Pkg.add("HDF5")' && julia -e 'Pkg.add("DataFrames")' && julia -e 'Pkg.add("QuantEcon")'
USER root

RUN mv /home/$NB_USER/.local/share/jupyter/kernels/* /usr/local/share/jupyter/kernels/ && \
    chmod -R go+rx /usr/local/share/jupyter # && \
    # rm -rf /home/$NB_USER/.local/share

USER epinux