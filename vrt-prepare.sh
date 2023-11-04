#!/bin/bash

CONTAINER_NAME=bun-vrt-prepare
COMMAND="bun run test:vrt:prepare"
PORT_MAPPINGS=""

source ./bun-container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
