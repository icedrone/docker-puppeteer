ARG NODE_VERSION="lts-alpine"
FROM node:${NODE_VERSION}

ARG VERSION="dev"

LABEL org.opencontainers.image.title="docker-puppeteer" \
      org.opencontainers.image.description="Lightweight Puppeteer/Chromium Docker image on Alpine" \
      org.opencontainers.image.url="https://github.com/icedrone/docker-puppeteer" \
      org.opencontainers.image.source="https://github.com/icedrone/docker-puppeteer" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.version="${VERSION}"

WORKDIR /app

ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true" \
    PUPPETEER_SKIP_DOWNLOAD="true" \
    PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

RUN apk upgrade --no-cache && \
    apk add --no-cache \
    chromium \
    tini \
    font-noto-cjk \
    font-noto-emoji \
    ttf-dejavu \
    ttf-freefont \
    ttf-inconsolata \
    ttf-linux-libertine \
    && fc-cache -f \
    && npm install -g npm@10 \
    && npm install -g npm@11 \
    && npm cache clean --force

RUN addgroup -S -g 1001 pptruser && adduser -S -G pptruser -u 1001 pptruser \
    && chown -R pptruser:pptruser /app

USER pptruser

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node"]
