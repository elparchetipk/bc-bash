# Configuración de GitHub Copilot para Commits en Inglés

Esta guía explica cómo configurar GitHub Copilot en VS Code para que genere mensajes de commit en inglés de forma predeterminada.

## Métodos de Configuración

### 1. Configuración en VS Code Settings

#### Opción A: A través de la UI de Settings

1. Abre VS Code
2. Ve a `File` > `Preferences` > `Settings` (o `Ctrl+,`)
3. Busca "github copilot"
4. Busca la configuración `GitHub Copilot: Chat: Locale Override`
5. Establece el valor a `en` o `en-US`

#### Opción B: A través de settings.json

Agrega las siguientes configuraciones a tu `settings.json`:

```json
{
  "github.copilot.chat.localeOverride": "en",
  "github.copilot.chat.welcomeMessage": "default",
  "workbench.colorTheme": "default"
}
```

### Configuración Global vs Workspace

#### Configuración Global (para todos los proyectos)

Archivo: `~/.config/Code/User/settings.json` (Linux) o `%APPDATA%\Code\User\settings.json` (Windows)

```json
{
  "github.copilot.chat.localeOverride": "en-US",
  "github.copilot.enable": {
    "*": true,
    "plaintext": false,
    "markdown": true,
    "scminput": true
  },
  "github.copilot.inlineSuggest.enable": true
}
```

#### Configuración de Workspace (solo para este proyecto)

Archivo: `/home/epti/Documentos/epti-dev/bc-bash/.vscode/settings.json` en la raíz del proyecto

```json
{
  "github.copilot.chat.localeOverride": "en-US",
  "git.inputValidation": "always",
  "git.inputValidationLength": 72,
  "git.inputValidationSubjectLength": 50
}
```

### 3. Configuración Específica para Commits

#### Configuración en Git

```bash
# Establecer idioma del sistema para git
/usr/bin/git config --global core.commentChar "#"
/usr/bin/git config --global i18n.commitencoding utf-8
/usr/bin/git config --global i18n.logoutputencoding utf-8

# Establecer editor con configuración de idioma
/usr/bin/git config --global core.editor "code --wait --locale=en"
```

#### Variables de Entorno

```bash
# En tu ~/.bashrc, ~/.zshrc, o ~/.profile
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GIT_EDITOR="code --wait --locale=en"
```

### 4. Configuración Avanzada con Prompts Personalizados

#### Crear archivo de configuración personalizado

Archivo: `.vscode/copilot-prompts.json`

```json
{
  "commit": {
    "system": "You are a helpful assistant that writes git commit messages in English following conventional commits format.",
    "user": "Generate a commit message in English for the following changes. Use conventional commits format (type(scope): description). Be concise and descriptive.",
    "language": "en",
    "format": "conventional"
  }
}
```

## Configuración para el Proyecto bc_bash

### Configuración Recomendada

Crea el archivo `/home/epti/Documentos/epti-dev/bc-bash/.vscode/settings.json` en la raíz del proyecto:

```json
{
  "github.copilot.chat.localeOverride": "en-US",
  "github.copilot.enable": {
    "*": true,
    "markdown": true,
    "shellscript": true,
    "scminput": true
  },
  "git.inputValidation": "always",
  "git.inputValidationLength": 72,
  "git.inputValidationSubjectLength": 50,
  "git.useCommitInputAsStashMessage": true,
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[shellscript]": {
    "editor.defaultFormatter": "foxundermoon.shell-format"
  }
}
```

### Configuración de Workspace específica

Archivo: `/home/epti/Documentos/epti-dev/bc-bash/.vscode/tasks.json`

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Git Commit with Copilot (English)",
      "type": "shell",
      "command": "git",
      "args": ["commit", "-m", "${input:commitMessage}"],
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
      }
    }
  ],
  "inputs": [
    {
      "id": "commitMessage",
      "description": "Commit message (English)",
      "default": "feat: add new functionality",
      "type": "promptString"
    }
  ]
}
```

## Verificación de la Configuración

### 1. Verificar configuración de Copilot

```bash
# En la terminal de VS Code
/usr/bin/code --list-extensions | grep -i copilot
```

### 2. Verificar configuración de Git

```bash
/usr/bin/git config --list | grep -i core
```

### 3. Probar generación de commits

1. Haz algunos cambios en archivos
2. Ve a la pestaña Source Control en VS Code
3. Haz clic en el ícono de Copilot (✨) en el campo de mensaje de commit
4. Verifica que el mensaje generado esté en inglés

## Troubleshooting

### Problema: Copilot sigue generando en español

**Solución 1**: Verificar configuración regional del sistema

```bash
# Verificar configuración actual
/usr/bin/locale

# Cambiar temporalmente para VS Code
LANG=en_US.UTF-8 /usr/bin/code /home/epti/Documentos/epti-dev/bc-bash
```

**Solución 2**: Reinstalar extensión de Copilot

1. Desinstalar GitHub Copilot extension
2. Reiniciar VS Code
3. Reinstalar la extensión
4. Configurar el idioma desde el inicio

**Solución 3**: Configuración explícita en settings.json

```json
{
  "github.copilot.chat.localeOverride": "en-US",
  "github.copilot.advanced": {
    "language": "en",
    "locale": "en-US"
  }
}
```

### Problema: Configuración no se aplica

**Verificar jerarquía de configuración**:

1. Configuración de Workspace (`.vscode/settings.json`) - Mayor prioridad
2. Configuración de Usuario - Prioridad media
3. Configuración por defecto - Menor prioridad

**Comando para verificar configuración activa**:

En la Command Palette (`Ctrl+Shift+P`):

- `Preferences: Open Settings (JSON)`
- `Developer: Reload Window`

## Configuración Automática

### Script para configurar automáticamente

```bash
#!/bin/bash
# setup-copilot-english.sh

# Definir ruta del proyecto
PROJECT_DIR="/home/epti/Documentos/epti-dev/bc-bash"
cd "$PROJECT_DIR" || exit 1

# Crear directorio .vscode si no existe
/usr/bin/mkdir -p "$PROJECT_DIR/.vscode"

# Crear configuración de settings
/usr/bin/cat > "$PROJECT_DIR/.vscode/settings.json" << 'EOF'
{
    "github.copilot.chat.localeOverride": "en-US",
    "github.copilot.enable": {
        "*": true,
        "markdown": true,
        "shellscript": true,
        "scminput": true
    },
    "git.inputValidation": "always",
    "git.inputValidationLength": 72,
    "git.inputValidationSubjectLength": 50
}
EOF

# Configurar git para inglés
/usr/bin/git config core.editor "code --wait --locale=en"

echo "✅ GitHub Copilot configurado para commits en inglés"
echo "✅ Reinicia VS Code para aplicar los cambios"
```

### Usar el script

```bash
# Hacer ejecutable
/usr/bin/chmod +x /home/epti/Documentos/epti-dev/bc-bash/setup-copilot-english.sh

# Ejecutar desde el directorio del proyecto
cd /home/epti/Documentos/epti-dev/bc-bash && ./setup-copilot-english.sh
```

## Resultado Esperado

Después de aplicar esta configuración:

- ✅ Copilot generará commits en inglés por defecto
- ✅ Formato conventional commits en inglés
- ✅ Validación de longitud de commit habilitada
- ✅ Configuración persistente en el proyecto

## Comandos Útiles

```bash
# Verificar configuración actual de VS Code
/usr/bin/code --list-extensions
/usr/bin/code --show-versions

# Verificar configuración de git
/usr/bin/git config --list | grep -E "(core|i18n)"

# Abrir VS Code con idioma específico en el proyecto
cd /home/epti/Documentos/epti-dev/bc-bash && LANG=en_US.UTF-8 /usr/bin/code .
```

---

**Nota**: Algunos cambios requieren reiniciar VS Code para tomar efecto. Después de aplicar la configuración, cierra y abre VS Code nuevamente.
