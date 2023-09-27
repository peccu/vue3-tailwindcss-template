#!/bin/bash

./docker-build.sh

echo port mapping is 5173:5173

docker run \
       -it \
       --rm \
       --name bun-dev \
       -v "$PWD:/app" \
       -p 5173:5173 \
       -w /app \
       --entrypoint /bin/bash \
       bun \
       -c "bun run dev -- --host"
