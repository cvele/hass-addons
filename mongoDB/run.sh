#!/bin/bash
set -e

BASHIO_VERSION="0.14.3"
mkdir -p /tmp/bashio
curl -sSL "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" | tar -xzf - --strip 1 -C /tmp/bashio
mv /tmp/bashio/lib /usr/lib/bashio
ln -s /usr/lib/bashio/bashio /usr/bin/bashio
rm -rf /tmp/bashio

MONGO_INITDB_ROOT_USERNAME=$(bashio::config 'MONGO_INITDB_ROOT_USERNAME')
MONGO_INITDB_ROOT_PASSWORD=$(bashio::config 'MONGO_INITDB_ROOT_PASSWORD')
MONGO_PORT=$(bashio::config 'MONGO_PORT')
MONGO_BIND_IP=$(bashio::config 'MONGO_BIND_IP')

if [ -z "$MONGO_INITDB_ROOT_USERNAME" ] || [ -z "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  echo "MongoDB root username or password is not set. Exiting."
  exit 1
fi

mongod --auth --bind_ip $MONGO_BIND_IP --port $MONGO_PORT &
mongo_admin="mongo admin -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --port $MONGO_PORT"
until $mongo_admin --eval "print(\"waited for connection\")"; do
  >&2 echo "MongoDB is unavailable - sleeping"
  sleep 1
done
tail -f /dev/null
