
# Haikus for Codespaces

This is a quick node project template for demoing Codespaces. It is based on the [Azure node sample](https://github.com/Azure-Samples/nodejs-docs-hello-world). It's great!!!

Point your browser to [Quickstart for GitHub Codespaces](https://docs.github.com/en/codespaces/getting-started/quickstart) for a tour of using Codespaces with this repo.

## 🚀 Features

- **Express.js Web Server**: Lightweight and fast Node.js web server
- **EJS Templating**: Dynamic HTML rendering for haiku display
- **Console Logging**: Comprehensive logging with informative status messages
  - Startup information with configuration details
  - Request tracking for monitoring
  - Server status and environment information
- **Static File Serving**: CSS and images served efficiently
- **Responsive Design**: Mobile-friendly haiku viewing experience

## 📋 Getting Started

### Prerequisites

- Node.js (16.x, 18.x, or 20.x)
- npm (comes with Node.js)

### Installation

```bash
# Clone the repository
git clone https://github.com/cptthura-alt/turbo-console-log-.git
cd turbo-console-log-

# Install dependencies
npm install

# Start the application
npm start
```

The server will start on `http://localhost:3000` with detailed console output showing:
- Application initialization status
- Number of haikus loaded
- Server configuration and environment
- Request logs for monitoring

### Development Mode

For development with auto-reload:

```bash
npm run dev
```

## 🔒 Security

This repository has comprehensive GitHub security features enabled. See [SECURITY_CONFIGURATION_SUMMARY.md](SECURITY_CONFIGURATION_SUMMARY.md) for complete details.

**Enabled Security Features**:
- ✅ CodeQL Code Scanning (automated security analysis)
- ✅ Dependency Review (PR checks for vulnerable dependencies)
- ✅ OpenSSF Scorecards (security best practices assessment)
- ✅ Dependabot (automated dependency updates)
- ✅ CI/CD Security Scanning (npm audit + Trivy)

For vulnerability reporting, see [SECURITY.md](SECURITY.md).
