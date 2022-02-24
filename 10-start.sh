#!/bin/sh

. ./env.sh

# make sure npm is installed
# run npm install

pushd ./jwt-auth
touch ./.env
./deploy-vpc.sh ${1} -d
popd

pushd ./nginx-certbot
touch ./.env
cp ../nginx.conf ./nginx-template/default.conf
cp ../docker-compose.yml ./docker-compose.yml
./10-proxy.sh -d
popd

