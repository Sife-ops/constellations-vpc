#!/bin/sh

. ./.env

pushd ./jwt-auth/deploy

./vpc-build.sh -d

popd
pushd ./nginx-certbot

cp ../config/nginx.conf ./nginx-template/default.conf
cp ../config/docker-compose.yml ./docker-compose.yml
./10-proxy.sh -d

