#!/bin/bash

container_name=$1

version=$2

docker run --rm -d --name ${container_name}         \
-p 8080:8080                                        \
-e ADMIN_PASSWORD="12345678"                        \
-e ROOT_DIR="/home/debian"                          \
curiosinauts/${container_name}:${version}

echo -e "go here http://localhost:8080/"