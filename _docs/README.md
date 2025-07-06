# Bootcamp Bash (bc_bash) - Documentación

## Descripción General

Este es un bootcamp completo de scripting en Bash dividido en 5 módulos progresivos, diseñado para enseñar los fundamentos de shell scripting a través de ejercicios prácticos y proyectos reales.

## Estructura del Proyecto

```
bc_bash/
├── _docs/                    # 📚 Toda la documentación del proyecto
├── _scripts/                 # 🔧 Scripts de utilidad y automatización
├── modulo1/                  # 📖 Módulo 1: Fundamentos de Bash
│   ├── ejercicios/           # 💪 Ejercicios prácticos
│   ├── proyectos/            # 🚀 Proyectos del módulo
│   └── README.md            # 📋 Descripción del módulo
├── modulo2/                  # 📖 Módulo 2: Variables y Control de Flujo
├── modulo3/                  # 📖 Módulo 3: Funciones y Arrays
├── modulo4/                  # 📖 Módulo 4: Operaciones de Archivos
├── modulo5/                  # 📖 Módulo 5: Temas Avanzados
└── README.md                # 📖 README principal del proyecto
```

## Módulos del Bootcamp

### Módulo 1: Fundamentos de Bash

- **Objetivo**: Introducir comandos básicos y sintaxis de Bash
- **Contenido**: Variables, entrada/salida, comandos básicos
- **Proyecto**: Calculadora simple en Bash

### Módulo 2: Variables y Control de Flujo

- **Objetivo**: Dominar variables y estructuras de control
- **Contenido**: Condicionales, bucles, parámetros de script
- **Proyecto**: Sistema de menús interactivo

### Módulo 3: Funciones y Arrays

- **Objetivo**: Organizar código con funciones y manejar arrays
- **Contenido**: Definición de funciones, arrays, manipulación de strings
- **Proyecto**: Biblioteca de funciones reutilizables

### Módulo 4: Operaciones de Archivos y Procesamiento de Texto

- **Objetivo**: Automatizar tareas de archivos y texto
- **Contenido**: grep, sed, awk, permisos, expresiones regulares
- **Proyecto**: Analizador de logs del sistema

### Módulo 5: Temas Avanzados y Automatización

- **Objetivo**: Técnicas avanzadas y automatización
- **Contenido**: Procesos, debugging, integración con servicios
- **Proyecto**: Sistema de backup automatizado

## Documentación Disponible

### En `_docs/`

- [`commit-strategy.md`](_docs/commit-strategy.md) - Estrategia de commits automáticos
- [`templates/`](_docs/templates/) - Plantillas para ejercicios y proyectos
- [`assets/`](_docs/assets/) - Recursos visuales y diagramas

### Por Módulo

- Cada módulo tiene su propio `README.md` con objetivos específicos
- Ejercicios documentados en `moduloX/ejercicios/README.md`
- Proyectos documentados en `moduloX/proyectos/[proyecto]/README.md`

## Scripts de Automatización

El directorio `_scripts/` contiene herramientas para facilitar el desarrollo:

### Sistema de Commits Automáticos

```bash
./_scripts/commit.sh auto      # Commits automáticos con detección inteligente
./_scripts/commit.sh quick     # Commits interactivos
./_scripts/commit.sh status    # Estado actual del repositorio
```

### Utilidades de Desarrollo

```bash
./_scripts/demo.sh            # Demo del sistema de commits
./_scripts/setup-auto-commit.sh  # Configuración inicial
```

## Convenciones de Código

### Scripts de Shell

- Usar `#!/bin/bash` en todos los scripts
- Nombres de archivo en `snake_case.sh`
- Indentación con 4 espacios
- Manejo de errores con `set -euo pipefail`
- Documentación clara en cada función

### Documentación

- Archivos Markdown en `kebab-case.md`
- Headers claros con objetivos de aprendizaje
- Ejemplos de código con salida esperada
- Instrucciones paso a paso

### Estructura de Ejercicios

```bash
#!/bin/bash
# Ejercicio: [Título]
# Módulo: [X]
# Objetivo: [Meta de aprendizaje]
# Instrucciones: [Qué debe hacer el estudiante]

# Tu solución aquí
```

## Progresión del Aprendizaje

1. **Módulo 1**: Conceptos básicos, familiarización con la terminal
2. **Módulo 2**: Control de flujo, toma de decisiones en scripts
3. **Módulo 3**: Organización de código, reutilización
4. **Módulo 4**: Automatización práctica, manipulación de datos
5. **Módulo 5**: Integración con sistemas, mejores prácticas

## Requisitos Previos

- Sistema Linux o macOS (o WSL en Windows)
- Terminal con Bash disponible
- Editor de texto (VS Code recomendado)
- Git para control de versiones

## Recursos Adicionales

- [Manual de Bash](https://www.gnu.org/software/bash/manual/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
- [ShellCheck](https://www.shellcheck.net/) para validación de scripts

## Contribución

Para contribuir al proyecto:

1. Seguir las convenciones establecidas
2. Usar el sistema de commits automáticos: `./_scripts/commit.sh auto`
3. Documentar todos los cambios apropiadamente
4. Probar scripts en múltiples entornos

---

**¡Bienvenido al Bootcamp de Bash! Comenzando un viaje hacia la maestría en shell scripting.** 🚀
