#!/bin/bash

./docker-build.sh bun .codesandbox

echo port mapping is 5173:5173

docker run \
       -it \
       --rm \
       --name bun-dev \
       --mount type=bind,source="$(pwd)",target=/app \
       -p 5173:5173 \
       -w /app \
       --entrypoint /bin/bash \
       bun \
       -c "bun run dev"
