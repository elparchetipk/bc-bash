#!/bin/bash
# Demo del Sistema de Auto-Commit con Cron
# Demuestra las capacidades del sistema de auto-commit automatizado

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Demo functions
demo_header() {
    clear
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}            BC-BASH Auto-Commit con Cron - Demo${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo
}

demo_step() {
    echo -e "${CYAN}📋 $1${NC}"
    echo
}

wait_for_user() {
    echo
    read -p "Presiona Enter para continuar..."
    echo
}

# Demo 1: Basic auto-commit
demo_basic_auto_commit() {
    demo_header
    demo_step "Demo 1: Auto-Commit Básico"
    
    echo -e "${YELLOW}Creando archivos de ejemplo para demostrar auto-commit...${NC}"
    
    # Create a test file
    cat > "$PROJECT_DIR/demo_file.md" << EOF
# Archivo de Demo

Este es un archivo creado para demostrar el sistema de auto-commit.

## Características

- Auto-detección de tipos de commit
- Mensajes descriptivos automáticos
- Agrupación inteligente de archivos
EOF
    
    echo -e "${GREEN}✅ Archivo creado: demo_file.md${NC}"
    
    # Show git status
    cd "$PROJECT_DIR"
    echo -e "${BLUE}Estado actual del repositorio:${NC}"
    git status --porcelain
    
    wait_for_user
    
    echo -e "${YELLOW}Ejecutando auto-commit...${NC}"
    "$SCRIPT_DIR/auto-commit.sh"
    
    echo -e "${GREEN}✅ Demo 1 completado${NC}"
    wait_for_user
}

# Demo 2: Cron auto-commit interactive
demo_cron_interactive() {
    demo_header
    demo_step "Demo 2: Auto-Commit Interactivo (Simulación Cron)"
    
    echo -e "${YELLOW}Creando más cambios para demostrar el modo interactivo...${NC}"
    
    # Create another test file
    cat > "$PROJECT_DIR/demo_script.sh" << 'EOF'
#!/bin/bash
# Script de ejemplo para el demo

echo "Hola desde el script de demo"
echo "Este script demuestra la detección automática de tipos"

# Función de ejemplo
demo_function() {
    local message="$1"
    echo "Demo: $message"
}

demo_function "Auto-commit funciona!"
EOF
    
    chmod +x "$PROJECT_DIR/demo_script.sh"
    
    echo -e "${GREEN}✅ Script creado: demo_script.sh${NC}"
    
    # Show git status
    echo -e "${BLUE}Estado actual del repositorio:${NC}"
    git status --porcelain
    
    wait_for_user
    
    echo -e "${YELLOW}Ejecutando cron auto-commit en modo interactivo...${NC}"
    echo -e "${CYAN}Nota: Esto simula lo que pasaría cuando cron ejecuta el script${NC}"
    
    "$SCRIPT_DIR/cron-auto-commit.sh" --interactive
    
    echo -e "${GREEN}✅ Demo 2 completado${NC}"
    wait_for_user
}

# Demo 3: Notification system
demo_notifications() {
    demo_header
    demo_step "Demo 3: Sistema de Notificaciones"
    
    echo -e "${YELLOW}Simulando notificación pendiente...${NC}"
    
    # Create a notification file manually
    cat > "/tmp/bc-bash-commit-notification" << EOF
{
    "timestamp": "$(date -Iseconds)",
    "changes_count": 3,
    "project_dir": "$PROJECT_DIR",
    "status": "pending"
}
EOF
    
    echo -e "${GREEN}✅ Notificación simulada creada${NC}"
    
    wait_for_user
    
    echo -e "${YELLOW}Manejando notificación...${NC}"
    "$SCRIPT_DIR/notification-handler.sh" check
    
    echo
    echo -e "${CYAN}Puedes ejecutar '${SCRIPT_DIR}/notification-handler.sh' para manejar la notificación${NC}"
    
    wait_for_user
}

# Demo 4: Cron setup
demo_cron_setup() {
    demo_header
    demo_step "Demo 4: Configuración de Cron (Simulación)"
    
    echo -e "${YELLOW}Mostrando el sistema de configuración de cron...${NC}"
    echo -e "${CYAN}Nota: No se añadirán tareas cron reales en este demo${NC}"
    
    wait_for_user
    
    echo -e "${BLUE}Contenido del script de configuración de cron:${NC}"
    echo
    
    # Show help from the cron setup script
    "$SCRIPT_DIR/setup-cron-commit.sh" help
    
    echo
    echo -e "${CYAN}Para configurar cron realmente, ejecuta:${NC}"
    echo -e "${CYAN}  ${SCRIPT_DIR}/setup-cron-commit.sh${NC}"
    
    wait_for_user
}

# Demo 5: Configuration overview
demo_configuration() {
    demo_header
    demo_step "Demo 5: Configuración del Sistema"
    
    echo -e "${YELLOW}Mostrando configuración actual...${NC}"
    
    echo -e "${BLUE}Archivo de configuración:${NC} _scripts/commit-config.json"
    echo
    
    # Show key parts of config
    echo -e "${BLUE}Tipos de commit configurados:${NC}"
    grep -A 15 '"commit_patterns"' "$SCRIPT_DIR/commit-config.json" | head -15
    
    echo
    echo -e "${BLUE}Mapeo de directorios:${NC}"
    grep -A 10 '"scope_mapping"' "$SCRIPT_DIR/commit-config.json" | head -10
    
    wait_for_user
}

# Cleanup demo files
cleanup_demo() {
    demo_header
    demo_step "Limpieza de Demo"
    
    echo -e "${YELLOW}Limpiando archivos de demo...${NC}"
    
    cd "$PROJECT_DIR"
    
    # Remove demo files if they exist
    for file in demo_file.md demo_script.sh; do
        if [[ -f "$file" ]]; then
            rm -f "$file"
            echo -e "${GREEN}✅ Eliminado: $file${NC}"
        fi
    done
    
    # Remove notification file
    rm -f "/tmp/bc-bash-commit-notification"
    echo -e "${GREEN}✅ Notificación de demo eliminada${NC}"
    
    # Restore git state if needed
    if git status --porcelain | grep -q .; then
        echo -e "${YELLOW}⚠️  Hay cambios sin confirmar. ¿Deseas revertirlos?${NC}"
        read -p "¿Revertir cambios? [y/N]: " -r choice
        if [[ "$choice" =~ ^[Yy]$ ]]; then
            git checkout -- .
            git clean -fd
            echo -e "${GREEN}✅ Cambios revertidos${NC}"
        fi
    fi
    
    echo -e "${GREEN}✅ Limpieza completada${NC}"
}

# Main menu
show_menu() {
    demo_header
    echo -e "${YELLOW}Selecciona una demo para ejecutar:${NC}"
    echo
    echo "  1) Auto-Commit Básico"
    echo "  2) Auto-Commit Interactivo (Simulación Cron)"
    echo "  3) Sistema de Notificaciones"
    echo "  4) Configuración de Cron (Simulación)"
    echo "  5) Configuración del Sistema"
    echo "  6) Ejecutar todas las demos"
    echo "  7) Limpiar archivos de demo"
    echo "  8) Salir"
    echo
}

# Run all demos
run_all_demos() {
    demo_basic_auto_commit
    demo_cron_interactive
    demo_notifications
    demo_cron_setup
    demo_configuration
    
    demo_header
    echo -e "${GREEN}🎉 ¡Todas las demos completadas!${NC}"
    echo
    echo -e "${CYAN}Para usar el sistema en producción:${NC}"
    echo -e "${CYAN}1. Configura cron: ${SCRIPT_DIR}/setup-cron-commit.sh${NC}"
    echo -e "${CYAN}2. Maneja notificaciones: ${SCRIPT_DIR}/notification-handler.sh${NC}"
    echo -e "${CYAN}3. Usa auto-commit manual: ${SCRIPT_DIR}/auto-commit.sh${NC}"
    wait_for_user
}

# Main execution
main() {
    # Check if we're in the right directory
    if [[ ! -f "$SCRIPT_DIR/auto-commit.sh" ]]; then
        echo -e "${RED}❌ Error: No se encuentra auto-commit.sh${NC}"
        echo -e "${RED}   Asegúrate de ejecutar este script desde el directorio correcto${NC}"
        exit 1
    fi
    
    case "${1:-menu}" in
        "1"|"basic")
            demo_basic_auto_commit
            ;;
        "2"|"interactive")
            demo_cron_interactive
            ;;
        "3"|"notifications")
            demo_notifications
            ;;
        "4"|"cron")
            demo_cron_setup
            ;;
        "5"|"config")
            demo_configuration
            ;;
        "6"|"all")
            run_all_demos
            ;;
        "7"|"cleanup")
            cleanup_demo
            ;;
        "menu"|"")
            while true; do
                show_menu
                read -p "Selecciona una opción [1-8]: " choice
                
                case "$choice" in
                    1) demo_basic_auto_commit ;;
                    2) demo_cron_interactive ;;
                    3) demo_notifications ;;
                    4) demo_cron_setup ;;
                    5) demo_configuration ;;
                    6) run_all_demos ;;
                    7) cleanup_demo ;;
                    8) echo -e "${GREEN}¡Hasta luego!${NC}"; exit 0 ;;
                    *) echo -e "${RED}Opción no válida${NC}"; sleep 1 ;;
                esac
            done
            ;;
        "help"|"--help"|"-h")
            echo "Uso: $0 [demo]"
            echo "Demos disponibles: basic, interactive, notifications, cron, config, all, cleanup"
            echo "Sin argumentos: menú interactivo"
            ;;
        *)
            echo -e "${RED}❌ Opción desconocida: $1${NC}"
            echo -e "${YELLOW}Ejecuta '$0 help' para ver las opciones${NC}"
            exit 1
            ;;
    esac
}

# Execute main function
main "$@"
