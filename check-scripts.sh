#!/bin/bash
# exit on error
set -e
# execute scripts for check not broken
source container.sh

function run(){
    echo "----------$@----------"
    "$@"
}

function o(){
    exists open \
        && open "$1" \
            || echo open "$1"
}


run bun run dev
echo "==========build related=========="
run bun run build
run bun run build-only
run bun run build:make404
run bun run build:preview
echo "==========testing=========="
run bun run test:unit
run bun run test:unit:show-report

echo "==========vitest UI. This can show coverage report. This needs node instead of bun. You can use vitest-ui.sh=========="
# run bun run test:vitestui
# vitest ui does not work with bun
docker pull node:lts-slim
# docker rmi vitestui
o http://0.0.0.0:51204/__vitest__/
run ./vitestui.sh

# current playwright doesn't run in old mac
if playwright-installed
then
    echo "==========playwright related tests=========="
    run bun run test:e2e
    run bun run test:e2e:setup
    run bun run test:e2e:show-report
    run bun run test:e2e:update-snapshots
    echo "==========runs e2e test name starts 'vrt' for VRT=========="
    run bun run test:vrt
    run bun run test:vrt:build
    run bun run test:vrt:prepare
    run bun run test:vrt:preview
    run bun run test:vrt:snapshots
else
    # docker rmi playwright
    # runs e2e test in container
    run ./e2e-update-snapshots.sh
    # maybe this fails when updated. need to update snapshot by e2e-update-snapshots.sh
    run ./e2e.sh || echo Please run ./e2e-show-report.sh to show report
    # build as previous version and take snapshots
    run ./vrt-prepare.sh
    # preview built previous version
    run ./vrt-preview.sh
    # build current local and compare it with previous verision's snapshots
    run ./vrt.sh || echo Please run ./e2e-show-report.sh to show report
fi

echo "==========coverage=========="
run bun run coverage
run bun run coverage:show-report
echo "==========code quality=========="
run bun run eslint
run bun run format
run bun run lint
run bun run type-check
echo "==========storybook=========="
# this is for dev and cant stop safely
# run bun run storybook
run bun run storybook:build
run bun run storybook:preview-built

echo "==========Dependency cruiser=========="
run bunx depcruise src --config
run bunx depcruise src --config --output-type markdown
