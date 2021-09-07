#!/bin/sh

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < create_database
mysql -u root wordpress < base.sql

rc-service mariadb stop

/usr/bin/mysqld_safe