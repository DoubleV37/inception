#!/bin/sh

addgroup -S $FTP_USER
adduser -S $FTP_USER -G $FTP_USER -h /var/www
passwd -d $FTP_USER

chown -R $FTP_USER:$FTP_USER /var/www
chmod -R 777 /var/www

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
