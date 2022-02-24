#!/bin/sh

. ./env.sh

pushd ./jwt-auth
touch ./.env
./deploy.sh -d
popd

pushd ./nginx-certbot
touch ./.env
./start.sh -d
popd

