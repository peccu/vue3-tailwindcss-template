#!/bin/bash

CONTAINER_NAME=bun-vrt-prepare
COMMAND="bun run test:vrt:prepare"
PORT_MAPPINGS=""
VOLUMES="-v $(PWD)/node_modules_container:/app/node_modules"
ENVIRONMENT=""

source ./bun-container.sh
if [ ! -d node_modules_container ]
then
    mkdir node_modules_container
fi
playwright-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS" "$VOLUMES" "$ENVIRONMENT"
