#!/bin/bash

VERSION_NUMBER=1.0.0
TAG_PREFIX=dockerreg.magenta.dk/
IMAGE_PATH=${TAG_PREFIX}magentadk/docker_user_mapping

docker build -t ${IMAGE_PATH}:latest .

function tag {
    docker tag ${IMAGE_PATH}:latest${RELEASE_CANDIDATE} ${IMAGE_PATH}:$1
    docker push ${IMAGE_PATH}:$1
}

IFS='.' read -ra VER <<< "${VERSION_NUMBER}"
VER_SO_FAR="${VER[0]}"
VER=("${VER[@]:1}")
tag "$VER_SO_FAR"
for i in "${VER[@]}"; do
    VER_SO_FAR=${VER_SO_FAR}.${i}
    tag "$VER_SO_FAR"
done
