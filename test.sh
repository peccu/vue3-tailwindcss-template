#!/bin/bash

# ./docker-build.sh bun .codesandbox

echo port mapping is 9323:9323
echo test with "npm run build && CI=1 npm run test:e2e"
# https://playwright.dev/docs/ci-intro

docker run \
       -it \
       --rm \
       --name playwright \
       -v "$PWD:/app" \
       -p 9323:9323 \
       -w /app \
       --ipc=host \
       mcr.microsoft.com/playwright:v1.38.0-jammy \
       /bin/bash

