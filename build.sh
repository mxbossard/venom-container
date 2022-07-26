#! /bin/sh
scriptDir=$( readlink -f $( dirname $0 ) )

VERSION=${1:-1.0.1}

cd $scriptDir
docker build -t venom:$VERSION --build-arg=VERSION .

