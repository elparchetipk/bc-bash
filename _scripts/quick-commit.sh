#!/bin/bash
# Quick commit with conventional commit format

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Simple interactive commit
if [[ $# -eq 0 ]]; then
    echo "Quick Commit Options:"
    echo "1. feat     - New feature"
    echo "2. fix      - Bug fix"
    echo "3. docs     - Documentation"
    echo "4. style    - Code style"
    echo "5. test     - Tests"
    echo "6. chore    - Maintenance"
    echo ""
    read -p "Select type (1-6): " choice
    
    case $choice in
        1) type="feat" ;;
        2) type="fix" ;;
        3) type="docs" ;;
        4) type="style" ;;
        5) type="test" ;;
        6) type="chore" ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac
    
    read -p "Enter scope (optional): " scope
    read -p "Enter description: " description
    
    if [[ -n "$scope" ]]; then
        message="${type}(${scope}): ${description}"
    else
        message="${type}: ${description}"
    fi
    
    git add .
    git commit -m "$message"
    echo "Committed: $message"
else
    # Use auto-commit script
    "$SCRIPT_DIR/auto-commit.sh"
fi
