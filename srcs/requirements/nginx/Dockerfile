FROM debian:buster

COPY conf/start.sh .

RUN apt-get update; \
	apt-get install -y nginx;\
	apt-get install -y openssl;\
	openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=crisfern.42.fr/C=EU/L=Madrid" -keyout /etc/ssl/rootCA.key -out etc/ssl/rootCA.crt;\
	apt-get install gettext-base;\
	chmod 755 ./start.sh;

COPY conf/default.conf.template /etc/nginx/conf.d/

CMD ["./start.sh"]
