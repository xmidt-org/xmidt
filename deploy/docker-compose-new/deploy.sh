#!/bin/bash

DIR=$( cd "$(dirname "$0")" || exit; pwd -P )
ROOT_DIR=$DIR/../../

# pushd "$ROOT_DIR" || exit
# # echo "Building Simulator..."
# # if [[ "$(docker images -q xmidt/simulator:latest 2> /dev/null)" == "" ]]; then
# #   docker build -t xmidt/simulator:latest $ROOT_DIR/simulator
# # fi
# popd

echo "Running services..."
CONSUL_VERSION=${CONSUL_VERSION:-1.12.6} \
CADUCEUS_VERSION=${CADUCEUS_VERSION:-latest-amd64} \
ARGUS_VERSION=${ARGUS_VERSION:-latest-amd64} \
TR1D1UM_VERSION=${TR1D1UM_VERSION:-latest-amd64} \
SCYTALE_VERSION=${SCYTALE_VERSION:-latest-amd64} \
PETASOS_VERSION=${PETASOS_VERSION:-latest} \
TALARIA_VERSION=${TALARIA_VERSION:-latest} \
THEMIS_VERSION=${THEMIS_VERSION:-latest} \
SIMULATOR_VERSION=${SIMULATOR_VERSION:-latest-amd64} \
docker compose -f $ROOT_DIR/deploy/docker-compose-new/docker-compose.yml up -d $@
if [[ $? -ne 0 ]]; then
  exit 1
fi

# sleep 10
# AWS_ACCESS_KEY_ID=accessKey AWS_SECRET_ACCESS_KEY=secretKey aws dynamodb  --endpoint-url http://localhost:8000 describe-table --table-name gifnoc --region us-east-2 --output text > /dev/null 2> /dev/null
# if [[ $? -ne 0 ]]; then
#   AWS_ACCESS_KEY_ID=accessKey AWS_SECRET_ACCESS_KEY=secretKey aws dynamodb  --endpoint-url http://localhost:8000 create-table \
#       --table-name gifnoc \
#       --attribute-definitions \
#           AttributeName=bucket,AttributeType=S \
#           AttributeName=expires,AttributeType=N \
#           AttributeName=id,AttributeType=S \
#       --key-schema \
#           AttributeName=bucket,KeyType=HASH \
#           AttributeName=id,KeyType=RANGE \
#     --global-secondary-indexes \
#         "[{\"IndexName\": \"Expires-index\",\"KeySchema\":[{\"AttributeName\":\"bucket\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"expires\",\"KeyType\":\"RANGE\"}], \
#         \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}]" \
#       --provisioned-throughput \
#           ReadCapacityUnits=10,WriteCapacityUnits=5 \
#       --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES \
#       --region us-east-2 \
#       --output text

#   AWS_ACCESS_KEY_ID=accessKey AWS_SECRET_ACCESS_KEY=secretKey aws dynamodb \
#     --endpoint-url http://localhost:8000 --region us-east-2 update-time-to-live \
#     --table-name gifnoc --time-to-live-specification "Enabled=true, AttributeName=expires" \
#     --output text
# fi
