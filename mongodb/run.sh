#!/usr/bin/env bash
set -e

# Source bashio
if ! source /usr/lib/bashio/bashio.sh; then
    echo "Failed to source bashio. Exiting."
    exit 1
fi

# Retrieve configuration from bashio
MONGO_INITDB_ROOT_USERNAME=$(bashio::config 'MONGO_INITDB_ROOT_USERNAME')
MONGO_INITDB_ROOT_PASSWORD=$(bashio::config 'MONGO_INITDB_ROOT_PASSWORD')

# Check if the required environment variables are set
if [ -z "${MONGO_INITDB_ROOT_USERNAME}" ] || [ -z "${MONGO_INITDB_ROOT_PASSWORD}" ]; then
    echo "MongoDB root username or password is not set. Exiting."
    exit 1
fi

# Start MongoDB
mongod
