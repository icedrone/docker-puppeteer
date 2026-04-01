ARG NODE_VERSION="lts-alpine"
FROM node:${NODE_VERSION}

LABEL org.opencontainers.image.title="docker-puppeteer" \
      org.opencontainers.image.description="Lightweight Puppeteer/Chromium Docker image on Alpine" \
      org.opencontainers.image.url="https://github.com/icedrone/docker-puppeteer" \
      org.opencontainers.image.source="https://github.com/icedrone/docker-puppeteer" \
      org.opencontainers.image.licenses="MIT"

WORKDIR /app

ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true" \
    PUPPETEER_SKIP_DOWNLOAD="true" \
    PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

RUN apk add --no-cache \
    chromium \
    tini \
    font-noto-cjk \
    font-noto-emoji \
    ttf-dejavu \
    ttf-freefont \
    ttf-inconsolata \
    ttf-linux-libertine \
    && fc-cache -f

RUN addgroup -S pptruser && adduser -S -G pptruser pptruser \
    && chown -R pptruser:pptruser /app

USER pptruser

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node"]
