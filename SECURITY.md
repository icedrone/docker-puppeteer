# Security Policy

## Supported Versions

Only the latest release is actively supported with security updates.

## Reporting a Vulnerability

If you discover a security vulnerability in this project, please report it responsibly:

1. **Do not** open a public GitHub issue.
2. Email the maintainers or use [GitHub's private vulnerability reporting](https://github.com/icedrone/docker-puppeteer/security/advisories/new).
3. Include a description of the vulnerability and steps to reproduce.

We aim to acknowledge reports within 48 hours and provide a fix timeline within 7 days.

## Security Practices

- Docker images are scanned with [Trivy](https://github.com/aquasecurity/trivy) on every build.
- Published images include SBOM and provenance attestations.
- Downloaded CI binaries are verified with SHA256 checksums.
- The container runs as a non-root user (`pptruser`).
