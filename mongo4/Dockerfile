FROM mongo:4.4.18
LABEL org.opencontainers.image.source https://github.com/your-repo/hass-mongo4
RUN mkdir -p /data/db /var/log/mongodb
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 27017
CMD [ "/run.sh" ]
