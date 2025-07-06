#!/bin/bash
# Auto-commit script with best practices
# Generates conventional commits automatically with minimal intervention

set -euo pipefail

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONFIG_FILE="$SCRIPT_DIR/commit-config.json"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${BLUE}[AUTO-COMMIT]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check if we're in a git repository
check_git_repo() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        error "Not in a git repository"
        exit 1
    fi
}

# Load configuration
load_config() {
    if [[ ! -f "$CONFIG_FILE" ]]; then
        log "Creating default configuration..."
        "$SCRIPT_DIR/setup-auto-commit.sh"
    fi
    
    if command -v jq > /dev/null 2>&1; then
        MAX_FILES=$(jq -r '.max_files_per_commit // 10' "$CONFIG_FILE")
        AUTO_PUSH=$(jq -r '.auto_push // false' "$CONFIG_FILE")
    else
        warning "jq not found, using default values"
        MAX_FILES=10
        AUTO_PUSH=false
    fi
}

# Analyze file changes and determine commit type
analyze_changes() {
    local files=("$@")
    local types=()
    
    for file in "${files[@]}"; do
        case "$file" in
            package.json|pnpm-lock.yaml|requirements.txt|Gemfile|Gemfile.lock)
                types+=("deps")
                ;;
            *test*|*spec*|*.test.sh|*.spec.sh)
                types+=("test")
                ;;
            *.md|*.txt|*.rst|docs/*|README*)
                types+=("docs")
                ;;
            *.json|*.yml|*.yaml|*.toml|*.ini|.env*|Dockerfile|docker-compose*)
                types+=("config")
                ;;
            *.sh|*.bash|*.zsh|scripts/*)
                types+=("script")
                ;;
            .gitignore|.gitattributes|.github/*)
                types+=("ci")
                ;;
            *.css|*.scss|*.sass|*.less|*.styl)
                types+=("style")
                ;;
            *)
                if git diff --cached --name-only | grep -q "^$file$"; then
                    if git diff --cached "$file" | grep -q "^+.*function\|^+.*def\|^+.*class"; then
                        types+=("feat")
                    else
                        types+=("fix")
                    fi
                else
                    types+=("feat")
                fi
                ;;
        esac
    done
    
    # Return most common type
    printf '%s\n' "${types[@]}" | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
}

# Generate commit message based on files
generate_commit_message() {
    local commit_type="$1"
    shift
    local files=("$@")
    
    local scope=""
    local description=""
    
    # Determine scope from file paths
    for file in "${files[@]}"; do
        if [[ "$file" =~ ^modulo[0-9]+/ ]]; then
            scope="module$(echo "$file" | sed 's/modulo\([0-9]\+\).*/\1/')"
            break
        elif [[ "$file" =~ ^scripts/ ]]; then
            scope="scripts"
            break
        elif [[ "$file" =~ ^docs?/ ]]; then
            scope="docs"
            break
        fi
    done
    
    # Generate description based on commit type
    case "$commit_type" in
        "feat")
            if [[ ${#files[@]} -eq 1 ]]; then
                description="add $(basename "${files[0]}")"
            else
                description="add new features and components"
            fi
            ;;
        "fix")
            if [[ ${#files[@]} -eq 1 ]]; then
                description="resolve issues in $(basename "${files[0]}")"
            else
                description="resolve multiple issues and bugs"
            fi
            ;;
        "docs")
            if [[ ${#files[@]} -eq 1 ]]; then
                description="update $(basename "${files[0]}")"
            else
                description="update documentation"
            fi
            ;;
        "test")
            description="add/update tests"
            ;;
        "config")
            description="update configuration files"
            ;;
        "script")
            description="update shell scripts"
            ;;
        "ci")
            description="update CI/CD configuration"
            ;;
        "deps")
            description="update dependencies"
            ;;
        "style")
            description="update styles and formatting"
            ;;
        *)
            description="update project files"
            ;;
    esac
    
    # Format conventional commit
    if [[ -n "$scope" ]]; then
        echo "${commit_type}(${scope}): ${description}"
    else
        echo "${commit_type}: ${description}"
    fi
}

# Main auto-commit function
auto_commit() {
    cd "$PROJECT_ROOT"
    
    # Check for changes
    if git diff --quiet && git diff --cached --quiet; then
        log "No changes to commit"
        return 0
    fi
    
    # Stage all changes if nothing is staged
    if git diff --cached --quiet; then
        log "Staging all changes..."
        git add .
    fi
    
    # Get staged files
    local staged_files
    mapfile -t staged_files < <(git diff --cached --name-only)
    
    if [[ ${#staged_files[@]} -eq 0 ]]; then
        log "No staged changes found"
        return 0
    fi
    
    log "Found ${#staged_files[@]} staged files"
    
    # Split large commits
    if [[ ${#staged_files[@]} -gt $MAX_FILES ]]; then
        warning "Too many files (${#staged_files[@]} > $MAX_FILES), splitting into multiple commits"
        
        local batch=()
        local count=0
        
        for file in "${staged_files[@]}"; do
            batch+=("$file")
            ((count++))
            
            if [[ $count -eq $MAX_FILES ]]; then
                commit_batch "${batch[@]}"
                batch=()
                count=0
            fi
        done
        
        # Commit remaining files
        if [[ ${#batch[@]} -gt 0 ]]; then
            commit_batch "${batch[@]}"
        fi
    else
        commit_batch "${staged_files[@]}"
    fi
    
    # Auto push if enabled
    if [[ "$AUTO_PUSH" == "true" ]]; then
        log "Auto-pushing to remote..."
        if git push; then
            success "Changes pushed to remote"
        else
            warning "Failed to push to remote"
        fi
    fi
}

# Commit a batch of files
commit_batch() {
    local files=("$@")
    
    if [[ ${#files[@]} -eq 0 ]]; then
        warning "No files to commit in batch"
        return 1
    fi
    
    # Analyze changes to determine commit type
    local commit_type
    commit_type=$(analyze_changes "${files[@]}")
    
    # Generate commit message
    local commit_msg
    commit_msg=$(generate_commit_message "$commit_type" "${files[@]}")
    
    log "Committing ${#files[@]} files with type: $commit_type"
    log "Message: $commit_msg"
    
    # Reset and stage only the files for this batch
    git reset > /dev/null 2>&1 || true
    
    for file in "${files[@]}"; do
        git add "$file"
    done
    
    # Create commit
    if git commit -m "$commit_msg"; then
        success "Committed: $commit_msg"
        
        # Show files in this commit
        log "Files in this commit:"
        printf '  %s\n' "${files[@]}"
        return 0
    else
        error "Failed to create commit"
        return 1
    fi
}

# Main execution
main() {
    log "Starting auto-commit process..."
    
    check_git_repo
    load_config
    auto_commit
    
    success "Auto-commit process completed"
}

# Run main function
main "$@"
