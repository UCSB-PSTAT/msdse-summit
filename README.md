# Base Notebooks for PSTAT Courses

This repository was tested with Ubuntu 18.04 only.

## Docker images

Docker Hub: [https://cloud.docker.com/u/ucsb/repository/docker/ucsb/base-notebooks](https://cloud.docker.com/u/ucsb/repository/docker/ucsb/base-notebooks)

There are three variants:

* **`rstudio`**: [Jupyter Project's r-notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-r-notebook) with following additions:
    * [`rstudio`](https://www.rstudio.com/products/rstudio/download/preview/)
    * [`yadm`](https://yadm.io/)
    * [`nbgitpuller`](https://github.com/jupyterhub/nbgitpuller) ([create puller link](https://jupyterhub.github.io/nbgitpuller/link))
    * [`jupyter-server-proxy`](https://github.com/jupyterhub/jupyter-server-proxy)
    * Modified [`jupyter-rsession-proxy`](https://github.com/ucsb-pstat/jupyter-rsession-proxy)
    * [`jupyterlab-server-proxy`](https://github.com/jupyterhub/jupyter-server-proxy/tree/master/jupyterlab-server-proxy)

* **`scipy`** : [Jupyter Project's scipy-notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook) with following additions:
    * [`yadm`](https://yadm.io/)
    * [`nbgitpuller`](https://github.com/jupyterhub/nbgitpuller) ([create puller link](https://jupyterhub.github.io/nbgitpuller/link))

* **`scipy-rstudio`**: a combination of `scipy` and `rstudio`

## Docker-compose Instructions

### Minimal instructions 

- To setup the encryption keys and notebook password, execute the following from terminal:
    ```
    ./setup.sh
    ```
    This script creates `keys/mycert.pem` and `keys/mykey.key`. Also, it stores a hashed password in `.env` file.
- To launch the `default` notebook, execute
    ```
    docker-compose up
    ```
- Open a browser window and go to `https://host_ip_address:8888`. If on a local machine, `https://127.0.0.1:8888`.

### Default Settings and Customizations

- A directory named `home` is mounted as the working directory inside the Jupyter notebook
- Default port is 8888, but it can be changed with:
    ```
    PORT=8887 docker-compose up
    ```
- Default `[IMAGE]:[TAG]` is `ucsb/scipy-rstudio-notebook:latest`, but it can be changed with:
    ```
    IMAGE=ultimate TAG=v1.2 docker-compose up -d
    ```
    This setting would look for `ultimate/Dockerfile` to build the image `ucsb/ultimate:v1.2` if it does not exist.

### Starting up at reboot

- Add `@reboot (cd /path/to/dir && docker-compose up -d)` to `crontab`: i.e., `crontab -e`
