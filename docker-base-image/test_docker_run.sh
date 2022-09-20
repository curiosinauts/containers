#!/bin/bash

container_name=$1

version=$2

docker run --rm -d --name ${container_name}         \
curiosinauts/${container_name}:${version}

echo -e "docker base image has no endpoint"