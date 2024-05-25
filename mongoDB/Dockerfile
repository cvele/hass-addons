FROM mongo:4.4.18

LABEL org.opencontainers.image.source https://github.com/cvele/hass-addons
LABEL io.hass.name="MongoDB"
LABEL io.hass.description="A MongoDB addon for Home Assistant"
LABEL io.hass.arch="amd64|aarch64"
LABEL io.hass.type="addon"
LABEL io.hass.version="4.4.18"
RUN mkdir -p /data/db /var/log/mongodb

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates curl && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN BASHIO_VERSION="0.14.3"
RUN mkdir -p /tmp/bashio
RUN curl -f -L -s -S "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" | tar -xzf - --strip 1 -C /tmp/bashio
RUN mv /tmp/bashio/lib /usr/lib/bashio
RUN ln -s /usr/lib/bashio/bashio /usr/bin/bashio
RUN rm -rf /tmp/bashio


COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 27017

CMD [ "/run.sh" ]
