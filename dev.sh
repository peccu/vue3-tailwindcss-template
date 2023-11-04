#!/bin/bash

echo port mapping is 5173:5173

CONTAINER_NAME=bun-dev
COMMAND="bun run dev"
PORT_MAPPINGS="-p 5173:5173"

source ./bun-container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
