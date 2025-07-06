#!/bin/bash
# Interactive Auto-Commit with Cron Support
# This script can be executed by cron and will request user confirmation
# when there are changes to commit.

set -euo pipefail

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
LOCKFILE="/tmp/bc-bash-auto-commit.lock"
NOTIFICATION_FILE="/tmp/bc-bash-commit-notification"

# Load configuration
source "$SCRIPT_DIR/auto-commit.sh"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >&2
}

# Check if running in a terminal
is_interactive() {
    [[ -t 0 && -t 1 ]]
}

# Send desktop notification (if available)
send_notification() {
    local title="$1"
    local message="$2"
    
    if command -v notify-send >/dev/null 2>&1; then
        notify-send "$title" "$message" --icon=dialog-information
    elif command -v osascript >/dev/null 2>&1; then
        # macOS notification
        osascript -e "display notification \"$message\" with title \"$title\""
    fi
}

# Create notification file for GUI pickup
create_notification_file() {
    local changes_count="$1"
    cat > "$NOTIFICATION_FILE" << EOF
{
    "timestamp": "$(date -Iseconds)",
    "changes_count": $changes_count,
    "project_dir": "$PROJECT_DIR",
    "status": "pending"
}
EOF
}

# Check for existing lock
check_lock() {
    if [[ -f "$LOCKFILE" ]]; then
        local lock_pid
        lock_pid=$(cat "$LOCKFILE" 2>/dev/null || echo "")
        
        if [[ -n "$lock_pid" ]] && kill -0 "$lock_pid" 2>/dev/null; then
            log "Another auto-commit process is running (PID: $lock_pid)"
            exit 1
        else
            log "Removing stale lock file"
            rm -f "$LOCKFILE"
        fi
    fi
}

# Create lock
create_lock() {
    echo $$ > "$LOCKFILE"
    trap 'rm -f "$LOCKFILE"; exit' INT TERM EXIT
}

# Remove lock
remove_lock() {
    rm -f "$LOCKFILE"
    trap - INT TERM EXIT
}

# Interactive confirmation
confirm_commit() {
    local changes_count="$1"
    
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo -e "${BLUE}    BC-BASH Auto-Commit Assistant${NC}"
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo
    echo -e "${YELLOW}📋 Se encontraron $changes_count cambio(s) pendiente(s)${NC}"
    echo
    
    # Show git status
    echo -e "${BLUE}Estado actual del repositorio:${NC}"
    git status --porcelain | head -10
    
    if [[ $(git status --porcelain | wc -l) -gt 10 ]]; then
        echo "... y $(( $(git status --porcelain | wc -l) - 10 )) archivo(s) más"
    fi
    
    echo
    echo -e "${BLUE}Opciones disponibles:${NC}"
    echo "  [y] Sí, hacer commit automático"
    echo "  [n] No, salir sin cambios"
    echo "  [s] Mostrar cambios detallados"
    echo "  [m] Hacer commit manual (editor)"
    echo "  [d] Diferir por 1 hora"
    echo
    
    while true; do
        read -p "¿Qué deseas hacer? [y/n/s/m/d]: " -r choice
        case "$choice" in
            [Yy]*)
                return 0
                ;;
            [Nn]*)
                echo -e "${RED}❌ Operación cancelada${NC}"
                return 1
                ;;
            [Ss]*)
                echo -e "${BLUE}📊 Cambios detallados:${NC}"
                git diff --stat
                echo
                ;;
            [Mm]*)
                echo -e "${BLUE}✏️  Abriendo editor para commit manual...${NC}"
                git add .
                git commit
                echo -e "${GREEN}✅ Commit manual completado${NC}"
                return 2
                ;;
            [Dd]*)
                echo -e "${YELLOW}⏰ Difiriendo por 1 hora...${NC}"
                # Schedule for 1 hour later
                echo "*/60 * * * * $SCRIPT_DIR/cron-auto-commit.sh" | crontab -
                return 3
                ;;
            *)
                echo -e "${RED}Opción no válida. Por favor, elige y, n, s, m, o d.${NC}"
                ;;
        esac
    done
}

# Non-interactive mode (for cron)
handle_non_interactive() {
    local changes_count="$1"
    
    log "Running in non-interactive mode"
    log "Found $changes_count changes"
    
    # Create notification for GUI applications
    create_notification_file "$changes_count"
    
    # Send desktop notification
    send_notification "BC-BASH Auto-Commit" "Se encontraron $changes_count cambios. Ejecuta el script manualmente para confirmar."
    
    # Try to open terminal if in GUI environment
    if [[ -n "${DISPLAY:-}" ]] || [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
        # Try different terminal emulators
        for terminal in gnome-terminal konsole xterm x-terminal-emulator; do
            if command -v "$terminal" >/dev/null 2>&1; then
                log "Opening terminal with $terminal"
                $terminal -- bash -c "cd '$PROJECT_DIR' && '$0' --interactive; read -p 'Presiona Enter para cerrar...'"
                break
            fi
        done
    fi
    
    return 1
}

# Main execution function
main() {
    local interactive_mode=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --interactive)
                interactive_mode=true
                shift
                ;;
            --help|-h)
                echo "Uso: $0 [--interactive]"
                echo "  --interactive  Forzar modo interactivo"
                exit 0
                ;;
            *)
                echo "Opción desconocida: $1" >&2
                exit 1
                ;;
        esac
    done
    
    # Change to project directory
    cd "$PROJECT_DIR" || {
        log "Error: No se puede acceder al directorio del proyecto: $PROJECT_DIR"
        exit 1
    }
    
    # Check if git repository
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        log "Error: No es un repositorio git válido"
        exit 1
    fi
    
    # Check for changes
    if ! git diff --quiet || ! git diff --cached --quiet || [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
        local changes_count
        changes_count=$(git status --porcelain | wc -l)
        
        # Determine if we should run interactively
        if [[ "$interactive_mode" == "true" ]] || is_interactive; then
            if confirm_commit "$changes_count"; then
                log "User confirmed auto-commit"
                check_lock
                create_lock
                
                # Execute auto-commit
                if bash "$SCRIPT_DIR/auto-commit.sh"; then
                    echo -e "${GREEN}✅ Auto-commit completado exitosamente${NC}"
                    rm -f "$NOTIFICATION_FILE"
                else
                    echo -e "${RED}❌ Error durante el auto-commit${NC}"
                    exit 1
                fi
                
                remove_lock
            else
                local exit_code=$?
                if [[ $exit_code -eq 2 ]] || [[ $exit_code -eq 3 ]]; then
                    # Manual commit or deferred
                    rm -f "$NOTIFICATION_FILE"
                fi
                exit $exit_code
            fi
        else
            handle_non_interactive "$changes_count"
            exit 1
        fi
    else
        log "No changes detected"
        rm -f "$NOTIFICATION_FILE"
    fi
}

# Execute main function with all arguments
main "$@"
