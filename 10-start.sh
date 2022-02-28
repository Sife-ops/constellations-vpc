#!/bin/sh

. ./env.sh

pushd ./constellations

# backend
cp ../constellations-config/backend/.dockerignore ./backend/.dockerignore
cp ../constellations-config/backend/Dockerfile ./backend/Dockerfile

# frontend
cp ../constellations-config/frontend/.dockerignore ./frontend/.dockerignore
sed -e "/VITE_PROD_URL/ s!<++>!${VITE_PROD_URL}!" \
    -e "/VITE_RECAPTCHA_KEY/ s/<++>/${VITE_RECAPTCHA_KEY}/" \
    ../constellations-config/frontend/Dockerfile > ./frontend/Dockerfile

cp ../constellations-config/frontend/default.conf ./frontend/default.conf

# root
cp ../constellations-config/docker-compose.yml ./docker-compose.yml

docker-compose up $@ -d

popd
pushd ./nginx-certbot

cp ../nginx-certbot-config/default.conf ./nginx-template/default.conf
cp ../nginx-certbot-config/docker-compose.yml ./docker-compose.yml

./10-proxy.sh -d

