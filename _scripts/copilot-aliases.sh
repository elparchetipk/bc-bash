# GitHub Copilot English Configuration - Shell Aliases
# Añade estas líneas a tu ~/.bashrc, ~/.zshrc, o ~/.profile

# Alias para abrir VS Code con configuración en inglés
alias code-en='LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 code --locale=en'

# Alias para el proyecto bc-bash con configuración en inglés
alias bc-bash-code='cd ~/Documentos/epti-dev/bc-bash && LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 code --locale=en .'

# Función para commits en inglés usando auto-commit
bc-commit() {
    local current_dir=$(pwd)
    local project_dir="$HOME/Documentos/epti-dev/bc-bash"
    
    cd "$project_dir" || {
        echo "Error: No se puede acceder al directorio del proyecto"
        return 1
    }
    
    # Set English environment
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    
    # Run auto-commit
    ./_scripts/auto-commit.sh
    
    # Return to original directory
    cd "$current_dir"
}

# Función para configurar git en inglés globalmente
git-config-english() {
    /usr/bin/git config --global core.editor "code --wait --locale=en"
    /usr/bin/git config --global i18n.commitencoding utf-8
    /usr/bin/git config --global i18n.logoutputencoding utf-8
    echo "✅ Git configurado para inglés globalmente"
}

# Función para configurar git en inglés solo para el proyecto actual
git-config-english-local() {
    /usr/bin/git config core.editor "code --wait --locale=en"
    /usr/bin/git config i18n.commitencoding utf-8
    /usr/bin/git config i18n.logoutputencoding utf-8
    echo "✅ Git configurado para inglés en el proyecto actual"
}

# Función para verificar configuración de Copilot
check-copilot-config() {
    echo "=== Configuración de GitHub Copilot ==="
    echo
    echo "📍 Directorio actual: $(pwd)"
    echo
    echo "🌐 Variables de entorno:"
    echo "   LANG=$LANG"
    echo "   LC_ALL=${LC_ALL:-"(no establecido)"}"
    echo
    echo "🔧 Configuración de Git:"
    /usr/bin/git config --list | grep -E "(core.editor|i18n)" || echo "   No hay configuración i18n"
    echo
    echo "📁 Archivos de configuración VS Code:"
    if [[ -f ".vscode/settings.json" ]]; then
        echo "   ✅ .vscode/settings.json existe"
        if grep -q "github.copilot.chat.localeOverride" .vscode/settings.json; then
            echo "   ✅ Locale override configurado"
        else
            echo "   ❌ Locale override no encontrado"
        fi
    else
        echo "   ❌ .vscode/settings.json no existe"
    fi
    echo
    echo "🎯 Extensiones VS Code:"
    if command -v code >/dev/null 2>&1; then
        if code --list-extensions | grep -q "github.copilot"; then
            echo "   ✅ GitHub Copilot instalado"
        else
            echo "   ❌ GitHub Copilot no instalado"
        fi
        if code --list-extensions | grep -q "github.copilot-chat"; then
            echo "   ✅ GitHub Copilot Chat instalado"
        else
            echo "   ❌ GitHub Copilot Chat no instalado"
        fi
    else
        echo "   ⚠️  VS Code no disponible en PATH"
    fi
}

# Función para setup rápido en cualquier proyecto
setup-copilot-english-project() {
    local script_path="/home/epti/Documentos/epti-dev/bc-bash/_scripts/setup-copilot-english.sh"
    local current_dir
    current_dir="$(pwd)"
    
    if [[ -f "$script_path" ]]; then
        echo "🔧 Configurando GitHub Copilot en inglés para el proyecto actual..."
        
        # Create minimal .vscode/settings.json
        /usr/bin/mkdir -p "$current_dir/.vscode"
        /usr/bin/cat > "$current_dir/.vscode/settings.json" << 'EOF'
{
    "github.copilot.chat.localeOverride": "en-US",
    "github.copilot.enable": {
        "*": true,
        "scminput": true
    },
    "git.inputValidation": "always",
    "git.inputValidationLength": 72
}
EOF
        
        # Configure git for this project
        git-config-english-local
        
        echo "✅ Configuración básica de Copilot aplicada al proyecto actual"
        echo "💡 Reinicia VS Code para aplicar los cambios"
    else
        echo "❌ Script de configuración no encontrado en $script_path"
        return 1
    fi
}

echo "🎉 Aliases y funciones de GitHub Copilot cargados:"
echo "   • code-en            - Abrir VS Code en inglés"
echo "   • bc-bash-code       - Abrir proyecto bc-bash en inglés"
echo "   • bc-commit          - Auto-commit en inglés"
echo "   • git-config-english - Configurar git globalmente"
echo "   • check-copilot-config - Verificar configuración"
echo "   • setup-copilot-english-project - Setup rápido para proyecto actual"
