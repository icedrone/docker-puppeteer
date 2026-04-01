# Docker Puppeteer
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Known Vulnerabilities](https://snyk.io/test/github/icedrone/docker-puppeteer/badge.svg)](https://snyk.io/test/github/icedrone/docker-puppeteer)

### A ready to use "Google Puppeteer" docker image
This project is a light weight Google-Puppeteer docker image ready to launch out of the box.
> Supports alpine base image versions 18, 20 and 22.
> Additional versions are coming soon.

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
        args: ['--no-sandbox', '--disable-setuid-sandbox']
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
- `latest` - the most recent stable build
- `1.0.0` - specific semver release
- `1.0` - latest patch for a given major.minor
- `1` - latest minor and patch for a given major
- SHA-based tags (e.g. `sha-a1b2c3d`) - built from a specific commit

## 👨‍💻 Contributing
If you ❤️ the project feel free to help and contribute.
Pull-requests are welcome. 

## 💫 License
MIT © [License](LICENSE)
