FROM debian:buster

COPY conf/start.sh .

RUN apt-get update; \
	apt-get install -y nginx;\
	apt-get install -y openssl;\
	apt-get install gettext-base;\
	chmod 755 ./start.sh;

COPY conf/default.conf.template /etc/nginx/conf.d/

CMD ["./start.sh"]
