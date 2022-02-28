#!/bin/sh

pushd ./nginx-certbot
docker-compose down
popd

pushd ./constellations
docker-compose down
popd

