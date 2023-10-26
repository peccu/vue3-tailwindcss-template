FROM node:18-slim

ENV NODE_PATH=/node_modules
WORKDIR /app
VOLUME "/app"
RUN npm install \
    vitest \
    @vitest/ui \
    @vitest/coverage-v8 \
    && mv node_modules /
