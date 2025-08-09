# Bootcamp Bash - Módulo 1: Desarrollo Paso a Paso

## Guión para Video de YouTube - Fundamentos de Bash

---

## 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bootcamp Bash - Módulo 1: Fundamentos de Bash - De Cero a Tu Primer Script"

**Duración Estimada:** 45-60 minutos

**Audiencia:** Desarrolladores principiantes e intermedios que quieren dominar Bash scripting

**Objetivo:** Establecer las bases sólidas de Bash y crear el primer script funcional

---

## 🎯 OBJETIVOS DE APRENDIZAJE

Al finalizar este video, los estudiantes podrán:

1. **Configurar** un entorno de desarrollo Bash completo
2. **Dominar** los comandos básicos de navegación y manipulación de archivos
3. **Entender** la estructura del sistema de archivos Unix/Linux
4. **Crear** su primer script Bash funcional
5. **Implementar** permisos de archivos y ejecutabilidad
6. **Ejecutar** y depurar scripts básicos

---

## 📝 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y BIENVENIDA (5 minutos)

### PARTE 2: CONFIGURACIÓN DEL ENTORNO BASH (10 minutos)

### PARTE 3: NAVEGACIÓN Y COMANDOS BÁSICOS (15 minutos)

### PARTE 4: TU PRIMER SCRIPT BASH (10 minutos)

### PARTE 5: PERMISOS Y EJECUCIÓN (10 minutos)

### PARTE 6: PROYECTO PRÁCTICO Y PRÓXIMOS PASOS (5 minutos)

---

## 🎬 PARTE 1: INTRODUCCIÓN Y BIENVENIDA (5 minutos)

### 🎤 Guión de Presentación

**[PANTALLA: Logo del Bootcamp Bash con SVG del módulo 1]**

> "¡Hola y bienvenidos al Bootcamp Bash! Soy tu instructor y durante estas 8 semanas aprenderemos a dominar el shell scripting desde cero hasta proyectos avanzados de automatización."

**[TRANSICIÓN: Mostrar agenda del bootcamp con los 8 módulos]**

> "En este primer módulo vamos a establecer las bases fundamentales que necesitas para convertirte en un experto en Bash. No importa si nunca has usado la terminal o ya tienes algo de experiencia, este video está diseñado para que todos puedan seguir el ritmo."

### 📊 Contexto y Motivación

**[PANTALLA: Estadísticas de Bash en la industria]**

> "Bash es el shell más utilizado en el mundo Linux/Unix, presente en más del 80% de los servidores web del mundo. Desde administración de sistemas hasta DevOps, CI/CD y automatización, Bash es una herramienta fundamental para cualquier desarrollador."

**[PANTALLA: Casos de uso reales]**

> "¿Por qué aprender Bash? Te permitirá automatizar tareas repetitivas, gestionar servidores, crear pipelines de deployment, procesar datos masivos, y ser mucho más eficiente en tu trabajo diario."

### 🗺️ Roadmap del Módulo 1

**[PANTALLA: Cronograma visual del módulo]**

> "En este módulo cubriremos:
>
> - Configuración del entorno de desarrollo
> - Navegación básica en el sistema de archivos
> - Comandos fundamentales de manipulación
> - Creación de tu primer script
> - Sistema de permisos Unix
> - Proyecto práctico: Sistema de Gestión de Archivos"

**[TRANSICIÓN: Mostrar resultado final]**

> "Al final de este módulo, tendrás tu primer script funcional y las bases sólidas para continuar con el bootcamp. ¡Empecemos!"

---

## ⚙️ PARTE 2: CONFIGURACIÓN DEL ENTORNO BASH (10 minutos)

### 🎤 Transición

**[PANTALLA: Logo de configuración]**

> "Antes de escribir nuestro primer script, necesitamos configurar nuestro entorno de desarrollo. Te mostraré cómo preparar tu sistema tanto en Linux, macOS como en Windows con WSL."

### 🐧 Verificación del Entorno

**[PANTALLA: Compartir pantalla - Terminal]**

> "Primero, verificamos nuestro shell y versión de Bash. Abre tu terminal y ejecuta:"

```bash
echo $SHELL
bash --version
```

**[DEMOSTRACIÓN EN VIVO]**

> "Deberías ver algo como '/bin/bash' y una versión 4.0 o superior. Si estás en Windows, te recomiendo instalar WSL2 con Ubuntu."

### 📁 Estructura del Proyecto

**[PANTALLA: Código en vivo]**

> "Creemos la estructura de nuestro proyecto siguiendo las mejores prácticas:"

```bash
# Crear directorio del bootcamp
mkdir -p ~/bootcamp-bash/modulo1
cd ~/bootcamp-bash/modulo1

# Crear subdirectorios
mkdir -p ejercicios proyectos scripts

# Verificar estructura
tree . # o ls -la si no tienes tree
```

**[EXPLICACIÓN TEÓRICA]**

> "Una buena organización es fundamental. Separamos ejercicios, proyectos y scripts de utilidad para mantener todo ordenado y fácil de encontrar."

### 🔧 Configuración del Editor

**[PANTALLA: VS Code]**

> "Configuremos nuestro editor para trabajar eficientemente con Bash:"

**Extensiones recomendadas:**

- Bash IDE
- ShellCheck
- Bash Debug

**[DEMOSTRACIÓN]**

> "También configuraremos algunos alias útiles en nuestro ~/.bashrc:"

```bash
# Añadir al final de ~/.bashrc
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# Recargar configuración
source ~/.bashrc
```

### ✅ Verificación de Herramientas

**[PANTALLA: Terminal]**

> "Vamos a verificar que tenemos todas las herramientas básicas disponibles:"

```bash
# Comandos esenciales
which ls pwd cd mkdir rmdir cp mv rm
which grep sed awk cat head tail
which chmod chown find

# Crear script de verificación
cat > verificar_entorno.sh << 'EOF'
#!/bin/bash
echo "🔍 Verificando entorno Bash..."
echo "📍 Directorio actual: $(pwd)"
echo "👤 Usuario actual: $(whoami)"
echo "🖥️  Sistema: $(uname -s)"
echo "📅 Fecha: $(date)"
echo "✅ ¡Entorno listo para el bootcamp!"
EOF

chmod +x verificar_entorno.sh
./verificar_entorno.sh
```

---

## 🚀 PARTE 3: NAVEGACIÓN Y COMANDOS BÁSICOS (15 minutos)

### 🎤 Transición

**[PANTALLA: Diagrama del sistema de archivos]**

> "Ahora que tenemos nuestro entorno listo, vamos a explorar los comandos fundamentales que todo scripter de Bash debe dominar."

### 🧭 Navegación Básica

**[PANTALLA: Terminal en vivo]**

> "Empezamos con la navegación. Estos son los comandos que usarás constantemente:"

```bash
# ¿Dónde estoy?
pwd

# Listar contenido
ls
ls -l    # Lista detallada
ls -la   # Incluir archivos ocultos
ls -lh   # Tamaños legibles

# Cambiar directorio
cd /home
cd ~     # Ir al home
cd -     # Volver al directorio anterior
cd ..    # Subir un nivel
```

**[EXPLICACIÓN PRÁCTICA]**

> "Practiquemos navegando por el sistema. Vamos a explorar directorios importantes:"

```bash
# Explorar sistema
cd /
ls -la
cd /usr/bin
ls | head -10
cd /var/log
ls -la
cd ~/bootcamp-bash/modulo1
```

### 📁 Manipulación de Archivos y Directorios

**[PANTALLA: Demostración en vivo]**

> "Ahora los comandos para crear, copiar, mover y eliminar:"

```bash
# Crear directorios
mkdir pruebas
mkdir -p pruebas/sub1/sub2

# Crear archivos
touch archivo1.txt
echo "Hola Bash" > archivo2.txt
echo "Segunda línea" >> archivo2.txt

# Copiar
cp archivo1.txt archivo1_copia.txt
cp -r pruebas pruebas_backup

# Mover/Renombrar
mv archivo1_copia.txt archivo_renombrado.txt
mv pruebas_backup experimentos

# Eliminar (¡CUIDADO!)
rm archivo_renombrado.txt
rm -r experimentos
```

### 📖 Visualización de Contenido

**[PANTALLA: Ejemplos prácticos]**

> "Para ver el contenido de archivos, tenemos varias herramientas:"

```bash
# Crear archivo de ejemplo
cat > ejemplo.txt << 'EOF'
Línea 1: Introducción a Bash
Línea 2: Comandos básicos
Línea 3: Navegación
Línea 4: Manipulación de archivos
Línea 5: Visualización de contenido
Línea 6: Permisos
Línea 7: Scripts
Línea 8: Automatización
Línea 9: Proyectos
Línea 10: Conclusión
EOF

# Visualizar contenido
cat ejemplo.txt       # Todo el archivo
head ejemplo.txt      # Primeras 10 líneas
head -5 ejemplo.txt   # Primeras 5 líneas
tail ejemplo.txt      # Últimas 10 líneas
tail -3 ejemplo.txt   # Últimas 3 líneas
less ejemplo.txt      # Navegación interactiva (q para salir)
```

### 🔍 Búsqueda Básica

**[PANTALLA: Comandos de búsqueda]**

> "Buscar archivos y contenido es fundamental:"

```bash
# Buscar archivos
find . -name "*.txt"
find . -type f -name "ejemplo*"

# Buscar contenido
grep "Bash" ejemplo.txt
grep -n "Script" ejemplo.txt    # Con números de línea
grep -i "bash" ejemplo.txt      # Case insensitive
```

---

## 📝 PARTE 4: TU PRIMER SCRIPT BASH (10 minutos)

### 🎤 Transición

**[PANTALLA: Editor con archivo vacío]**

> "¡Es hora de crear tu primer script! Vamos a escribir un programa que demuestre los conceptos que hemos aprendido."

### 🚀 Creación del Script

**[PANTALLA: Codificación en vivo]**

> "Creemos nuestro primer script paso a paso:"

```bash
# Crear el archivo
nano mi_primer_script.sh
# o usa tu editor preferido: code mi_primer_script.sh
```

**[ESCRIBIR EN VIVO]**

```bash
#!/bin/bash
# Mi Primer Script Bash
# Autor: [Tu nombre]
# Fecha: $(date +%Y-%m-%d)
# Descripción: Script de demostración del Módulo 1

# Configuración de errores
set -euo pipefail

# Función de bienvenida
mostrar_bienvenida() {
    echo "=================================="
    echo "🎉 ¡Bienvenido a tu primer script!"
    echo "=================================="
    echo
}

# Función para mostrar información del sistema
mostrar_info_sistema() {
    echo "📊 INFORMACIÓN DEL SISTEMA:"
    echo "----------------------------"
    echo "👤 Usuario: $(whoami)"
    echo "🖥️  Sistema: $(uname -s)"
    echo "📍 Directorio: $(pwd)"
    echo "📅 Fecha: $(date)"
    echo "🕐 Hora: $(date +%H:%M:%S)"
    echo
}

# Función para listar archivos
listar_archivos() {
    echo "📁 ARCHIVOS EN EL DIRECTORIO ACTUAL:"
    echo "------------------------------------"
    ls -lh | head -10
    echo
    local total_archivos=$(ls -1 | wc -l)
    echo "📊 Total de elementos: $total_archivos"
    echo
}

# Función principal
main() {
    mostrar_bienvenida
    mostrar_info_sistema
    listar_archivos

    echo "✅ ¡Script ejecutado exitosamente!"
    echo "🎓 ¡Felicidades por tu primer script Bash!"
}

# Ejecutar función principal
main "$@"
```

### 📝 Explicación del Código

**[PANTALLA: Revisar el código línea por línea]**

> "Analicemos cada parte de nuestro script:"

1. **Shebang** (`#!/bin/bash`): Le dice al sistema qué intérprete usar
2. **Comentarios**: Documentación esencial para cualquier script
3. **set -euo pipefail**: Configuración de seguridad y manejo de errores
4. **Funciones**: Organizan el código de manera modular
5. **Variables**: Como `$total_archivos` para almacenar datos
6. **Substitución de comandos**: `$(comando)` para ejecutar y capturar salida

---

## 🔒 PARTE 5: PERMISOS Y EJECUCIÓN (10 minutos)

### 🎤 Transición

**[PANTALLA: Diagrama de permisos Unix]**

> "Antes de ejecutar nuestro script, necesitamos entender el sistema de permisos de Unix. Es fundamental para la seguridad y funcionalidad."

### 🔐 Sistema de Permisos

**[PANTALLA: Demostración práctica]**

> "Los permisos en Unix se dividen en tres categorías:"

```bash
# Ver permisos actuales
ls -l mi_primer_script.sh

# Salida ejemplo: -rw-r--r-- 1 usuario grupo 1234 fecha mi_primer_script.sh
```

**[EXPLICACIÓN VISUAL]**

> "Desglosemos los permisos:"

- **Primer carácter**: Tipo de archivo (`-` = archivo, `d` = directorio)
- **Siguiente 3**: Permisos del propietario (rwx)
- **Siguiente 3**: Permisos del grupo (r-x)
- **Últimos 3**: Permisos para otros (r--)

### ⚡ Hacer el Script Ejecutable

**[PANTALLA: Terminal]**

> "Para ejecutar nuestro script, necesitamos darle permisos de ejecución:"

```bash
# Añadir permiso de ejecución
chmod +x mi_primer_script.sh

# Verificar cambio
ls -l mi_primer_script.sh

# Ahora debería mostrar: -rwxr-xr-x
```

**[MÉTODOS ALTERNATIVOS]**

```bash
# Usando notación octal
chmod 755 mi_primer_script.sh

# Usando notación simbólica específica
chmod u+x,g+x,o+x mi_primer_script.sh
```

### 🚀 Ejecutar el Script

**[PANTALLA: Ejecución en vivo]**

> "¡Momento de la verdad! Ejecutemos nuestro primer script:"

```bash
# Método 1: Con ruta relativa
./mi_primer_script.sh

# Método 2: Con ruta absoluta
/home/usuario/bootcamp-bash/modulo1/mi_primer_script.sh

# Método 3: Con bash explícito
bash mi_primer_script.sh
```

**[DEMOSTRACIÓN COMPLETA]**

> "Veamos nuestro script en acción y analicemos la salida."

### 🐛 Depuración Básica

**[PANTALLA: Técnicas de debugging]**

> "Si algo sale mal, estas técnicas te ayudarán:"

```bash
# Ejecutar con debug
bash -x mi_primer_script.sh

# Verificar sintaxis sin ejecutar
bash -n mi_primer_script.sh

# Añadir debug en el script
set -x  # Activar debug
set +x  # Desactivar debug
```

---

## 🎯 PARTE 6: PROYECTO PRÁCTICO Y PRÓXIMOS PASOS (5 minutos)

### 🎤 Transición

**[PANTALLA: Logo del proyecto]**

> "Para consolidar lo aprendido, vamos a crear un pequeño proyecto práctico que combine todos los conceptos del módulo."

### 🏗️ Proyecto: Organizador de Archivos

**[PANTALLA: Descripción del proyecto]**

> "Crearemos un script que organice archivos por tipo en diferentes carpetas:"

```bash
# Crear script organizador
cat > organizador_archivos.sh << 'EOF'
#!/bin/bash
# Organizador de Archivos Automático
# Módulo 1 - Proyecto Práctico

set -euo pipefail

echo "🗂️  ORGANIZADOR DE ARCHIVOS"
echo "========================="

# Crear directorios por tipo
mkdir -p {documentos,imagenes,videos,scripts,otros}

# Función para mover archivos
organizar_archivos() {
    echo "📋 Organizando archivos..."

    # Documentos
    find . -maxdepth 1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.doc" \) -exec mv {} documentos/ \;

    # Imágenes
    find . -maxdepth 1 -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.gif" \) -exec mv {} imagenes/ \;

    # Videos
    find . -maxdepth 1 -type f \( -name "*.mp4" -o -name "*.avi" -o -name "*.mkv" \) -exec mv {} videos/ \;

    # Scripts
    find . -maxdepth 1 -type f -name "*.sh" ! -name "organizador_archivos.sh" -exec mv {} scripts/ \;

    echo "✅ Archivos organizados correctamente!"
}

# Mostrar estadísticas
mostrar_estadisticas() {
    echo ""
    echo "📊 ESTADÍSTICAS:"
    echo "Documentos: $(ls documentos/ 2>/dev/null | wc -l)"
    echo "Imágenes: $(ls imagenes/ 2>/dev/null | wc -l)"
    echo "Videos: $(ls videos/ 2>/dev/null | wc -l)"
    echo "Scripts: $(ls scripts/ 2>/dev/null | wc -l)"
}

# Ejecutar funciones
organizar_archivos
mostrar_estadisticas

echo "🎉 ¡Organización completada!"
EOF

chmod +x organizador_archivos.sh
```

### 🎓 Resumen de Logros

**[PANTALLA: Checklist de logros]**

> "¡Felicidades! Has completado el Módulo 1. Repasemos lo que has logrado:"

- ✅ Configurado entorno de desarrollo Bash
- ✅ Dominado comandos básicos de navegación
- ✅ Creado tu primer script funcional
- ✅ Entendido el sistema de permisos Unix
- ✅ Desarrollado un proyecto práctico

### 🚀 Próximos Pasos

**[PANTALLA: Preview del Módulo 2]**

> "En el Módulo 2 - Comandos Avanzados y Pipes, aprenderemos:"

- Pipes y redirección avanzada
- Procesamiento de texto con grep, sed, awk
- Wildcards y pattern matching
- Filtros y transformaciones de datos
- Proyecto: Procesador de Logs Avanzado

### 📚 Recursos Adicionales

**[PANTALLA: Enlaces y recursos]**

> "Para profundizar en lo aprendido:"

- 📖 [Manual oficial de Bash](https://www.gnu.org/software/bash/manual/)
- 🔧 [ShellCheck online](https://www.shellcheck.net/)
- 📋 [Cheatsheet de comandos Unix](_docs/cheatsheets/unix-permissions-cheatsheet.md)
- 💻 [Repositorio del bootcamp](https://github.com/tu-usuario/bc-bash)

### 🎬 Despedida

**[PANTALLA: Logo del bootcamp]**

> "¡Excelente trabajo completando el Módulo 1! Has dado el primer paso hacia convertirte en un experto en Bash scripting. Nos vemos en el próximo módulo donde llevaremos tus habilidades al siguiente nivel."

> "¡No olvides practicar con los ejercicios adicionales y compartir tus scripts en los comentarios! ¡Hasta la próxima!"

---

## 📋 CHECKLIST DE PRODUCCIÓN

### Antes de Grabar

- [ ] Entorno de grabación configurado
- [ ] Scripts de ejemplo probados
- [ ] Terminal con configuración limpia
- [ ] Resolución de pantalla optimizada para video
- [ ] Audio configurado y probado

### Durante la Grabación

- [ ] Introducción energética y clara
- [ ] Demostraciones en tiempo real
- [ ] Explicaciones paso a paso
- [ ] Verificación de cada comando
- [ ] Manejo de errores en vivo

### Después de Grabar

- [ ] Edición con timestamps claros
- [ ] Añadir títulos y transiciones
- [ ] Verificar audio sincronizado
- [ ] Crear thumbnail atractivo
- [ ] Preparar descripción con enlaces

---

## 🎥 NOTAS TÉCNICAS

### Configuración de Grabación

- **Resolución**: 1920x1080 mínimo
- **Terminal**: Fuente grande y legible
- **Colores**: Esquema de alto contraste
- **Zoom**: Nivel apropiado para lectura

### Puntos Clave para Edición

- Timestamp para cada sección principal
- Zoom en comandos importantes
- Highlights en salidas de comandos
- Transiciones suaves entre secciones
- Overlay con comando actual cuando sea necesario

---

**¡Listo para crear un video excepcional del Módulo 1! 🚀**
