FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add	wget nginx supervisor php7-fpm php7-opcache php7-gd php7-iconv php7-mysqli php7-json php7-session

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-english.tar.gz && rm phpMyAdmin-5.0.4-english.tar.gz
RUN mkdir -p var/www
RUN mv phpMyAdmin-5.0.4-english/ /var/www/phpmyadmin

COPY config.inc.php /var/www/phpmyadmin
COPY supervisor.conf /etc/supervisord.conf
COPY nginx_for_php.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx

EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]