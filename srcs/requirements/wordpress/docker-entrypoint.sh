#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
	wp-cli.phar core download --allow-root
	wp-cli.phar config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
	wp-cli.phar core install --url=vviovi.42.fr --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=valentin.v3719@gmail.com
fi

if ! getent group www >/dev/null 2>&1; then
    addgroup -S www
fi

if ! getent passwd www >/dev/null 2>&1; then
    adduser -S -D -H -G www www
fi

chown -R www:www /var/www/html

exec "php-fpm81" "-FOR"
