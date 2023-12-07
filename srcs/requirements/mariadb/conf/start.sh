#! /bin/sh

if [ ! -d /var/lib/mysql/$MYSQL_DB ]
then
	service mysql start
	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_USER';"
	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
	killall mysqld;
fi

mysqld
