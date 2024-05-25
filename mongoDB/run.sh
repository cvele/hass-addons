#!/bin/bash
set -e
source /usr/lib/bashio/bashio.sh
export MONGO_INITDB_ROOT_USERNAME=$(bashio::config 'MONGO_INITDB_ROOT_USERNAME')
export MONGO_INITDB_ROOT_PASSWORD=$(bashio::config 'MONGO_INITDB_ROOT_PASSWORD')

if [ -z "$MONGO_INITDB_ROOT_USERNAME" ] || [ -z "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  echo "MongoDB root username or password is not set. Exiting."
  exit 1
fi

mongod --bind_ip_all --port 27017 --auth
