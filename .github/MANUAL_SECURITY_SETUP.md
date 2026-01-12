# Manual GitHub Security Settings Configuration Guide

This guide provides step-by-step instructions for enabling GitHub security features that cannot be automated through workflow files or configuration files. These settings must be enabled through the GitHub repository Settings page.

## Prerequisites

- You must have **Admin** access to the repository to enable these features
- The repository must be hosted on GitHub.com (not GitHub Enterprise Server without proper features)
- Some features are only available for public repositories or require GitHub Advanced Security for private repositories

---

## 🔐 Step 1: Enable Secret Scanning

**Purpose**: Detect and prevent accidental commits of secrets (API keys, tokens, passwords) in your repository.

### Instructions:

1. Navigate to your repository on GitHub
2. Click **Settings** tab (requires admin access)
3. In the left sidebar, click **Code security and analysis**
4. Scroll to the **Secret scanning** section
5. Click the **Enable** button next to "Secret scanning"
6. ✅ Verify it shows "Secret scanning is enabled"

### Recommended: Enable Push Protection

1. In the same **Secret scanning** section
2. Find **Push protection** subsection
3. Click **Enable** to prevent commits containing secrets
4. This will block pushes that contain detected secrets

**What this does**:
- Scans entire repository history for exposed secrets
- Monitors new commits for secret patterns (200+ types)
- Alerts maintainers when secrets are detected
- Push protection prevents accidental secret commits before they reach GitHub

**For Public Repositories**: May already be enabled by default

---

## 📦 Step 2: Enable Dependabot Alerts

**Purpose**: Get notified about security vulnerabilities in your project's dependencies.

### Instructions:

1. Go to **Settings** → **Code security and analysis**
2. Scroll to the **Dependabot alerts** section
3. Click **Enable** if not already enabled
4. ✅ Verify it shows "Dependabot alerts are enabled"

**What this does**:
- Monitors your `package.json` and `package-lock.json` for vulnerable dependencies
- Creates alerts in the Security tab when vulnerabilities are found
- Provides severity ratings and remediation advice
- Integrates with the GitHub Advisory Database

**For Public Repositories**: Usually enabled by default

---

## 🔄 Step 3: Enable Dependabot Security Updates

**Purpose**: Automatically create pull requests to update vulnerable dependencies.

### Instructions:

1. **First**, ensure Dependabot alerts are enabled (Step 2)
2. Go to **Settings** → **Code security and analysis**
3. Scroll to the **Dependabot security updates** section
4. Click **Enable**
5. ✅ Verify it shows "Dependabot security updates are enabled"

**What this does**:
- Automatically creates PRs to fix vulnerable dependencies
- Only creates PRs for security updates (not regular version updates)
- Works in conjunction with Dependabot alerts
- Helps maintain security with minimal manual effort

**Note**: Regular version updates are handled by `.github/dependabot.yml` configuration file

---

## 🛡️ Step 4: Enable Private Vulnerability Reporting

**Purpose**: Allow security researchers to report vulnerabilities privately before public disclosure.

### Instructions:

1. Go to **Settings** → **Code security and analysis**
2. Scroll to the **Private vulnerability reporting** section
3. Click **Enable**
4. ✅ Verify it shows "Private vulnerability reporting is enabled"

**What this does**:
- Adds a "Report a vulnerability" button to your Security tab
- Creates a secure, private channel for vulnerability reports
- Allows you to discuss and fix issues before public disclosure
- Helps coordinate responsible disclosure

**Available for**: Public repositories

---

## 🔍 Step 5: Verify Code Scanning Alerts (Auto-enabled)

**Purpose**: Ensure CodeQL results are visible in the Security tab.

### Instructions:

1. Go to the **Security** tab in your repository
2. Click **Code scanning** in the left sidebar
3. After the first CodeQL workflow run, you should see:
   - The CodeQL tool listed
   - Any security findings (or "No code scanning alerts")

**What to do**:
- Wait for the CodeQL workflow to run (triggered on next push, PR, or manually)
- Review any alerts that appear
- Address high and critical severity findings

**Note**: This is automatically enabled when the CodeQL workflow (`.github/workflows/codeql.yml`) runs successfully for the first time.

---

## 📊 Step 6: Configure Security Alert Notifications

**Purpose**: Get notified when new security alerts are created.

### Instructions:

1. Click your profile icon (top right) → **Settings**
2. In the left sidebar, click **Notifications**
3. Scroll to **Watching**
4. Configure notification preferences for:
   - **Dependabot alerts**: Email and/or web notifications
   - **Secret scanning alerts**: Email and/or web notifications
   - **Code scanning alerts**: Email and/or web notifications
5. Optionally, click **Security alerts** to customize per-repository settings

**Recommended Settings**:
- ✅ Enable email notifications for all security alerts
- ✅ Enable web notifications for immediate awareness
- ✅ Watch the repository to receive all security notifications

---

## ✅ Verification Checklist

After completing all steps, verify the following in your repository settings:

Go to **Settings** → **Code security and analysis** and confirm:

- [ ] ✅ **Secret scanning** shows "Enabled"
- [ ] ✅ **Secret scanning push protection** shows "Enabled" (recommended)
- [ ] ✅ **Dependabot alerts** shows "Enabled"
- [ ] ✅ **Dependabot security updates** shows "Enabled"
- [ ] ✅ **Private vulnerability reporting** shows "Enabled"
- [ ] ✅ **Code scanning** shows "Set up" or "Enabled" (after first workflow run)

---

## 🧪 Testing the Configuration

### Test Secret Scanning:
```bash
# Try to commit a test secret (in a feature branch)
echo "aws_access_key_id = AKIAIOSFODNN7EXAMPLE" > test_secret.txt
git add test_secret.txt
git commit -m "Test secret detection"
# Push protection should block this commit if enabled
```

**Note**: Don't actually commit real secrets! Use test patterns only.

### Test Dependabot:
1. Wait for Dependabot to scan (runs weekly on Mondays)
2. Check **Security** → **Dependabot** for any alerts
3. Dependabot should create PRs for vulnerable dependencies

### Test CodeQL:
1. Trigger the CodeQL workflow manually:
   - Go to **Actions** → **CodeQL Advanced Security**
   - Click **Run workflow** → **Run workflow**
2. Wait for completion (usually 2-5 minutes)
3. Check **Security** → **Code scanning** for results

---

## 🔧 Troubleshooting

### Secret Scanning Not Available
- **Cause**: Private repository without GitHub Advanced Security
- **Solution**: Upgrade to GitHub Advanced Security or make repository public

### Dependabot Alerts Not Appearing
- **Cause**: No vulnerable dependencies or alerts not yet generated
- **Solution**: Wait 24 hours after enabling, or manually check dependencies with `npm audit`

### Code Scanning Not Showing Results
- **Cause**: CodeQL workflow hasn't run yet
- **Solution**: 
  1. Go to **Actions** tab
  2. Find **CodeQL Advanced Security** workflow
  3. Click **Run workflow** to trigger manually

### Private Vulnerability Reporting Not Available
- **Cause**: Feature only available for public repositories
- **Solution**: Make repository public or use SECURITY.md for vulnerability reporting

---

## 📈 Expected Results

After enabling all features, you should see:

1. **Security Tab** displays:
   - Dependabot alerts
   - Code scanning alerts
   - Secret scanning alerts (if any)
   - Security advisories
   - Security policy (SECURITY.md)

2. **Automated Security Workflows**:
   - CodeQL scans run on every push/PR
   - Dependency Review blocks vulnerable dependencies in PRs
   - Scorecards assesses security posture weekly
   - Dependabot creates update PRs weekly

3. **Protection Against**:
   - Known CVEs in dependencies
   - Common security vulnerabilities (SQL injection, XSS, etc.)
   - Exposed secrets
   - Vulnerable dependencies in PRs

---

## 🎯 Success Criteria

Your repository has comprehensive security coverage when:

- ✅ All security features are enabled in Settings
- ✅ CodeQL workflow runs successfully
- ✅ Dependabot creates PRs for updates
- ✅ Security tab shows no critical/high alerts (or alerts are triaged)
- ✅ Push protection blocks secret commits
- ✅ Dependency Review blocks vulnerable dependencies in PRs
- ✅ OpenSSF Scorecard shows improving scores

---

## 📞 Support

- **GitHub Docs**: https://docs.github.com/en/code-security
- **Security Policy**: See [SECURITY.md](../SECURITY.md) in repository root
- **Detailed Features**: See [SECURITY_FEATURES.md](SECURITY_FEATURES.md)
- **Configuration Summary**: See [SECURITY_CONFIGURATION_SUMMARY.md](../SECURITY_CONFIGURATION_SUMMARY.md)

---

## 🔄 Maintenance

### Weekly:
- Review and merge Dependabot PRs
- Check Security tab for new alerts
- Review Scorecards results

### Per Pull Request:
- Ensure CodeQL and Dependency Review checks pass
- Address any security findings before merging

### Monthly:
- Review overall security posture
- Update security documentation if needed
- Audit access controls

---

**Last Updated**: 2026-01-12  
**Version**: 1.0  
**Status**: Ready for implementation
