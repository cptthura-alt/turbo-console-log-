# Branch Protection Setup Guide

This document provides instructions for repository administrators to configure branch protection rules for the `main` branch.

## Overview

Branch protection rules are security controls that enforce specific workflows and prevent unauthorized changes to important branches. This repository requires strong branch protection on the `main` branch to maintain code quality and security.

## Required Branch Protection Rules

The following rules must be configured for the `main` branch:

### 1. Require Pull Request Reviews Before Merging

**Settings:**
- ✅ Require approvals: **1 required approving review**
- ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ Require review from Code Owners
- ❌ Restrict who can dismiss pull request reviews (optional)
- ❌ Require approval of the most recent reviewable push

**Purpose:** Ensures all changes are reviewed by at least one other person before merging.

### 2. Require Status Checks to Pass Before Merging

**Settings:**
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- **Required status checks:**
  - `build-and-test (16.x)`
  - `build-and-test (18.x)`
  - `build-and-test (20.x)`
  - `security-scan`

**Purpose:** Ensures code quality through automated testing and security scanning.

### 3. Require Signed Commits

**Settings:**
- ✅ Require signed commits

**Purpose:** Ensures all commits are cryptographically signed, verifying the identity of the committer and preventing commit tampering.

### 4. Require Linear History

**Settings:**
- ❌ Require linear history (optional, based on team preference)

**Purpose:** Maintains a clean, linear commit history without merge commits.

### 5. Require Conversation Resolution Before Merging

**Settings:**
- ✅ Require conversation resolution before merging

**Purpose:** Ensures all review comments and discussions are addressed before merging.

### 6. Include Administrators

**Settings:**
- ✅ Include administrators

**Purpose:** Enforces branch protection rules for repository administrators, ensuring no one can bypass security controls.

### 7. Restrict Who Can Push to Matching Branches

**Settings:**
- ✅ Restrict pushes that create matching branches
- Specify users/teams/apps (if any exceptions needed)

**Purpose:** Prevents direct pushes to the main branch, requiring all changes to go through pull requests.

### 8. Allow Force Pushes

**Settings:**
- ❌ Allow force pushes: **Disabled**

**Purpose:** Prevents rewriting history on the main branch, maintaining audit trail.

### 9. Allow Deletions

**Settings:**
- ❌ Allow deletions: **Disabled**

**Purpose:** Prevents accidental or malicious deletion of the main branch.

## How to Apply These Settings

### Option 1: GitHub Web Interface

1. Navigate to your repository on GitHub
2. Click **Settings** tab
3. In the left sidebar, click **Branches**
4. Under "Branch protection rules", click **Add rule** (or edit existing rule)
5. In "Branch name pattern", enter: `main`
6. Configure all settings as specified above
7. Click **Create** or **Save changes**

### Option 2: GitHub CLI

```bash
# Install GitHub CLI if not already installed
# Visit: https://cli.github.com/

# Apply branch protection using configuration file
gh api repos/{owner}/{repo}/branches/main/protection \
  -X PUT \
  --input .github/branch-protection.yml
```

### Option 3: GitHub API

```bash
# Using curl with GitHub API
curl -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  https://api.github.com/repos/OWNER/REPO/branches/main/protection \
  -d @.github/branch-protection.yml
```

## Validation

After configuring branch protection rules, verify they are working:

1. **Test Pull Request Flow:**
   - Create a test branch
   - Make a change and create a pull request
   - Verify that direct merge is blocked until requirements are met

2. **Test Status Checks:**
   - Create a PR with a failing test
   - Verify that merge is blocked until tests pass

3. **Test Signed Commits:**
   - Try to push an unsigned commit
   - Verify it is rejected

4. **Run Validation Workflow:**
   ```bash
   # Trigger the branch protection validation workflow
   gh workflow run branch-protection.yml
   ```

## Troubleshooting

### Common Issues

**Issue:** Status checks not appearing in required checks list
- **Solution:** Trigger a workflow run first, then the check will appear in the list

**Issue:** Signed commits being rejected
- **Solution:** Ensure GPG key is properly configured and verified on GitHub
- See: https://docs.github.com/en/authentication/managing-commit-signature-verification

**Issue:** Cannot push to main branch
- **Solution:** This is expected behavior. Use pull requests instead.

**Issue:** Administrator bypass not working
- **Solution:** Check if "Include administrators" is enabled in branch protection settings

## Additional Security Measures

In addition to branch protection rules, enable these security features:

1. **Dependabot Alerts:**
   - Settings > Security & analysis > Dependabot alerts: Enable

2. **Dependabot Security Updates:**
   - Settings > Security & analysis > Dependabot security updates: Enable

3. **Secret Scanning:**
   - Settings > Security & analysis > Secret scanning: Enable

4. **Code Scanning (CodeQL):**
   - Settings > Security & analysis > Code scanning: Enable
   - Configure CodeQL analysis workflow

5. **Two-Factor Authentication:**
   - Require 2FA for all collaborators
   - Organization settings > Authentication security

## References

- [GitHub Branch Protection Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
- [Requiring Commit Signatures](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches#require-signed-commits)
- [Status Checks](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/collaborating-on-repositories-with-code-quality-features/about-status-checks)

## Audit and Compliance

Branch protection rules are part of security compliance. Regular audits should:

1. Verify all protection rules are enabled
2. Review bypass permissions (should be minimal or none)
3. Check audit logs for any protection rule changes
4. Validate that CI/CD pipelines are functioning correctly
5. Ensure all team members have signed commits configured

For audit logs:
- Settings > Logs > Audit log

## Support

For questions or issues with branch protection configuration:
- Open an issue in this repository
- Contact repository administrators
- Refer to SECURITY.md for security-related inquiries
