#!/bin/bash

echo port mapping is 9323:9323

CONTAINER_NAME=bun-vrt
COMMAND="bun run test:vrt"
PORT_MAPPINGS="-p 9323:9323"

source ./bun-container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
