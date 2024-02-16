#!/bin/bash

echo port mapping is 51204:51204

CONTAINER_NAME=vitestui
COMMAND="npm run test:vitestui"
PORT_MAPPINGS="-p 51204:51204"
VOLUMES="-v $PWD/node_modules_vitestui:/app/node_modules"
ENVIRONMENT=""

source ./container.sh
if [ ! -d node_modules_vitestui ]
then
    mkdir node_modules_vitestui
fi
USE_CONTAINER=1 vitestui-command $CONTAINER_NAME "$COMMAND" "$PORT_MAPPINGS" "$VOLUMES" "$ENVIRONMENT"
