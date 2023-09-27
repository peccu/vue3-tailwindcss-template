#!/bin/bash

./docker-build.sh bun .codesandbox

docker run \
       --rm \
       --name bun-build \
       -v "$PWD:/app" \
       -w /app \
       --entrypoint /bin/bash \
       bun \
       -c "bun run build"
