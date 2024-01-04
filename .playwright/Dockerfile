FROM mcr.microsoft.com/playwright:v1.40.1-jammy

# Install bun and add it to PATH
RUN apt update -y && apt install -y curl unzip \
  && curl -fsSL https://bun.sh/install | bash \
  && mv ~/.bun/bin/bun /usr/local/bin \
  && cd /usr/local/bin \
  && ln -s bun bunx
