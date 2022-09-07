#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

username=$1 

# service=vscode-${username}

set -x

# version=$(uuid)

platformctl before docker-build ${username} none 

# docker build --no-cache -t curiosinauts/vscode-ext:${version} .

# docker push docker-registry.curiosityworks.org/curiosinauts/${service}:${version}

kubectl apply -f ./vscode-${username}-secrets.yml

kubectl apply -f ./vscode-${username}.yml

platformctl after docker-build ${username}

docker images | grep vscode | awk '{ print $3 }' | xargs docker rmi