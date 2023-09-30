#!/bin/bash
image=$1
context=$2
docker images | grep -E $image' +latest ' >/dev/null \
    || (\
        echo no $image image found
        cd $context
        docker build -t $image .\
            )
