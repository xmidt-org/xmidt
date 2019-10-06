#!/bin/bash

DIR=$( cd $(dirname $0) ; pwd -P )
ROOT_DIR=$DIR/../../

pushd $ROOT_DIR
echo "Building Simulator..."
docker build -t simulator:local $ROOT_DIR/simulator
popd

echo "Building goaws..."
git clone git@github.com:kcajmagic/goaws.git /tmp/goaws
pushd /tmp/goaws
git checkout adding_http_support
docker build -t goaws:local .
popd

echo "Running services..."
CADUCEUS_VERSION=${CADUCEUS_VERSION:-0.2.1} \
TR1D1UM_VERSION=${TR1D1UM_VERSION:-0.1.5} \
SCYTALE_VERSION=${SCYTALE_VERSION:-0.1.5} \
PETASOS_VERSION=${PETASOS_VERSION:-0.1.4} \
TALARIA_VERSION=${TALARIA_VERSION:-0.1.3} \
SIMULATOR_VERSION=${SIMULATOR_VERSION:-local} \
docker-compose -f deploy/docker-compose/docker-compose.yml up -d $@

