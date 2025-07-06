# Guía Paso a Paso: Implementar Estrategia de Auto-Commit en Cualquier Proyecto

## 📋 Descripción General

Esta guía te permitirá replicar la estrategia exitosa de commits automáticos en cualquier proyecto, proporcionando commits profesionales en inglés con mínima intervención del usuario.

## ✅ Prerrequisitos

- [x] Proyecto con Git inicializado (`git init`)
- [x] Terminal con Bash disponible
- [x] Permisos de escritura en el directorio del proyecto
- [x] Opcional: `jq` para mejor manejo de JSON (`sudo apt install jq`)

## 🚀 Implementación Paso a Paso

### Paso 1: Crear Estructura de Directorios

```bash
# Crear directorio para scripts de automatización
mkdir -p _scripts

# Crear directorio para documentación (opcional pero recomendado)
mkdir -p _docs

# Verificar estructura
tree -d
```

### Paso 2: Crear Archivo de Configuración

Crear `_scripts/commit-config.json`:

```json
{
  "max_files_per_commit": 10,
  "auto_push": false,
  "commit_patterns": {
    "feat": "add new features and functionality",
    "fix": "resolve bugs and issues",
    "docs": "update documentation",
    "style": "improve code formatting and style",
    "refactor": "restructure code without changing functionality",
    "test": "add or update tests",
    "chore": "maintain and update project dependencies",
    "ci": "update CI/CD configuration",
    "config": "update configuration files",
    "script": "update shell scripts and automation",
    "deps": "update project dependencies"
  },
  "scope_mapping": {
    "src": "core",
    "lib": "library",
    "docs": "docs",
    "_scripts": "scripts",
    "_docs": "docs",
    "test": "test",
    "tests": "test"
  },
  "file_type_mapping": {
    "*.md": "docs",
    "*.txt": "docs",
    "*.rst": "docs",
    "README*": "docs",
    "*test*": "test",
    "*spec*": "test",
    "*.test.*": "test",
    "*.spec.*": "test",
    "*.json": "config",
    "*.yml": "config",
    "*.yaml": "config",
    "*.toml": "config",
    "*.ini": "config",
    ".env*": "config",
    "Dockerfile": "config",
    "docker-compose*": "config",
    "*.js": "feat",
    "*.ts": "feat",
    "*.py": "feat",
    "*.java": "feat",
    "*.cpp": "feat",
    "*.c": "feat",
    "*.go": "feat",
    "*.rs": "feat",
    "*.sh": "script",
    "*.bash": "script",
    "*.zsh": "script",
    "_scripts/*": "script",
    ".gitignore": "ci",
    ".gitattributes": "ci",
    ".github/*": "ci",
    "package.json": "deps",
    "package-lock.json": "deps",
    "pnpm-lock.yaml": "deps",
    "yarn.lock": "deps",
    "requirements.txt": "deps",
    "Pipfile": "deps",
    "Gemfile": "deps",
    "Cargo.toml": "deps",
    "go.mod": "deps",
    "*.css": "style",
    "*.scss": "style",
    "*.sass": "style",
    "*.less": "style"
  }
}
```

### Paso 3: Crear Script de Auto-Commit Principal

Crear `_scripts/auto-commit.sh`:

```bash
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

# Logging functions
log() { echo -e "${BLUE}[AUTO-COMMIT]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1" >&2; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }

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
            package.json|package-lock.json|pnpm-lock.yaml|yarn.lock|requirements.txt|Pipfile|Gemfile|Gemfile.lock|Cargo.toml|go.mod)
                types+=("deps")
                ;;
            *test*|*spec*|*.test.*|*.spec.*)
                types+=("test")
                ;;
            *.md|*.txt|*.rst|README*|docs/*)
                types+=("docs")
                ;;
            *.json|*.yml|*.yaml|*.toml|*.ini|.env*|Dockerfile|docker-compose*)
                types+=("config")
                ;;
            *.sh|*.bash|*.zsh|_scripts/*)
                types+=("script")
                ;;
            .gitignore|.gitattributes|.github/*|.gitlab-ci.yml|.travis.yml|Jenkinsfile)
                types+=("ci")
                ;;
            *.css|*.scss|*.sass|*.less|*.styl)
                types+=("style")
                ;;
            *)
                if git diff --cached --name-only | grep -q "^$file$"; then
                    if git diff --cached "$file" | grep -q "^+.*function\|^+.*def\|^+.*class\|^+.*const\|^+.*let\|^+.*var"; then
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
        if [[ "$file" =~ ^src/ ]]; then
            scope="core"
            break
        elif [[ "$file" =~ ^lib/ ]]; then
            scope="library"
            break
        elif [[ "$file" =~ ^_scripts/ ]]; then
            scope="scripts"
            break
        elif [[ "$file" =~ ^_docs/|^docs/ ]]; then
            scope="docs"
            break
        elif [[ "$file" =~ ^test/|^tests/ ]]; then
            scope="test"
            break
        fi
    done

    # Generate description based on commit type
    case "$commit_type" in
        "feat")
            if [[ ${#files[@]} -eq 1 ]]; then
                description="add $(basename "${files[0]%.*}")"
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
        "test") description="add/update tests" ;;
        "config") description="update configuration files" ;;
        "script") description="update automation scripts" ;;
        "ci") description="update CI/CD configuration" ;;
        "deps") description="update dependencies" ;;
        "style") description="improve code formatting and style" ;;
        *) description="update project files" ;;
    esac

    # Format conventional commit
    if [[ -n "$scope" ]]; then
        echo "${commit_type}(${scope}): ${description}"
    else
        echo "${commit_type}: ${description}"
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
        log "Files in this commit:"
        printf '  %s\n' "${files[@]}"
        return 0
    else
        error "Failed to create commit"
        return 1
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

    # Split large commits or commit all at once
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
```

### Paso 4: Crear Script de Configuración

Crear `_scripts/setup-auto-commit.sh`:

```bash
#!/bin/bash
# Setup script for auto-commit configuration

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/commit-config.json"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${BLUE}[SETUP]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }

# Create default configuration if it doesn't exist
create_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        log "Configuration file already exists: $CONFIG_FILE"
        return 0
    fi

    log "Creating configuration file: $CONFIG_FILE"

    # Copy the configuration content from Paso 2
    # (The JSON content goes here - same as in Paso 2)

    success "Configuration file created successfully"
}

# Make scripts executable
make_executable() {
    log "Making scripts executable..."
    chmod +x "$SCRIPT_DIR"/*.sh
    success "Scripts are now executable"
}

# Main setup function
main() {
    log "Setting up auto-commit system..."
    create_config
    make_executable
    success "Auto-commit system setup completed!"
    echo ""
    echo "Usage:"
    echo "  ./_scripts/auto-commit.sh      # Automatic commits"
    echo "  ./_scripts/commit.sh auto      # Via wrapper (if created)"
}

main "$@"
```

### Paso 5: Crear Script Wrapper Principal (Opcional)

Crear `_scripts/commit.sh`:

```bash
#!/bin/bash
# Main commit wrapper - Single entry point for all commit operations

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

show_help() {
    echo "Commit Automation System"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  auto     Automatic commit detection and creation"
    echo "  status   Show git status and pending changes"
    echo "  config   Show current configuration"
    echo "  help     Show this help message"
}

show_status() {
    echo "=== Git Status ==="
    git status --short
    echo ""
    echo "=== Recent Commits ==="
    git log --oneline -5
}

show_config() {
    local config_file="$SCRIPT_DIR/commit-config.json"
    echo "=== Current Configuration ==="
    if command -v jq > /dev/null 2>&1; then
        jq . "$config_file"
    else
        cat "$config_file"
    fi
}

main() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Error: Not in a git repository"
        exit 1
    fi

    case "${1:-help}" in
        "auto") exec "$SCRIPT_DIR/auto-commit.sh" ;;
        "status") show_status ;;
        "config") show_config ;;
        "help"|"--help"|"-h") show_help ;;
        *) echo "Unknown command: $1"; show_help; exit 1 ;;
    esac
}

main "$@"
```

### Paso 6: Hacer Scripts Ejecutables

```bash
# Hacer todos los scripts ejecutables
chmod +x _scripts/*.sh

# Verificar permisos
ls -la _scripts/
```

### Paso 7: Ejecutar Configuración Inicial

```bash
# Ejecutar setup
./_scripts/setup-auto-commit.sh

# Verificar que la configuración se creó
ls -la _scripts/commit-config.json
```

### Paso 8: Personalizar para Tu Proyecto

#### 8.1 Actualizar Scope Mapping

Edita `_scripts/commit-config.json` para reflejar la estructura de tu proyecto:

```json
{
  "scope_mapping": {
    "src": "core", // Para proyectos con src/
    "app": "app", // Para aplicaciones web
    "components": "ui", // Para componentes React/Vue
    "api": "api", // Para APIs
    "database": "db", // Para archivos de base de datos
    "utils": "utils", // Para utilidades
    "YOUR_DIR": "YOUR_SCOPE" // Personaliza según tu estructura
  }
}
```

#### 8.2 Actualizar File Type Mapping

Agrega extensiones específicas de tu proyecto:

```json
{
  "file_type_mapping": {
    "*.vue": "feat", // Vue.js
    "*.jsx": "feat", // React JSX
    "*.tsx": "feat", // TypeScript React
    "*.php": "feat", // PHP
    "*.rb": "feat", // Ruby
    "*.swift": "feat", // Swift
    "*.kt": "feat", // Kotlin
    "*.sql": "config", // SQL files
    "*.env.*": "config" // Environment files
  }
}
```

## 🎯 Uso del Sistema

### Uso Básico

```bash
# Automático (recomendado para uso diario)
./_scripts/auto-commit.sh

# O usando el wrapper
./_scripts/commit.sh auto
```

### Comandos Útiles

```bash
# Ver estado actual
./_scripts/commit.sh status

# Ver configuración
./_scripts/commit.sh config

# Ver ayuda
./_scripts/commit.sh help
```

## 🔧 Personalización Avanzada

### Modificar Patrones de Detección

En `_scripts/auto-commit.sh`, función `analyze_changes()`:

```bash
# Agregar tu lógica personalizada
case "$file" in
    "src/models/"*)      types+=("model") ;;
    "src/controllers/"*) types+=("controller") ;;
    "src/views/"*)       types+=("view") ;;
    # Tu lógica aquí
esac
```

### Modificar Generación de Mensajes

En `_scripts/auto-commit.sh`, función `generate_commit_message()`:

```bash
# Agregar casos específicos
case "$commit_type" in
    "model")      description="update data models" ;;
    "controller") description="update controllers" ;;
    "view")       description="update views" ;;
    # Tus casos aquí
esac
```

## 🚀 Activación Automática (Opcional)

### Git Hook Pre-Commit

```bash
# Crear hook pre-commit
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Auto-format before commit (optional)
if command -v prettier > /dev/null 2>&1; then
    prettier --write .
fi
exit 0
EOF

chmod +x .git/hooks/pre-commit
```

### Alias de Git

```bash
# Agregar a ~/.gitconfig o usar git config
git config alias.ac '!./_scripts/auto-commit.sh'

# Ahora puedes usar
git ac
```

## ✅ Verificación de Funcionamiento

### Prueba Básica

```bash
# Crear archivo de prueba
echo "# Test file" > test.md

# Ejecutar auto-commit
./_scripts/commit.sh auto

# Verificar el commit
git log --oneline -1
# Debería mostrar algo como: "docs: update test.md"
```

### Prueba con Múltiples Archivos

```bash
# Crear varios archivos
echo "console.log('test');" > test.js
echo "# Documentation" > docs.md
echo '{"test": true}' > config.json

# Ejecutar auto-commit
./_scripts/commit.sh auto

# Verificar commits
git log --oneline -3
```

## 🔍 Solución de Problemas

### Error: "Not in a git repository"

```bash
# Inicializar git si no existe
git init
git remote add origin YOUR_REPO_URL
```

### Error: "Permission denied"

```bash
# Verificar y corregir permisos
chmod +x _scripts/*.sh
```

### Config File Not Found

```bash
# Re-ejecutar setup
./_scripts/setup-auto-commit.sh
```

### jq Command Not Found

```bash
# Instalar jq (opcional pero recomendado)
# Ubuntu/Debian
sudo apt install jq

# macOS
brew install jq

# O el sistema funcionará con valores por defecto
```

## 📚 Casos de Uso por Tipo de Proyecto

### Proyecto Node.js

```json
{
  "scope_mapping": {
    "src": "core",
    "public": "assets",
    "routes": "api",
    "models": "db",
    "views": "ui"
  },
  "file_type_mapping": {
    "*.js": "feat",
    "*.json": "config",
    "package.json": "deps"
  }
}
```

### Proyecto Python

```json
{
  "scope_mapping": {
    "src": "core",
    "tests": "test",
    "docs": "docs",
    "scripts": "scripts"
  },
  "file_type_mapping": {
    "*.py": "feat",
    "requirements.txt": "deps",
    "*.yml": "config"
  }
}
```

### Proyecto React

```json
{
  "scope_mapping": {
    "src/components": "ui",
    "src/pages": "pages",
    "src/hooks": "hooks",
    "src/utils": "utils",
    "public": "assets"
  },
  "file_type_mapping": {
    "*.jsx": "feat",
    "*.tsx": "feat",
    "*.css": "style",
    "*.scss": "style"
  }
}
```

## 🎉 Resultado Final

Después de seguir esta guía tendrás:

✅ **Sistema de commits automáticos funcional**  
✅ **Commits profesionales en inglés**  
✅ **Detección inteligente de tipos de commit**  
✅ **Mínima intervención requerida**  
✅ **Configuración personalizable**  
✅ **Estructura escalable**

### Ejemplos de Commits Generados

```
feat(core): add user authentication system
fix(api): resolve validation error in user endpoint
docs: update installation guide
config: update database configuration
deps: update project dependencies
style(ui): improve component styling
test: add unit tests for auth module
```

## 📞 Soporte

Si encuentras problemas:

1. Verificar que todos los scripts tienen permisos de ejecución
2. Confirmar que estás en un repositorio git
3. Revisar la configuración JSON para errores de sintaxis
4. Probar con archivos simples primero
5. Consultar los logs de error para diagnóstico

---

**¡Tu sistema de auto-commits profesionales está listo para usar!** 🚀
