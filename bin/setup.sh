#!/bin/sh

# set -x

DOCKER_NET=mw-net

# -----------------------------------------------------------------------------

echo
echo "Copy the .env template and then adjust ports as required"

if [ ! -e .env ] ; then
    echo "Creating local .env file"
    cp env.template .env
else
    echo "local .env file already exists"
    cat .env
fi

# -----------------------------------------------------------------------------

echo
echo "Ensure that the docker network -  ${DOCKER_NET} - exists"

RC=`docker network list  | grep ${DOCKER_NET} | wc -l`

if [ ${RC} -eq 0 ] ; then
    echo "Creating docker network  ${DOCKER_NET}"
    docker network create  ${DOCKER_NET}
else
    echo "Docker network - ${DOCKER_NET} - already exists"
fi

# -----------------------------------------------------------------------------

echo
echo "Ensure that db and images sub-directories exist"

if [ ! -d db ] ; then
    echo "Creating db directory"
    mkdir db
else
    echo "Directory db already exists"
fi

if [ ! -d images ] ; then
    echo "Creating images directory"
    mkdir images
else
    echo "Directory images already exists"
fi

# -----------------------------------------------------------------------------

echo

