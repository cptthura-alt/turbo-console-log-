#!/bin/bash
# Security Configuration Verification Script
# This script verifies that all security workflows and configurations are properly set up

set -e

echo "🔍 Verifying Security Configuration..."
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0
WARNINGS=0

# Function to check if file exists
check_file() {
    local file=$1
    local description=$2
    
    if [ -f "$file" ]; then
        echo -e "${GREEN}✅ PASS${NC}: $description exists: $file"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}❌ FAIL${NC}: $description not found: $file"
        ((FAILED++))
        return 1
    fi
}

# Function to check if file contains specific content
check_content() {
    local file=$1
    local pattern=$2
    local description=$3
    
    if [ -f "$file" ] && grep -q "$pattern" "$file"; then
        echo -e "${GREEN}✅ PASS${NC}: $description configured in $file"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}❌ FAIL${NC}: $description not found in $file"
        ((FAILED++))
        return 1
    fi
}

# Function to check workflow syntax
check_yaml_syntax() {
    local file=$1
    local description=$2
    
    if command -v yamllint &> /dev/null; then
        if yamllint -d relaxed "$file" &> /dev/null; then
            echo -e "${GREEN}✅ PASS${NC}: $description has valid YAML syntax"
            ((PASSED++))
            return 0
        else
            echo -e "${RED}❌ FAIL${NC}: $description has YAML syntax errors"
            ((FAILED++))
            return 1
        fi
    else
        echo -e "${YELLOW}⚠️  WARN${NC}: yamllint not installed, skipping syntax check for $file"
        ((WARNINGS++))
        return 0
    fi
}

echo "📋 Checking Security Workflow Files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check CodeQL workflow
check_file ".github/workflows/codeql.yml" "CodeQL workflow"
check_content ".github/workflows/codeql.yml" "github/codeql-action" "CodeQL action"
check_content ".github/workflows/codeql.yml" "security-extended" "CodeQL security-extended queries"
check_yaml_syntax ".github/workflows/codeql.yml" "CodeQL workflow"

echo ""
echo "📋 Checking Dependency Security..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check Dependabot configuration
check_file ".github/dependabot.yml" "Dependabot configuration"
check_content ".github/dependabot.yml" "package-ecosystem.*npm" "Dependabot npm ecosystem"
check_content ".github/dependabot.yml" "package-ecosystem.*github-actions" "Dependabot GitHub Actions"
check_yaml_syntax ".github/dependabot.yml" "Dependabot configuration"

# Check Dependency Review workflow
check_file ".github/workflows/dependency-review.yml" "Dependency Review workflow"
check_content ".github/workflows/dependency-review.yml" "dependency-review-action" "Dependency Review action"
check_yaml_syntax ".github/workflows/dependency-review.yml" "Dependency Review workflow"

echo ""
echo "📋 Checking Additional Security Features..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check Scorecards workflow
check_file ".github/workflows/scorecards.yml" "OpenSSF Scorecards workflow"
check_content ".github/workflows/scorecards.yml" "ossf/scorecard-action" "Scorecards action"
check_yaml_syntax ".github/workflows/scorecards.yml" "Scorecards workflow"

# Check CI security scanning
check_file ".github/workflows/ci.yml" "CI workflow"
check_content ".github/workflows/ci.yml" "npm audit" "npm audit security check"

echo ""
echo "📋 Checking Security Documentation..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check security policy
check_file "SECURITY.md" "Security Policy"
check_content "SECURITY.md" "Reporting a Vulnerability" "Vulnerability reporting section"

# Check security features documentation
check_file ".github/SECURITY_FEATURES.md" "Security Features documentation"

# Check security configuration summary
check_file "SECURITY_CONFIGURATION_SUMMARY.md" "Security Configuration Summary"

# Check manual setup guide
check_file ".github/MANUAL_SECURITY_SETUP.md" "Manual Security Setup Guide"

echo ""
echo "📋 Checking Package Configuration..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check package.json exists
check_file "package.json" "package.json"
check_file "package-lock.json" "package-lock.json"

# Check for npm audit in CI
if check_content ".github/workflows/ci.yml" "npm audit" "npm audit in CI"; then
    echo -e "   ${GREEN}→${NC} npm vulnerabilities will be checked on every build"
fi

echo ""
echo "📋 Checking Node.js Security Best Practices..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check for security-sensitive patterns in code
if [ -f "index.js" ]; then
    echo -e "${GREEN}✅ PASS${NC}: Main application file exists"
    ((PASSED++))
    
    # Check for potential security issues (basic checks)
    if ! grep -q "eval(" index.js 2>/dev/null; then
        echo -e "${GREEN}✅ PASS${NC}: No eval() usage detected"
        ((PASSED++))
    else
        echo -e "${YELLOW}⚠️  WARN${NC}: eval() usage detected - potential security risk"
        ((WARNINGS++))
    fi
    
    if ! grep -q "innerHTML" index.js 2>/dev/null; then
        echo -e "${GREEN}✅ PASS${NC}: No innerHTML usage detected"
        ((PASSED++))
    else
        echo -e "${YELLOW}⚠️  WARN${NC}: innerHTML usage detected - potential XSS risk"
        ((WARNINGS++))
    fi
fi

echo ""
echo "📋 Verifying Workflow Triggers..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check CodeQL triggers
if grep -q "pull_request:" ".github/workflows/codeql.yml"; then
    echo -e "${GREEN}✅ PASS${NC}: CodeQL runs on pull requests"
    ((PASSED++))
fi

if grep -q "schedule:" ".github/workflows/codeql.yml"; then
    echo -e "${GREEN}✅ PASS${NC}: CodeQL has scheduled runs"
    ((PASSED++))
fi

# Check Dependency Review triggers
if grep -q "pull_request:" ".github/workflows/dependency-review.yml"; then
    echo -e "${GREEN}✅ PASS${NC}: Dependency Review runs on pull requests"
    ((PASSED++))
fi

# Check Scorecards triggers
if grep -q "schedule:" ".github/workflows/scorecards.yml"; then
    echo -e "${GREEN}✅ PASS${NC}: Scorecards has scheduled runs"
    ((PASSED++))
fi

echo ""
echo "📋 Checking Permissions Configuration..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check if workflows have proper permissions
if grep -q "security-events: write" ".github/workflows/codeql.yml"; then
    echo -e "${GREEN}✅ PASS${NC}: CodeQL has security-events write permission"
    ((PASSED++))
fi

if grep -q "security-events: write" ".github/workflows/scorecards.yml"; then
    echo -e "${GREEN}✅ PASS${NC}: Scorecards has security-events write permission"
    ((PASSED++))
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 VERIFICATION SUMMARY"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✅ Passed: $PASSED${NC}"
echo -e "${RED}❌ Failed: $FAILED${NC}"
echo -e "${YELLOW}⚠️  Warnings: $WARNINGS${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 All security configurations are properly set up!${NC}"
    echo ""
    echo "📝 Next Steps:"
    echo "   1. Enable manual security features in GitHub Settings"
    echo "      (See .github/MANUAL_SECURITY_SETUP.md for instructions)"
    echo "   2. Wait for security workflows to run"
    echo "   3. Review Security tab for any alerts"
    echo "   4. Address any findings from CodeQL or Scorecards"
    echo ""
    exit 0
else
    echo -e "${RED}⚠️  Some security configurations are missing or incorrect.${NC}"
    echo "   Please review the failures above and fix them."
    echo ""
    exit 1
fi
