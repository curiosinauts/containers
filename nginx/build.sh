#!/bin/bash -e

set -x

# version=$(platformctl next tag curiosinauts/sites)
version=0.1.1

docker build -t curiosinauts/sites:"${version}" .

docker push curiosinauts/sites:"${version}"

