#!/bin/bash

export APP=vue-app
bun create vue@latest ${APP} --ts --vue-router --pinia --vitest --playwright --eslint-with-prettier --force

cd ${APP}

if [ $(ulimit -n) -lt 300 ]
then
    echo need to increase maxfiles
    sudo launchctl limit maxfiles 2147483646
    ulimit -n 2147483646
fi

bun i

bun add -d @vitest/coverage-v8 @vitest/ui
bun add -d dependency-cruiser
bun add -d tailwindcss postcss autoprefixer

bunx tailwindcss init -p
# make this patch from (R means reverse, no-prefix means no a/, b/ prefix in filepath)
# cf. https://stackoverflow.com/a/4610809/514411
# git diff -R --no-prefix src/assets/base.css > patch/tailwind.patch
patch -p0 < ../patch/tailwind.patch

# This uses node.js and npm. not supported bun yet
CI=true bunx storybook@latest init --disable-telemetry --package-manager bun --skip-install --yes

# does not supports storybook 7
# bun add -d @storybook/addon-postcss

bun add -d eslint-plugin-storybook

bun add -d oxlint

bun run format
patch -p0 < ../patch/storybook-fix-lint-error.patch
bun run eslint

patch -p0 < ../patch/my-config.patch

rm -rf node_modules
rm bun.lockb

cd ..

# TODO apply patch from git diff
cp -R $(
    ls -a1 $APP \
        | grep -Ev '^\.\.?$' \
        | grep -Ev '^\.git$' \
        | grep -Ev '^'$APP'$' \
        | xargs -I{} echo "$APP/"{}
   ) ./
