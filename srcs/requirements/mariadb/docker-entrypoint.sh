#!/bin/sh

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then
    mysql_install_db --user=root --datadir=/var/lib/mysql
    {
        echo "FLUSH PRIVILEGES;"
        echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
        echo "USE $MYSQL_DATABASE;"
        echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
        echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
        echo "FLUSH PRIVILEGES;"
    } | mysqld --bootstrap --user=root
fi

exec mysqld_safe --user=root --port=3306