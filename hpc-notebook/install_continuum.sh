#!/usr/bin/env bash

git clone https://github.com/numba/llvmlite
cd llvmlite
python3 setup.py install
cd ..
git clone https://github.com/numba/numba
cd numba
python3 setup.py install

pip3 install --default-timeout=100 -U dask
pip3 install --default-timeout=100 -U partd
pip3 install --default-timeout=100 -U distributed
pip3 install --default-timeout=100 -U feather-format
pip3 install --default-timeout=100 -U xarray
pip3 install --default-timeout=100 -U datashape
pip3 install --default-timeout=100 -U odo
pip3 install --default-timeout=100 -U pillow
pip3 install --default-timeout=100 -U ipympl
pip3 install --default-timeout=100 -U castra