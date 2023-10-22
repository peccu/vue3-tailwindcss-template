#!/bin/bash

./docker-build.sh playwright .playwright

echo port mapping is 9323:9323 for playwright show-report
echo 'test with "npm run build && npm run test:e2e"'
echo 'its includes running "playwright show-report"'
# https://playwright.dev/docs/ci-intro

docker run \
       -it \
       --rm \
       --name playwright \
       --mount type=bind,source="$(pwd)",target=/app \
       -p 9323:9323 \
       -w /app \
       --ipc=host \
       playwright \
       /bin/bash \
       -c "bun run build && bun run test:e2e"
