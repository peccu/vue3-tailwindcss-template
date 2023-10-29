# vue-app

This template should help get you started developing with Vue 3 in Vite.

## Uses

- Vue3 + Vite + Playwright
  - Generated via `bun create vue@latest vue-app --ts --vue-router --pinia --vitest --playwright --eslint-with-prettier --force`.
- Vitest Coverage and Vitest UI
  - Install via ` bun add -d @vitest/coverage-v8 @vitest/ui`.
- Dependency Cruiser
  - Install via `bun add -d dependency-cruiser`.
- TailwindCSS
  - Installed via `bun add -d tailwindcss postcss autoprefixer` with some other setup documented in [Official document for Vite](https://tailwindcss.com/docs/guides/vite).
  - runs `bunx tailwindcss init -p`. (generates `tailwind.config.js`)
  - update `tailwind.config.js`
  - add `@tailwind` directives into `src/assets/base.css`
- GitHub Actions
  - CI (unit test and E2E test with Playwright). see [.github/workflows/ci.yml](.github/workflows/ci.yml)
  - Release build (host built application on GitHub Pages. You need to activate it in repository's settings page). see [.github/workflows/release.yml](.github/workflows/release.yml)
- Codesandbox Configurations
  - `bun` installed container. see [./.codesandbox/Dockerfile](.codesandbox/Dockerfile)
  - Some useful tasks. see [./.codesandbox/tasks.json](.codesandbox/tasks.json)
    - Setup tasks runs `bun install`
    - Run At Start task runs `bun run dev`. You can preview with dev server.
    - Other defined on demand tasks
      - `bun run lint`
      - `bun run format`
- Some Tweaks
  - `bun`'s `package.json` parsing is not same as `npm`, so I updated the `.scripts.build` from `"run-p type-check \"build-only {@}\" -- "` to `"run-p type-check 'build-only -- {@}' --"`.
    - refs. [Spaces and quotes aren't handled correctly by bun run · Issue #53 · oven-sh/bun](https://github.com/oven-sh/bun/issues/53)
  - Now I can run `bun run build` with parameter in GitHub Actions like `bun run build --base=/${GITHUB_REPOSITORY#*/}/`.
    - GitHub pages are hosted in subdirectory, so I need to [specify the `--base` parameter](https://vitejs.dev/guide/build.html#public-base-path)
  - If you don't use `bun`, revert `package.json`'s `.scripts.build` into ``"run-p type-check \"build-only {@}\" -- "`` and your build script will looks like `npm run build -- -- --base=/${GITHUB_REPOSITORY#*/}/`.
    - `--` should be parsed twice at `npm run run-p` and `npm run build-only`.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Type Support for `.vue` Imports in TS

TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin) to make the TypeScript language service aware of `.vue` types.

If the standalone TypeScript plugin doesn't feel fast enough to you, Volar has also implemented a [Take Over Mode](https://github.com/johnsoncodehk/volar/discussions/471#discussioncomment-1361669) that is more performant. You can enable it by the following steps:

1. Disable the built-in TypeScript Extension
    1) Run `Extensions: Show Built-in Extensions` from VSCode's command palette
    2) Find `TypeScript and JavaScript Language Features`, right click and select `Disable (Workspace)`
2. Reload the VSCode window by running `Developer: Reload Window` from the command palette.

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Helper scripts for bun container

`bun` command can be used via docker. `shell.sh` runs shell with `bun` installed container.

### `shell.sh`

This script runs bash with `bun` installed container. Current directory is mounted in `/app`. Port mapping is below.

|host|inside container|purpose|
|--|--|--|
|5555|5173|dev server (5173 in host will used by `dev.sh`)|
|4173|4173|Playwright reporter|

```sh
$ ./shell.sh
port mapping is 5555:5173 4173:4173
root@90cbb764e199:/app# #You can use bun here
```

### `build.sh`

This script runs `bun run build`.

```sh
$ ./build.sh
$ ./scripts/v.sh ; run-p type-check 'build-only -- {@}' --
commit ref:
$ vue-tsc --noEmit -p tsconfig.vitest.json --composite false
$ vite build
vite v4.4.9 building for production...
transforming...
✓ 48 modules transformed.
rendering chunks...
computing gzip size...
dist/assets/logo-277e0e97.svg        0.28 kB │ gzip:  0.20 kB
dist/index.html                      0.42 kB │ gzip:  0.29 kB
dist/assets/AboutView-4d995ba2.css   0.09 kB │ gzip:  0.10 kB
dist/assets/index-c6ff3635.css       8.94 kB │ gzip:  2.59 kB
dist/assets/AboutView-e65f201b.js    0.29 kB │ gzip:  0.24 kB
dist/assets/index-5649da16.js       85.54 kB │ gzip: 33.70 kB
✓ built in 18.74s
```

### `dev.sh`

This script runs `bun run dev`. Development server will hosted on the port 5173. Port mapping is below.

|host|inside container|purpose|
|--|--|--|
|5173|5173|dev server|

```sh
$ ./dev.sh
port mapping is 5173:5173
$ vite --host

  VITE v4.4.9  ready in 2785 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: http://172.17.0.2:5173/
  ➜  press h to show help
```


### `test.sh`

This scripts runs Playwright tests and show reports.

It runs `npm run build` and `npm run test:e2e` which runs Playwright tests.
Then, it runs `npx playwright show-report`, so you can see the report in http://localhost:9323/.

Port mapping is below.

|host|inside container|purpose|
|--|--|--|
|9323|9323|Playwright reporter|

```sh
$ ./test.sh
port mapping is 9323:9323
test with npm run build && npm run test:e2e
then npx playwright show-report --host 0.0.0.0

> vue-app@0.0.0 build
> ./scripts/v.sh ; run-p type-check 'build-only -- {@}' --

commit ref:

> vue-app@0.0.0 type-check
> vue-tsc --noEmit -p tsconfig.vitest.json --composite false


> vue-app@0.0.0 build-only
> vite build

vite v4.4.9 building for production...
✓ 48 modules transformed.
dist/assets/logo-277e0e97.svg        0.28 kB │ gzip:  0.20 kB
dist/index.html                      0.42 kB │ gzip:  0.29 kB
dist/assets/AboutView-4d995ba2.css   0.09 kB │ gzip:  0.10 kB
dist/assets/index-c6ff3635.css       8.94 kB │ gzip:  2.59 kB
dist/assets/AboutView-e65f201b.js    0.29 kB │ gzip:  0.24 kB
dist/assets/index-5649da16.js       85.54 kB │ gzip: 33.70 kB
✓ built in 27.15s
npm notice
npm notice New major version of npm available! 9.6.7 -> 10.1.0
npm notice Changelog: https://github.com/npm/cli/releases/tag/v10.1.0
npm notice Run npm install -g npm@10.1.0 to update!
npm notice

> vue-app@0.0.0 test:e2e
> playwright test


Running 3 tests using 2 workers
  3 passed (42.4s)

To open last HTML report run:

  npx playwright show-report

you can see the report in http://localhost:9323/

  Serving HTML report at http://0.0.0.0:9323. Press Ctrl+C to quit.
```

### `docker-build.sh`

This script builds docker container if not exists. This is internally called from above scripts.

Usage is `./docker-build.sh name-of-built-container path/to/context/folder`

This sample runs `(cd .codesandbox; docker build -t bun .)` if the container image `bun:latest` does not found.


```sh
$ ./docker-build.sh bun .codesandbox
# ... build log
```

### `netlify.sh`

WIP

## Project Setup

```sh
bun install
```

### Compile and Hot-Reload for Development

```sh
bun run dev
```

### Type-Check, Compile and Minify for Production

```sh
bun run build
```

### Run Unit Tests with [Vitest](https://vitest.dev/)

```sh
bun run test:unit
```

### Run End-to-End Tests with [Playwright](https://playwright.dev)

```sh
# Install browsers for the first run
bunx playwright install

# When testing on CI, must build the project first
bun run build

# Runs the end-to-end tests
bun run test:e2e
# Runs the tests only on Chromium
bun run test:e2e -- --project=chromium
# Runs the tests of a specific file
bun run test:e2e -- tests/example.spec.ts
# Runs the tests in debug mode
bun run test:e2e -- --debug
```

### Lint with [ESLint](https://eslint.org/)

```sh
bun run lint
```
