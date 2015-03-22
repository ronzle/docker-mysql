FROM ubuntu:latest
MAINTAINER Ronny Laborius <ronny@laborius.org>

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install --force-yes -y mysql-client mysql-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

VOLUME /var/lib/mysql
EXPOSE 3306

CMD ["mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]

