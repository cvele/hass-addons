FROM ghcr.io/hassio-addons/base:16.3.6

# Install necessary packages
RUN apk add --no-cache miniflux miniflux-openrc miniflux-doc postgresql postgresql-contrib

# Expose Miniflux port
EXPOSE 8080

# Start Miniflux using environment variables
CMD ["miniflux"]
