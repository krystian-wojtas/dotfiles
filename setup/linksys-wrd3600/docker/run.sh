#!/bin/bash

# Script is to run prepared previously docker image with custom user command
# or by default build openwrt if not any specific command is passed

# Command to run in docker container could be passed as script arguments
command=("$@")

# If command to run is not passed, then run build.sh script as default one
[ -z "$command" ] && command='./build.sh'

# Run docker container
docker run \
    `# Set user and group id inside container to match host ones` \
    --env LOCAL_UID="$(id -u)" \
    --env LOCAL_GID="$(id -g)" \
    \
    `# Mount current repository from host into docker` \
    --volume "$(pwd)/../:$(pwd)/../" \
    \
    `# Set working directory inside container as this repository` \
    --workdir "$(pwd)/../" \
    \
    `# Allow to work on container interacively` \
    --interactive \
    --tty \
    \
    `# Remove container after use` \
    --rm \
    \
    `# Docker image have to build firstly` \
    ubuntu:18.04-openwrt \
    \
    `# Run command` \
    "${command[@]}"
