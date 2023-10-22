#!/bin/bash

./docker-build.sh bun .codesandbox

docker run \
       -it \
       --rm \
       --name bun-vrt-prepare \
       --mount type=bind,source="$(pwd)",target=/app \
       -w /app \
       --entrypoint /bin/bash \
       bun \
       -c "bun run test:vrt:prepare"
