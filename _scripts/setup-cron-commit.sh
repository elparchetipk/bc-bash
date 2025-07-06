#!/bin/bash
# Setup Cron Auto-Commit
# Script para configurar la tarea cron de auto-commit

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CRON_SCRIPT="$SCRIPT_DIR/cron-auto-commit.sh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Display current cron jobs related to bc-bash
show_current_cron() {
    echo -e "${BLUE}Tareas cron actuales relacionadas con bc-bash:${NC}"
    if crontab -l 2>/dev/null | grep -i "bc-bash\|auto-commit" || true; then
        echo "  (ninguna encontrada)"
    fi
    echo
}

# Add cron job
add_cron_job() {
    local interval="$1"
    local cron_expression=""
    
    case "$interval" in
        "1min")
            cron_expression="* * * * *"
            ;;
        "2min")
            cron_expression="*/2 * * * *"
            ;;
        "5min")
            cron_expression="*/5 * * * *"
            ;;
        "10min")
            cron_expression="*/10 * * * *"
            ;;
        "15min")
            cron_expression="*/15 * * * *"
            ;;
        "30min")
            cron_expression="*/30 * * * *"
            ;;
        "1hour")
            cron_expression="0 * * * *"
            ;;
        "2hours")
            cron_expression="0 */2 * * *"
            ;;
        "custom")
            read -p "Introduce la expresión cron personalizada: " cron_expression
            ;;
        *)
            echo -e "${RED}❌ Intervalo no válido${NC}"
            return 1
            ;;
    esac
    
    # Create new cron entry
    local new_entry="$cron_expression $CRON_SCRIPT # bc-bash auto-commit"
    
    # Get current crontab and add new entry
    (crontab -l 2>/dev/null | grep -v "bc-bash auto-commit" || true; echo "$new_entry") | crontab -
    
    echo -e "${GREEN}✅ Tarea cron añadida exitosamente${NC}"
    echo -e "${BLUE}Expresión cron:${NC} $cron_expression"
    echo -e "${BLUE}Script:${NC} $CRON_SCRIPT"
    
    # Verify cron service is running (detect different distributions)
    local cron_service=""
    if systemctl is-active --quiet crond 2>/dev/null; then
        cron_service="crond"
    elif systemctl is-active --quiet cron 2>/dev/null; then
        cron_service="cron"
    elif systemctl is-active --quiet cronie 2>/dev/null; then
        cron_service="cronie"
    fi
    
    if [[ -n "$cron_service" ]]; then
        echo -e "${GREEN}✅ Servicio cron ($cron_service) está ejecutándose${NC}"
    else
        echo -e "${YELLOW}⚠️  Advertencia: El servicio cron no está ejecutándose${NC}"
        # Detect distribution and suggest correct command
        if [[ -f /etc/fedora-release ]] || [[ -f /etc/redhat-release ]]; then
            echo -e "${YELLOW}   Ejecuta: sudo systemctl start crond${NC}"
            echo -e "${YELLOW}   Para habilitarlo: sudo systemctl enable crond${NC}"
        elif [[ -f /etc/debian_version ]]; then
            echo -e "${YELLOW}   Ejecuta: sudo systemctl start cron${NC}"
            echo -e "${YELLOW}   Para habilitarlo: sudo systemctl enable cron${NC}"
        else
            echo -e "${YELLOW}   Ejecuta: sudo systemctl start crond o sudo systemctl start cron${NC}"
        fi
    fi
}

# Remove cron job
remove_cron_job() {
    # Remove bc-bash auto-commit entries from crontab
    crontab -l 2>/dev/null | grep -v "bc-bash auto-commit" | crontab - 2>/dev/null || true
    echo -e "${GREEN}✅ Tareas cron de bc-bash eliminadas${NC}"
}

# Test the cron script
test_cron_script() {
    echo -e "${BLUE}🧪 Probando el script de auto-commit...${NC}"
    echo
    
    if [[ -x "$CRON_SCRIPT" ]]; then
        echo -e "${GREEN}✅ Script es ejecutable${NC}"
    else
        echo -e "${RED}❌ Script no es ejecutable${NC}"
        return 1
    fi
    
    # Test in non-interactive mode
    echo -e "${BLUE}Ejecutando en modo no interactivo...${NC}"
    if "$CRON_SCRIPT"; then
        echo -e "${GREEN}✅ Prueba exitosa${NC}"
    else
        echo -e "${YELLOW}⚠️  El script completó con código de salida $?${NC}"
        echo -e "${YELLOW}   Esto es normal si no hay cambios o requiere interacción${NC}"
    fi
}

# Show help
show_help() {
    cat << EOF
${BLUE}BC-BASH Cron Auto-Commit Setup${NC}

${YELLOW}DESCRIPCIÓN:${NC}
    Configura una tarea cron para ejecutar auto-commit periódicamente.
    El script solicitará confirmación del usuario antes de hacer commits.

${YELLOW}USO:${NC}
    $0 [COMANDO] [OPCIONES]

${YELLOW}COMANDOS:${NC}
    add [INTERVALO]  Añadir nueva tarea cron
    remove          Eliminar tareas cron existentes
    list            Mostrar tareas cron actuales
    test            Probar el script de auto-commit
    help            Mostrar esta ayuda

${YELLOW}INTERVALOS DISPONIBLES (Optimizado para Competencias):${NC}
    1min            Cada minuto (COMPETENCIA INTENSIVA) ⚡
    2min            Cada 2 minutos (COMPETENCIA RÁPIDA) 🏃‍♂️
    5min            Cada 5 minutos (DESARROLLO SPRINT) ⚡
    10min           Cada 10 minutos (DESARROLLO ACTIVO) 🔄
    15min           Cada 15 minutos (TRABAJO NORMAL) 📝
    30min           Cada 30 minutos (TRABAJO PAUSADO) 🕐
    1hour           Cada hora (MANTENIMIENTO) 📅
    2hours          Cada 2 horas (TRABAJO LENTO) 🌙
    custom          Expresión cron personalizada ⚙️

${YELLOW}EJEMPLOS (Contexto de Competencia):${NC}
    $0 add 1min      # Competencia intensiva (cada minuto)
    $0 add 5min      # Sprint de desarrollo rápido
    $0 add 15min     # Desarrollo normal con commits frecuentes
    $0 remove        # Eliminar todas las tareas
    $0 test          # Probar el script

${YELLOW}RECOMENDACIONES POR CONTEXTO:${NC}
    🏆 COMPETENCIA HACKATHON:     1min o 2min
    ⚡ DESARROLLO SPRINT:         5min o 10min  
    📝 TRABAJO COLABORATIVO:      15min o 30min
    🔧 MANTENIMIENTO/REFACTOR:    1hour o 2hours

${YELLOW}NOTAS:${NC}
    • El script enviará notificaciones cuando encuentre cambios
    • En entornos gráficos, intentará abrir una terminal para confirmación
    • Los commits automáticos requieren confirmación del usuario
    • Se puede diferir la ejecución por intervalos específicos

EOF
}

# Interactive menu
interactive_menu() {
    while true; do
        echo -e "${BLUE}═══════════════════════════════════════${NC}"
        echo -e "${BLUE}    BC-BASH Cron Auto-Commit Setup${NC}"
        echo -e "${BLUE}═══════════════════════════════════════${NC}"
        echo
        
        show_current_cron
        
        echo -e "${BLUE}Opciones disponibles:${NC}"
        echo "  1) Añadir tarea cron (cada 1 minuto) 🏃‍♂️ COMPETENCIA"
        echo "  2) Añadir tarea cron (cada 2 minutos) 🏃‍♂️ COMPETENCIA"
        echo "  3) Añadir tarea cron (cada 5 minutos) ⚡ DESARROLLO RÁPIDO"
        echo "  4) Añadir tarea cron (cada 10 minutos) 🔄 DESARROLLO ACTIVO"
        echo "  5) Añadir tarea cron (cada 15 minutos) 📝 TRABAJO NORMAL"
        echo "  6) Añadir tarea cron (cada 30 minutos) 🕐 TRABAJO PAUSADO"
        echo "  7) Añadir tarea cron (cada hora) 📅 MANTENIMIENTO"
        echo "  8) Añadir tarea cron (cada 2 horas) 🌙 TRABAJO LENTO"
        echo "  9) Añadir tarea cron (personalizada) ⚙️ CONFIGURACIÓN MANUAL"
        echo " 10) Eliminar todas las tareas cron"
        echo " 11) Probar script de auto-commit"
        echo " 12) Salir"
        echo
        
        read -p "Selecciona una opción [1-12]: " choice
        
        case "$choice" in
            1) add_cron_job "1min" ;;
            2) add_cron_job "2min" ;;
            3) add_cron_job "5min" ;;
            4) add_cron_job "10min" ;;
            5) add_cron_job "15min" ;;
            6) add_cron_job "30min" ;;
            7) add_cron_job "1hour" ;;
            8) add_cron_job "2hours" ;;
            9) add_cron_job "custom" ;;
            10) remove_cron_job ;;
            11) test_cron_script ;;
            12) echo -e "${GREEN}¡Hasta luego!${NC}"; exit 0 ;;
            *) echo -e "${RED}Opción no válida${NC}" ;;
        esac
        
        echo
        read -p "Presiona Enter para continuar..."
        clear
    done
}

# Main function
main() {
    # Check if cron-auto-commit.sh exists and is executable
    if [[ ! -f "$CRON_SCRIPT" ]]; then
        echo -e "${RED}❌ Error: No se encuentra el script $CRON_SCRIPT${NC}"
        exit 1
    fi
    
    if [[ ! -x "$CRON_SCRIPT" ]]; then
        echo -e "${YELLOW}⚠️  Haciendo ejecutable el script de auto-commit...${NC}"
        chmod +x "$CRON_SCRIPT"
    fi
    
    # Parse command line arguments
    case "${1:-interactive}" in
        "add")
            if [[ -n "${2:-}" ]]; then
                add_cron_job "$2"
            else
                echo -e "${RED}❌ Error: Especifica un intervalo${NC}"
                echo -e "${YELLOW}Ejemplo: $0 add 1hour${NC}"
                exit 1
            fi
            ;;
        "remove")
            remove_cron_job
            ;;
        "list")
            show_current_cron
            ;;
        "test")
            test_cron_script
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        "interactive"|"")
            interactive_menu
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
