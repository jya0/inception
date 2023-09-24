FROM	alpine:3.17.5
#		This is the penultimate version of alpine as the latest is 3.18.3
#		https://hub.docker.com/_/alpine

RUN		apk upgrade --update-cache

RUN		apk add --no-cache nginx && apk add --no-cache openssl

RUN		openssl version

# COPY	./conf.d/http_server.conf /etc/nginx/http.d

# COPY	./tools/www/index.html	/root/www/

#NEED TO CONFIGURE SSH && HOSTNAME/SERVER_NAME

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]
