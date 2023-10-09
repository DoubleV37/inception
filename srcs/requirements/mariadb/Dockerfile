FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add mariadb mariadb-client mariadb-server-utils

RUN mkdir /docker-entrypoint-initdb.d

COPY --chmod=777 docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3306

CMD ["/docker-entrypoint.sh"]
