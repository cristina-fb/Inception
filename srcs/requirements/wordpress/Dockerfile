FROM debian:buster

RUN apt-get update;\
	apt-get install -y php php-fpm;\
	apt-get install -y wordpress;

COPY ./tools/index.php /var/www/html/

CMD ./bin/sh -c "/usr/sbin/php-fpm"
