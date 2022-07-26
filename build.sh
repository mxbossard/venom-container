#! /bin/sh -e
scriptDir=$( readlink -f $( dirname $0 ) )

VERSION=${1:-1.0.1}
IMAGE_NAME=mxbossard/venom

cd $scriptDir
image=$IMAGE_NAME:$VERSION
docker build -t $image --build-arg=VERSION .
docker login
docker push $image

