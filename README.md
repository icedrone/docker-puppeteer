# Docker Puppeteer
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Known Vulnerabilities](https://snyk.io/test/github/icedrone/docker-puppeteer/badge.svg)](https://snyk.io/test/github/icedrone/docker-puppeteer)

### A ready to use "Google Puppeteer" docker image
This project is a light weight Google-Puppeteer docker image ready to launch out of the box.
> Supports alpine base image versions 14 and 16.
> Aditional versions are comming soon.

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
        executablePath: '/usr/bin/chromium-browser'
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
## 👨‍💻 Contributing
If you ❤️ the project fill free to help and contribute.
Pull-requests are welcome. 

## 💫 License
MIT © [License](LICENSE)
