#!/usr/bin/env bash

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

minikube addons enable metallb
minikube addons enable dashboard

kubectl apply -f ./srcs/configmap.yaml

docker build -t nginx_image		./srcs/nginx/		&& kubectl apply -f ./srcs/nginx/nginx.yaml
docker build -t wp_image		./srcs/wp/			&& kubectl apply -f ./srcs/wp/wp.yaml
docker build -t mysql_image		./srcs/mysql/		&& kubectl apply -f ./srcs/mysql/my_sql.yaml
docker build -t php_image		./srcs/php/			&& kubectl apply -f ./srcs/php/php.yaml
docker build -t ftps_image		./srcs/ftps/		&& kubectl apply -f ./srcs/ftps/ftps.yaml
docker build -t grafana_image	./srcs/graf/		&& kubectl apply -f ./srcs/graf/grafana.yaml
docker build -t influxdb_image	./srcs/influx/		&& kubectl apply -f ./srcs/influx/influxdb.yaml
docker build -t telegraf_image	./srcs/telegraf/	&& kubectl apply -f ./srcs/telegraf/telegraf.yaml
minikube dashboard &

sleep 10
kubectl get pods
sleep 10
kubectl get svc