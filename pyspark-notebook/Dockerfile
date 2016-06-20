# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/db-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# Spark dependencies
ENV APACHE_SPARK_VERSION 2.0.0
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN cd /tmp && \
        wget -q http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-preview-bin-hadoop2.7.tgz && \
        echo "395a4892c5787072bceb5a5a61d9cd813dd12d3c98c6a920978fc438bbdf44de *spark-${APACHE_SPARK_VERSION}-preview-bin-hadoop2.7.tgz" | sha256sum -c - && \
        tar xzf spark-${APACHE_SPARK_VERSION}-preview-bin-hadoop2.7.tgz -C /usr/local && \
        rm spark-${APACHE_SPARK_VERSION}-preview-bin-hadoop2.7.tgz
RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-preview-bin-hadoop2.7 spark

# Mesos dependencies
# Currently, Mesos is not available from Debian Jessie.
# So, we are installing it from Debian Wheezy. Once it
# becomes available for Debian Jessie. We should switch
# over to using that instead.
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    DISTRO=debian && \
    CODENAME=jessie-unstable && \
    echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-get -y update && \
    apt-get --no-install-recommends -y --force-yes install mesos && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Spark and Mesos config
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.1-src.zip
ENV MESOS_NATIVE_LIBRARY /usr/local/lib/libmesos.so
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info

# Install Python 3 packages
RUN pip3 install jq

# Set PYSPARK_HOME in the python2 spec
RUN jq --arg v "/usr/bin/python" \
        '.["env"]["PYSPARK_PYTHON"]=$v' \
        /usr/local/share/jupyter/kernels/python2/kernel.json > /tmp/kernel.json && \
        mv /tmp/kernel.json /usr/local/share/jupyter/kernels/python2/kernel.json

USER epinux


