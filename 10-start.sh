#!/bin/sh

. ./env.sh

pushd ./jwt-auth
touch ./.env
./deploy-vpc.sh ${1} -d
popd

pushd ./nginx-certbot
touch ./.env
./10-proxy.sh -d
popd

