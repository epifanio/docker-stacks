FROM epinux/db-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nano \
    netcdf-bin \
    grass-core \
    gdal-bin \
    mapserver-bin \
    dans-gdal-scripts \
    python-gdal \
    python3-gdal \
    libgdal20-2.1.0-grass \
    librasterlite2-1 \
    libspatialite7 \
    spatialite-bin \
    python-mapscript \
    cgi-mapserver \
    shapelib \
    gpx2shp \
    gpsbabel \
    ossim-core


# script for xvfb-run.  all docker commands will effectively run under this via the entrypoint
RUN printf "#\041/bin/sh \n rm -f /tmp/.X99-lock && xvfb-run -s '-screen 0 1600x1200x16' \$@" >> /usr/local/bin/xvfbrun.sh && \
    chmod +x /usr/local/bin/xvfbrun.sh


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fiona \
    python-fiona \
    python-rasterio \
    python-geopandas \
    python-shapely \
    python-geopy \
    python-owslib \
    python-geojson \
    python-netcdf4 \
    python-grib

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-fiona \
    python3-rasterio \
    rasterio \
    python3-geopandas \
    python3-shapely \
    python3-geopy \
    python3-owslib \
    python3-geojson \
    python3-netcdf4 \
    python3-grib


RUN pip3 install xray \
    pygeoif \
    pyepsg \
    geocoder \
    pygeoif \
    czml

RUN pip2 install xray \
    pygeoif \
    pyepsg \
    geocoder \
    pygeoif \
    czml


RUN pip install ipyleaflet && pip3 install ipyleaflet
RUN jupyter nbextension enable --py ipyleaflet

RUN pip3 install -U pyproj && pip install -U pyproj



USER epinux

ENV PATH /usr/lib/grass70/bin:$PATH
ENV GRASS_PNG_AUTO_WRITE TRUE
ENV GRASS_PNG_COMPRESSION 9
ENV GRASS_TRANSPARENT TRUE
ENV GRASS_TRUECOLOR TRUE
ENV GISBASE /usr/lib/grass70
ENV GISDBASE /home/epinux/work/grassdata
ENV GISRC /home/epinux/.grass7/rc
ENV LD_LIBRARY_PATH /usr/lib/grass70/lib/

RUN mkdir /home/epinux/.grass7
ADD GRASS/rc /home/epinux/.grass7/rc

RUN wget http://epinux.com/grassdata.zip && \
unzip grassdata.zip && \
rm -rf grassdata.zip


USER root
RUN chown -R epinux /home/epinux
RUN updatedb

USER epinux
