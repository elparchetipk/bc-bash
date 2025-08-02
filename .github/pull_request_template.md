## 📋 Descripción

Proporciona una descripción clara y concisa de los cambios realizados.

## 🔗 Issues Relacionados

Fixes #(issue_number)
Closes #(issue_number)
Related to #(issue_number)

## 🧪 Tipo de Cambio

Marca las opciones relevantes:

- [ ] 🐛 Bug fix (cambio que no rompe funcionalidad y soluciona un issue)
- [ ] ✨ Nueva característica (cambio que no rompe funcionalidad y añade funcionalidad)
- [ ] 💥 Cambio que rompe compatibilidad (fix o feature que causa que funcionalidad existente no funcione como se esperaba)
- [ ] 📚 Documentación (cambios solo en documentación)
- [ ] 🎨 Estilo (formateo, semicolons faltantes, etc; sin cambio en lógica)
- [ ] ♻️ Refactoring (cambio de código que ni arregla un bug ni añade una característica)
- [ ] ⚡ Mejora de rendimiento
- [ ] 🧪 Tests (añadir tests faltantes o corregir tests existentes)
- [ ] 🔧 Chore (cambios en el proceso de build o herramientas auxiliares)

## 📚 Módulo(s) Afectado(s)

Marca todos los módulos que se ven afectados por este cambio:

- [ ] Módulo 1: Fundamentos de Bash
- [ ] Módulo 2: Comandos Avanzados y Pipes
- [ ] Módulo 3: Variables y Control de Flujo
- [ ] Módulo 4: Funciones y Arrays
- [ ] Módulo 5: Operaciones de Archivos
- [ ] Módulo 6: Manipulación Avanzada de Datos
- [ ] Módulo 7: Optimización y Debugging
- [ ] Módulo 8: Proyectos y Automatización
- [ ] Documentación general
- [ ] Scripts de automatización
- [ ] Configuración del proyecto

## 🧪 Cómo se ha Probado

Describe las pruebas que has ejecutado para verificar tus cambios:

- [ ] Pruebas unitarias pasaron
- [ ] Pruebas de integración pasaron
- [ ] Probado manualmente en: [especifica entornos]
- [ ] Verificado con ShellCheck
- [ ] Probado el sistema de auto-commit

```bash
# Comandos ejecutados para probar
```

## ✅ Checklist

- [ ] Mi código sigue las convenciones de estilo de este proyecto
- [ ] He realizado una auto-revisión de mi código
- [ ] He comentado mi código, particularmente en áreas difíciles de entender
- [ ] He realizado los cambios correspondientes en la documentación
- [ ] Mis cambios no generan nuevos warnings
- [ ] He añadido pruebas que demuestran que mi fix es efectivo o que mi característica funciona
- [ ] Las pruebas unitarias nuevas y existentes pasan localmente con mis cambios
- [ ] Cualquier cambio dependiente ha sido merged y publicado en módulos downstream
- [ ] He usado el sistema de auto-commit o seguido Conventional Commits

## 📸 Screenshots (si es aplicable)

Añade screenshots para ayudar a explicar los cambios, especialmente para cambios en documentación o interfaces.

## 📝 Notas Adicionales

Cualquier información adicional que los reviewers deberían saber.

## 🔄 Impacto en Backward Compatibility

- [ ] Este cambio es completamente compatible hacia atrás
- [ ] Este cambio requiere actualización de documentación
- [ ] Este cambio requiere migración de usuarios existentes
- [ ] Este cambio rompe compatibilidad (explicar abajo)

### Detalles del Impacto (si aplica)

[Explica qué se rompe y cómo los usuarios pueden migrar]

## 📋 Checklist del Reviewer

Para uso del reviewer:

- [ ] El código sigue las convenciones del proyecto
- [ ] Los cambios están bien documentados
- [ ] Los tests son apropiados y pasan
- [ ] El PR resuelve el issue relacionado
- [ ] No hay problemas de seguridad evidentes
- [ ] La documentación está actualizada
- [ ] Los commits siguen Conventional Commits
