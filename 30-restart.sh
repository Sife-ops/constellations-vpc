#!/bin/sh

./stop.sh

git submodule update --recursive --remote

./start.sh

