#!/bin/sh

pushd ./nginx-certbot
docker-compose down
popd

pushd ./jwt-auth
docker-compose -f docker-compose-vpc.yml down
popd

