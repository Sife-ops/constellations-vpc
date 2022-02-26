#!/bin/sh

pushd ./nginx-certbot
docker-compose down
popd

pushd ./jwt-auth
docker-compose down
popd

