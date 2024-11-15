FROM ghcr.io/hassio-addons/base:16.3.6

# Install necessary packages
RUN apk add --no-cache miniflux miniflux-openrc miniflux-doc postgresql postgresql-contrib

# Create s6-overlay service directory
RUN mkdir -p /etc/services.d/miniflux

# Add service script for Miniflux
COPY miniflux-run.sh /etc/services.d/miniflux/run
COPY miniflux-finish.sh /etc/services.d/miniflux/finish
RUN chmod +x /etc/services.d/miniflux/run /etc/services.d/miniflux/finish

# Expose Miniflux port
EXPOSE 8080

# Use default s6-overlay init
