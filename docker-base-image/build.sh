#!/bin/bash -e

set -x

# credit: https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

version=$1

docker build -t curiosinauts/docker-base-image:${version} .

docker push curiosinauts/docker-base-image:${version}
