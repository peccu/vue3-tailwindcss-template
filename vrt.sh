#!/bin/bash

# Execute vrt-prepare.sh first in the original state of VRT for comparison.
# Then, run vrt.sh in the state to be compared; any differences will appear as test failures.

echo port mapping is 9323:9323

CONTAINER_NAME=bun-vrt
COMMAND="bun run test:vrt"
PORT_MAPPINGS="-p 9323:9323"
VOLUMES="-v $(PWD)/node_modules_container:/app/node_modules"
ENVIRONMENT=""

source ./container.sh
if [ ! -d node_modules_container ]
then
    mkdir node_modules_container
fi
playwright-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS" "$VOLUMES" "$ENVIRONMENT"
