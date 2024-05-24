#!/usr/bin/env bash
set -e

# Source the bashio library
source /usr/lib/bashio/bashio.sh

# Export environment variables from the Home Assistant add-on options
export LOG_LEVEL=$(bashio::config 'log_level')
export AUTH=$(bashio::config 'auth')
export USERNAME=$(bashio::config 'username')
export PASSWORD=$(bashio::config 'password')

# Set MongoDB environment variables
export MONGO_INITDB_ROOT_USERNAME=$USERNAME
export MONGO_INITDB_ROOT_PASSWORD=$PASSWORD

# Create the MongoDB configuration file
cat <<EOF > /etc/mongod.conf
systemLog:
  destination: file
  path: /var/log/mongodb/mongod.log
  logAppend: true
  logLevel: ${LOG_LEVEL}

storage:
  dbPath: /data/db
  journal:
    enabled: true

net:
  bindIp: 0.0.0.0
  port: 27017

security:
  authorization: $(if [ "$AUTH" = "true" ]; then echo "enabled"; else echo "disabled"; fi)
EOF

# Start MongoDB
exec mongod --config /etc/mongod.conf
