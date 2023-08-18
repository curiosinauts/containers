#!/bin/bash

container_name=$1

version=$2

docker run --rm -d --name ${container_name}         \
-p 8080:9991                                        \
-e VSCODE_USERNAME="test"                           \
-e VSCODE_PASSWORD="test"                           \
-e VSCODE_HOST="localhost:8080"                     \
curiosinauts/${container_name}:${version}

echo -e "go here http://localhost:8080/"
