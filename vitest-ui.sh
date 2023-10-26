#!/bin/bash

./docker-build.sh vitestui .vitestui

echo port mapping is 51204:51204

docker run \
       -it \
       --rm \
       --name vitestui \
       --mount type=bind,source="$(pwd)",target=/app \
       -p 51204:51204 \
       -w /app \
       --entrypoint /bin/bash \
       vitestui \
       -c "npm run vitest-ui"
