FROM debian:buster

RUN apt-get update; \
	apt-get install -y nginx;\
	apt-get install -y openssl;\
	openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=crisfern.42.fr/C=EU/L=Madrid" -keyout /etc/ssl/rootCA.key -out etc/ssl/rootCA.crt;\
	apt-get install gettext-base;

COPY conf/default.conf.template /etc/nginx/conf.d/

CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf; rm -rf /etc/nginx/conf.d/default.conf.template; nginx -g 'daemon off;'"
