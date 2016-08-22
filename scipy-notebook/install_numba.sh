#!/usr/bin/env bash

git clone https://github.com/numba/llvmlite
cd llvmlite
python3 setup.py install
cd ..
git clone https://github.com/numba/numba
cd numba
python3 setup.py install
cd ../
rm -rf numba
rm -rf llvmlite


