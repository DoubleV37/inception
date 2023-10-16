FROM alpine:3.17

RUN apk update && apk upgrade && apk add mariadb mariadb-client mariadb-server-utils

COPY --chmod=777 docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3306

CMD ["/docker-entrypoint.sh"]
