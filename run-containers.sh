#!/bin/sh
#
# run-containers.sh
#
# Runs the Redis and Flask containers for the pycounter application

docker run -d --rm -p 127.0.0.1:6379:6379/tcp --name pycounter-alpine redis:5-alpine
docker run -d --rm -p 127.0.0.1:5000:5000/tcp --name pycounter-app dixonwhitmire/pycounter:1.0.0