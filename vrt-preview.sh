#!/bin/bash

# This script is for previewing the original state to confirm the VRT comparison.
# It previews ORIGINAL=vrt-original as dist.
# Since the comparison target is available locally, it can be Live Previewed with the usual dev command.
# Therefore, a separate script for VRT is not provided.

echo port mapping is 4173:4173

CONTAINER_NAME=bun-vrt-preview
COMMAND="bun run test:vrt:preview"
PORT_MAPPINGS="-p 4173:4173"
VOLUMES="-v $(PWD)/node_modules_container:/app/node_modules"
ENVIRONMENT=""

source ./container.sh
if [ ! -d node_modules_container ]
then
    mkdir node_modules_container
fi
playwright-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS" "$VOLUMES" "$ENVIRONMENT"
