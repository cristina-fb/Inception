FROM debian:buster

COPY ./conf/post.txt .
COPY ./conf/start.sh .

RUN apt-get update;\
	apt-get install -y php php-fpm php-mysqli;\
	apt-get install -y mariadb-client;\
	apt-get install -y curl;\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
	chmod +x wp-cli.phar;\
	mv wp-cli.phar /usr/local/bin/wp;\
	mkdir /run/php;\
	chmod 755 ./start.sh ./config.sh;\
	sed -i 's/^listen .*$/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf;

CMD ["./start.sh"]
