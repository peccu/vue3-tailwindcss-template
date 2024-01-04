#!/bin/bash

echo preview built app
echo port mapping is 4173:4173

CONTAINER_NAME=bun-preview
COMMAND="bun run build:preview"
PORT_MAPPINGS="-p 4173:4173"

source ./container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
