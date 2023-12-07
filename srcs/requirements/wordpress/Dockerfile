FROM debian:buster

COPY ./conf/index.php .
COPY ./conf/start.sh .

RUN apt-get update;\
	apt-get install -y php php-fpm;\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
	chmod +x wp-cli.phar;\
	mv wp-cli.phar /usr/local/bin/wp;\
	mkdir /run/php;\
	chmod 755 /start.sh;\
	sed -i 's/^listen .*$/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf;

#CMD tail -f /dev/null

CMD ["./start.sh"]
