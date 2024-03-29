#!/bin/bash

echo port mapping is 9323:9323 for playwright show-report
echo 'show test report with "npm run test:e2e:show-report"'
# https://playwright.dev/docs/ci-intro

CONTAINER_NAME=playwright
COMMAND="bun run test:e2e:show-report"
PORT_MAPPINGS="-p 9323:9323"
VOLUMES="-v $PWD/node_modules_container:/app/node_modules"
ENVIRONMENT=""

source container.sh
if [ ! -d node_modules_container ]
then
    mkdir node_modules_container
fi
playwright-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS" "$VOLUMES" "$ENVIRONMENT"
