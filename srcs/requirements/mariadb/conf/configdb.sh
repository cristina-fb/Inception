echo "CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';" > configdb.sql;
echo "GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_USER';" >> configdb.sql;
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> configdb.sql;
echo "CREATE DATABASE IF NOT EXISTS wordpress_db;" >> configdb.sql
echo "FLUSH PRIVILEGES;" >> configdb.sql;
mysql < configdb.sql;
