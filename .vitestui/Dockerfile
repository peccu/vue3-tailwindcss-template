FROM node:lts-slim

ENV NODE_PATH=/node_modules
WORKDIR /app
ADD package.json /app/
RUN npm install \
    && mv node_modules /
VOLUME "/app"
