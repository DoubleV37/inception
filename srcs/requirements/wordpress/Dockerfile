FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add php php-cli php-phar php-fpm curl php-curl php-mysqli mysql-client php-tokenizer php-mbstring php-zip
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/

COPY --chmod=777 docker-entrypoint.sh /docker-entrypoint.sh

COPY --chmod=777 www.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/docker-entrypoint.sh"]

