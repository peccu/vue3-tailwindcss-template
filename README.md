# vue-app

This template should help get you started developing with Vue 3 in Vite.

## Uses

- Vue3 + Vite + Playwright
  - `bun create vue@latest .`
- TailwindCSS
  - `bun add -d tailwindcss postcss autoprefixer`

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
|5555|5173|dev server|
|4173|4173|Playwright reporter|

```sh
$ ./shell.sh
port mapping is 5555:5173 4173:4173
root@90cbb764e199:/app# #You can use bun here
```

### `build.sh`

WIP

### `dev.sh`

WIP

### `test.sh`

WIP

### `docker-build.sh`

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
