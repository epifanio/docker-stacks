# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/pyspark-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# RSpark config
ENV R_LIBS_USER $SPARK_HOME/R/lib

# Apache Toree kernel
RUN pip --no-cache-dir install toree
RUN jupyter toree install
