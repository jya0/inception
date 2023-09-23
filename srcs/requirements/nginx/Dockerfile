FROM	alpine:3.17.5
#		This is the penultimate version of alpine as the latest is 3.18.3
#		https://hub.docker.com/_/alpine

RUN		apk update \
		&& apk upgrade

RUN		apk add nginx

RUN		openssl version

EXPOSE	80

CMD		["nginx", "-g", "daemon off;"]
