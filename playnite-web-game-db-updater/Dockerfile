FROM node:20-alpine3.19
LABEL org.opencontainers.image.source https://github.com/andrew-codes/playnite-web

WORKDIR /opt/playnite-web-game-db-updater
COPY ../.modules/playnite-web/apps/game-db-updater/_packaged/ .

COPY ./run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
