# Contributing to Haikus for Codespaces

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and collaborative environment for all contributors.

## How to Contribute

### Reporting Issues

- Search existing issues before creating a new one to avoid duplicates
- Provide a clear and descriptive title
- Include detailed steps to reproduce the issue
- Describe the expected and actual behavior
- Include relevant logs, screenshots, or code snippets

### Suggesting Enhancements

- Use a clear and descriptive title for the issue
- Provide a detailed description of the suggested enhancement
- Explain why this enhancement would be useful
- Include examples of how the enhancement would work

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Make your changes**:
   - Follow the existing code style
   - Keep changes focused and atomic
   - Write clear, descriptive commit messages
3. **Test your changes**:
   - Ensure the application runs correctly: `npm start`
   - Test in a development environment: `npm run dev`
4. **Submit your pull request**:
   - Use a clear and descriptive title
   - Provide a detailed description of your changes
   - Reference any related issues
   - Wait for review from maintainers

## Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/cptthura-alt/turbo-console-log-.git
   cd turbo-console-log-
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Run the application:
   ```bash
   npm start
   ```

4. For development with auto-reload:
   ```bash
   npm run dev
   ```

## Code Style

- Use consistent indentation (spaces, not tabs)
- Follow JavaScript best practices
- Keep functions small and focused
- Use meaningful variable and function names
- Add comments for complex logic

## Project Structure

- `index.js` - Main application entry point
- `haikus.json` - Haiku data storage
- `views/` - EJS templates
- `public/` - Static assets
- `.github/workflows/` - CI/CD workflows

## Questions?

If you have questions about contributing, feel free to open an issue for discussion.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
