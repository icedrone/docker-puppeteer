ARG NODE_VERSION="lts-alpine"
FROM node:$NODE_VERSION

WORKDIR /app
ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

RUN apk update && \
    apk upgrade && \
    apk add chromium  \
    font-noto-cjk  \
    font-noto-emoji \
    terminus-font  \
    ttf-dejavu  \
    ttf-freefont  \
    ttf-font-awesome \
    ttf-inconsolata ttf-linux-libertine \
    && fc-cache -f \
    && rm -rf /var/lib/apt/lists/*
