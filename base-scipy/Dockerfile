FROM jupyter/scipy-notebook:1386e2046833

USER root

RUN apt-get update && \
    apt-get install -y zip unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

USER $NB_UID
