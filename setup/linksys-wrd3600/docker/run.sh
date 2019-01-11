#!/bin/sh

docker run \
    --env LOCAL_UID="$(id -u)" \
    --env LOCAL_GID="$(id -g)" \
    \
    --volume "$(pwd)/../:$(pwd)/../" \
    --workdir "$(pwd)/../" \
    \
    --interactive \
    --tty \
    --rm \
    \
    ubuntu:18.04-openwrt "$@"
