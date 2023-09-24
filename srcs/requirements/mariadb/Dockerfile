FROM	alpine:3.17.5
#		This is the penultimate version of alpine as the latest is 3.18.3
#		https://hub.docker.com/_/alpine

ARG		DB_NAME \
		DB_USER \
		DB_PASS \
		DB_ROOT

RUN		apk upgrade --no-cache

RUN		apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

# COPY	./conf.d/mariadb.cnf /etc/my.cnf.d/

RUN mariadb-install-db --skip-test-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./conf.d/create_db.sh .
RUN sh create_db.sh

USER mysql

# CMD [ "tail", "-f" ]

CMD		[ "/usr/bin/mariadbd", "--skip-log-error" ]