#!/bin/bash

echo port mapping is 4173:4173

CONTAINER_NAME=bun-vrt-preview
COMMAND="bun run test:vrt:preview"
PORT_MAPPINGS="-p 4173:4173"

source ./bun-container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
