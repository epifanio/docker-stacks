git clone https://github.com/jupyterlab/jupyterlab-monaco /home/epinux/jupyterlab-monaco
cd  /home/epinux/jupyterlab-monaco
export NODE_OPTIONS=--max-old-space-size=4096
yarn install
yarn run build
jupyter labextension link .
cd ..
