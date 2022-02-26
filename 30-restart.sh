#!/bin/sh

./20-stop.sh

git submodule update --recursive --remote

./10-build.sh

