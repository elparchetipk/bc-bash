# Bootcamp Bash (bc_bash) - Documentación

## Descripción General

Este es un bootcamp completo de scripting en Bash dividido en 8 módulos progresivos, diseñado para enseñar los fundamentos de shell scripting a través de ejercicios prácticos y proyectos reales.

## Estructura del Proyecto

```text
bc_bash/
├── _docs/                    # 📚 Toda la documentación del proyecto
├── _scripts/                 # 🔧 Scripts de utilidad y automatización
├── modulo1/                  # 📖 Módulo 1: Fundamentos de Bash
│   ├── ejercicios/           # 💪 Ejercicios prácticos
│   ├── proyectos/            # 🚀 Proyectos del módulo
│   └── README.md            # 📋 Descripción del módulo
├── modulo2/                  # 📖 Módulo 2: Comandos Avanzados y Pipes
├── modulo3/                  # 📖 Módulo 3: Variables y Control de Flujo
├── modulo4/                  # 📖 Módulo 4: Funciones y Arrays
├── modulo5/                  # 📖 Módulo 5: Operaciones de Archivos y Texto
├── modulo6/                  # 📖 Módulo 6: Manipulación Avanzada de Datos
├── modulo7/                  # 📖 Módulo 7: Optimización y Debugging
├── modulo8/                  # 📖 Módulo 8: Proyectos y Automatización
└── README.md                # 📖 README principal del proyecto
```

## Módulos del Bootcamp

### Módulo 1: Fundamentos de Bash

- **Objetivo**: Introducir comandos básicos y sintaxis de Bash
- **Contenido**: Terminal, shell, navegación, permisos de archivos
- **Proyecto**: Sistema de Gestión de Archivos

### Módulo 2: Comandos Avanzados y Pipes

- **Objetivo**: Dominar comandos avanzados y procesamiento de texto
- **Contenido**: Pipes, redirección, wildcards, filtros de texto
- **Proyecto**: Procesador de Logs Avanzado

### Módulo 3: Variables y Control de Flujo

- **Objetivo**: Manejar variables y estructuras de control
- **Contenido**: Variables, condicionales, bucles, entrada/salida
- **Proyecto**: Sistema de Menús Interactivo

### Módulo 4: Funciones y Arrays

- **Objetivo**: Organizar código con funciones y manejar arrays
- **Contenido**: Funciones, arrays, códigos de salida, logging
- **Proyecto**: Gestor Interactivo de Archivos

### Módulo 5: Operaciones de Archivos y Texto

- **Objetivo**: Automatizar manipulación avanzada de archivos
- **Contenido**: Expresiones regulares, sed, awk, análisis de datos
- **Proyecto**: Analizador de Logs con Reportes

### Módulo 6: Manipulación Avanzada de Datos

- **Objetivo**: Procesamiento sofisticado de datos estructurados
- **Contenido**: CSV, JSON, XML, parsing complejo, transformaciones
- **Proyecto**: Procesador de Datos Empresariales

### Módulo 7: Optimización y Debugging

- **Objetivo**: Técnicas de optimización y resolución de problemas
- **Contenido**: Debugging, profiling, optimización, seguridad
- **Proyecto**: Monitor de Sistema Avanzado

### Módulo 8: Proyectos Avanzados y Automatización

- **Objetivo**: Integración empresarial y automatización completa
- **Contenido**: APIs, Docker, Git, CI/CD, automatización empresarial
- **Proyecto**: Sistema de Backup y Deploy Automatizado

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

### 🎯 Semanas 1-2: Fundamentos Sólidos

1. **Módulo 1**: Conceptos básicos, navegación y permisos
2. **Módulo 2**: Comandos avanzados, pipes y procesamiento de texto

### 🚀 Semanas 3-4: Programación Estructurada

1. **Módulo 3**: Variables, control de flujo e interactividad
2. **Módulo 4**: Funciones, arrays y organización de código

### 💪 Semanas 5-6: Manipulación Avanzada

1. **Módulo 5**: Operaciones de archivos y análisis de texto
2. **Módulo 6**: Procesamiento de datos estructurados y complejos

### 🏆 Semanas 7-8: Maestría Profesional

1. **Módulo 7**: Optimización, debugging y mejores prácticas
2. **Módulo 8**: Automatización empresarial y proyectos avanzados

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
