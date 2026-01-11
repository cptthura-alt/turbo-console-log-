# Contributing to Haikus for Codespaces

Thank you for your interest in contributing to this project! We welcome contributions from everyone.

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker to report bugs
- Describe the issue in detail
- Include steps to reproduce the problem
- Mention your environment (OS, Node.js version, etc.)

### Submitting Changes

1. **Fork the Repository**
   - Fork the project to your own GitHub account
   - Clone your fork locally

2. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**
   - Write clear, concise commit messages
   - Follow the existing code style
   - Test your changes thoroughly

4. **Commit Your Changes**
   
   **Important:** All commits must be signed with a verified GPG or SSH key.
   
   To sign your commits:
   ```bash
   git add .
   git commit -S -m "Add a descriptive commit message"
   ```
   
   For automatic signing, configure Git:
   ```bash
   git config --global commit.gpgsign true
   ```
   
   See [GitHub's guide on signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification) for setup instructions.

5. **Push to Your Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Open a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Provide a clear description of your changes

## Code Style

- Use consistent indentation (2 spaces)
- Follow JavaScript best practices
- Comment your code when necessary
- Keep functions small and focused

## Development Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm run dev
   ```

## Testing

Before submitting a pull request:

1. Ensure your code runs without errors
2. Test all affected functionality
3. Verify the application starts correctly
4. Ensure all CI checks pass
5. Address any security vulnerabilities found during scanning

## Branch Protection and Pull Request Requirements

The `main` branch is protected with strict security rules:

- **Pull Request Reviews**: At least 1 approving review from a code owner is required
- **Status Checks**: All CI/CD checks must pass (build, test, security scan)
- **Signed Commits**: All commits must be cryptographically signed
- **No Direct Pushes**: Changes must go through pull requests
- **Administrator Enforcement**: Rules apply to all contributors, including administrators

### Before Submitting Your Pull Request

- [ ] All commits are signed with a verified GPG/SSH key
- [ ] Code follows the project's style guidelines
- [ ] Changes have been tested locally
- [ ] CI checks are passing
- [ ] No security vulnerabilities introduced
- [ ] Documentation updated (if applicable)
- [ ] Pull request description clearly explains the changes

See `.github/branch-protection.yml` for complete branch protection configuration and `SECURITY.md` for security requirements.

## Questions?

Feel free to open an issue if you have questions about contributing.
