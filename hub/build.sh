#!/bin/bash -e

set -x

service=docker-hub

version=$(platformctl next tag curiosinauts/docker-hub)

docker build -t docker-registry.curiosityworks.org/curiosinauts/${service}:${version} .

docker push docker-registry.curiosityworks.org/curiosinauts/${service}:${version}

kubectl apply -f ./hub.yml