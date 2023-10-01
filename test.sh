#!/bin/bash

./docker-build.sh playwright .playwright

echo port mapping is 9323:9323
echo test with "npm run build && npm run test:e2e"
echo then "npx playwright show-report --host 0.0.0.0"
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
echo
echo you can see the report in http://localhost:9323/
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
       -c "bunx playwright show-report --host 0.0.0.0"
