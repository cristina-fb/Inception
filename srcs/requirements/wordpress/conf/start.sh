#! /bin/sh

if [ ! -f /var/www/html/wp-config.php ]
then
	mv post.txt ./var/www/html
	cd var/www/html
	wp core download --allow-root
	wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
	wp core install --url=$DOMAIN_NAME --title=42Chismes --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=info@wp-cli.org --skip-email --allow-root
	wp user create vieja_visillo vieja_visillo@example.com --user_pass=vieja_visillo --allow-root
	wp theme install bravada --activate --allow-root
	wp post delete 1 --allow-root
	wp post delete 2 --allow-root
	export post_cat=$(wp term create category "Rob me va a matar por hacer demasiadas pijadas en vez de entregar y ponerme a transcender" --porcelain --allow-root)
	export page_id=$(wp post create ./post.txt  --post_title='Es la hora del chisme!'  --tags_input="42, procrastinacion" --post_status=publish --post_category=$post_cat --porcelain --allow-root)
	wp option update page_on_front $page_id --allow-root
	wp option update show_on_front page --allow-root
	wp theme mod set header_image https://wallpapers.com/images/hd/cool-aesthetic-japanese-anime-city-o6nokrk4nduiinvx.jpg --allow-root
fi

php-fpm7.3 -F
