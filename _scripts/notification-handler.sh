#!/bin/bash
# BC-BASH Notification Handler
# Script para manejar notificaciones del sistema de auto-commit

set -euo pipefail

NOTIFICATION_FILE="/tmp/bc-bash-commit-notification"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check for pending notifications
check_notifications() {
    if [[ ! -f "$NOTIFICATION_FILE" ]]; then
        echo -e "${BLUE}ℹ️  No hay notificaciones pendientes${NC}"
        return 1
    fi
    
    local notification_data
    notification_data=$(cat "$NOTIFICATION_FILE")
    
    local timestamp changes_count project_dir status
    timestamp=$(echo "$notification_data" | grep -o '"timestamp":"[^"]*"' | cut -d'"' -f4)
    changes_count=$(echo "$notification_data" | grep -o '"changes_count":[0-9]*' | cut -d':' -f2)
    project_dir=$(echo "$notification_data" | grep -o '"project_dir":"[^"]*"' | cut -d'"' -f4)
    status=$(echo "$notification_data" | grep -o '"status":"[^"]*"' | cut -d'"' -f4)
    
    echo -e "${YELLOW}📬 Notificación pendiente de auto-commit${NC}"
    echo -e "${BLUE}Timestamp:${NC} $timestamp"
    echo -e "${BLUE}Cambios:${NC} $changes_count archivo(s)"
    echo -e "${BLUE}Proyecto:${NC} $project_dir"
    echo -e "${BLUE}Estado:${NC} $status"
    echo
    
    return 0
}

# Handle notification
handle_notification() {
    if ! check_notifications; then
        return 1
    fi
    
    echo -e "${BLUE}¿Qué deseas hacer?${NC}"
    echo "  [c] Proceder con auto-commit"
    echo "  [i] Ignorar por ahora"
    echo "  [d] Eliminar notificación"
    echo "  [s] Mostrar estado del repositorio"
    echo
    
    read -p "Selecciona una opción [c/i/d/s]: " choice
    
    case "$choice" in
        [Cc]*)
            echo -e "${BLUE}🚀 Ejecutando auto-commit interactivo...${NC}"
            "$SCRIPT_DIR/cron-auto-commit.sh" --interactive
            ;;
        [Ii]*)
            echo -e "${YELLOW}⏸️  Notificación ignorada (permanece activa)${NC}"
            ;;
        [Dd]*)
            rm -f "$NOTIFICATION_FILE"
            echo -e "${GREEN}🗑️  Notificación eliminada${NC}"
            ;;
        [Ss]*)
            echo -e "${BLUE}📊 Estado del repositorio:${NC}"
            local notification_data project_dir
            notification_data=$(cat "$NOTIFICATION_FILE")
            project_dir=$(echo "$notification_data" | grep -o '"project_dir":"[^"]*"' | cut -d'"' -f4)
            
            cd "$project_dir" || {
                echo -e "${RED}❌ Error: No se puede acceder al directorio del proyecto${NC}"
                return 1
            }
            
            git status
            echo
            handle_notification  # Show options again
            ;;
        *)
            echo -e "${RED}Opción no válida${NC}"
            handle_notification
            ;;
    esac
}

# Clean old notifications
clean_old_notifications() {
    if [[ ! -f "$NOTIFICATION_FILE" ]]; then
        return 0
    fi
    
    local notification_data timestamp
    notification_data=$(cat "$NOTIFICATION_FILE")
    timestamp=$(echo "$notification_data" | grep -o '"timestamp":"[^"]*"' | cut -d'"' -f4)
    
    # Convert timestamp to epoch
    local notification_epoch current_epoch age_hours
    notification_epoch=$(date -d "$timestamp" +%s 2>/dev/null || echo "0")
    current_epoch=$(date +%s)
    age_hours=$(( (current_epoch - notification_epoch) / 3600 ))
    
    # Remove notifications older than 24 hours
    if [[ $age_hours -gt 24 ]]; then
        rm -f "$NOTIFICATION_FILE"
        echo -e "${YELLOW}🧹 Notificación antigua eliminada (más de 24 horas)${NC}"
        return 1
    fi
    
    return 0
}

# Show help
show_help() {
    cat << EOF
${BLUE}BC-BASH Notification Handler${NC}

${YELLOW}DESCRIPCIÓN:${NC}
    Maneja las notificaciones del sistema de auto-commit cron.

${YELLOW}USO:${NC}
    $0 [COMANDO]

${YELLOW}COMANDOS:${NC}
    check      Verificar notificaciones pendientes
    handle     Manejar notificación pendiente interactivamente
    clean      Limpiar notificaciones antiguas
    help       Mostrar esta ayuda

${YELLOW}EJEMPLOS:${NC}
    $0 check    # Verificar si hay notificaciones
    $0 handle   # Manejar notificación pendiente
    $0 clean    # Limpiar notificaciones antiguas

EOF
}

# Main function
main() {
    case "${1:-handle}" in
        "check")
            check_notifications
            ;;
        "handle")
            clean_old_notifications
            handle_notification
            ;;
        "clean")
            clean_old_notifications
            echo -e "${GREEN}✅ Limpieza completada${NC}"
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        *)
            echo -e "${RED}❌ Comando desconocido: $1${NC}"
            echo -e "${YELLOW}Ejecuta '$0 help' para ver las opciones disponibles${NC}"
            exit 1
            ;;
    esac
}

# Execute main function
main "$@"
