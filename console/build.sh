#!/bin/bash -e

set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

version=0.1.0

docker build --build-arg CONSOLE_VERSION=${version} -t curiosinauts/console:${version} .

docker rm -f console || true

docker run -d --name console -p 3000:3000      \
curiosinauts/console:${version}                \
sleep 10000000000000000

docker exec -it console /bin/zsh

docker push curiosinauts/console:${version}
