#!/bin/bash
docker images | grep -E 'bun +latest ' >/dev/null \
    || (\
        echo no bun image found
        cd .codesandbox
        docker build -t bun .\
            )
