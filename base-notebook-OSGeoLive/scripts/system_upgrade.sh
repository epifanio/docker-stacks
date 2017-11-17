#!/usr/bin/env bash

echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/source.list

apt-get update
apt-get install -y aptitude -o APT::Force-LoopBreak=1
aptitude safe-upgrade -y
#RUN apt-get -o APT::Force-LoopBreak=1 dist-upgrade -y

apt-get clean && apt-get update && apt-get install -yq --no-install-recommends apt-utils \
    wget \
    bzip2 \
    python3 \
    python3-dev \
    python3-pip \
    ca-certificates \
    sudo \
    locales \
    mlocate \
    libzmq3-dev \
    python3-zmq \
    python3-setuptools \
    openssh-server ruby-dev rubygems git \
    python-software-properties build-essential libssl-dev nano htop 


# grass-dev

#apt-get clean && apt-get update && \
#    apt-get install -y --no-install-recommends \
#    fonts-dejavu \
#    gfortran \
#    gcc \
#    python3-rpy2 \
#    build-essential \
#    gfortran \
#    libblas-dev \
#    liblapack-dev  \
#    libzmq3-dev \
#    python-rpy2 \
#    r-recommended \
#    libreadline6-dev \
#    libcurl4-openssl-dev \
#    gdebi \
#    libgdal-dev \
#    libssl1* r-cran-rgl



gem install gist


curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install nodejs


echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
wget --quiet https://github.com/krallin/tini/releases/download/v0.9.0/tini && \
    echo "faafbfb5b079303691a939a747d7f60591f2143164093727e870b289a44d9872 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini
