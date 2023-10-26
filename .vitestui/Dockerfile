FROM node:18-slim

ENV NODE_PATH=/node_modules
WORKDIR /app
VOLUME "/app"
RUN npm install \
    vitest \
    @tsconfig/node18 \
    @types/jsdom \
    @types/node \
    @vitejs/plugin-vue \
    @vue/test-utils \
    @vue/tsconfig \
    jsdom \
    typescript \
    vite \
    vue-tsc \
    @vitest/ui \
    @vitest/coverage-v8 \
    && mv node_modules /
