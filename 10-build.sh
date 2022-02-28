#!/bin/sh

. ./env.sh

pushd ./jwt-auth

sed \
    -e "/VITE_PROD_URL/ s!<++>!${VITE_PROD_URL}!" \
    -e "/VITE_RECAPTCHA_KEY/ s/<++>/${VITE_RECAPTCHA_KEY}/" \
    ../jwt-auth-config/Dockerfile > ./frontend/Dockerfile

cp ../jwt-auth-config/docker-compose.yml ./docker-compose.yml

docker-compose up --build -d

popd
pushd ./nginx-certbot

cp ../nginx-certbot-config/default.conf ./nginx-template/default.conf
cp ../nginx-certbot-config/docker-compose.yml ./docker-compose.yml

./10-proxy.sh -d

