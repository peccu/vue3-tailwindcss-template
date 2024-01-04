#!/bin/bash

CONTAINER_NAME=bun-build
COMMAND="bun run build"
PORT_MAPPINGS=""

source ./container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
