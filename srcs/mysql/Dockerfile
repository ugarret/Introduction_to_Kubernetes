FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client openrc libc6-compat

VOLUME ["/var/lib/mysql"]

COPY my.cnf /etc/
COPY create_database ./create_database
COPY base.sql .

EXPOSE 3306

COPY start_sql.sh .
CMD sh start_sql.sh