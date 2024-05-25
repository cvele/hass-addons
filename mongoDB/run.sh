#!/bin/bash
set -e

MONGO_INITDB_ROOT_USERNAME=$(bashio::config 'MONGO_INITDB_ROOT_USERNAME')
MONGO_INITDB_ROOT_PASSWORD=$(bashio::config 'MONGO_INITDB_ROOT_PASSWORD')
MONGO_PORT=$(bashio::config 'MONGO_PORT')

if [ -z "$MONGO_INITDB_ROOT_USERNAME" ] || [ -z "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  echo "MongoDB root username or password is not set. Exiting."
  exit 1
fi

mongod --auth --port $MONGO_PORT &
mongo_admin="mongo admin -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --port $MONGO_PORT"
until $mongo_admin --eval "print(\"waited for connection\")"; do
  >&2 echo "MongoDB is unavailable - sleeping"
  sleep 1
done
tail -f /dev/null
