#!/bin/sh

if ! getent group www >/dev/null 2>&1; then
    addgroup -S www
fi

if ! getent passwd www >/dev/null 2>&1; then
    adduser -SDHG www www
fi

if [ ! -f /var/www/html/wp-config.php ]; then
	wp-cli.phar core download --path=/var/www/html
	sleep 5
	wp-cli.phar config create --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --skip-check
fi

wp-cli.phar config set --path=/var/www/html WP_SITEURL $WORDPRESS_URL

if ! wp-cli.phar core is-installed --path=/var/www/html --allow-root; then
	wp-cli.phar core install --path=/var/www/html --url=$WORDPRESS_URL --title=Example --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email
fi

chown -R www:www /var/www

chmod 777 /var/www

exec php-fpm81 -FOR
