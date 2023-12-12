#! /bin/sh

openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=$DOMAIN_NAME/C=EU/L=Madrid" -keyout /etc/ssl/rootCA.key -out etc/ssl/rootCA.crt
envsubst '$DOMAIN_NAME'< /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
rm etc/nginx/conf.d/default.conf.template
nginx -g 'daemon off;'
