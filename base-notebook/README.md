![docker pulls](https://img.shields.io/docker/pulls/jupyter/base-notebook.svg) ![docker stars](https://img.shields.io/docker/stars/jupyter/base-notebook.svg)

# Base Jupyter Notebook Stack

## This fork differs from the original repository [jupyter/docker-stacks](https://github.com/jupyter/docker-stacks) for:
* upgrade the OS to debian SID
* replace the conda python/R environment with the system python (2/3) and R
* Additional kernels (C, Octave, Bash)
* Additional noteb ook js extensions
* Additional software libraries for geospatial data analysys (GDAL, GRASS, OSIM, PostGIS) and other geo-oriented python and R librries


Small base image for defining your own stack

## What it Gives You

* Minimally-functional Jupyter Notebook 4.2.x (e.g., no pandoc for document conversion)
* Kernel based on Python 3.x
* No preinstalled scientific computing packages
* Privileged user `epinux` (uid=1000, configurable, see options) in group `users` (gid=100) with ownership over `/home/epinux` 
* [tini](https://github.com/krallin/tini) as the container entrypoint and [start-notebook.sh](./start-notebook.sh) as the default command
* A [start-singleuser.sh](../minimal-notebook/start-singleuser.sh) script for use as an alternate command that runs a single-user instance of the Notebook server, as required by [JupyterHub](#JupyterHub)
* Options for HTTPS, password auth, and passwordless `sudo`

## Basic Use

The following command starts a container with the Notebook server listening for HTTP connections on port 8888 without authentication configured.

```
docker run -d -p 8888:8888 epinux/base-notebook
```

## Notebook Options

You can pass [Jupyter command line options](http://jupyter.readthedocs.org/en/latest/config.html#command-line-arguments) through the [`start-notebook.sh` command](https://github.com/jupyter/docker-stacks/blob/master/minimal-notebook/start-notebook.sh#L15) when launching the container. For example, to set the base URL of the notebook server you might do the following:

```
docker run -d -p 8888:8888 epinux/minimal-notebook start-notebook.sh --NotebookApp.base_url=/some/path
```

You can sidestep the `start-notebook.sh` script entirely by specifying a command other than `start-notebook.sh`. If you do, the `NB_UID` and `GRANT_SUDO` features documented below will not work. See the Docker Options section for details.

## Docker Options

You may customize the execution of the Docker container and the Notebook server it contains with the following optional arguments.

* `-e PASSWORD="YOURPASS"` - Configures Jupyter Notebook to require the given password. Should be conbined with `USE_HTTPS` on untrusted networks.
* `-e USE_HTTPS=yes` - Configures Jupyter Notebook to accept encrypted HTTPS connections. If a `pem` file containing a SSL certificate and key is not provided (see below), the container will generate a self-signed certificate for you.
* `-e NB_UID=1000` - Specify the uid of the `epinux` user. Useful to mount host volumes with specific file ownership. For this option to take effect, you must run the container with `--user root`. (The `start-notebook.sh` script will `su epinux` after adjusting the user id.)
* `-e GRANT_SUDO=yes` - Gives the `epinux` user passwordless `sudo` capability. Useful for installing OS packages. For this option to take effect, you must run the container with `--user root`. (The `start-notebook.sh` script will `su epinux` after adding `epinux` to sudoers.) **You should only enable `sudo` if you trust the user or if the container is running on an isolated host.**
* `-v /some/host/folder/for/work:/home/epinux/work` - Host mounts the default working directory on the host to preserve work even when the container is destroyed and recreated (e.g., during an upgrade).
* `-v /some/host/folder/for/server.pem:/home/epinux/.local/share/jupyter/notebook.pem` - Mounts a SSL certificate plus key for `USE_HTTPS`. Useful if you have a real certificate for the domain under which you are running the Notebook server.

## Python Environment

The default Python 3.x shipped with debian SID. The commands `ipython`, `python`, `pip`, `easy_install` (among others) are available in this environment.


## JupyterHub

[JupyterHub](https://jupyterhub.readthedocs.org) requires a single-user instance of the Jupyter Notebook server per user.   To use this stack with JupyterHub and [DockerSpawner](https://github.com/jupyter/dockerspawner), you must specify the container image name and override the default container run command in your `jupyterhub_config.py`:

```python
# Spawn user containers from this image
c.DockerSpawner.container_image = 'jupyter/minimal-notebook'

# Have the Spawner override the Docker run command
c.DockerSpawner.extra_create_kwargs.update({
	'command': '/usr/local/bin/start-singleuser.sh'
})
```
