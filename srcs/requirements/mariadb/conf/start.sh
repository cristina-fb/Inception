#! /bin/sh

if [ ! -d /var/lib/mysql/wordpressdb ]
then
	service mysql start
	mysql -e "CREATE USER IF NOT EXISTS 'paco' IDENTIFIED BY 'paco';"
	mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'paco';"
	mysql -e "CREATE DATABASE IF NOT EXISTS wordpressdb;"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'paco'; FLUSH PRIVILEGES;"
	killall mysqld;
fi

mysqld
