#!/bin/sh

. ./env.sh

pushd ./nginx-certbot
./00-certbot.sh
popd
