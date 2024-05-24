#!/usr/bin/env bash
set -e

source /usr/lib/bashio/bashio.sh
export MQTT_HOST=$(bashio::config 'MQTT_HOST')
export MQTT_PORT=$(bashio::config 'MQTT_PORT')
export MQTT_USERNAME=$(bashio::config 'MQTT_USERNAME')
export MQTT_PASSWORD=$(bashio::config 'MQTT_PASSWORD')
export DB_HOST=$(bashio::config 'DB_HOST')
export DB_PORT=$(bashio::config 'DB_PORT')
export DB_USERNAME=$(bashio::config 'DB_USERNAME')
export DB_PASSWORD=$(bashio::config 'DB_PASSWORD')
export DEBUG=$(bashio::config 'DEBUG')

exec node index.js
