FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add php php-cli php-phar php-gd php-fpm curl php-curl php-mysqli mysql-client
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/

COPY docker-entrypoint.sh /docker-entrypoint.sh

COPY www.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/html

EXPOSE 3306 9000

CMD ["/docker-entrypoint.sh"]

