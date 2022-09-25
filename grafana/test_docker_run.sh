#!/bin/bash

container_name=$1

version=$2

docker run --rm -d --name ${container_name}         \
-p 3000:3000                                        \
-e ADMIN_PASSWORD="Grafana1234$"                    \
curiosinauts/${container_name}:${version}

echo -e "go here http://localhost:3000/"
