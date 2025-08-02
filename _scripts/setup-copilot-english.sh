#!/bin/bash
# Setup GitHub Copilot for English Commits
# Configura GitHub Copilot en VS Code para generar commits en inglés

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Project root directory
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo -e "${BLUE}🔧 Configurando GitHub Copilot para commits en inglés...${NC}"
echo

# Create .vscode directory if it doesn't exist
if [[ ! -d "$PROJECT_ROOT/.vscode" ]]; then
    mkdir -p "$PROJECT_ROOT/.vscode"
    echo -e "${GREEN}✅ Directorio .vscode creado${NC}"
fi

# Create VS Code settings for English Copilot
cat > "$PROJECT_ROOT/.vscode/settings.json" << 'EOF'
{
    "github.copilot.chat.localeOverride": "en-US",
    "github.copilot.enable": {
        "*": true,
        "markdown": true,
        "shellscript": true,
        "scminput": true,
        "plaintext": false
    },
    "github.copilot.inlineSuggest.enable": true,
    "git.inputValidation": "always",
    "git.inputValidationLength": 72,
    "git.inputValidationSubjectLength": 50,
    "git.useCommitInputAsStashMessage": true,
    "scm.inputFontFamily": "monospace",
    "scm.inputFontSize": 14,
    "[markdown]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode",
        "editor.wordWrap": "on"
    },
    "[shellscript]": {
        "editor.defaultFormatter": "foxundermoon.shell-format",
        "editor.insertSpaces": true,
        "editor.tabSize": 2
    },
    "[json]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    }
}
EOF

echo -e "${GREEN}✅ Configuración de VS Code creada (.vscode/settings.json)${NC}"

# Create tasks.json for Git operations with English locale
cat > "$PROJECT_ROOT/.vscode/tasks.json" << 'EOF'
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Git: Commit with Copilot (English)",
            "type": "shell",
            "command": "git",
            "args": ["commit", "-m", "${input:commitMessage}"],
            "group": "build",
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
            "options": {
                "env": {
                    "LANG": "en_US.UTF-8",
                    "LC_ALL": "en_US.UTF-8"
                }
            },
            "problemMatcher": []
        },
        {
            "label": "Git: Auto-commit with English messages",
            "type": "shell",
            "command": "${workspaceFolder}/_scripts/auto-commit.sh",
            "group": "build",
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared"
            },
            "options": {
                "env": {
                    "LANG": "en_US.UTF-8",
                    "LC_ALL": "en_US.UTF-8"
                }
            },
            "problemMatcher": []
        }
    ],
    "inputs": [
        {
            "id": "commitMessage",
            "description": "Commit message (English - use conventional commits format)",
            "default": "feat: add new functionality",
            "type": "promptString"
        }
    ]
}
EOF

echo -e "${GREEN}✅ Configuración de tareas creada (.vscode/tasks.json)${NC}"

# Configure git for English environment
echo -e "${BLUE}🔧 Configurando Git para entorno en inglés...${NC}"

# Set git editor with English locale
/usr/bin/git config core.editor "code --wait --locale=en" 2>/dev/null || {
    echo -e "${YELLOW}⚠️  No se pudo configurar VS Code como editor de git${NC}"
}

# Set git commit encoding
/usr/bin/git config i18n.commitencoding utf-8
/usr/bin/git config i18n.logoutputencoding utf-8

echo -e "${GREEN}✅ Configuración de Git completada${NC}"

# Create launch configuration for debugging
cat > "$PROJECT_ROOT/.vscode/launch.json" << 'EOF'
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "bashdb",
            "request": "launch",
            "name": "Debug Bash Script",
            "cwd": "${workspaceFolder}",
            "program": "${file}",
            "env": {
                "LANG": "en_US.UTF-8",
                "LC_ALL": "en_US.UTF-8"
            },
            "args": [],
            "showDebugOutput": true,
            "trace": true
        }
    ]
}
EOF

echo -e "${GREEN}✅ Configuración de debug creada (.vscode/launch.json)${NC}"

# Create recommended extensions file
cat > "$PROJECT_ROOT/.vscode/extensions.json" << 'EOF'
{
    "recommendations": [
        "github.copilot",
        "github.copilot-chat",
        "foxundermoon.shell-format",
        "esbenp.prettier-vscode",
        "ms-vscode.vscode-json",
        "rogalmic.bash-debug",
        "timonwong.shellcheck"
    ]
}
EOF

echo -e "${GREEN}✅ Extensiones recomendadas configuradas (.vscode/extensions.json)${NC}"

# Check if GitHub Copilot extension is installed
echo -e "${BLUE}🔍 Verificando extensiones de GitHub Copilot...${NC}"

if command -v code >/dev/null 2>&1; then
    if code --list-extensions | grep -q "github.copilot"; then
        echo -e "${GREEN}✅ GitHub Copilot está instalado${NC}"
    else
        echo -e "${YELLOW}⚠️  GitHub Copilot no está instalado${NC}"
        echo -e "${YELLOW}   Instala desde: https://marketplace.visualstudio.com/items?itemName=GitHub.copilot${NC}"
    fi
    
    if code --list-extensions | grep -q "github.copilot-chat"; then
        echo -e "${GREEN}✅ GitHub Copilot Chat está instalado${NC}"
    else
        echo -e "${YELLOW}⚠️  GitHub Copilot Chat no está instalado${NC}"
        echo -e "${YELLOW}   Instala desde: https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  VS Code no está disponible en PATH${NC}"
fi

# Create a test file to verify configuration
cat > "$PROJECT_ROOT/.vscode/copilot-test.md" << 'EOF'
# GitHub Copilot English Test

This file is for testing GitHub Copilot configuration.

## Test Instructions

1. Open this file in VS Code
2. Make some changes to files in the repository
3. Go to Source Control panel (Ctrl+Shift+G)
4. Click the Copilot icon (✨) in the commit message box
5. Verify that the generated commit message is in English

## Expected Result

Copilot should generate commit messages like:
- `feat: add new feature`
- `fix: resolve bug in script`
- `docs: update documentation`
- `style: improve code formatting`

## Troubleshooting

If messages are still in Spanish:
1. Reload VS Code window (Ctrl+Shift+P → "Developer: Reload Window")
2. Check that locale override is set to "en-US"
3. Verify git configuration with: `git config --list | grep i18n`
EOF

echo -e "${GREEN}✅ Archivo de prueba creado (.vscode/copilot-test.md)${NC}"

# Summary
echo
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}            Configuración Completada${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo
echo -e "${GREEN}✅ Archivos de configuración creados:${NC}"
echo "   📁 .vscode/settings.json"
echo "   📁 .vscode/tasks.json"
echo "   📁 .vscode/launch.json"
echo "   📁 .vscode/extensions.json"
echo "   📁 .vscode/copilot-test.md"
echo
echo -e "${GREEN}✅ Configuración de Git actualizada${NC}"
echo
echo -e "${YELLOW}📋 Próximos pasos:${NC}"
echo "1. Reinicia VS Code para aplicar la configuración"
echo "2. Asegúrate de que GitHub Copilot esté instalado y autenticado"
echo "3. Prueba la generación de commits en el panel Source Control"
echo "4. Lee el archivo .vscode/copilot-test.md para instrucciones detalladas"
echo
echo -e "${BLUE}🔧 Comandos útiles:${NC}"
echo "• Abrir VS Code con configuración inglesa: LANG=en_US.UTF-8 code ."
echo "• Verificar configuración de git: git config --list | grep i18n"
echo "• Recargar VS Code: Ctrl+Shift+P → 'Developer: Reload Window'"
echo
echo -e "${GREEN}🎉 ¡GitHub Copilot configurado para commits en inglés!${NC}"
