#!/bin/sh

#  install_nvm.sh
#  
#
#  Created by Massimo Di Stefano on 10/24/17.
#
/bin/bash /tmp/install_nvm.sh
ls $HOME/.nvm
source /home/epinux/.bashrc
nvm install 8.0.0
nvm use 8.0.0
nvm alias default 8.0.0
