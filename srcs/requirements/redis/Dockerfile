FROM alpine:3.17

RUN apk update && apk upgrade && apk add redis php81 php81-redis

EXPOSE 6379

CMD /usr/bin/redis-server --protected-mode no
