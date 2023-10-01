#!/bin/bash

./docker-build.sh bun .codesandbox

echo port mapping is 5555:5173 4173:4173
docker run \
       -it \
       --rm \
       --name bun-shell \
       --mount type=bind,source="$(pwd)",target=/app \
       -p 4173:4173 \
       -p 5555:5173 \
       -w /app \
       --entrypoint /bin/bash \
       bun
