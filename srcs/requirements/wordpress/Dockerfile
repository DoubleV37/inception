FROM alpine:3.17

RUN apk update && apk upgrade && apk add php81 php81-cli php81-phar php81-fpm curl php81-curl php81-mysqli mysql-client php81-tokenizer php81-mbstring php81-zip
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/

COPY --chmod=777 docker-entrypoint.sh /docker-entrypoint.sh

COPY --chmod=777 www.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/docker-entrypoint.sh"]

