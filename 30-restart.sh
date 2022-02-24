#!/bin/sh

./stop.sh

pushd ./jwt-auth
git pull
popd

./start.sh

