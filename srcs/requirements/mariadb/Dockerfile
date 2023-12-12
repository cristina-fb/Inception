FROM debian:buster

COPY ./conf/start.sh ./start.sh

RUN apt-get update; \
	apt-get install -y mariadb-server; \
	sed -i 's/^bind-address .*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf; \
	chmod 775 ./start.sh;

CMD ["./start.sh"]



