#!/bin/bash

echo port mapping is 9323:9323 for playwright show-report
echo 'test with "npm run build && npm run test:e2e"'
echo 'It includes running "playwright show-report"'
# https://playwright.dev/docs/ci-intro

CONTAINER_NAME=playwright
COMMAND="bun run build && bun run test:e2e:update-snapshots"
PORT_MAPPINGS="-p 9323:9323"
VOLUMES="-v $(PWD)/node_modules_container:/app/node_modules"
ENVIRONMENT=""

source container.sh
if [ ! -d node_modules_container ]
then
    mkdir node_modules_container
fi
playwright-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS" "$VOLUMES" "$ENVIRONMENT"
