#!/bin/bash
# Launch VS Code with English GitHub Copilot Configuration
# Abre VS Code con configuración en inglés para GitHub Copilot

set -euo pipefail

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo -e "${BLUE}🚀 Abriendo VS Code con configuración en inglés...${NC}"

# Set environment variables for English locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GIT_EDITOR="code --wait --locale=en"

# Change to project directory
cd "$PROJECT_DIR" || {
    echo "Error: No se puede acceder al directorio del proyecto"
    exit 1
}

# Check if VS Code is available
if ! command -v code >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  VS Code no está disponible en PATH${NC}"
    echo "   Instala VS Code o añádelo al PATH"
    exit 1
fi

# Launch VS Code with English locale
echo -e "${GREEN}✅ Configuración de idioma: en_US.UTF-8${NC}"
echo -e "${GREEN}✅ Editor de Git: VS Code con locale inglés${NC}"
echo -e "${BLUE}📂 Directorio: $PROJECT_DIR${NC}"

# Open VS Code with English settings
code --locale=en .

echo -e "${GREEN}🎉 VS Code abierto con configuración en inglés${NC}"
echo
echo -e "${YELLOW}💡 Tips para usar GitHub Copilot en inglés:${NC}"
echo "1. Ve al panel Source Control (Ctrl+Shift+G)"
echo "2. Haz cambios en archivos del proyecto"
echo "3. Haz clic en el ícono ✨ en el campo de commit message"
echo "4. Copilot generará el mensaje en inglés"
echo
echo -e "${BLUE}🔧 Configuración aplicada:${NC}"
echo "• Locale override: en-US"
echo "• Git editor: VS Code en inglés"
echo "• Encoding: UTF-8"
echo "• Conventional commits: Habilitado"
