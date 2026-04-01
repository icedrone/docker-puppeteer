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

## 🛑 Configuration
Change `executablePath` value to the chromium-browser location.

Example:
```js
const browser = await puppeteer.launch(
    {
        executablePath: '/usr/bin/chromium-browser',
        args: ['--no-sandbox', '--disable-setuid-sandbox', '--disable-dev-shm-usage']
    }
);
```

## 💾 Usage
```dockerfile
FROM icedrone/docker-puppeteer:latest
```

## ⚡️ Quick start example
```dockerfile
FROM icedrone/docker-puppeteer:latest
COPY . .
CMD ["node", "index.js"]
```
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
