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
	wp-cli.phar config set --path=/var/www/html 'WP_SITEURL' $WORDPRESS_URL
	wp-cli.phar config set --path=/var/www/html 'WP_CACHE_KEY_SALT' $WORDPRESS_URL
	wp-cli.phar config set --path=/var/www/html 'WP_CACHE' 'true'
	wp-cli.phar config set --path=/var/www/html 'WP_REDIS_HOST' 'redis'
fi

if ! wp-cli.phar core is-installed --path=/var/www/html --allow-root; then
	wp-cli.phar core install --path=/var/www/html --url=$WORDPRESS_URL --title=Example --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email
	wp-cli.phar plugin install --path=/var/www/html redis-cache --activate
	wp-cli.phar redis --path=/var/www/html enable
fi

if ! wp-cli.phar user list --path=/var/www/html --allow-root | grep $WORDPRESS_USER; then
	wp-cli.phar user create --path=/var/www/html $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author
fi

chown -R www:www /var/www

chmod 777 /var/www

exec php-fpm81 -FOR
