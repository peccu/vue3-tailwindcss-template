#!/bin/bash

function exists(){
    type $1 >/dev/null 2>&1
}

function playwright-installed(){
    bunx playwright install --dry-run \
        | grep Install \
        | awk '{print $3}' \
        | xargs ls 2>/dev/null
}

function bun-command(){
    COMMAND="$2"

    if exists bun && [ "$USE_CONTAINER" != "1" ]
    then
        ${COMMAND}
    else
        ./docker-build.sh bun .codesandbox
        _container-command bun "$@"
    fi

}

function playwright-command(){
    COMMAND="$2"

    if exists bun && [ "$USE_CONTAINER" != "1" ] && playwright-installed
    then
        ${COMMAND}
    else
        cp ./package.json .playwright/
        ./docker-build.sh playwright .playwright

        _container-command playwright "$@"
    fi
}

function vitestui-command(){
    COMMAND="$2"

    if exists node && [ "$USE_CONTAINER" != "1" ]
    then
        ${COMMAND}
    else
        cp ./package.json .vitestui/
        ./docker-build.sh vitestui .vitestui

        _container-command vitestui "$@"
    fi
}

function _container-command(){
    IMAGE=$1
    CONTAINER_NAME=$2
    COMMAND="$3"
    PORT_MAPPINGS="$4"
    VOLUMES="$5"
    ENVIRONMENT="$6"

    echo IMAGE ${IMAGE}
    echo CONTAINER_NAME ${CONTAINER_NAME}
    echo COMMAND ${COMMAND}
    echo PORT_MAPPINGS ${PORT_MAPPINGS}
    echo VOLUMES ${VOLUMES}
    echo ENVIRONMENT ${ENVIRONMENT}

    docker run \
           -it \
           --rm \
           --name $CONTAINER_NAME \
           --mount type=bind,source="$(pwd)",target=/app \
           $(echo $VOLUMES) \
           $(echo $PORT_MAPPINGS) \
           $(echo $ENVIRONMENT) \
           -w /app \
           --entrypoint /bin/bash \
           $IMAGE \
           -c "${COMMAND}"
}
