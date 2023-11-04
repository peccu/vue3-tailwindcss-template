#!/bin/bash

CONTAINER_NAME=bun-vrt-prepare
COMMAND="bun run test:vrt:prepare"
PORT_MAPPINGS=""
# TODO need to install packages in below volume
VOLUMES="-v $(PWD)/vrt-node-modules:/app/node_modules"

source ./bun-container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS" "$VOLUMES"
