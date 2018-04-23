FROM epinux/base-extended-notebook

MAINTAINER Massimo Di Stefano  <epiesasha@me.com>

USER root

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y software-properties-common

RUN apt-add-repository --remove ppa:grass/grass-stable
RUN apt-add-repository --remove ppa:ubuntugis/ubuntugis-unstable

#RUN add-apt-repository ppa:grass/grass-stable
#RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable

RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    grass-core gdal-bin python3-gdal python3-pyproj python3-scipy # grass-dev build-essential


# script for xvfb-run.  all docker commands will effectively run under this via the entrypoint
RUN printf "#\041/bin/sh \n rm -f /tmp/.X99-lock && xvfb-run -s '-screen 0 1600x1200x16' \$@" >> /usr/local/bin/xvfbrun.sh && \
    chmod +x /usr/local/bin/xvfbrun.sh

# move this in the extension image
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y git curl libgdal-dev gdal-bin

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install jupyter-leaflet

RUN pip3 install ipyleaflet
RUN pip3 install spectral
RUN jupyter nbextension enable --py ipyleaflet --sys-prefix
RUN pip3 install ipyearth
RUN jupyter nbextension enable --py --sys-prefix ipyearth
RUN pip3 install tqdm
RUN apt-get install -y g++
RUN pip3 install rasterio


USER epinux
RUN jupyter nbextension enable --py widgetsnbextension

ENV PATH /usr/lib/grass74/bin:/usr/lib/grass74/scripts:/home/epinux/.grass7/addons/bin:/home/epinux/.grass7/addons/scripts:$PATH
ENV GRASS_PNG_AUTO_WRITE TRUE
ENV GRASS_PNG_COMPRESSION 9
ENV GRASS_TRANSPARENT TRUE
ENV GRASS_TRUECOLOR TRUE
ENV GISBASE /usr/lib/grass74
ENV GISDBASE /home/epinux/grassdata
ENV GISRC /home/epinux/.grass7/rc
ENV LD_LIBRARY_PATH /usr/lib/grass74/lib/
ENV GRASS_ADDON_BASE /home/epinux/.grass7/addons
ENV PYTHONPATH /usr/lib/grass74/etc/python:$PYTHONPATH
ENV GRASSBIN /usr/bin/grass74
RUN mkdir /home/epinux/.grass7
#ADD GRASS/rc /home/epinux/.grass7/rc
ADD GRASS /home/epinux/.grass7

USER root
RUN apt-get -y install unzip python3-matplotlib
RUN pip3 install git+https://github.com/zarch/grass-session.git
RUN chmod a+x /usr/lib/grass74/bin && chmod a+x /usr/lib/grass74/bin/r.out.png
RUN chown -R epinux /home/epinux
RUN updatedb

USER epinux
