#!/bin/bash
# Cron Service Detection Library
# Funciones auxiliares para detectar y manejar servicios de cron en diferentes distribuciones

# Detect cron service name based on the distribution
detect_cron_service() {
    local service=""
    
    # Check which cron service is available and running
    if systemctl list-unit-files 2>/dev/null | grep -q "^crond.service"; then
        service="crond"
    elif systemctl list-unit-files 2>/dev/null | grep -q "^cron.service"; then
        service="cron"
    elif systemctl list-unit-files 2>/dev/null | grep -q "^cronie.service"; then
        service="cronie"
    fi
    
    echo "$service"
}

# Check if cron service is running
is_cron_running() {
    local service
    service=$(detect_cron_service)
    
    if [[ -n "$service" ]]; then
        systemctl is-active --quiet "$service" 2>/dev/null
        return $?
    else
        return 1
    fi
}

# Get cron service status with color output
get_cron_status() {
    local service
    service=$(detect_cron_service)
    
    # Colors
    local GREEN='\033[0;32m'
    local YELLOW='\033[1;33m'
    local RED='\033[0;31m'
    local NC='\033[0m'
    
    if [[ -n "$service" ]]; then
        if systemctl is-active --quiet "$service" 2>/dev/null; then
            echo -e "${GREEN}✅ Servicio cron ($service) está ejecutándose${NC}"
            return 0
        else
            echo -e "${YELLOW}⚠️  Servicio cron ($service) está disponible pero no ejecutándose${NC}"
            echo -e "${YELLOW}   Ejecuta: sudo systemctl start $service${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ No se encontró servicio de cron${NC}"
        echo -e "${RED}   Instala cron: sudo dnf install cronie (Fedora/RHEL) o sudo apt install cron (Debian/Ubuntu)${NC}"
        return 2
    fi
}

# Start cron service with appropriate command for the distribution
start_cron_service() {
    local service
    service=$(detect_cron_service)
    
    if [[ -n "$service" ]]; then
        echo "Iniciando servicio $service..."
        sudo systemctl start "$service"
        sudo systemctl enable "$service"
        echo "Servicio $service iniciado y habilitado"
    else
        echo "Error: No se encontró servicio de cron"
        return 1
    fi
}

# Get distribution-specific cron commands
get_cron_commands() {
    local service
    service=$(detect_cron_service)
    
    echo "Comandos para el servicio de cron ($service):"
    echo "  Iniciar:    sudo systemctl start $service"
    echo "  Parar:      sudo systemctl stop $service"
    echo "  Habilitar:  sudo systemctl enable $service"
    echo "  Estado:     sudo systemctl status $service"
    echo "  Ver logs:   sudo journalctl -u $service -f"
}

# Verify cron is working by checking if crontab command is available
verify_cron_installation() {
    if command -v crontab >/dev/null 2>&1; then
        echo "✅ Comando crontab disponible"
        
        # Check if user can list crontab
        if crontab -l >/dev/null 2>&1; then
            echo "✅ Usuario puede acceder a crontab"
        else
            echo "⚠️  Usuario puede requerir configuración de crontab"
        fi
        
        get_cron_status
        return 0
    else
        echo "❌ Comando crontab no disponible"
        echo "   Instala cron en tu distribución"
        return 1
    fi
}

# Functions are available when this script is sourced
# Usage: source cron-utils.sh
