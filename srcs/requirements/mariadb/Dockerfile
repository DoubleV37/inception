FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add mariadb mariadb-client mariadb-server-utils

#RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN mkdir /docker-entrypoint-initdb.d

COPY init_db.sql /docker-entrypoint-initdb.d/
COPY my.cnf /etc/my.cnf.d/
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3306

ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

#ENTRYPOINT ["mysqld", "--user=mysql"]
CMD ["/docker-entrypoint.sh"]
