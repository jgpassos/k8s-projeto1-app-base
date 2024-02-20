#!/bin/bash

echo "Criando as imagens....."

docker build -t jgpssos/projeto-backend:1.0 backend/.
docker build -t jgpssos/projeto-database:1.0 database/.

echo "Realizando o push das imagens....."

docker push jgpssos/projeto-backend:1.0
docker push jgpssos/projeto-database:1.0

echo "Criando serviços no cluster kubernetes....."

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yml