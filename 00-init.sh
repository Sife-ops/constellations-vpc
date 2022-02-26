#!/bin/sh

. ./.env

pushd ./nginx-certbot
./00-certbot.sh
popd
