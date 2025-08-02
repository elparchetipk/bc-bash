#!/bin/bash
# Install GitHub Copilot English Configuration
# Instala alias y funciones para usar Copilot en inglés

set -euo pipefail

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="$SCRIPT_DIR/copilot-aliases.sh"

echo -e "${BLUE}🔧 Instalando configuración de GitHub Copilot en inglés...${NC}"
echo

# Detect shell
SHELL_NAME=$(basename "$SHELL")
case "$SHELL_NAME" in
    "bash")
        RC_FILE="$HOME/.bashrc"
        ;;
    "zsh")
        RC_FILE="$HOME/.zshrc"
        ;;
    *)
        RC_FILE="$HOME/.profile"
        echo -e "${YELLOW}⚠️  Shell no reconocido ($SHELL_NAME), usando .profile${NC}"
        ;;
esac

echo -e "${BLUE}📁 Archivo de configuración detectado: $RC_FILE${NC}"

# Check if already configured
if grep -q "GitHub Copilot English Configuration" "$RC_FILE" 2>/dev/null; then
    echo -e "${YELLOW}⚠️  La configuración ya existe en $RC_FILE${NC}"
    read -p "¿Quieres actualizarla? [y/N]: " -r update_config
    if [[ ! "$update_config" =~ ^[Yy]$ ]]; then
        echo "Configuración no modificada"
        exit 0
    fi
    
    # Remove old configuration
    sed -i '/# GitHub Copilot English Configuration/,/# End GitHub Copilot Configuration/d' "$RC_FILE"
    echo -e "${GREEN}✅ Configuración anterior eliminada${NC}"
fi

# Add new configuration
echo "" >> "$RC_FILE"
echo "# GitHub Copilot English Configuration" >> "$RC_FILE"
echo "source \"$ALIASES_FILE\"" >> "$RC_FILE"
echo "# End GitHub Copilot Configuration" >> "$RC_FILE"

echo -e "${GREEN}✅ Configuración añadida a $RC_FILE${NC}"

# Source the configuration in current session
if [[ -f "$ALIASES_FILE" ]]; then
    # shellcheck source=/dev/null
    source "$ALIASES_FILE"
    echo -e "${GREEN}✅ Configuración cargada en la sesión actual${NC}"
else
    echo -e "${YELLOW}⚠️  Archivo de aliases no encontrado: $ALIASES_FILE${NC}"
fi

echo
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}            Instalación Completada${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo
echo -e "${GREEN}✅ Configuración instalada en: $RC_FILE${NC}"
echo -e "${GREEN}✅ Aliases y funciones disponibles${NC}"
echo
echo -e "${YELLOW}📋 Comandos disponibles:${NC}"
echo "   • code-en                          - Abrir VS Code en inglés"
echo "   • bc-bash-code                     - Abrir proyecto bc-bash en inglés"
echo "   • bc-commit                        - Auto-commit en inglés"
echo "   • git-config-english               - Configurar git globalmente"
echo "   • git-config-english-local         - Configurar git localmente"
echo "   • check-copilot-config             - Verificar configuración"
echo "   • setup-copilot-english-project    - Setup rápido para proyecto actual"
echo
echo -e "${YELLOW}🔄 Para aplicar en nuevas terminales:${NC}"
echo "   Reinicia tu terminal o ejecuta: source $RC_FILE"
echo
echo -e "${YELLOW}🧪 Para probar la configuración:${NC}"
echo "   1. Ejecuta: check-copilot-config"
echo "   2. Abre VS Code: code-en"
echo "   3. Ve al proyecto: bc-bash-code"
echo
echo -e "${GREEN}🎉 ¡GitHub Copilot configurado para commits en inglés!${NC}"
