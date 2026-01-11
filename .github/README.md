# Branch Protection Implementation

This directory contains configuration files and documentation for enforcing strong branch protection rules on the `main` branch.

## Files Overview

### Configuration Files

- **`branch-protection.yml`** - Complete branch protection policy configuration in YAML format
  - Documents all required protection rules
  - Serves as a reference for repository administrators
  - Can be used with GitHub API/CLI to apply settings programmatically

### Workflows

- **`workflows/branch-protection.yml`** - GitHub Actions workflow for validation
  - Validates that required configuration files exist
  - Displays branch protection requirements
  - Can be triggered manually to check compliance
  - No destructive operations - validation only

### Documentation

- **`BRANCH_PROTECTION_GUIDE.md`** - Comprehensive setup guide
  - Step-by-step instructions for administrators
  - Multiple methods for applying settings (Web UI, CLI, API)
  - Troubleshooting guide
  - Validation procedures
  - Additional security measures

### Scripts

- **`setup-branch-protection.sh`** - Bash script for administrators
  - Interactive setup assistance
  - Dry-run mode for testing
  - Validates GitHub CLI installation and authentication
  - Displays configuration that will be applied

## Quick Start for Administrators

### 1. Review Configuration

```bash
# View the branch protection policy
cat .github/branch-protection.yml

# Review the setup guide
cat .github/BRANCH_PROTECTION_GUIDE.md
```

### 2. Apply Settings via Web Interface

1. Go to repository Settings → Branches
2. Click "Add rule" for `main` branch
3. Configure according to `branch-protection.yml`
4. Save changes

### 3. Validate Configuration

```bash
# Run the validation workflow (requires GitHub CLI)
gh workflow run branch-protection.yml

# Or use the setup script in dry-run mode
./.github/setup-branch-protection.sh --dry-run
```

## Required Branch Protection Rules

The following rules must be configured for the `main` branch:

### ✅ Pull Request Reviews
- Require 1 approving review
- Dismiss stale reviews on new commits
- Require code owner reviews (see `CODEOWNERS` file)

### ✅ Status Checks
- Require all CI checks to pass:
  - `build-and-test (16.x)`
  - `build-and-test (18.x)`
  - `build-and-test (20.x)`
  - `security-scan`
- Require branches to be up to date before merging

### ✅ Signed Commits
- All commits must be cryptographically signed
- Unsigned commits will be rejected

### ✅ Administrator Enforcement
- Rules apply to all users including administrators
- No bypass exceptions

### ✅ Push Restrictions
- Direct pushes to `main` are blocked
- All changes must go through pull requests
- Force pushes are disabled
- Branch deletion is disabled

### ✅ Additional Requirements
- Conversation resolution required before merge
- Linear history preferred (optional)

## Security Best Practices

This implementation follows GitHub security best practices:

1. **Defense in Depth** - Multiple layers of protection
2. **Least Privilege** - Restrict direct branch access
3. **Code Review** - Mandatory peer review process
4. **Automated Testing** - CI/CD checks must pass
5. **Audit Trail** - Signed commits verify identity
6. **Administrator Accountability** - No exceptions for admins

## Integration with Other Security Features

Branch protection works together with:

- **Dependabot** - Automated dependency updates (configured in `dependabot.yml`)
- **CodeQL** - Code security scanning
- **Secret Scanning** - Prevent credential leaks
- **Code Owners** - Define review requirements (configured in `CODEOWNERS`)
- **Status Checks** - CI/CD validation (configured in `workflows/ci.yml`)

## For Contributors

See the following files for contributor requirements:

- `CONTRIBUTING.md` - How to contribute with signed commits
- `SECURITY.md` - Security policy and practices
- Pull request template - Guidelines for submissions

## Compliance and Auditing

Branch protection settings should be audited regularly:

- Review protection rules monthly
- Verify no bypass permissions exist
- Check audit logs for configuration changes
- Ensure all contributors have commit signing enabled
- Validate CI/CD pipelines are functioning

Audit logs are available at: Settings → Logs → Audit log

## Support and Questions

For assistance with branch protection:

1. Review `BRANCH_PROTECTION_GUIDE.md` for detailed instructions
2. Check GitHub's [official documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
3. Open an issue in this repository
4. Contact repository administrators

## References

- [GitHub Branch Protection Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
- [About Protected Branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [Signing Commits](https://docs.github.com/en/authentication/managing-commit-signature-verification)
- [Status Checks](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/collaborating-on-repositories-with-code-quality-features/about-status-checks)
- [Code Owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
