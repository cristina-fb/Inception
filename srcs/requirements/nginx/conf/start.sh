#! /bin/sh

envsubst '$DOMAIN_NAME'< /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
rm etc/nginx/conf.d/default.conf.template
nginx -g 'daemon off;'
