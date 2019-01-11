#!/bin/sh

docker run \
    -e LOCAL_UID="$(id -u)" -e LOCAL_GID="$(id -g)" \
    -v "$(pwd)/../:$(pwd)/../" -w "$(pwd)/../" \
    --rm -it ubuntu:18.04-openwrt "$@"
