#!/bin/bash
image=$1
context=$2
docker images | grep -E $image' +latest ' >/dev/null \
    || (\
        echo no bun image found
        cd $context
        docker build -t bun .\
            )
