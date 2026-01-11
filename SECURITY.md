# Security Policy

## Overview

The security of the Haikus for Codespaces project is a top priority. We appreciate your efforts to responsibly disclose security vulnerabilities and will make every effort to acknowledge your contributions.

## Supported Versions

We release patches for security vulnerabilities for the following versions:

| Version | Supported          | Status |
| ------- | ------------------ | ------ |
| 0.0.1   | :white_check_mark: | Current stable release |
| < 0.0.1 | :x:                | No longer supported |

**Note**: We recommend always using the latest version to ensure you have the most recent security updates.

## Reporting a Vulnerability

If you discover a security vulnerability within this project, please follow these guidelines:

### Reporting Process

1. **DO NOT** report security vulnerabilities through public GitHub issues, discussions, or pull requests
2. **DO** report vulnerabilities privately using one of the following methods:
   - **Preferred**: Use GitHub's [Security Advisories](https://github.com/cptthura-alt/turbo-console-log-/security/advisories/new) feature
   - **Alternative**: Send an email to the repository maintainer with the subject line "SECURITY: [Brief Description]"

### Information to Include

To help us better understand and resolve the issue, please include as much of the following information as possible:

#### Required Information
- **Type of vulnerability** (e.g., XSS, SQL injection, authentication bypass, etc.)
- **Severity assessment** (critical, high, medium, low)
- **Full paths of affected source file(s)**
- **Location of affected code** (tag/branch/commit or direct URL)
- **Step-by-step instructions to reproduce the issue**
- **Impact of the vulnerability** (what an attacker could accomplish)

#### Optional but Helpful
- **Proof-of-concept or exploit code** (if available)
- **Special configuration required** to reproduce
- **Affected versions or version range**
- **Suggested remediation** (if you have one)
- **Any mitigating factors** that reduce severity

### Example Report Format

```
Subject: SECURITY: Cross-Site Scripting in Content Display

Vulnerability Type: Cross-Site Scripting (XSS)
Severity: High
Affected Component: /views/index.ejs, line 15

Description:
User-supplied content is rendered without proper escaping,
allowing injection of malicious JavaScript.

Reproduction Steps:
1. Add content with malicious payload: <script>alert('XSS')</script>
2. Visit the affected page
3. JavaScript executes in user's browser

Impact:
Attackers could steal session cookies, perform actions as the user,
or deface the page for other visitors.

Suggested Fix:
Use EJS's <%= %> syntax instead of <%- %> for user-supplied content
to ensure automatic HTML escaping.
```

## Response Timeline

We are committed to responding to security reports promptly:

| Stage | Timeline | Description |
|-------|----------|-------------|
| **Initial Response** | Within 48 hours | Acknowledgment of your report |
| **Assessment** | Within 7 days | Initial vulnerability assessment and severity rating |
| **Status Update** | Every 7 days | Regular updates on progress |
| **Resolution** | Varies | Fix development and testing (depends on severity and complexity) |
| **Disclosure** | Coordinated | Public disclosure after fix is available |

### Severity-Based Response

- **Critical**: Immediate response, fix within 24-48 hours
- **High**: Fix within 1 week
- **Medium**: Fix within 2-4 weeks
- **Low**: Fix in next regular release

## Vulnerability Disclosure Policy

### Our Commitment

- We will respond to your report within 48 hours with next steps
- We will keep you informed about our progress
- We will credit you for the discovery (unless you prefer to remain anonymous)
- We will not take legal action against security researchers who:
  - Report vulnerabilities responsibly
  - Avoid privacy violations and data destruction
  - Give us reasonable time to fix issues before public disclosure

### Public Disclosure

- **Coordinated Disclosure**: We will work with you to coordinate public disclosure
- **Typical Timeline**: 90 days after initial report or when fix is deployed, whichever comes first
- **Early Disclosure**: May occur if vulnerability is being actively exploited
- **Credit**: Security researchers will be credited in release notes and security advisories (unless anonymity is requested)

## Security Update Policy

### How We Handle Security Updates

1. **Patch Development**: Create fix in private repository fork
2. **Testing**: Thoroughly test the fix
3. **Security Advisory**: Publish GitHub Security Advisory
4. **Release**: Deploy patched version with security notes
5. **Notification**: Notify users through:
   - GitHub Security Advisories
   - Release notes
   - Repository README (if severity warrants)

### Applying Security Updates

Users should:
- Monitor GitHub Security Advisories for this repository
- Enable GitHub's "Watch" feature for security updates
- Update to the latest version promptly when security releases are published
- Review release notes for security-related changes

## Security Best Practices for Contributors

When contributing to this project, please follow these security practices:

### Code Security

1. **Input Validation**
   - Validate all user inputs
   - Sanitize data before rendering in templates
   - Use parameterized queries (if applicable)
   - Implement proper error handling

2. **Authentication & Authorization**
   - Use secure session management
   - Implement proper access controls
   - Never hardcode credentials

3. **Data Protection**
   - Use HTTPS in production
   - Encrypt sensitive data at rest and in transit
   - Follow data minimization principles
   - Implement proper logging (without sensitive data)

4. **Dependencies**
   - Keep dependencies up to date
   - Review security advisories for dependencies
   - Use `npm audit` to check for vulnerabilities
   - Remove unused dependencies

5. **Code Quality**
   - Follow secure coding guidelines
   - Perform code reviews with security in mind
   - Use linters and static analysis tools
   - Avoid dangerous functions (eval, innerHTML, etc.)

### Secrets Management

**NEVER commit sensitive data:**
- API keys or tokens
- Passwords or credentials
- Private keys
- Database connection strings
- Environment-specific configuration

**Instead:**
- Use environment variables (`.env` files, ignored by git)
- Use secret management services
- Document required environment variables in README
- Provide example configuration files (`.env.example`)

### Common Vulnerabilities to Avoid

| Vulnerability | Prevention |
|--------------|------------|
| **XSS (Cross-Site Scripting)** | Use `<%= %>` in EJS templates; sanitize user input |
| **Injection Attacks** | Use parameterized queries; validate input |
| **Insecure Dependencies** | Run `npm audit`; keep packages updated |
| **Sensitive Data Exposure** | Never log secrets; use environment variables |
| **Missing Access Controls** | Implement authentication; validate permissions |
| **CSRF** | Use CSRF tokens for state-changing operations |

## Security Checklist for Pull Requests

Before submitting a PR, ensure:

- [ ] No secrets or credentials are committed
- [ ] User inputs are properly validated and sanitized
- [ ] Dependencies are up to date (`npm audit` passes)
- [ ] No new security warnings are introduced
- [ ] Error messages don't leak sensitive information
- [ ] Security best practices are followed
- [ ] Changes have been tested for security implications

## Security Tools and Resources

### Recommended Tools

- **npm audit**: Check for known vulnerabilities in dependencies
  ```bash
  npm audit
  npm audit fix  # Apply automatic fixes (review changes first)
  ```
  **Note**: Always review changes before applying `npm audit fix` as it may introduce breaking changes.

- **Dependabot**: Automated dependency updates (enabled in this repo)
- **GitHub Code Scanning**: Automated security analysis
- **OWASP Resources**: Web application security guidelines

### Security Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Node.js Security Best Practices](https://nodejs.org/en/docs/guides/security/)
- [npm Security Best Practices](https://docs.npmjs.com/auditing-package-dependencies-for-security-vulnerabilities)
- [Express Security Best Practices](https://expressjs.com/en/advanced/best-practice-security.html)

## Scope

### In Scope

The following are within the scope of our security policy:

- Server-side vulnerabilities (Node.js/Express)
- Client-side vulnerabilities (XSS, CSRF)
- Dependency vulnerabilities
- Authentication and authorization issues
- Data validation and sanitization issues
- Configuration vulnerabilities

### Out of Scope

The following are outside our security scope:

- Social engineering attacks
- Physical security
- Denial of Service (DoS) attacks
- Issues in third-party services or dependencies (report to the respective project)
- Theoretical vulnerabilities without proof of concept

## Acknowledgments

We would like to thank the following security researchers for responsibly disclosing vulnerabilities:

<!-- Security researchers who report valid vulnerabilities will be listed here -->

*No vulnerabilities have been reported yet.*

## Contact

For security-related questions that are not vulnerability reports:
- Open a GitHub Discussion with the "security" category
- Consult the [CONTRIBUTING.md](CONTRIBUTING.md) file

For urgent security concerns, use the vulnerability reporting process described above.

## Policy Updates

This security policy may be updated from time to time. We will announce significant changes through:
- GitHub releases
- Repository README
- Security advisories (if applicable)

**Last Updated**: 2026-01-11

---

Thank you for helping keep Haikus for Codespaces and its users safe!
