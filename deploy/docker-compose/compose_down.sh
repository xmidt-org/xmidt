 echo "Stopping services & removing containers..."
 CADUCEUS_VERSION=${CADUCEUS_VERSION:-latest} \
 ARGUS_VERSION=${ARGUS_VERSION:-latest} \
 TR1D1UM_VERSION=${TR1D1UM_VERSION:-latest} \
 SCYTALE_VERSION=${SCYTALE_VERSION:-latest} \
 PETASOS_VERSION=${PETASOS_VERSION:-latest} \
 TALARIA_VERSION=${TALARIA_VERSION:-latest} \
 THEMIS_VERSION=${THEMIS_VERSION:-latest} \
 SIMULATOR_VERSION=${SIMULATOR_VERSION:-latest} \
docker compose down --remove-orphans
