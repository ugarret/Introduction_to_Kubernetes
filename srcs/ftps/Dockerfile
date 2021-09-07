FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openrc openssl

RUN openssl req -newkey rsa:2048 \
		-x509 \
		-nodes \
		-keyout /etc/ssl/ugarret.key \
		-out etc/ssl/ugarret.crt \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/OU=IT/CN=ugarret"
		
RUN addgroup -S ftps && adduser -S admin -G ftps -h /var/www
RUN echo "admin:admin" | chpasswd
RUN chown admin:ftps /var/www

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]