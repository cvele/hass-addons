FROM mongo:4.4.8


ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update || true && \
	apt-get install -y --no-install-recommends curl=7.68.0-1ubuntu2.22 && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ENV BASHIO_VERSION="0.16.2"
ADD https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz /tmp/v${BASHIO_VERSION}.tar.gz
RUN mkdir -p /tmp/bashio && \
    tar -xzf /tmp/v${BASHIO_VERSION}.tar.gz --strip 1 -C /tmp/bashio && \
    mv /tmp/bashio/lib /usr/lib/bashio && \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio && \
    rm -rf /tmp/bashio /tmp/v${BASHIO_VERSION}.tar.gz

EXPOSE 27017

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
