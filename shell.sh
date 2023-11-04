#!/bin/bash

echo port mapping is
echo "5555:5173 (dev server)"
echo "4444:4173 (preview server)"
echo "9999:9323 (PlayWright report)"
echo "55555:51204 (Vitest UI)"

CONTAINER_NAME=bun-shell
COMMAND="bash"
PORT_MAPPINGS="-p 4444:4173 -p 5555:5173 -p 9999:9323 -p 55555:51204"

source ./bun-container.sh
if exists bun
then
    echo You already have the bun in your shell
else
    bun-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS"
fi
