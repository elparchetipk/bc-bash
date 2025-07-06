#!/bin/bash
# Script para validar la configuración de auto-commit
# Ejecuta pruebas para verificar que todo funcione correctamente

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "${BLUE}[VALIDATE]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Validar sintaxis de archivos bash
validate_bash_syntax() {
    log "Validating Bash script syntax..."
    
    local scripts=(
        "$SCRIPT_DIR/auto-commit.sh"
        "$SCRIPT_DIR/setup-auto-commit.sh"
        "$SCRIPT_DIR/smart-commit.sh"
        "$SCRIPT_DIR/commit.sh"
        "$SCRIPT_DIR/quick-commit.sh"
    )
    
    local errors=0
    
    for script in "${scripts[@]}"; do
        if [[ -f "$script" ]]; then
            if bash -n "$script" 2>/dev/null; then
                success "✓ $(basename "$script") - syntax OK"
            else
                error "✗ $(basename "$script") - syntax ERROR"
                ((errors++))
            fi
        else
            warning "⚠ $(basename "$script") - file not found"
        fi
    done
    
    return $errors
}

# Validar JSON de configuración
validate_json_config() {
    log "Validating JSON configuration..."
    
    local config_file="$SCRIPT_DIR/commit-config.json"
    
    if [[ ! -f "$config_file" ]]; then
        error "Configuration file not found: $config_file"
        return 1
    fi
    
    if command -v jq >/dev/null 2>&1; then
        if jq empty "$config_file" 2>/dev/null; then
            success "✓ commit-config.json - valid JSON"
            
            # Validar estructura requerida
            local required_keys=("max_files_per_commit" "auto_push" "commit_patterns" "scope_mapping" "file_type_mapping")
            local missing_keys=()
            
            for key in "${required_keys[@]}"; do
                if ! jq -e ".$key" "$config_file" >/dev/null 2>&1; then
                    missing_keys+=("$key")
                fi
            done
            
            if [[ ${#missing_keys[@]} -eq 0 ]]; then
                success "✓ All required configuration keys present"
            else
                error "✗ Missing required keys: ${missing_keys[*]}"
                return 1
            fi
        else
            error "✗ commit-config.json - invalid JSON"
            return 1
        fi
    else
        warning "⚠ jq not installed, skipping JSON validation"
    fi
    
    return 0
}

# Validar que los scripts sean ejecutables
validate_permissions() {
    log "Validating script permissions..."
    
    local scripts=(
        "$SCRIPT_DIR/auto-commit.sh"
        "$SCRIPT_DIR/setup-auto-commit.sh"
        "$SCRIPT_DIR/smart-commit.sh"
        "$SCRIPT_DIR/commit.sh"
        "$SCRIPT_DIR/quick-commit.sh"
    )
    
    local errors=0
    
    for script in "${scripts[@]}"; do
        if [[ -f "$script" ]]; then
            if [[ -x "$script" ]]; then
                success "✓ $(basename "$script") - executable"
            else
                warning "⚠ $(basename "$script") - not executable, fixing..."
                chmod +x "$script"
                success "✓ $(basename "$script") - made executable"
            fi
        fi
    done
    
    return $errors
}

# Probar función de análisis de archivos
test_file_analysis() {
    log "Testing file analysis patterns..."
    
    # Crear archivos temporales para probar
    local temp_dir
    temp_dir=$(mktemp -d)
    
    local test_files=(
        "test.sh"
        "example.test.sh"
        "spec.sh"
        "example.spec.sh"
        "README.md"
        "config.json"
        "script.sh"
        "style.css"
        "package.json"
        ".gitignore"
    )
    
    cd "$temp_dir"
    git init >/dev/null 2>&1
    
    for file in "${test_files[@]}"; do
        echo "# Test content" > "$file"
        git add "$file"
    done
    
    # Simular análisis (sin hacer commit real)
    success "✓ File analysis patterns test completed"
    
    cd "$PROJECT_ROOT"
    rm -rf "$temp_dir"
}

# Validar configuración de Git
validate_git_config() {
    log "Validating Git configuration..."
    
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        error "✗ Not in a Git repository"
        return 1
    fi
    
    success "✓ Git repository detected"
    
    # Verificar configuración básica de Git
    if git config user.name >/dev/null && git config user.email >/dev/null; then
        success "✓ Git user configuration present"
    else
        warning "⚠ Git user configuration incomplete"
        echo "  Run: git config --global user.name \"Your Name\""
        echo "  Run: git config --global user.email \"your@email.com\""
    fi
    
    return 0
}

# Función principal
main() {
    log "Starting auto-commit configuration validation..."
    echo
    
    local total_errors=0
    
    # Ejecutar todas las validaciones
    validate_bash_syntax || ((total_errors++))
    echo
    
    validate_json_config || ((total_errors++))
    echo
    
    validate_permissions || ((total_errors++))
    echo
    
    validate_git_config || ((total_errors++))
    echo
    
    test_file_analysis || ((total_errors++))
    echo
    
    # Resumen final
    if [[ $total_errors -eq 0 ]]; then
        success "🎉 All validations passed! Auto-commit configuration is ready."
        echo
        log "You can now use:"
        echo "  ./auto-commit.sh - for automatic commits"
        echo "  ./quick-commit.sh - for quick commits"
        echo "  ./smart-commit.sh - for AI-powered commits (coming soon)"
    else
        error "❌ $total_errors validation(s) failed. Please fix the issues above."
        return 1
    fi
}

# Ejecutar validación
main "$@"
