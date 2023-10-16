FROM alpine:3.17

RUN apk update && apk upgrade && apk add wget php81 php81-session php81-mysqli
RUN mkdir -p /var/www/
RUN wget https://www.adminer.org/latest-mysql.php -O /var/www/index.php

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/"]

