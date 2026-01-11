# Repository Security Settings Checklist

This checklist helps ensure all security settings are properly configured in GitHub repository settings. Use this during initial setup and quarterly audits.

**Repository**: cptthura-alt/turbo-console-log-  
**Last Reviewed**: [Date]  
**Reviewed By**: [Name/Username]  
**Next Review**: [Date]

---

## General Settings

Navigate to: `Settings → General`

### Basic Information
- [ ] Repository description is accurate and helpful
- [ ] Website URL is set (if applicable)
- [ ] Topics/tags are set for discoverability
- [ ] README exists and is up to date

### Features
- [ ] Issues are enabled (if accepting contributions)
- [ ] Discussions are enabled/disabled as appropriate
- [ ] Sponsorships are enabled/disabled as appropriate
- [ ] Projects are enabled/disabled as appropriate
- [ ] Wiki is disabled (use docs/ folder instead for security)

### Pull Requests
- [ ] Allow merge commits (or choose preferred merge strategy)
- [ ] Allow squash merging (recommended)
- [ ] Allow rebase merging (or disable if prefer squash)
- [ ] Automatically delete head branches (recommended: ✅)
- [ ] Allow auto-merge (optional)
- [ ] Require linear history (recommended for main branch)

### Archives
- [ ] Do NOT archive unless repository is truly obsolete

### Danger Zone
- [ ] Repository visibility is correct (public/private)
- [ ] Transfer ownership: N/A (do not transfer without proper authorization)
- [ ] Archive: Only if repository is obsolete
- [ ] Delete: ⚠️ DANGER - Never delete without backup and authorization

---

## Collaborators & Teams

Navigate to: `Settings → Collaborators and teams` (or `Settings → Access`)

### Collaborators Review
- [ ] Review list of all collaborators
- [ ] Verify each user still needs access
- [ ] Confirm access levels are appropriate
- [ ] Document any outside collaborators (not in organization)
- [ ] Verify all Write+ users have 2FA enabled

### Current Collaborators Count
- Admins: ___
- Maintain: ___
- Write: ___
- Triage: ___
- Read: ___
- **Total**: ___

### Team Access (if applicable)
- [ ] Review all teams with access
- [ ] Verify team permissions are appropriate
- [ ] Remove any unnecessary team access
- [ ] Document team purposes

### Actions
- [ ] Remove inactive users (90+ days without activity)
- [ ] Downgrade over-privileged users
- [ ] Process pending invitations (accept or cancel)

---

## Branches

Navigate to: `Settings → Branches`

### Default Branch
- [ ] Default branch is set correctly (usually `main` or `master`)

### Branch Protection Rules

#### Main/Master Branch Protection
- [ ] Branch protection rule exists for `main` or `master`
- [ ] **Require a pull request before merging** ✅
  - [ ] Required approvals: 1 (minimum)
  - [ ] Dismiss stale pull request approvals when new commits pushed ✅
  - [ ] Require review from Code Owners ✅ (if CODEOWNERS exists)
- [ ] **Require status checks to pass before merging** ✅
  - [ ] Require branches to be up to date before merging ✅
  - [ ] Required status checks configured (list):
    - [ ] CI build/test checks
    - [ ] Security scanning
    - [ ] Code quality checks
- [ ] **Require conversation resolution before merging** ✅
- [ ] **Require signed commits** (recommended) ⚠️
- [ ] **Require linear history** (recommended) ⚠️
- [ ] **Block force pushes** ✅
- [ ] **Block deletions** ✅
- [ ] **Enforce restrictions for administrators** ✅
- [ ] **Restrict pushes** (optional, define who can push)

#### Other Protected Branches
- [ ] List other protected branches: _______________
- [ ] Verify protection rules are appropriate

#### Rulesets (if using instead of branch protection)
- [ ] Review configured rulesets
- [ ] Verify target branches
- [ ] Check bypass permissions

---

## Code Security & Analysis

Navigate to: `Settings → Code security and analysis`

### Dependency Graph
- [ ] **Enabled** ✅ (should be on by default for public repos)

### Dependabot Alerts
- [ ] **Dependabot alerts** enabled ✅
- [ ] Notification settings configured
- [ ] Grouped security updates enabled (if available)

### Dependabot Security Updates
- [ ] **Dependabot security updates** enabled ✅
- [ ] Auto-merge security updates (optional): ___

### Dependabot Version Updates
- [ ] Configuration file exists: `.github/dependabot.yml` ✅
- [ ] Scheduled updates configured ✅
- [ ] Review dependabot.yml settings

### Code Scanning
- [ ] **Code scanning** enabled (CodeQL or other) ✅
- [ ] CodeQL workflow exists: `.github/workflows/codeql.yml` or in `security-audit.yml`
- [ ] Scanning runs on push and PR ✅
- [ ] Alerts are reviewed regularly

### Secret Scanning
- [ ] **Secret scanning** enabled ✅ (automatic for public repos)
- [ ] **Push protection** enabled ⚠️ (prevents committing secrets)
- [ ] Secret scanning alerts are monitored

### Private Vulnerability Reporting
- [ ] **Enabled** for private repositories (if applicable)
- [ ] Contact information is current

---

## Deploy Keys

Navigate to: `Settings → Deploy keys`

### Active Deploy Keys Review
- [ ] List all deploy keys: _______________
- [ ] Verify each key is still needed
- [ ] Confirm read-only unless write is required
- [ ] Check last used date for each key
- [ ] Rotate keys older than 1 year

### Actions
- [ ] Remove unused deploy keys
- [ ] Document purpose of each key
- [ ] Schedule key rotation if needed

---

## Secrets and Variables

Navigate to: `Settings → Secrets and variables → Actions`

### Repository Secrets
- [ ] Review all secrets
- [ ] Verify each secret is still needed
- [ ] Confirm secrets are not exposed in logs
- [ ] Remove unused secrets
- [ ] Rotate secrets periodically

### Repository Variables
- [ ] Review all variables
- [ ] Verify variables don't contain sensitive data
- [ ] Remove unused variables

### Environment Secrets (if using environments)
- [ ] Review environment protection rules
- [ ] Verify required reviewers
- [ ] Check wait timers

---

## Actions

Navigate to: `Settings → Actions → General`

### Actions Permissions
- [ ] **Actions permissions** set appropriately:
  - ✅ Allow enterprise/organization, and select non-enterprise/organization, actions and reusable workflows (recommended)
  - Or: Allow all actions and reusable workflows (less secure)
  - Or: Disable actions (if not used)
- [ ] **Workflow permissions** set to: "Read repository contents and packages permissions" (recommended)
- [ ] **Allow GitHub Actions to create and approve pull requests**: Disabled (recommended) or enabled with justification

### Artifact and Log Retention
- [ ] Retention period set: ___ days (default 90, can reduce to save storage)

### Fork Pull Request Workflows
- [ ] **Require approval for all outside collaborators** ✅ (recommended)
- [ ] **Require approval for first-time contributors** ✅ (recommended)

---

## Webhooks

Navigate to: `Settings → Webhooks`

### Active Webhooks Review
- [ ] List all webhooks: _______________
- [ ] Verify each webhook is still needed
- [ ] Check webhook destinations are legitimate
- [ ] Verify SSL is enabled for all webhooks
- [ ] Review webhook permissions and events
- [ ] Test webhook deliveries

### Actions
- [ ] Remove unused webhooks
- [ ] Document purpose of each webhook
- [ ] Verify webhook secrets are secure

---

## Integrations

Navigate to: `Settings → Integrations` or `Settings → Installed GitHub Apps`

### GitHub Apps Review
- [ ] List installed apps: _______________
- [ ] Verify each app is still needed
- [ ] Review permissions granted to each app
- [ ] Check last access date
- [ ] Verify apps are from trusted sources

### Actions
- [ ] Remove unused applications
- [ ] Reduce permissions where possible
- [ ] Document purpose of each integration

---

## Notifications

Navigate to: `Settings → Notifications` (user settings)

### Security Alerts
- [ ] Dependabot alerts notifications enabled ✅
- [ ] Secret scanning alerts notifications enabled ✅
- [ ] Code scanning alerts notifications enabled ✅
- [ ] Delivery method configured (email, web, mobile)

### Activity Notifications
- [ ] PR review requests enabled
- [ ] PR assignments enabled
- [ ] Issue assignments enabled
- [ ] Watching repository (recommended for maintainers)

---

## Moderation

Navigate to: `Settings → Moderation`

### Interaction Limits (if needed)
- [ ] Temporary interaction limits set (if spam issues)
- [ ] Code review limits set appropriately

### Blocked Users
- [ ] Review list of blocked users
- [ ] Verify blocks are still necessary
- [ ] Document reasons for blocks

---

## Pages (if using GitHub Pages)

Navigate to: `Settings → Pages`

### GitHub Pages Settings
- [ ] Source branch configured correctly
- [ ] Custom domain configured (if applicable)
- [ ] HTTPS enforced ✅
- [ ] Build and deployment source verified

---

## Summary and Actions

### Settings Compliance Score
- Total checkboxes: ___
- Completed: ___
- Compliance: ____%

### Critical Issues Found
1. _______________
2. _______________
3. _______________

### Actions Required

| Action | Priority | Assigned To | Due Date | Status |
|--------|----------|-------------|----------|--------|
| | | | | |
| | | | | |
| | | | | |

### Recommendations
1. _______________
2. _______________
3. _______________

### Next Review
- **Scheduled Date**: _______________
- **Frequency**: Quarterly (every 3 months)
- **Responsible**: Repository administrators

---

## Sign-Off

- **Reviewed By**: _______________
- **Date**: _______________
- **Next Review Date**: _______________
- **Status**: [ ] Complete [ ] In Progress [ ] Issues Found

---

## Notes

Additional notes about repository configuration:

_______________________________________________
_______________________________________________
_______________________________________________

---

## References

- [Access Management Policy](.github/ACCESS_MANAGEMENT.md)
- [Branch Protection Guide](.github/BRANCH_PROTECTION_GUIDE.md)
- [Security Policy](SECURITY.md)
- [GitHub Docs: Repository Settings](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features)

---

**Document Version**: 1.0  
**Last Updated**: January 2026
