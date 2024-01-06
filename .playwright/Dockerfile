FROM mcr.microsoft.com/playwright:v1.40.1-jammy

# Install bun and add it to PATH
ENV VER_bun=v1.0.20
RUN apt update -y && apt install -y curl unzip \
  && curl -fsSL https://bun.sh/install | bash -s "bun-${VER_bun}" \
  && mv ~/.bun/bin/bun /usr/local/bin \
  && cd /usr/local/bin \
  && ln -s bun bunx

ENV NODE_PATH=/node_modules
WORKDIR /app
ADD package.json /app/
RUN bun install \
    && bunx playwright install chrome \
    && bunx playwright install msedge \
    && mv node_modules /
VOLUME "/app"
