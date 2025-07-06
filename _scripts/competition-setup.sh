#!/bin/bash
# BC-BASH Competition Auto-Commit Setup
# Configuración rápida para entornos de competencia de desarrollo

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Competition profiles
setup_competition_profile() {
    local profile="$1"
    
    echo -e "${PURPLE}🏆 Configurando perfil de competencia: $profile${NC}"
    echo
    
    case "$profile" in
        "hackathon")
            echo -e "${CYAN}📋 Configuración HACKATHON:${NC}"
            echo "   • Auto-commit cada 1 minuto"
            echo "   • Commits automáticos sin confirmación"
            echo "   • Mensajes descriptivos cortos"
            echo "   • Push automático deshabilitado"
            echo
            
            # Setup 1-minute cron
            "$SCRIPT_DIR/setup-cron-commit.sh" add 1min
            
            # Update config for aggressive commits
            update_config_for_competition "aggressive"
            ;;
            
        "sprint")
            echo -e "${CYAN}📋 Configuración SPRINT:${NC}"
            echo "   • Auto-commit cada 5 minutos"
            echo "   • Confirmación rápida del usuario"
            echo "   • Batching inteligente de archivos"
            echo "   • Notificaciones no intrusivas"
            echo
            
            # Setup 5-minute cron
            "$SCRIPT_DIR/setup-cron-commit.sh" add 5min
            
            # Update config for sprint development
            update_config_for_competition "moderate"
            ;;
            
        "collaborative")
            echo -e "${CYAN}📋 Configuración COLABORATIVA:${NC}"
            echo "   • Auto-commit cada 10 minutos"
            echo "   • Confirmación del usuario requerida"
            echo "   • Commits descriptivos detallados"
            echo "   • Integración con notificaciones"
            echo
            
            # Setup 10-minute cron
            "$SCRIPT_DIR/setup-cron-commit.sh" add 10min
            
            # Update config for collaborative work
            update_config_for_competition "conservative"
            ;;
            
        "custom")
            echo -e "${CYAN}📋 Configuración PERSONALIZADA:${NC}"
            show_custom_setup
            ;;
            
        *)
            echo -e "${RED}❌ Perfil desconocido: $profile${NC}"
            return 1
            ;;
    esac
    
    echo -e "${GREEN}✅ Perfil de competencia configurado exitosamente${NC}"
}

# Update configuration based on competition needs
update_config_for_competition() {
    local intensity="$1"
    local config_file="$SCRIPT_DIR/commit-config.json"
    
    case "$intensity" in
        "aggressive")
            # Very fast commits, minimal batching
            sed -i 's/"max_files_per_commit": [0-9]*/"max_files_per_commit": 20/' "$config_file"
            ;;
        "moderate")
            # Balanced approach
            sed -i 's/"max_files_per_commit": [0-9]*/"max_files_per_commit": 15/' "$config_file"
            ;;
        "conservative")
            # Careful commits
            sed -i 's/"max_files_per_commit": [0-9]*/"max_files_per_commit": 10/' "$config_file"
            ;;
    esac
}

# Show custom setup options
show_custom_setup() {
    echo "Intervalos disponibles para configuración personalizada:"
    echo "  • 1min   - Competencia extrema"
    echo "  • 2min   - Competencia intensa"
    echo "  • 5min   - Sprint activo"
    echo "  • 10min  - Desarrollo normal"
    echo "  • 15min  - Trabajo pausado"
    echo
    
    read -p "¿Qué intervalo deseas usar? [1min/2min/5min/10min/15min]: " interval
    
    case "$interval" in
        "1min"|"2min"|"5min"|"10min"|"15min")
            "$SCRIPT_DIR/setup-cron-commit.sh" add "$interval"
            update_config_for_competition "moderate"
            ;;
        *)
            echo -e "${RED}❌ Intervalo no válido${NC}"
            return 1
            ;;
    esac
}

# Quick competition start
quick_start() {
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo -e "${BLUE}    🚀 INICIO RÁPIDO DE COMPETENCIA${NC}"
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo
    
    echo -e "${YELLOW}Selecciona tu tipo de competencia:${NC}"
    echo
    echo "  1) 🏃‍♂️ HACKATHON (commits cada 1 minuto)"
    echo "  2) ⚡ SPRINT (commits cada 5 minutos)"
    echo "  3) 🤝 COLABORATIVO (commits cada 10 minutos)"
    echo "  4) ⚙️ PERSONALIZADO"
    echo "  5) 📊 Mostrar estado actual"
    echo "  6) 🧹 Limpiar configuración"
    echo "  7) ❌ Salir"
    echo
    
    read -p "Selecciona una opción [1-7]: " choice
    
    case "$choice" in
        1)
            setup_competition_profile "hackathon"
            show_post_setup_info
            ;;
        2)
            setup_competition_profile "sprint"
            show_post_setup_info
            ;;
        3)
            setup_competition_profile "collaborative"
            show_post_setup_info
            ;;
        4)
            setup_competition_profile "custom"
            show_post_setup_info
            ;;
        5)
            show_current_status
            ;;
        6)
            clean_configuration
            ;;
        7)
            echo -e "${GREEN}¡Buena suerte en tu competencia!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Opción no válida${NC}"
            quick_start
            ;;
    esac
}

# Show current status
show_current_status() {
    echo -e "${BLUE}📊 ESTADO ACTUAL DEL SISTEMA${NC}"
    echo
    
    echo -e "${YELLOW}Tareas cron activas:${NC}"
    if crontab -l 2>/dev/null | grep -q "bc-bash auto-commit"; then
        crontab -l 2>/dev/null | grep "bc-bash auto-commit" | while read -r line; do
            echo "  ✅ $line"
        done
    else
        echo "  ❌ No hay tareas cron configuradas"
    fi
    
    echo
    echo -e "${YELLOW}Configuración actual:${NC}"
    if [[ -f "$SCRIPT_DIR/commit-config.json" ]]; then
        local max_files
        max_files=$(grep -o '"max_files_per_commit": [0-9]*' "$SCRIPT_DIR/commit-config.json" | cut -d':' -f2 | tr -d ' ')
        echo "  📁 Máximo archivos por commit: $max_files"
        
        local auto_push
        auto_push=$(grep -o '"auto_push": [a-z]*' "$SCRIPT_DIR/commit-config.json" | cut -d':' -f2 | tr -d ' ')
        echo "  🚀 Push automático: $auto_push"
    else
        echo "  ❌ No se encuentra archivo de configuración"
    fi
    
    echo
    echo -e "${YELLOW}Scripts disponibles:${NC}"
    for script in auto-commit.sh cron-auto-commit.sh setup-cron-commit.sh notification-handler.sh; do
        if [[ -f "$SCRIPT_DIR/$script" ]]; then
            echo "  ✅ $script"
        else
            echo "  ❌ $script (faltante)"
        fi
    done
    
    echo
    read -p "Presiona Enter para continuar..."
    quick_start
}

# Clean configuration
clean_configuration() {
    echo -e "${YELLOW}🧹 Limpiando configuración de competencia...${NC}"
    
    # Remove cron jobs
    "$SCRIPT_DIR/setup-cron-commit.sh" remove
    
    # Reset config to defaults
    local config_file="$SCRIPT_DIR/commit-config.json"
    if [[ -f "$config_file" ]]; then
        sed -i 's/"max_files_per_commit": [0-9]*/"max_files_per_commit": 10/' "$config_file"
        echo "  ✅ Configuración restablecida a valores por defecto"
    fi
    
    # Clean notification files
    rm -f /tmp/bc-bash-commit-notification
    echo "  ✅ Archivos de notificación eliminados"
    
    echo -e "${GREEN}✅ Limpieza completada${NC}"
    echo
    read -p "Presiona Enter para continuar..."
    quick_start
}

# Show post-setup information
show_post_setup_info() {
    echo
    echo -e "${GREEN}🎉 ¡Configuración completada!${NC}"
    echo
    echo -e "${CYAN}🔧 Comandos útiles durante la competencia:${NC}"
    echo "  • Verificar notificaciones:    ./_scripts/notification-handler.sh"
    echo "  • Commit manual inmediato:     ./_scripts/auto-commit.sh"
    echo "  • Cambiar configuración:       ./_scripts/setup-cron-commit.sh"
    echo "  • Estado del repositorio:      git status"
    echo
    echo -e "${CYAN}💡 Consejos para la competencia:${NC}"
    echo "  • El sistema notificará cuando haya cambios"
    echo "  • Siempre puedes hacer commits manuales"
    echo "  • Los commits automáticos requieren tu confirmación"
    echo "  • Usa 'git log --oneline' para ver el historial"
    echo
    echo -e "${YELLOW}⚠️  Recuerda: Siempre revisa los commits antes de hacer push final${NC}"
    echo
    read -p "Presiona Enter para finalizar..."
}

# Show help
show_help() {
    cat << EOF
${BLUE}BC-BASH Competition Auto-Commit Setup${NC}

${YELLOW}DESCRIPCIÓN:${NC}
    Configuración rápida de auto-commit optimizada para competencias de desarrollo.

${YELLOW}USO:${NC}
    $0 [PERFIL]

${YELLOW}PERFILES DISPONIBLES:${NC}
    hackathon      Commits cada 1 minuto (competencia intensa)
    sprint         Commits cada 5 minutos (desarrollo rápido)
    collaborative  Commits cada 10 minutos (trabajo en equipo)
    custom         Configuración personalizada
    
${YELLOW}EJEMPLOS:${NC}
    $0 hackathon   # Configuración para hackathon
    $0 sprint      # Configuración para sprint
    $0             # Menú interactivo

${YELLOW}CARACTERÍSTICAS POR PERFIL:${NC}
    
    🏃‍♂️ HACKATHON:
       • Commits cada 1 minuto
       • Máximo 20 archivos por commit
       • Optimizado para velocidad
       
    ⚡ SPRINT:
       • Commits cada 5 minutos
       • Máximo 15 archivos por commit
       • Balance velocidad/calidad
       
    🤝 COLABORATIVO:
       • Commits cada 10 minutos
       • Máximo 10 archivos por commit
       • Enfoque en calidad

EOF
}

# Main function
main() {
    # Check dependencies
    for script in setup-cron-commit.sh auto-commit.sh; do
        if [[ ! -f "$SCRIPT_DIR/$script" ]]; then
            echo -e "${RED}❌ Error: Script requerido no encontrado: $script${NC}"
            exit 1
        fi
    done
    
    case "${1:-interactive}" in
        "hackathon"|"sprint"|"collaborative"|"custom")
            setup_competition_profile "$1"
            show_post_setup_info
            ;;
        "status")
            show_current_status
            ;;
        "clean")
            clean_configuration
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        "interactive"|"")
            quick_start
            ;;
        *)
            echo -e "${RED}❌ Perfil desconocido: $1${NC}"
            echo -e "${YELLOW}Ejecuta '$0 help' para ver las opciones disponibles${NC}"
            exit 1
            ;;
    esac
}

# Execute main function
main "$@"
