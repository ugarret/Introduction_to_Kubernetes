FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz
RUN tar -xf grafana-7.4.1.linux-amd64.tar.gz && rm grafana-7.4.1.linux-amd64.tar.gz
RUN mv grafana-7.4.1 grafana

RUN mkdir -p /var/lib/grafana/dashboards
COPY configs/dashboards.yaml /grafana/conf/provisioning/dashboards/dashboards.yaml
COPY configs/datasources.yaml /grafana/conf/provisioning/datasources/influxdb.yaml
COPY configs/ftps.json /var/lib/grafana/dashboards/
COPY configs/mysql.json /var/lib/grafana/dashboards/
COPY configs/nginx.json /var/lib/grafana/dashboards/
COPY configs/php.json /var/lib/grafana/dashboards/
COPY configs/wp.json /var/lib/grafana/dashboards/
COPY configs/grafana.json /var/lib/grafana/dashboards/
COPY configs/telegraf.json /var/lib/grafana/dashboards/
COPY configs/influx.json /var/lib/grafana/dashboards/

COPY ./start_grafana.sh ./

EXPOSE 3000

CMD sh start_grafana.sh