#!/bin/bash

container_name=$1

version=$2

docker run --rm -d --name ${container_name}         \
-p 8080:80                                          \
curiosinauts/${container_name}:${version}

echo -e "go here http://localhost:8080/"