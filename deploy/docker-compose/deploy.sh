#!/bin/bash

DIR=$( cd "$(dirname "$0")" || exit; pwd -P )
ROOT_DIR=$DIR/../../

pushd "$ROOT_DIR" || exit
echo "Building Simulator..."
if [[ "$(docker images -q xmidt/simulator:latest 2> /dev/null)" == "" ]]; then
  docker build -t xmidt/simulator:latest $ROOT_DIR/simulator
fi
popd

echo "Running services..."
CONSUL_VERSION=${CONSUL_VERSION:-1.12.6} \
CADUCEUS_VERSION=${CADUCEUS_VERSION:-latest-amd64} \
ARGUS_VERSION=${ARGUS_VERSION:-latest-amd64} \
TR1D1UM_VERSION=${TR1D1UM_VERSION:-latest-amd64} \
SCYTALE_VERSION=${SCYTALE_VERSION:-latest-amd64} \
PETASOS_VERSION=${PETASOS_VERSION:-latest} \
TALARIA_VERSION=${TALARIA_VERSION:-latest} \
THEMIS_VERSION=${THEMIS_VERSION:-latest} \
SIMULATOR_VERSION=${SIMULATOR_VERSION:-latest} \
docker compose -f $ROOT_DIR/deploy/docker-compose/docker-compose.yml up -d $@
if [[ $? -ne 0 ]]; then
  exit 1
fi