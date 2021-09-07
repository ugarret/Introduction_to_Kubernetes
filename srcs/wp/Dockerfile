FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add	wget nginx supervisor php7 php7-fpm php7-opcache php7-gd php7-iconv php7-mysqli php7-mbstring php7-json php7-session php7-xml php7-ctype

RUN wget https://ru.wordpress.org/wordpress-5.6.1-ru_RU.tar.gz
RUN tar -xf wordpress-5.6.1-ru_RU.tar.gz && rm wordpress-5.6.1-ru_RU.tar.gz
RUN mkdir -p var/www
RUN mv wordpress /var/www/wordpress

COPY wp-config.php /var/www/wordpress/
COPY supervisor.conf /etc/supervisord.conf
COPY nginx_for_wp.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]