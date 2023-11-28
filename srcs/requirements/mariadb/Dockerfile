FROM debian:buster

COPY ./conf/configdb.sh ./configdb.sh

RUN apt-get update; \
	apt-get install -y mariadb-server; \
	chmod 777 ./configdb.sh;

CMD /bin/bash -c "/etc/init.d/mysql start && ./configdb.sh && rm ./configdb.sh ./configdb.sql && mysql"
