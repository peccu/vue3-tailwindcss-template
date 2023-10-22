#!/bin/bash

./docker-build.sh bun .codesandbox

echo port mapping is 9323:9323

docker run \
       -it \
       --rm \
       --name bun-vrt \
       --mount type=bind,source="$(pwd)",target=/app \
       -p 9323:9323 \
       -w /app \
       --entrypoint /bin/bash \
       bun \
       -c "bun run test:vrt"
