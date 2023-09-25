#!/bin/sh

# Démarrer le serveur MariaDB
mysqld --user=mysql &

# Attendre que le serveur MariaDB démarre complètement
while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

# Exécutez le script SQL d'initialisation
mysql_install_db
mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /docker-entrypoint-initdb.d/init-db.sql

# Arrêtez MariaDB proprement
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Démarrer MariaDB normalement
exec mysqld_safe --user=mysql --socket= --port=3306