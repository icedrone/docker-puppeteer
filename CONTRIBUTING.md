# Contributing to Docker Puppeteer

Thanks for your interest in contributing! This guide will help you get started.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [container-structure-test](https://github.com/GoogleContainerTools/container-structure-test)
- [goss / dgoss](https://github.com/goss-org/goss)
- Node.js (for running integration tests locally outside Docker)

## Getting Started

1. Fork and clone the repo
2. Create a feature branch from `master`:
   ```shell
   git checkout -b feat/my-feature
   ```
3. Build the image locally:
   ```shell
   docker build -t docker-puppeteer:local .
   ```

## Running Tests

### Container structure tests
Validates metadata, binaries, fonts, and environment variables:
```shell
container-structure-test test --image docker-puppeteer:local --config test/structure-test.yaml
```

### Runtime validation (goss/dgoss)
Validates packages, users, groups, and commands inside the running container:
```shell
dgoss run docker-puppeteer:local
```

### Integration tests
Runs Puppeteer-based tests for HTML rendering, PDF generation, screenshots, and timeouts:
```shell
docker run --rm -v "$(pwd)/test/integration:/app" -w /app docker-puppeteer:local sh -c "npm ci && npm test"
```

### Linting
```shell
# Dockerfile linting
docker run --rm -i hadolint/hadolint < Dockerfile

# Integration test linting
cd test/integration && npm run lint
```

## Commit Messages

This project uses [Conventional Commits](https://www.conventionalcommits.org/) enforced by commitlint. Format:

```
type(scope): description
```

Common types: `feat`, `fix`, `chore`, `docs`, `test`, `ci`

Examples:
```
feat: add Node 24 support
fix: resolve chromium crash on arm64
docs: update available tags section
test: add PDF content validation
```

## Pull Request Process

1. Ensure all tests pass locally
2. Keep PRs focused — one concern per PR
3. Update the README if your change affects usage or configuration
4. Use rebase workflow — do not merge `master` into your branch:
   ```shell
   git fetch origin
   git rebase origin/master
   ```
5. Open a PR against `master` with a clear description of what and why

## Project Structure

```
├── Dockerfile              # The image definition
├── test/
│   ├── structure-test.yaml # Container structure tests
│   ├── goss.yaml           # Runtime validation (amd64)
│   ├── goss-arm64.yaml     # Runtime validation (arm64)
│   └── integration/        # Vitest + Puppeteer tests
├── .github/workflows/      # CI/CD pipelines
└── release-please-config.json
```

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).
