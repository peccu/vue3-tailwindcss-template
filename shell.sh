#!/bin/bash

./docker-build.sh bun .codesandbox

echo port mapping is
echo "5555:5173 (dev server)"
echo "4173:4173 (preview server)"
echo "9323:9323 (PlayWright report)"

docker run \
       -it \
       --rm \
       --name bun-shell \
       --mount type=bind,source="$(pwd)",target=/app \
       -p 4173:4173 \
       -p 5555:5173 \
       -p 9323:9323 \
       -w /app \
       --entrypoint /bin/bash \
       bun
