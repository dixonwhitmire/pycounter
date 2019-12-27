#!/bin/sh
#
# manage-containers.sh
#
# Used to start and stop docker networking and container services.
#
# Usage:
# manage-containers.sh [start|stop]

OPERATION=$1

REDIS_CONTAINER_NAME=pycounter-redis
PYCOUNTER_CONTAINER_NAME=pycounter-app

function start {
    echo "starting docker network and container services"

    docker network create --driver bridge pycounter_nw

    docker run -d --rm --network=pycounter_nw -p 6379:6379 --name pycounter-redis redis:5-alpine
    docker run -d --rm --network=pycounter_nw -p 5000:5000 --name pycounter-app pycounter/pycounter:1.0.0

    docker ps
    docker network inspect pycounter_nw
}

function stop {
    echo "stopping docker network and container services"

    docker stop pycounter-redis &> /dev/null
    docker stop pycounter-app &> /dev/null

    docker ps
    docker network rm pycounter_nw &> /dev/null
}

if [[ "$OPERATION" != "start" ]] && [[ "$OPERATION" != "stop" ]]; then
    echo "invalid operation $OPERATION. Expected start | stop"
    exit 1
fi

if [[ "$OPERATION" == "start" ]]; then
    stop
    start
else
    stop
fi



