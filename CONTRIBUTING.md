# Contributing to Haikus for Codespaces

Thank you for your interest in contributing to this project! We welcome contributions from everyone and are grateful for even the smallest of improvements.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Enhancements](#suggesting-enhancements)
  - [Contributing Code](#contributing-code)
- [Development Workflow](#development-workflow)
- [Code Style Guidelines](#code-style-guidelines)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Pull Request Process](#pull-request-process)
- [Community Guidelines](#community-guidelines)

## Code of Conduct

This project and everyone participating in it is governed by our commitment to providing a welcoming and inspiring community for all. Please be respectful and constructive in all interactions.

### Our Standards

- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

## How Can I Contribute?

### Reporting Bugs

Bugs are tracked as [GitHub issues](https://github.com/cptthura-alt/turbo-console-log-/issues). Before creating a bug report, please check existing issues to avoid duplicates.

When reporting a bug, please use the bug report template and include:

- A clear and descriptive title
- Detailed steps to reproduce the issue
- Expected behavior vs. actual behavior
- Your environment (OS, Node.js version, browser)
- Screenshots or error messages if applicable
- Any additional context that might be helpful

### Suggesting Enhancements

Enhancement suggestions are also tracked as [GitHub issues](https://github.com/cptthura-alt/turbo-console-log-/issues). When suggesting an enhancement:

- Use a clear and descriptive title
- Provide a detailed description of the proposed feature
- Explain why this enhancement would be useful
- Include examples of how the feature would be used
- List any alternatives you've considered

### Contributing Code

We actively welcome your pull requests! Here's how to get started:

1. **Check existing issues and PRs** to see if someone is already working on it
2. **For major changes**, open an issue first to discuss your proposed changes
3. **For minor fixes or improvements**, feel free to submit a PR directly

## Development Workflow

### Initial Setup

1. **Fork the Repository**
   ```bash
   # Fork via GitHub UI, then clone your fork
   git clone https://github.com/YOUR-USERNAME/turbo-console-log-.git
   cd turbo-console-log-
   ```

2. **Add Upstream Remote**
   ```bash
   git remote add upstream https://github.com/cptthura-alt/turbo-console-log-.git
   ```

3. **Install Dependencies**
   ```bash
   npm install
   ```

4. **Verify Setup**
   ```bash
   npm start
   # Visit http://localhost:3000 to ensure it's working
   ```

### Making Changes

1. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

2. **Make Your Changes**
   - Write clean, readable code
   - Follow the existing code style
   - Add comments for complex logic
   - Keep changes focused and atomic

3. **Test Your Changes**
   ```bash
   # Start the development server
   npm run dev
   
   # Test all affected functionality
   # Verify the application starts without errors
   # Check browser console for errors
   ```

4. **Keep Your Branch Updated**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

## Code Style Guidelines

### JavaScript Style

- **Indentation**: Use 2 spaces (no tabs)
- **Semicolons**: Use semicolons at the end of statements
- **Quotes**: Use single quotes for strings (except to avoid escaping)
- **Variables**: Use `const` by default, `let` when reassignment is needed
- **Naming Conventions**:
  - `camelCase` for variables and functions
  - `PascalCase` for classes
  - `UPPER_SNAKE_CASE` for constants

### Code Quality

- Keep functions small and focused (single responsibility)
- Use meaningful variable and function names
- Avoid deep nesting (max 3-4 levels)
- Comment complex logic, but prefer self-documenting code
- Remove commented-out code and console.logs before committing
- Handle errors appropriately

### File Organization

- Place related functionality together
- Keep files reasonably sized
- Use clear, descriptive file names

## Commit Message Guidelines

Write clear, descriptive commit messages that explain what and why:

### Format

```
<type>: <subject>

<body (optional)>

<footer (optional)>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, missing semicolons, etc.)
- **refactor**: Code changes that neither fix bugs nor add features
- **perf**: Performance improvements
- **test**: Adding or updating tests
- **chore**: Maintenance tasks (dependency updates, etc.)

### Examples

```
feat: add haiku filtering by author

Add a new filter option to display haikus by a specific author.
This helps users find content from their favorite poets.

Closes #123
```

```
fix: correct port configuration in production

The app was using hardcoded port 3000 instead of PORT env variable,
causing deployment failures.
```

## Pull Request Process

### Before Submitting

- [ ] Test your changes thoroughly
- [ ] Update documentation if needed
- [ ] Ensure code follows style guidelines
- [ ] Write clear commit messages
- [ ] Rebase on latest main branch
- [ ] Check for any security vulnerabilities

### Submitting Your PR

1. **Push Your Branch**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Open a Pull Request**
   - Go to the repository on GitHub
   - Click "New Pull Request"
   - Select your branch
   - Fill out the PR template completely
   - Link related issues

3. **PR Title**: Use a clear, descriptive title
   ```
   Good: "Add haiku search functionality"
   Bad: "Update index.js"
   ```

4. **PR Description**: Include:
   - What changes were made and why
   - Type of change (bug fix, feature, etc.)
   - Testing performed
   - Screenshots for UI changes
   - Related issue numbers

### Review Process

- Maintainers will review your PR within a few days
- Address any requested changes promptly
- Keep discussions respectful and constructive
- Be open to feedback and suggestions
- Once approved, a maintainer will merge your PR

### After Your PR is Merged

- Delete your feature branch (both locally and on GitHub)
- Update your local main branch:
  ```bash
  git checkout main
  git pull upstream main
  ```

## Community Guidelines

### Getting Help

- **Questions**: Open a GitHub issue with the "question" label
- **Discussions**: Use GitHub Discussions for general conversations
- **Security Issues**: See [SECURITY.md](SECURITY.md) for reporting vulnerabilities

### Recognition

We value all contributions and will:
- Credit contributors in release notes
- Respond to issues and PRs in a timely manner
- Provide constructive feedback
- Foster a welcoming community

### Best Practices

- Be patient with review times - maintainers are often volunteers
- Keep PRs focused on a single concern
- Write tests for new features when applicable
- Update documentation for user-facing changes
- Be respectful of different skill levels and backgrounds

## Development Resources

### Useful Commands

```bash
# Start development server with auto-reload
npm run dev

# Start production server
npm start

# Install dependencies
npm install

# Check for outdated packages
npm outdated
```

### Project Structure

```
turbo-console-log-/
├── .github/          # GitHub configuration and templates
├── public/           # Static assets (CSS, images)
├── views/            # EJS templates
├── index.js          # Main application file
├── haikus.json       # Haiku data
├── package.json      # Project metadata and dependencies
└── README.md         # Project documentation
```

### Technology Stack

- **Runtime**: Node.js
- **Framework**: Express.js
- **Template Engine**: EJS
- **Development**: Nodemon for auto-reload

## Questions or Suggestions?

We're here to help! If you have questions about contributing:

- Open an issue with the "question" label
- Reach out to the maintainers
- Check existing issues and PRs for similar questions

Thank you for contributing to Haikus for Codespaces! Your efforts help make this project better for everyone. 🎉
