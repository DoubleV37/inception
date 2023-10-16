FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache vsftpd

COPY --chmod=777 docker-entrypoint.sh /docker-entrypoint.sh
COPY --chmod=777 vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010

CMD ["/docker-entrypoint.sh"]
