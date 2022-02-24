#!/bin/sh

. ./env.sh

pushd ./nginx-certbot

touch ./.env

./start-certbot.sh
