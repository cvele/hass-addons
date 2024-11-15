#!/usr/bin/with-contenv bash

echo "Starting Miniflux service..."

cat <<EOF > /etc/miniflux.conf
LOG_DATE_TIME=yes
LISTEN_ADDR=0.0.0.0:8080
DATABASE_URL=${DATABASE_URL}
RUN_MIGRATIONS=${RUN_MIGRATIONS:-0}
EOF

exec miniflux -c /etc/miniflux.conf
