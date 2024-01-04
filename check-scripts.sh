#!/bin/bash
# exit on error
set -e
# execute scripts for check not broken
source container.sh

function run(){
    echo "----------$@----------"
    "$@"
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
    # runs e2e test in container
    run ./e2e.sh
    # build as previous version and take snapshots
    run ./vrt-prepare.sh
    # preview built previous version
    run ./vrt-preview.sh
    # build current local and compare it with previous verision's snapshots
    run ./vrt.sh
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
