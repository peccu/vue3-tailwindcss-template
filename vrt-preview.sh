#!/bin/bash

# This script is for previewing the original state to confirm the VRT comparison.
# It previews ORIGINAL=vrt-original as dist.
# Since the comparison target is available locally, it can be Live Previewed with the usual dev command.
# Therefore, a separate script for VRT is not provided.

echo port mapping is 4173:4173

CONTAINER_NAME=bun-vrt-preview
COMMAND="bun run test:vrt:preview"
PORT_MAPPINGS="-p 4173:4173"

source ./bun-container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
