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

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 27017

CMD [ "/run.sh" ]
