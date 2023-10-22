#!/bin/bash

./docker-build.sh bun .codesandbox

docker run \
       --rm \
       --name bun-vrt-pepare \
       --mount type=bind,source="$(pwd)",target=/app \
       -w /app \
       --entrypoint /bin/bash \
       bun \
       -c "bun run test:vrt:prepare"
