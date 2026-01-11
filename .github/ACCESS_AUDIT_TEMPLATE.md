# GitHub Access Audit Template

## Audit Information

- **Audit Date**: YYYY-MM-DD
- **Auditor**: [Name/Username]
- **Audit Period**: [Quarter] [Year]
- **Repository**: cptthura-alt/turbo-console-log-

## Executive Summary

Brief overview of audit findings, key changes, and recommendations.

---

## Collaborator Audit

### Current Collaborators

| Username | Access Level | 2FA Enabled | Last Active | Status | Action Required |
|----------|--------------|-------------|-------------|--------|-----------------|
| @cptthura-alt | Admin | ✓ | Active | ✓ Valid | None |
| [username] | [role] | [✓/✗] | [date/status] | [Valid/Review/Remove] | [action] |

### Collaborator Access Summary

- **Total Collaborators**: [number]
- **Admin**: [count]
- **Maintain**: [count]
- **Write**: [count]
- **Triage**: [count]
- **Read**: [count]

### 2FA Compliance

- **2FA Enabled**: [count] ([percentage]%)
- **2FA Not Enabled**: [count] ([percentage]%)
- **Non-Compliant Users**: [list usernames if any]

### Activity Analysis

- **Active Users (last 30 days)**: [count]
- **Inactive Users (30-90 days)**: [count]
- **Dormant Users (90+ days)**: [count]

---

## Team Access Audit (if applicable)

### Teams with Repository Access

| Team Name | Access Level | Member Count | Last Modified | Status | Action Required |
|-----------|--------------|--------------|---------------|--------|-----------------|
| [team] | [role] | [count] | [date] | [Valid/Review] | [action] |

### Team Access Summary

- **Total Teams**: [number]
- **Teams with Admin**: [count]
- **Teams with Write**: [count]
- **Teams with Read**: [count]

---

## Outside Collaborators Review

Outside collaborators (users not part of the organization) require special attention.

| Username | Access Level | 2FA | Reason for Access | Last Contribution | Action |
|----------|--------------|-----|-------------------|-------------------|--------|
| [username] | [role] | [✓/✗] | [reason] | [date] | [keep/remove] |

---

## Deploy Keys and Tokens Audit

### Deploy Keys

| Key Name | Read/Write | Added Date | Last Used | Status | Action |
|----------|------------|------------|-----------|--------|--------|
| [key] | [access] | [date] | [date] | [Valid/Revoke] | [action] |

### GitHub Apps and Integrations

| App Name | Permissions | Installed Date | Last Used | Status | Action |
|----------|-------------|----------------|-----------|--------|--------|
| [app] | [perms] | [date] | [date] | [Valid/Review] | [action] |

---

## Branch Protection Review

### Protected Branches

| Branch | Protection Status | Required Reviews | Status Checks | Enforced on Admins |
|--------|-------------------|------------------|---------------|--------------------|
| main | [Enabled/Disabled] | [count] | [list] | [Yes/No] |
| master | [Enabled/Disabled] | [count] | [list] | [Yes/No] |

### Branch Protection Recommendations

- [ ] Enable branch protection on main/master
- [ ] Require at least 1 code review
- [ ] Require status checks to pass
- [ ] Enforce restrictions for administrators
- [ ] Require signed commits
- [ ] Enable linear history

---

## Security Settings Review

### Repository Security Features

| Feature | Status | Recommendation |
|---------|--------|----------------|
| Dependabot alerts | [Enabled/Disabled] | [Enable/Keep] |
| Dependabot security updates | [Enabled/Disabled] | [Enable/Keep] |
| Dependabot version updates | [Enabled/Disabled] | [Enable/Keep] |
| Code scanning (CodeQL) | [Enabled/Disabled] | [Enable/Keep] |
| Secret scanning | [Enabled/Disabled] | [Enable/Keep] |
| Private vulnerability reporting | [Enabled/Disabled] | [Enable/Keep] |

---

## Actions Taken During Audit

### Access Modifications

1. **[Date]**: [Description of change]
   - User: [username]
   - Action: [granted/revoked/modified access]
   - From: [old role]
   - To: [new role]
   - Reason: [justification]

2. **[Date]**: [Description of change]
   - [Details]

### Accounts Removed

1. **[Username]**: [Reason for removal]
2. **[Username]**: [Reason for removal]

### New Access Granted

1. **[Username]**: [Role granted] - [Justification]
2. **[Username]**: [Role granted] - [Justification]

---

## Findings and Recommendations

### Critical Findings

1. **[Finding]**: [Description and impact]
   - **Recommendation**: [Action to take]
   - **Priority**: High/Medium/Low
   - **Due Date**: [date]

### Security Improvements

1. **[Improvement]**: [Description]
   - **Implementation Steps**: [steps]
   - **Expected Benefit**: [benefit]

### Policy Compliance

- [ ] All collaborators with write+ access have 2FA enabled
- [ ] No dormant accounts with elevated privileges
- [ ] Branch protection rules are properly configured
- [ ] No unnecessary bot or service account access
- [ ] All outside collaborators are documented and justified
- [ ] Deploy keys follow least-privilege principles
- [ ] Security features are enabled and configured

---

## Follow-Up Actions

### Immediate Actions (Within 7 days)

1. [ ] [Action item with assignee]
2. [ ] [Action item with assignee]

### Short-Term Actions (Within 30 days)

1. [ ] [Action item with assignee]
2. [ ] [Action item with assignee]

### Long-Term Improvements (Within 90 days)

1. [ ] [Action item with assignee]
2. [ ] [Action item with assignee]

---

## Next Audit

- **Scheduled Date**: [Next quarter date]
- **Assigned Auditor**: [Name/Username]
- **Focus Areas**: [Any specific areas to pay attention to]

---

## Approval

- **Auditor Signature**: [Name] - [Date]
- **Repository Owner Review**: [Name] - [Date]
- **Status**: [Draft/Approved/In Progress]

---

## Audit History

Keep a record of previous audits:

| Audit Date | Auditor | Collaborators | Critical Findings | Status |
|------------|---------|---------------|-------------------|--------|
| YYYY-MM-DD | [name] | [count] | [summary] | Completed |
| YYYY-MM-DD | [name] | [count] | [summary] | Completed |

---

**Template Version**: 1.0
**Last Updated**: January 2026
