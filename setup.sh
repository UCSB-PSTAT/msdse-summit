#!/bin/bash

[ -d home ] || mkdir home
[ -d keys ] || mkdir keys

## Self-signed certificates can be generated according to
## https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#using-ssl-for-encrypted-communication

openssl req -x509 -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout keys/mykey.key \
    -out keys/mycert.pem \
    -subj "/C=US/ST=A/L=B/O=C/OU=D/CN=F"

## The binary at ucsb.box.com (created using pyinstaller) hashes a password according to
## https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#preparing-a-hashed-password

wget -nc https://ucsb.box.com/shared/static/0g291d3aw5fpl0j7j02kyrnm3zuutaqu \
    -O hash_password && \
    chmod u+x hash_password
echo PASSWD=`./hash_password` > .env
