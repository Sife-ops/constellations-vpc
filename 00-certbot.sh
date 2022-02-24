#!/bin/sh

. ./env.sh

pushd ./nginx-certbot
touch ./.env
./00-certbot.sh
popd
