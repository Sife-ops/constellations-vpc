#!/bin/sh

. ./env.sh

pushd ./jwt-auth

cp ../jwt-auth-config/docker-compose.yml ./docker-compose.yml

docker-compose up -d

popd
pushd ./nginx-certbot

cp ../nginx-certbot-config/default.conf ./nginx-template/default.conf
cp ../nginx-certbot-config/docker-compose.yml ./docker-compose.yml

./10-proxy.sh -d

