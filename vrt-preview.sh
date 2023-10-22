#!/bin/bash

./docker-build.sh bun .codesandbox

echo port mapping is 4173:4173

docker run \
       -it \
       --rm \
       --name bun-vrt-preview \
       --mount type=bind,source="$(pwd)",target=/app \
       -p 4173:4173 \
       -w /app \
       --entrypoint /bin/bash \
       bun \
       -c "bun run test:vrt:preview"
