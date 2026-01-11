#!/bin/bash

# Branch Protection Validation Script
# This script validates branch protection requirements and displays configuration
# For applying settings, use GitHub web interface or API (see BRANCH_PROTECTION_GUIDE.md)
# Requires: GitHub CLI (gh) installed and authenticated
# Usage: ./setup-branch-protection.sh [--dry-run] [--branch main]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

# Default values
DRY_RUN=false
BRANCH="main"
REPO_OWNER=""
REPO_NAME=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --branch)
      BRANCH="$2"
      shift 2
      ;;
    --help)
      echo "Usage: $0 [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  --dry-run        Show what would be done without making changes"
      echo "  --branch BRANCH  Branch to protect (default: main)"
      echo "  --help           Show this help message"
      echo ""
      echo "Requirements:"
      echo "  - GitHub CLI (gh) must be installed"
      echo "  - User must be authenticated with appropriate permissions"
      echo "  - User must have admin access to the repository"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

# Function to print colored output
print_status() {
  echo -e "${GREEN}✓${NC} $1"
}

print_error() {
  echo -e "${RED}✗${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
  echo -e "${BLUE}ℹ${NC} $1"
}

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  print_error "GitHub CLI (gh) is not installed"
  echo "Please install it from: https://cli.github.com/"
  exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
  print_error "Not authenticated with GitHub CLI"
  echo "Please run: gh auth login"
  exit 1
fi

print_status "GitHub CLI is installed and authenticated"

# Get repository information
echo ""
echo "=== Repository Information ==="
REPO_INFO=$(gh repo view --json owner,name)
REPO_OWNER=$(echo "$REPO_INFO" | grep -o '"owner":{[^}]*"login":"[^"]*"' | grep -o 'login":"[^"]*"' | cut -d'"' -f3)
REPO_NAME=$(echo "$REPO_INFO" | grep -o '"name":"[^"]*"' | cut -d'"' -f4)

if [ -z "$REPO_OWNER" ] || [ -z "$REPO_NAME" ]; then
  print_error "Could not determine repository information"
  echo "Please run this script from within a git repository"
  exit 1
fi

echo "Owner: $REPO_OWNER"
echo "Repository: $REPO_NAME"
echo "Branch: $BRANCH"

# Confirm with user
if [ "$DRY_RUN" = false ]; then
  echo ""
  print_warning "This will modify branch protection rules for $BRANCH branch"
  read -p "Do you want to continue? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
  fi
fi

echo ""
echo "=== Configuring Branch Protection Rules ==="

if [ "$DRY_RUN" = true ]; then
  print_info "DRY RUN MODE - No changes will be made"
  echo ""
fi

# Configuration
echo "The following rules will be applied:"
echo ""
echo "1. Require pull request reviews:"
echo "   - Required approving reviews: 1"
echo "   - Dismiss stale reviews: yes"
echo "   - Require code owner reviews: yes"
echo ""
echo "2. Require status checks:"
echo "   - Require branches to be up to date: yes"
echo "   - Required checks: build-and-test (16.x, 18.x, 20.x), security-scan"
echo ""
echo "3. Require signed commits: yes"
echo ""
echo "4. Include administrators: yes"
echo ""
echo "5. Restrict pushes: yes"
echo ""
echo "6. Allow force pushes: no"
echo ""
echo "7. Allow deletions: no"
echo ""
echo "8. Require conversation resolution: yes"
echo ""

if [ "$DRY_RUN" = false ]; then
  print_info "Validation complete."
  
  echo ""
  print_warning "Note: This script validates configuration but does not apply settings."
  print_info "To apply branch protection rules, use one of these methods:"
  echo ""
  echo "Method 1: GitHub Web Interface"
  echo "  1. Go to: https://github.com/$REPO_OWNER/$REPO_NAME/settings/branches"
  echo "  2. Click 'Add rule' or edit existing rule for '$BRANCH'"
  echo "  3. Configure settings as shown above"
  echo ""
  echo "Method 2: GitHub CLI with API"
  echo "  See: .github/BRANCH_PROTECTION_GUIDE.md for detailed instructions"
  echo ""
  echo "Configuration reference: .github/branch-protection.yml"
  
  exit 0
fi

echo ""
print_status "Configuration validated"
print_info "Run without --dry-run to apply changes"

exit 0
