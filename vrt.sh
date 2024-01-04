#!/bin/bash

# Execute vrt-prepare.sh first in the original state of VRT for comparison.
# Then, run vrt.sh in the state to be compared; any differences will appear as test failures.

echo port mapping is 9323:9323

CONTAINER_NAME=bun-vrt
COMMAND="bun run test:vrt"
PORT_MAPPINGS="-p 9323:9323"

source ./bun-container.sh
bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
