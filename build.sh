#!/bin/bash -e

# set -x

# credit: https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

container_name=$1

version=$2

echo
echo docker build
docker build -t curiosinauts/${container_name}:${version} ${container_name} 

echo
echo terminating existing docker instance
docker rm -f ${container_name} 2> /dev/null || true

echo
echo starting test docker instance
${container_name}/test_docker_run.sh ${container_name} ${version}

echo
echo docker exec-ing to check out the file system
docker exec -it ${container_name} /bin/zsh

echo
read -p "Push curiosinauts/${container_name}:${version} (y/n) [y]:" push
push=${push:-y}

if [ "${push}" == "y" ]; then
    echo
    echo pusing to docker hub
    docker push curiosinauts/${container_name}:${version}
fi

echo
echo terminating the new docker instance
docker rm -f ${container_name} 2> /dev/null || true
