#!/bin/sh

. ./env.sh

pushd ./jwt-auth

cp ../jwt-auth-config/docker-compose.yml ./docker-compose.yml

pushd ./frontend

if ! command -v npm 1>/dev/null 2>&1 ; then
    echo 'Error: npm not found'
    exit 1
fi

if ! stat ./node_modules 1>/dev/null 2>&1 ; then
    npm install
fi

npm run build

popd

docker-compose up --build -d

popd
pushd ./nginx-certbot

cp ../nginx-certbot-config/default.conf ./nginx-template/default.conf
cp ../nginx-certbot-config/docker-compose.yml ./docker-compose.yml

./10-proxy.sh -d

