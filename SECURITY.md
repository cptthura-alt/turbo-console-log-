# Security Policy

## Supported Versions

We release patches for security vulnerabilities. Which versions are eligible for receiving such patches depends on the CVSS v3.0 Rating:

| Version | Supported          |
| ------- | ------------------ |
| 0.0.1   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability within this project, please send an email to the repository maintainer. All security vulnerabilities will be promptly addressed.

**Please do not report security vulnerabilities through public GitHub issues.**

### What to Include

- Type of issue (e.g., buffer overflow, SQL injection, cross-site scripting, etc.)
- Full paths of source file(s) related to the manifestation of the issue
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit it

### Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Depends on severity and complexity

## Branch Protection Rules

To maintain code quality and security, the `main` branch is protected with the following rules:

### Required Pull Request Reviews
- At least 1 approving review required before merging
- Stale reviews are dismissed when new commits are pushed
- Review from code owners is required (see CODEOWNERS file)

### Required Status Checks
- All CI/CD checks must pass before merging
- Branches must be up to date with the base branch
- Required checks include:
  - build-and-test (Node.js 16.x, 18.x, 20.x)
  - security-scan

### Commit Signing
- All commits must be signed with a verified GPG or SSH key
- Unsigned commits will be rejected
- See [GitHub's guide on signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification)

### Push Restrictions
- Direct pushes to the main branch are restricted
- All changes must go through pull requests
- Force pushes are not allowed
- Branch deletion is not allowed

### Administrator Enforcement
- Protection rules apply to repository administrators
- No exceptions for emergency bypasses without proper audit trail

### Additional Requirements
- Conversation resolution required before merging
- Linear history preferred to maintain clear audit trail

For detailed configuration, see `.github/branch-protection.yml`

## Security Best Practices

When contributing to this project:

1. Keep dependencies up to date
2. Follow secure coding practices
3. Never commit secrets, API keys, or sensitive data
4. Use environment variables for configuration
5. Validate and sanitize all user inputs
6. Follow the principle of least privilege
7. Sign all commits with GPG or SSH keys
8. Ensure all CI checks pass before requesting review
9. Address all security findings before merging
