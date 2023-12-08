#! /bin/sh

mv index.php ./var/www/html

if [ ! -d /var/www/html/wp-admin ]
then
	cd var/www/html
	wp core download --allow-root
	wp config create --dbname=wordpressdb --dbuser=crisfern --dbpass=crisfern --dbhost=mariadb --allow-root
	wp core install --url=crisfern.42.fr --title=paco --admin_user=crisfern --admin_password=crisfern --admin_email=info@wp-cli.org --skip-email --allow-root
fi

php-fpm7.3 -F
