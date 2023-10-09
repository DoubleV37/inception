FROM alpine:3.18.2

RUN apk --no-cache add wget

RUN wget  https://github.com/portainer/portainer/releases/download/2.19.1/portainer-2.19.1-linux-amd64.tar.gz \
    && tar -xzf portainer-2.19.1-linux-amd64.tar.gz \
    && mv portainer /usr/local/bin/portainer

RUN chmod +x /usr/local/bin/portainer

WORKDIR /usr/local/bin/portainer

EXPOSE 9000

CMD ["./portainer"]
