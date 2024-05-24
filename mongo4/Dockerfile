FROM mongo:4.4.18
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=example
RUN mkdir -p /data/db
EXPOSE 27017
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
