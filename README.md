# Docker Puppeteer
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Known Vulnerabilities](https://snyk.io/test/github/icedrone/docker-puppeteer/badge.svg)](https://snyk.io/test/github/icedrone/docker-puppeteer)

### A ready to use Puppeteer docker image
This project is a lightweight Puppeteer/Chromium docker image ready to launch out of the box.
> Supports Node.js 20, 22, and 24 on Alpine Linux.

> **Architectures:** `amd64` and `arm64`.

## 🚀 Install
```shell
docker pull icedrone/docker-puppeteer:latest
```

## 🔧 Configuration
Install `puppeteer-core` (not `puppeteer`) since the image ships with system Chromium:

```shell
npm install puppeteer-core
```

Example:
```js
const puppeteer = require('puppeteer-core');

const browser = await puppeteer.launch(
    {
        executablePath: '/usr/bin/chromium-browser',
        args: ['--no-sandbox', '--disable-setuid-sandbox', '--disable-dev-shm-usage']
    }
);
```

> **Note:** `--no-sandbox` is required because Chromium's sandbox needs kernel capabilities not available in most containers. The container already runs as a non-root user (`pptruser`) which limits the blast radius. Avoid processing untrusted HTML/URLs without additional isolation.
>
> `--disable-dev-shm-usage` is recommended to prevent Chromium crashes caused by Docker's default 64MB `/dev/shm` limit.

### Pre-configured environment variables
The following are already set in the image — no need to configure them manually:

| Variable | Value |
|----------|-------|
| `CHROME_BIN` | `/usr/bin/chromium-browser` |
| `PUPPETEER_EXECUTABLE_PATH` | `/usr/bin/chromium-browser` |
| `PUPPETEER_SKIP_CHROMIUM_DOWNLOAD` | `true` |
| `PUPPETEER_SKIP_DOWNLOAD` | `true` |

### Included fonts
Noto Sans CJK, Noto Color Emoji, DejaVu, FreeFonts, Inconsolata, Linux Libertine — supporting CJK characters, emoji, and Latin scripts out of the box.

### Container details
- Runs as non-root user `pptruser` (UID 1001)
- Working directory: `/app`
- Uses `tini` as PID 1 for proper signal handling
- Available on both **Docker Hub** and **GitHub Container Registry**:
  ```shell
  docker pull icedrone/docker-puppeteer:latest
  docker pull ghcr.io/icedrone/docker-puppeteer:latest
  ```

## 💾 Usage
```dockerfile
FROM icedrone/docker-puppeteer:latest
```

## ⚡️ Quick start example
```dockerfile
FROM icedrone/docker-puppeteer:latest
COPY --chown=pptruser:pptruser . .
RUN npm ci
CMD ["node", "index.js"]
```

> **Note:** Always use `--chown=pptruser:pptruser` with `COPY` and `ADD` instructions.
> The image runs as non-root user `pptruser`, so files copied without `--chown` will be
> owned by root and may not be readable or writable by the application.
## 🏷️ Available Tags
All tags include a Node version suffix. Short aliases without `-alpine` are also available since Alpine is the default.

Bare semver tags (e.g. `1.0.0`) always point to the default Node version (currently 22 Alpine).

- `latest` — default image (currently Node 22 Alpine)
- `1.0.0` — specific semver release (default Node version)
- `1.0` — latest patch for a given major.minor
- `1` — latest minor and patch for a given major
- `22` or `22-alpine` — latest build for Node 22
- `latest-22` or `latest-22-alpine` — same as above, explicit form
- `1.0.0-22-alpine` — specific semver release pinned to a Node version
- `sha-a1b2c3d-22-alpine` — built from a specific commit

Replace `22` with `20` or `24` for other Node versions.

## 👨‍💻 Contributing
If you ❤️ the project feel free to help and contribute.
Pull-requests are welcome. 

## 💫 License
MIT © [License](LICENSE)
