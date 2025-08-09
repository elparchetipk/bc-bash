# Organización de la Documentación

## Estructura Temática

La documentación de `bc_bash` está organizada por categorías temáticas para facilitar la navegación y el mantenimiento.

### 📁 **Directorios por Categoría**

#### 🚀 [`setup/`](setup/) - Configuración Inicial

Documentación relacionada con la configuración inicial del proyecto y herramientas de desarrollo.

**Contenido:**

- [`QUICK_SETUP.md`](setup/QUICK_SETUP.md) - Guía rápida de configuración (10 minutos)
- [`github-copilot-english-setup.md`](setup/github-copilot-english-setup.md) - Configuración de GitHub Copilot en inglés

#### 🤖 [`automation/`](automation/) - Automatización y Commits

Todo lo relacionado con automatización, sistema de commits y flujos de trabajo.

**Contenido:**

- [`COMMIT_STRATEGY.md`](automation/COMMIT_STRATEGY.md) - Estrategia de commits automáticos
- [`auto-commit-replication-guide.md`](automation/auto-commit-replication-guide.md) - Guía detallada de replicación
- [`competition-auto-commit-summary.md`](automation/competition-auto-commit-summary.md) - Resumen de competición de commits

#### 📋 [`cheatsheets/`](cheatsheets/) - Referencias Rápidas

Cheatsheets y guías de referencia rápida para consulta frecuente.

**Contenido:**

- [`markdown-cheatsheet.md`](cheatsheets/markdown-cheatsheet.md) - Referencia completa de Markdown
- [`unix-permissions-cheatsheet.md`](cheatsheets/unix-permissions-cheatsheet.md) - Permisos Unix y Linux
- [`comandos_xa_recordar.md`](cheatsheets/comandos_xa_recordar.md) - Comandos útiles para recordar

#### 🛠️ [`development/`](development/) - Desarrollo y Guidelines

Guías de desarrollo, estándares de código y mejores prácticas.

**Contenido:**

- [`open-source-structure.md`](development/open-source-structure.md) - Estructura y mejores prácticas open source

#### 📊 [`summaries/`](summaries/) - Resúmenes de Implementación

Documentación de cambios importantes, implementaciones y actualizaciones del proyecto.

**Contenido:**

- [`8-modules-update-summary.md`](summaries/8-modules-update-summary.md) - Actualización del proyecto a 8 módulos
- [`absolute-paths-update.md`](summaries/absolute-paths-update.md) - Implementación de rutas absolutas
- [`open-source-implementation-summary.md`](summaries/open-source-implementation-summary.md) - Implementación estructura open source
- [`svg-logos-implementation-summary.md`](summaries/svg-logos-implementation-summary.md) - Implementación de logos SVG

#### 🔧 [`troubleshooting/`](troubleshooting/) - Solución de Problemas

Soluciones específicas para problemas comunes y compatibilidad con diferentes plataformas.

**Contenido:**

- [`fedora-cron-solution.md`](troubleshooting/fedora-cron-solution.md) - Solución específica para cron en Fedora

#### 📄 [`templates/`](templates/) - Plantillas

Plantillas reutilizables para ejercicios, proyectos y documentación.

**Contenido:**

- [`ejercicio-template.md`](templates/ejercicio-template.md) - Plantilla estándar para ejercicios

---

## Principios de Organización

### 1. **Navegación Intuitiva**

Cada categoría agrupa documentación relacionada por función o propósito.

### 2. **Mantenimiento Simplificado**

Los cambios relacionados se encuentran en el mismo directorio, facilitando actualizaciones.

### 3. **Escalabilidad**

La estructura permite agregar nueva documentación sin reorganizar el contenido existente.

### 4. **Referencias Claras**

Cada documento utiliza rutas relativas apropiadas para mantener enlaces válidos.

---

## Migración de Enlaces

Al mover archivos a la nueva estructura, se actualizaron automáticamente:

- **README.md principal** → Referencias a rutas organizadas
- **CONTRIBUTING.md** → Enlaces a documentación reorganizada
- **Archivos internos** → Rutas relativas corregidas

---

## Navegación Rápida

```bash
# Ver toda la documentación organizada
ls -la /home/epti/Documentos/epti-dev/bc-bash/_docs/

# Acceder por categoría
cd _docs/setup/          # Configuración
cd _docs/automation/     # Automatización
cd _docs/cheatsheets/    # Referencias
cd _docs/development/    # Desarrollo
cd _docs/summaries/      # Resúmenes
cd _docs/troubleshooting/ # Soluciones
cd _docs/templates/      # Plantillas
```

---

**Última actualización:** 9 de agosto de 2025  
**Versión de organización:** 1.0
