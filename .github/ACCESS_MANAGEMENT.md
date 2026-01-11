# GitHub Access Management Policy

## Overview

This document defines the access management policy for the repository, ensuring security through least-privilege access, regular audits, and two-factor authentication enforcement.

## Access Levels and Roles

### Repository Roles

| Role | Permissions | Use Case |
|------|-------------|----------|
| **Admin** | Full access including settings, security, and collaborator management | Repository owners and maintainers |
| **Maintain** | Manage repository without access to sensitive settings | Senior contributors who manage releases |
| **Write** | Push to protected branches (with approval), create branches, tags | Core contributors and committers |
| **Triage** | Manage issues and pull requests without write access | Issue managers and community moderators |
| **Read** | Read and clone repository, create issues | External contributors and observers |

## Least Privilege Principles

### Access Assignment Guidelines

1. **Default to Read Access**: New collaborators should start with read access
2. **Justify Higher Privileges**: Write, Maintain, and Admin access require documented justification
3. **Time-Limited Access**: Temporary contributors should have access with defined expiration
4. **Regular Review**: Access levels should be reviewed quarterly
5. **Remove Inactive Users**: Users inactive for 90+ days should be audited and potentially removed

### Permission Escalation Process

To request elevated permissions:

1. Submit request via GitHub issue using the access request template
2. Provide justification for required access level
3. Specify duration of access if temporary
4. Obtain approval from repository admin
5. Document access grant in audit log

## Two-Factor Authentication (2FA) Requirements

### Mandatory 2FA Policy

- **All collaborators** with Write, Maintain, or Admin access **MUST** enable 2FA
- 2FA requirement is enforced at the organization level where applicable
- Contributors without 2FA will have access downgraded to Read-only
- External contributors submitting via pull requests are exempt from 2FA requirement

### 2FA Enforcement Steps

1. Enable 2FA requirement in organization settings
2. Notify all collaborators of 2FA requirement (30-day grace period)
3. After grace period, audit non-compliant users
4. Downgrade or remove access for non-compliant users
5. Document exceptions (if any) with security review approval

### Setting Up 2FA

Contributors should follow GitHub's official guide:
- [Configuring Two-Factor Authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication)

Recommended 2FA methods:
1. **Authenticator App** (recommended): TOTP apps like Google Authenticator, Authy, or 1Password
2. **Security Keys**: Hardware tokens like YubiKey
3. **SMS** (least secure): Only if other methods are unavailable

## Access Audit Procedures

### Quarterly Access Review

Every quarter (Jan, Apr, Jul, Oct), repository admins must:

1. **Review all collaborators**:
   - Verify each user still requires access
   - Confirm access level is appropriate for current role
   - Check 2FA status for each user

2. **Review team access** (if applicable):
   - Audit team membership
   - Verify team permissions
   - Remove dormant teams

3. **Document findings**:
   - Create audit report (see template below)
   - Record all access changes
   - File report in repository documentation

### Continuous Monitoring

- **Monitor failed authentication attempts**: Review security logs monthly
- **Track permission changes**: All permission modifications should be logged
- **Review outside collaborators**: Special attention to external contributors with write access
- **Audit bot and service accounts**: Review and rotate credentials for automated tools

### Access Removal Process

When removing collaborator access:

1. Document reason for removal
2. Remove from repository collaborators
3. Remove from organization teams (if applicable)
4. Revoke any personal access tokens (PATs) or deploy keys
5. Update documentation and CODEOWNERS if necessary
6. Notify affected user (if appropriate)

## Security Best Practices

### For Repository Admins

- Enable branch protection rules on main/master branch
- Require pull request reviews before merging
- Enable automated security updates (Dependabot)
- Configure required status checks in CI/CD
- Regularly review and update access policies
- Maintain audit logs of all access changes

### For Collaborators

- Enable 2FA on your GitHub account immediately
- Use strong, unique passwords
- Protect personal access tokens (never commit to code)
- Report suspicious activity immediately
- Follow secure coding practices in contributions
- Review and acknowledge security policies

## Compliance and Exceptions

### Exception Handling

Exceptions to this policy require:

1. Written justification
2. Security risk assessment
3. Approval from repository owner
4. Documentation in exceptions log
5. Regular review of active exceptions

### Audit Trail

All access management activities must be documented:

- Date and time of change
- User making the change
- User affected by the change
- Type of change (grant, revoke, modify)
- Justification for change

## Contact and Questions

For access requests or questions about this policy:

- Open an issue with the `access-request` label
- Contact repository admins via the CODEOWNERS file
- Reference security policy in SECURITY.md

## Policy Review

This policy should be reviewed and updated:

- Annually or when significant changes occur
- After security incidents
- When GitHub introduces new security features
- Based on audit findings and recommendations

---

**Last Updated**: January 2026
**Policy Owner**: Repository Administrators (see CODEOWNERS)
**Next Review**: January 2027
