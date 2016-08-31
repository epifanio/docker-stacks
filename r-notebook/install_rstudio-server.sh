#!/usr/bin/env bash
apt-get install gdebi-core
wget http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u2_amd64.deb
dpkg -i libssl1.0.0_1.0.1t-1+deb8u2_amd64.deb
wget https://download2.rstudio.org/rstudio-server-0.99.903-amd64.deb
gdebi -n rstudio-server-0.99.903-amd64.deb
rm -rf rstudio-server-0.99.903-amd64.deb
