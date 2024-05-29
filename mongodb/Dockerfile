FROM mongo:4.4.8

ENV BASHIO_VERSION="0.16.2"
ADD https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz /tmp/v${BASHIO_VERSION}.tar.gz
RUN mkdir -p /tmp/bashio && \
    tar -xzf /tmp/v${BASHIO_VERSION}.tar.gz --strip 1 -C /tmp/bashio && \
    mv /tmp/bashio/lib /usr/lib/bashio && \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio && \
    rm -rf /tmp/bashio /tmp/v${BASHIO_VERSION}.tar.gz

EXPOSE 27017

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]

COPY docker-entrypoint.sh /
RUN chmod a+x docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
