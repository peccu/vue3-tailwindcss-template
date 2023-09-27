#!/bin/bash

./docker-build.sh netlify .netlify

echo port mapping is 3000:3000 and 9999:9999
docker run \
       -it \
       --rm \
       --name netlify-cli \
       -p 3000:3000 \
       -p 9999:9999 \
       -v "$PWD:/app" \
       netlify
