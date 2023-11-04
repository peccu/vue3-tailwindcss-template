#!/bin/bash

function exists(){
    type $1 >/dev/null 2>&1
}

function bun-command(){
    CONTAINER_NAME=$1
    COMMAND="$2"
    PORT_MAPPINGS="$3"
    VOLUMES="$4"

    echo CONTAINER_NAME $CONTAINER_NAME
    echo COMMAND $COMMAND
    echo PORT_MAPPINGS $PORT_MAPPINGS
    echo VOLUMES $VOLUMES

    if [ $(exists bun;echo $?) -eq 0 -a "$USE_CONTAINER" != "1" ]
    then
        ${COMMAND}
    else
        ./docker-build.sh bun .codesandbox
        docker run \
               -it \
               --rm \
               --name $CONTAINER_NAME \
               --mount type=bind,source="$(pwd)",target=/app \
               $(echo $VOLUMES) \
               $(echo $PORT_MAPPINGS) \
               -w /app \
               --entrypoint /bin/bash \
               bun \
               -c "${COMMAND}"
    fi

}
