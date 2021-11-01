minikube delete --all
minikube start --vm-driver=virtualbox --disk-size=10GB --extra-config=kubelet.authentication-token-webhook=true

eval $(minikube docker-env)

minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

kubectl apply -f ./srcs/metallb.yaml

docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx.yaml
docker build -t mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql.yaml
docker build -t phpmyadmin ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin.yaml
docker build -t influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb.yaml
docker build -t wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress.yaml
docker build -t ftps ./srcs/ftps
kubectl apply -f ./srcs/ftps.yaml
docker build -t grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana.yaml

minikube dashboard
