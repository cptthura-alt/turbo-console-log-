# Branch Protection Configuration Guide

## Overview

Branch protection rules are critical for maintaining code quality, security, and preventing unauthorized changes to important branches. This guide provides recommended configurations for protecting your repository branches.

## Why Branch Protection Matters

- **Prevents Force Pushes**: Protects against accidental or malicious history rewrites
- **Enforces Code Review**: Ensures all changes are reviewed before merging
- **Maintains Quality**: Requires tests and checks to pass before merge
- **Audit Trail**: Creates clear history of who approved what changes
- **Security**: Prevents direct commits that bypass security checks

## Recommended Branch Protection Rules

### For `main` or `master` Branch

#### Essential Rules (Minimum Security)

Navigate to: `Settings → Branches → Add rule` or edit existing rule for `main`/`master`

1. **Require a pull request before merging** ✅
   - ✅ Require approvals: **1** (minimum)
   - ✅ Dismiss stale pull request approvals when new commits are pushed
   - ✅ Require review from Code Owners (if CODEOWNERS file exists)

2. **Require status checks to pass before merging** ✅
   - ✅ Require branches to be up to date before merging
   - Select required status checks:
     - CI build/test checks
     - Security scanning (if configured)
     - Code quality checks (if configured)

3. **Require conversation resolution before merging** ✅
   - Ensures all review comments are addressed

4. **Require signed commits** ⚠️ (Recommended)
   - Verifies commit authenticity
   - Requires contributors to set up GPG signing

5. **Require linear history** ⚠️ (Recommended)
   - Prevents merge commits
   - Keeps history clean and easier to follow

6. **Do not allow bypassing the above settings** ✅
   - ✅ Even for administrators (unless absolutely necessary)

7. **Restrict who can push to matching branches** ⚠️ (If needed)
   - Limit direct pushes to specific users/teams
   - For most repos, disallow all direct pushes

8. **Allow force pushes** ❌
   - Should be DISABLED to prevent history rewrites

9. **Allow deletions** ❌
   - Should be DISABLED to prevent branch deletion

#### Enhanced Rules (High Security)

For repositories requiring stricter controls:

1. **Require approvals: 2+**
   - Multiple reviewers for critical changes
   - Reduces risk of malicious or buggy code

2. **Require approval from specific team**
   - Security team approval for security-sensitive changes
   - Senior developer approval for architectural changes

3. **Lock branch**
   - Makes branch read-only
   - Use for archived or legacy branches

### For Development/Release Branches

If you use `develop`, `staging`, or release branches:

1. **Require a pull request before merging** ✅
   - Require approvals: **1**
   
2. **Require status checks to pass** ✅
   - Same as main branch

3. **Less restrictive than main**
   - May allow force pushes for development branches
   - May not require signed commits

### Branch Protection Pattern Matching

You can protect multiple branches with patterns:

| Pattern | Matches | Use Case |
|---------|---------|----------|
| `main` | Only main branch | Primary branch protection |
| `master` | Only master branch | Primary branch protection (legacy) |
| `release/*` | release/v1.0, release/v2.0, etc. | All release branches |
| `hotfix/*` | hotfix/security-patch, etc. | Emergency fix branches |
| `*` | All branches | Apply base rules to all branches |

## Implementation Steps

### Step 1: Access Branch Protection Settings

1. Go to your repository on GitHub
2. Click `Settings` (requires admin access)
3. Click `Branches` in the left sidebar
4. Click `Add branch protection rule` or edit existing rule

### Step 2: Configure Protection Rules

For the `main` branch, use this configuration:

```
Branch name pattern: main

☑ Require a pull request before merging
  ☑ Require approvals: 1
  ☑ Dismiss stale pull request approvals when new commits are pushed
  ☑ Require review from Code Owners

☑ Require status checks to pass before merging
  ☑ Require branches to be up to date before merging
  Status checks that are required:
    - CI / build-and-test (Node 18.x)
    - security-scan

☑ Require conversation resolution before merging

☑ Require signed commits [Optional but recommended]

☑ Require linear history [Optional but recommended]

☐ Require deployments to succeed before merging [If you have deployment workflows]

☑ Lock branch [Only for archived branches]

☑ Do not allow bypassing the above settings
  ☑ Enforce for administrators

☐ Restrict who can push to matching branches
  [Leave empty to prevent all direct pushes]

☐ Allow force pushes [Keep UNCHECKED]

☐ Allow deletions [Keep UNCHECKED]
```

### Step 3: Verify Configuration

After saving, test the protection rules:

1. ✅ Try to push directly to main (should fail)
2. ✅ Create a PR without required checks (should block merge)
3. ✅ Create a PR without reviews (should block merge)
4. ✅ Verify status checks are required

### Step 4: Document Configuration

Save your branch protection configuration in this repository for reference and consistency.

## Rulesets (Modern Alternative)

GitHub now offers **Rulesets** as a more flexible alternative to branch protection rules:

### Benefits of Rulesets

- Apply rules to multiple branches with patterns
- More granular permission controls
- Better targeting (by repository, organization, or enterprise)
- Can bypass based on specific conditions

### Accessing Rulesets

1. Go to repository `Settings`
2. Click `Rules` → `Rulesets` in the left sidebar
3. Click `New ruleset` → `New branch ruleset`

### Recommended Ruleset Configuration

**Ruleset Name**: `Protect main branch`

**Target branches**: `main`, `master`

**Rules**:
- ✅ Restrict deletions
- ✅ Require a pull request before merging
  - Required approvals: 1
  - Dismiss stale reviews: Yes
  - Require code owner review: Yes
- ✅ Require status checks to pass
  - Require branches up to date: Yes
- ✅ Block force pushes
- ✅ Require signed commits

**Bypass list**: (leave empty or add emergency-only administrators)

## Status Checks Configuration

To require specific CI/CD checks:

1. The checks must run at least once on a PR
2. Then they'll appear in the branch protection settings
3. Select which checks are required

Common status checks to require:

- **Build/Compile**: Ensures code builds successfully
- **Unit Tests**: Verifies test suite passes
- **Linting**: Enforces code style
- **Security Scan**: Checks for vulnerabilities
- **Code Coverage**: Ensures adequate test coverage (optional)

Example workflow check names:
- `CI / build-and-test (Node 16.x)`
- `CI / build-and-test (Node 18.x)`
- `CI / build-and-test (Node 20.x)`
- `Security Audit / security-audit`
- `CodeQL / Analyze (javascript)`

## CODEOWNERS Integration

When "Require review from Code Owners" is enabled:

1. Create/maintain `CODEOWNERS` file at repository root or in `.github/`
2. Define owners for different paths:
   ```
   # Default owner
   * @cptthura-alt
   
   # Security files require security team review
   /SECURITY.md @security-team
   /.github/workflows/ @devops-team
   ```
3. Pull requests touching these files will automatically request reviews from specified owners

## Troubleshooting

### "Merge blocked by branch protection rules"

**Cause**: PR doesn't meet protection requirements

**Solutions**:
- Ensure required reviews are approved
- Verify all status checks pass
- Resolve all conversations
- Ensure branch is up to date with base

### "You don't have permission to merge"

**Cause**: You need specific permissions or more approvals

**Solutions**:
- Request additional reviews if needed
- Contact repository admin if rules are misconfigured
- Verify your access level (should be Write or above)

### Status checks not appearing

**Cause**: Workflow hasn't run yet on this branch

**Solutions**:
- Push a commit to trigger workflows
- Manually run workflows from Actions tab
- Check workflow files for branch filters

## Monitoring and Compliance

### Regular Reviews

Review branch protection settings:
- **Quarterly**: Verify rules are still appropriate
- **After incidents**: Tighten rules if needed
- **When adding collaborators**: Ensure they understand rules

### Audit Trail

GitHub logs all changes to branch protection rules:
1. Go to repository `Settings`
2. Click `Audit log` (if available)
3. Filter by branch protection events

### Notifications

Set up notifications for:
- Failed status checks
- Required reviews pending
- Branch protection rule changes
- Direct push attempts (blocked)

## Best Practices

1. **Start Strict, Loosen If Needed**
   - Begin with maximum protection
   - Only relax rules with documented justification

2. **Test Before Enforcing**
   - Create test branch
   - Apply rules to test branch first
   - Verify team can work within rules

3. **Document Exceptions**
   - If you allow admin bypass, document when/why it's used
   - Create audit log for bypass usage

4. **Communicate Changes**
   - Notify team before enabling new rules
   - Provide guidance on adapting workflows
   - Document in team wiki or README

5. **Review Regularly**
   - Quarterly review of rules
   - Adjust based on team feedback
   - Update as security requirements change

## Quick Reference Checklist

Use this checklist when setting up branch protection:

- [ ] Branch protection enabled on `main`/`master`
- [ ] Require pull requests with at least 1 approval
- [ ] Dismiss stale reviews when new commits pushed
- [ ] Require Code Owner review (if CODEOWNERS exists)
- [ ] Require status checks to pass before merge
- [ ] Require branches to be up to date
- [ ] Require conversation resolution
- [ ] Consider requiring signed commits
- [ ] Consider requiring linear history
- [ ] Block force pushes
- [ ] Block branch deletions
- [ ] Enforce rules for administrators
- [ ] Configure required status checks
- [ ] Test protection rules with a PR
- [ ] Document configuration in repository
- [ ] Notify team of new rules

## Additional Resources

- [GitHub Docs: About protected branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [GitHub Docs: Managing a branch protection rule](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule)
- [GitHub Docs: About rulesets](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets)

---

**Last Updated**: January 2026
**Next Review**: April 2026
