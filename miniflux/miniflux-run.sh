#!/usr/bin/with-contenv bash
# Import Bashio
echo "Starting Miniflux service..."

# Create the Miniflux configuration file
cat <<EOF > /etc/miniflux.conf
LOG_DATE_TIME=yes
LISTEN_ADDR=0.0.0.0:8080
DATABASE_URL=$(bashio::config 'DATABASE_URL')
RUN_MIGRATIONS=$(bashio::config 'RUN_MIGRATIONS')
ADMIN_PASSWORD=$(bashio::config 'ADMIN_PASSWORD')
ADMIN_USERNAME=$(bashio::config 'ADMIN_USERNAME')
EOF

# Log the generated configuration for debugging
bashio::log.info "Generated Miniflux configuration:"
cat /etc/miniflux.conf

# Start Miniflux
exec miniflux -c /etc/miniflux.conf
