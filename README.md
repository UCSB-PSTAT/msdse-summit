**This repo has been deprecated.  Please see our updated [Jupyter](https://github.com/UCSB-PSTAT/jupyter-base) and [RStudio](https://github.com/UCSB-PSTAT/base-rstudio) container image sources instead.**

# Base Notebooks for PSTAT Courses

This repository was tested with Ubuntu 18.04.

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
