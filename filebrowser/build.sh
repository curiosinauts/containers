#!/bin/bash -e

set -x

# credit: https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

version=1.0.0

docker build -t curiosinauts/filebrowser:${version} .

docker rm -f filebrowser || true

docker run --name filebrowser -p 8080:8080  \
-e ADMIN_PASSWORD="12345678"                \
-e ROOT_DIR="/home/debian"                  \
curiosinauts/filebrowser:${version}  

# docker push curiosinauts/docker-base-image:${version}
