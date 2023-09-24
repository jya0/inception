FROM	alpine:3.17.5
#		This is the penultimate version of alpine as the latest is 3.18.3
#		https://hub.docker.com/_/alpine

ARG		PHP_VERSION=81	\
		DB_NAME	\
		DB_USER	\
		DB_PASS

RUN		apk upgrade --update-cache

RUN		apk add --no-cache \
		php${PHP_VERSION} \
		php${PHP_VERSION}-fpm \
		php${PHP_VERSION}-json \
		php${PHP_VERSION}-mysqli \
		php${PHP_VERSION}-curl \
		php${PHP_VERSION}-dom \
		php${PHP_VERSION}-exif \
		php${PHP_VERSION}-fileinfo \
		php${PHP_VERSION}-intl \
		php${PHP_VERSION}-mbstring \
		php${PHP_VERSION}-openssl \
		php${PHP_VERSION}-xml \
		php${PHP_VERSION}-zip \
		wget \
		unzip


RUN		sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
		/etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
		sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
		/etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
		sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
		/etc/php${PHP_VERSION}/php-fpm.d/www.conf

WORKDIR	/var/www

RUN		wget https://wordpress.org/latest.zip && \
		unzip latest.zip && \
		cp -rf wordpress/* . && \
		rm -rf wordpress latest.zip

COPY	./conf.d/wp_create_conf.sh .

RUN		sh wp_create_conf.sh && rm wp_create_conf.sh && \
		chmod -R 0777 wp-content/

CMD ["/usr/sbin/php-fpm81", "-F"]