#!/bin/bash

./docker-build.sh playwright .playwright

echo port mapping is 9323:9323 for playwright show-report
echo 'test with "npm run build && npm run test:e2e"'
echo 'its includes running "playwright show-report"'
# https://playwright.dev/docs/ci-intro

CONTAINER_NAME=playwright
COMMAND="bun run build && bun run test:e2e"
PORT_MAPPINGS="-p 9323:9323"
if exists bun
then
    "${COMMAND}"
else
docker run \
       -it \
       --rm \
       --name $CONTAINER_NAME \
       --mount type=bind,source="$(pwd)",target=/app \
       $(echo $PORT_MAPPINGS) \
       -w /app \
       --entrypoint /bin/bash \
       playwright \
       -c "${COMMAND}"
fi
