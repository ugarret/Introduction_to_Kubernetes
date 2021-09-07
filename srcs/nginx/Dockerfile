FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add	nginx openssl openssh supervisor

COPY ./default etc/nginx/conf.d/default.conf
COPY ./index.html /var/www
ADD ./tractor.png /var/www/tractor.png
ADD ./tractor_with_petr.png /var/www/tractor_with_petr.png
COPY supervisor.conf /etc/supervisord.conf

RUN openssl req -newkey rsa:2048 \
		-x509 \
		-nodes \
		-keyout /etc/ssl/ugarret.key \
		-out etc/ssl/ugarret.crt \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/OU=IT/CN=ugarret"

EXPOSE 80 443 22
COPY ./start_nginx.sh /tmp
RUN mkdir -p /run/nginx

CMD sh /tmp/start_nginx.sh