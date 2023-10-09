#!/bin/sh

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then

	mkdir -p /run/mysql
	chown -R mysql:mysql /run/mysql

	chown -R mysql:mysql /var/lib/mysql

	sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
	sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

	sed -i "s|.*skip-networking.*|skip-networking=OFF|g" /etc/mysql/my.cnf
	sed -i "s|.*skip-networking.*|skip-networking=OFF|g" /etc/my.cnf.d/mariadb-server.cnf

    mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db
    {
        echo "FLUSH PRIVILEGES;"
        echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
		echo "CREATE USER \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
        echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
        echo "FLUSH PRIVILEGES;"
    } | mysqld --bootstrap --user=mysql --datadir=/var/lib/mysql
fi

exec mysqld_safe --user=mysql --port=3306 --datadir=/var/lib/mysql --socket=
