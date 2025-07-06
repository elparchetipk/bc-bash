#!/bin/bash
# Main commit wrapper - Single entry point for all commit operations

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

show_help() {
    echo "Commit Automation System"
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  auto, a      Automatic commit detection and creation"
    echo "  quick, q     Interactive commit with type selection"
    echo "  smart, s     AI-enhanced commits (coming soon)"
    echo "  setup        Run initial setup and configuration"
    echo "  status, st   Show git status and pending changes"
    echo "  config, c    Show/edit configuration"
    echo "  help, h      Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 auto      # Automatically detect and commit changes"
    echo "  $0 quick     # Interactive commit mode"
    echo "  $0 status    # Check current status"
    echo "  $0 setup     # Initial setup"
    echo ""
    echo "Configuration file: scripts/commit-config.json"
    echo "Documentation: scripts/README.md"
}

show_status() {
    echo -e "${BLUE}=== Git Status ===${NC}"
    git status --short
    echo ""
    
    echo -e "${BLUE}=== Staged Changes ===${NC}"
    if git diff --cached --quiet; then
        echo "No staged changes"
    else
        git diff --cached --name-only
    fi
    echo ""
    
    echo -e "${BLUE}=== Unstaged Changes ===${NC}"
    if git diff --quiet; then
        echo "No unstaged changes"
    else
        git diff --name-only
    fi
    echo ""
    
    echo -e "${BLUE}=== Recent Commits ===${NC}"
    git log --oneline -5
}

show_config() {
    local config_file="$SCRIPT_DIR/commit-config.json"
    
    if [[ ! -f "$config_file" ]]; then
        echo -e "${RED}Configuration file not found. Run setup first.${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}=== Current Configuration ===${NC}"
    if command -v jq > /dev/null 2>&1; then
        jq . "$config_file"
    else
        cat "$config_file"
    fi
    
    echo ""
    echo "Edit configuration: ${config_file}"
}

main() {
    # Check if we're in a git repository (except for help and setup)
    if [[ $# -eq 0 ]] || [[ "$1" != "help" && "$1" != "h" && "$1" != "setup" ]]; then
        if ! git rev-parse --git-dir > /dev/null 2>&1; then
            echo -e "${RED}Error: Not in a git repository${NC}"
            exit 1
        fi
    fi
    
    # Handle commands
    case "${1:-help}" in
        "auto"|"a")
            exec "$SCRIPT_DIR/auto-commit.sh"
            ;;
        "quick"|"q")
            shift
            exec "$SCRIPT_DIR/quick-commit.sh" "$@"
            ;;
        "smart"|"s")
            exec "$SCRIPT_DIR/smart-commit.sh"
            ;;
        "setup")
            exec "$SCRIPT_DIR/setup-auto-commit.sh"
            ;;
        "status"|"st")
            show_status
            ;;
        "config"|"c")
            show_config
            ;;
        "help"|"h"|"--help"|"-h")
            show_help
            ;;
        *)
            echo -e "${RED}Unknown command: $1${NC}"
            echo ""
            show_help
            exit 1
            ;;
    esac
}

main "$@"
