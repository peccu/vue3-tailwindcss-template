#!/bin/bash

./docker-build.sh

echo port mapping is 5555:5173
docker run \
       -it \
       --rm \
       --name bun-shell \
       -v "$PWD:/app" \
       -p 5555:5173 \
       -w /app \
       --entrypoint /bin/bash \
       bun
