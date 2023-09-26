FROM	alpine:3.17.5

ARG		CERT_ \
		KEY_ \
		DOMAIN_NAME

RUN		apk upgrade --update-cache

RUN		apk add --no-cache nginx openssl

RUN		mkdir /etc/nginx/ssl/

RUN		openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout ${KEY_} -out ${CERT_};

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]