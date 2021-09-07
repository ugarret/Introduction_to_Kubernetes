FROM alpine:3.12

RUN apk update && apk add openrc wget libc6-compat

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_i386.tar.gz
RUN tar -xf telegraf-1.18.0_linux_i386.tar.gz && rm -rf telegraf-1.18.0_linux_i386.tar.gz
RUN cp -r telegraf-1.18.0/* ./ && rm -rf /telegraf-1.18.0

COPY telegraf.conf /etc/telegraf/

CMD	telegraf