# Bootcamp Bash - Módulo 4: Guión para Video de YouTube

## 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bootcamp Bash - Módulo 4: Funciones y Arrays - Construyendo Bibliotecas Reutilizables"

**Duración Estimada:** 65-80 minutos

**Audiencia:** Desarrolladores que han completado los módulos 1-3 y quieren crear código modular y reutilizable

**Objetivo:** Dominar funciones avanzadas, arrays multidimensionales y crear bibliotecas de código reutilizable para proyectos complejos

---

## 🎯 OBJETIVOS DE APRENDIZAJE

Al finalizar este video, los estudiantes podrán:

1. **Crear** funciones modulares y reutilizables con parámetros avanzados
2. **Implementar** bibliotecas de funciones para proyectos complejos
3. **Manipular** arrays y estructuras de datos complejas
4. **Diseñar** sistemas de backup y sincronización automatizados
5. **Aplicar** patrones de diseño profesional en bash scripting
6. **Construir** herramientas de línea de comandos robustas y escalables

---

## 📝 ESTRUCTURA DEL VIDEO

### PARTE 1: FUNCIONES AVANZADAS Y BIBLIOTECAS (15 minutos)

### PARTE 2: ARRAYS Y ESTRUCTURAS DE DATOS (12 minutos)

### PARTE 3: PATRONES DE DISEÑO EN BASH (13 minutos)

### PARTE 4: MANEJO DE ARCHIVOS Y DIRECTORIOS (10 minutos)

### PARTE 5: SISTEMA DE LOGGING Y DEBUGGING (8 minutos)

### PARTE 6: PROYECTO FINAL - SISTEMA DE BACKUP AVANZADO (15 minutos)

---

## 🎬 PARTE 1: FUNCIONES AVANZADAS Y BIBLIOTECAS (15 minutos)

### 🎤 Guión de Presentación

**[PANTALLA: Logo del Módulo 4 con animación de funciones conectándose]**

> "¡Bienvenidos al Módulo 4 del Bootcamp Bash! Hoy damos el salto de crear scripts lineales a construir verdaderas arquitecturas de software. Si hasta ahora hemos estado construyendo casas, hoy aprenderemos a diseñar rascacielos modulares y reutilizables."

### 🔧 Funciones Fundamentales: Más Allá de lo Básico

**[PANTALLA: Diagrama comparativo de script lineal vs modular]**

> "Las funciones no son solo bloques de código que se repiten. Son los componentes básicos de software mantenible. Imagina la diferencia entre tener todas las herramientas sueltas en una caja versus organizarlas en un taller profesional donde cada herramienta tiene su lugar específico."

**[DEMOSTRACIÓN FUNDAMENTAL]**

```bash
cat > funciones_avanzadas.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# FUNCIONES AVANZADAS - NIVEL PROFESIONAL
# ================================

# Colores para output profesional
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'

# ================================
# FUNCIONES CON PARÁMETROS VARIABLES
# ================================

# Función que acepta cualquier número de argumentos
sumar_numeros() {
    local suma=0
    local contador=0
    
    # Validar que tenemos al menos un argumento
    if [[ $# -eq 0 ]]; then
        echo -e "${RED}❌ Error: Se requiere al menos un número${NC}" >&2
        return 1
    fi
    
    echo -e "${BLUE}🧮 Calculando suma de $# números...${NC}"
    
    for numero in "$@"; do
        # Validar que es un número
        if ! [[ "$numero" =~ ^-?[0-9]+$ ]]; then
            echo -e "${RED}❌ Error: '$numero' no es un número válido${NC}" >&2
            return 1
        fi
        
        suma=$((suma + numero))
        ((contador++))
        echo -e "${CYAN}  Paso $contador: $suma (agregando $numero)${NC}"
    done
    
    echo -e "${GREEN}✅ Resultado final: $suma${NC}"
    return 0
}

# ================================
# FUNCIONES CON VALORES DE RETORNO COMPLEJOS
# ================================

# Función que retorna múltiples valores via variables globales
analizar_archivo() {
    local archivo="$1"
    
    # Variables globales para retornar resultados
    archivo_tamaño=""
    archivo_tipo=""
    archivo_permisos=""
    archivo_modificacion=""
    archivo_existe=false
    
    if [[ ! -f "$archivo" ]]; then
        echo -e "${RED}❌ Archivo '$archivo' no existe${NC}" >&2
        return 1
    fi
    
    # Recopilar información
    archivo_existe=true
    archivo_tamaño=$(stat -f%z "$archivo" 2>/dev/null || stat -c%s "$archivo")
    archivo_tipo=$(file -b "$archivo")
    archivo_permisos=$(stat -f%A "$archivo" 2>/dev/null || stat -c%a "$archivo")
    archivo_modificacion=$(stat -f%m "$archivo" 2>/dev/null || stat -c%Y "$archivo")
    
    echo -e "${GREEN}✅ Análisis completado para: $archivo${NC}"
    return 0
}

# Función para mostrar análisis formateado
mostrar_analisis() {
    local archivo="$1"
    
    if analizar_archivo "$archivo"; then
        echo -e "${PURPLE}📊 ANÁLISIS DETALLADO${NC}"
        echo "================================"
        echo "📄 Archivo: $archivo"
        echo "📏 Tamaño: $(formatear_tamaño $archivo_tamaño)"
        echo "🏷️ Tipo: $archivo_tipo"
        echo "🔒 Permisos: $archivo_permisos"
        echo "📅 Modificado: $(date -r $archivo_modificacion '+%Y-%m-%d %H:%M:%S')"
        echo "✅ Existe: $archivo_existe"
    fi
}

# ================================
# FUNCIONES UTILITARIAS REUTILIZABLES
# ================================

# Función para formatear tamaños de archivo
formatear_tamaño() {
    local bytes="$1"
    local unidades=("bytes" "KB" "MB" "GB" "TB")
    local unidad=0
    
    while ((bytes >= 1024 && unidad < 4)); do
        bytes=$((bytes / 1024))
        ((unidad++))
    done
    
    echo "$bytes ${unidades[unidad]}"
}

# Función para crear barras de progreso
mostrar_progreso() {
    local actual="$1"
    local total="$2"
    local ancho="${3:-50}"
    local caracter="${4:-█}"
    
    local porcentaje=$((actual * 100 / total))
    local completado=$((porcentaje * ancho / 100))
    local restante=$((ancho - completado))
    
    printf "\r${BLUE}["
    printf "%${completado}s" | tr ' ' "$caracter"
    printf "%${restante}s" | tr ' ' '░'
    printf "] %3d%% (%d/%d)${NC}" "$porcentaje" "$actual" "$total"
    
    [[ $actual -eq $total ]] && echo
}

# Función para logging con niveles
log_mensaje() {
    local nivel="$1"
    shift
    local mensaje="$*"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    case $nivel in
        "INFO")  echo -e "${BLUE}[$timestamp] INFO: $mensaje${NC}" ;;
        "WARN")  echo -e "${YELLOW}[$timestamp] WARN: $mensaje${NC}" >&2 ;;
        "ERROR") echo -e "${RED}[$timestamp] ERROR: $mensaje${NC}" >&2 ;;
        "DEBUG") [[ "${DEBUG:-false}" == "true" ]] && echo -e "${CYAN}[$timestamp] DEBUG: $mensaje${NC}" ;;
        *)       echo -e "[$timestamp] $nivel: $mensaje" ;;
    esac
}

# ================================
# FUNCIONES DE VALIDACIÓN AVANZADAS
# ================================

# Función para validar emails con regex
validar_email() {
    local email="$1"
    local regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
    
    if [[ $email =~ $regex ]]; then
        echo -e "${GREEN}✅ Email válido: $email${NC}"
        return 0
    else
        echo -e "${RED}❌ Email inválido: $email${NC}"
        return 1
    fi
}

# Función para validar URLs
validar_url() {
    local url="$1"
    local regex="^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$"
    
    if [[ $url =~ $regex ]]; then
        echo -e "${GREEN}✅ URL válida: $url${NC}"
        return 0
    else
        echo -e "${RED}❌ URL inválida: $url${NC}"
        return 1
    fi
}

# Función para validar números en rangos
validar_numero_rango() {
    local numero="$1"
    local min="$2"
    local max="$3"
    
    if ! [[ "$numero" =~ ^-?[0-9]+$ ]]; then
        echo -e "${RED}❌ '$numero' no es un número${NC}"
        return 1
    fi
    
    if ((numero < min || numero > max)); then
        echo -e "${RED}❌ '$numero' debe estar entre $min y $max${NC}"
        return 1
    fi
    
    echo -e "${GREEN}✅ Número válido: $numero${NC}"
    return 0
}

# ================================
# DEMOSTRACIONES INTERACTIVAS
# ================================

demo_funciones_avanzadas() {
    echo -e "${PURPLE}🚀 DEMOSTRACIÓN DE FUNCIONES AVANZADAS${NC}"
    echo "=============================================="
    echo
    
    # Demo 1: Suma variable de números
    echo -e "${BLUE}📊 Demo 1: Suma de números variables${NC}"
    sumar_numeros 10 20 30 40 50
    echo
    
    # Demo 2: Análisis de archivos
    echo -e "${BLUE}📊 Demo 2: Análisis de archivos${NC}"
    # Crear archivo de ejemplo
    echo "Contenido de ejemplo para análisis" > archivo_demo.txt
    mostrar_analisis "archivo_demo.txt"
    echo
    
    # Demo 3: Barras de progreso
    echo -e "${BLUE}📊 Demo 3: Simulación de progreso${NC}"
    for i in {1..20}; do
        mostrar_progreso $i 20 30 "▓"
        sleep 0.1
    done
    echo
    
    # Demo 4: Validaciones
    echo -e "${BLUE}📊 Demo 4: Validaciones avanzadas${NC}"
    validar_email "usuario@ejemplo.com"
    validar_email "email-invalido"
    validar_url "https://github.com/usuario/repo"
    validar_url "url-invalida"
    validar_numero_rango 50 1 100
    validar_numero_rango 150 1 100
    echo
    
    # Limpiar
    rm -f archivo_demo.txt
    
    echo -e "${GREEN}✅ Demostración completada${NC}"
}

# Ejecutar demo si se llama directamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    demo_funciones_avanzadas
fi
EOF

chmod +x funciones_avanzadas.sh

echo "🎯 EJECUTANDO DEMOSTRACIÓN:"
./funciones_avanzadas.sh
```

### 📚 Creando Bibliotecas Reutilizables

**[PANTALLA: Estructura de biblioteca modular]**

> "Una biblioteca de funciones es como tener un equipo de especialistas siempre disponible. En lugar de reescribir código, importamos expertise."

**[DEMOSTRACIÓN DE BIBLIOTECA]**

```bash
# Crear biblioteca de utilidades
cat > lib_utils.sh << 'EOF'
#!/bin/bash

# ================================
# BIBLIOTECA DE UTILIDADES PROFESIONAL
# lib_utils.sh - v1.0
# ================================

# Prevenir múltiples inclusiones
if [[ "${LIB_UTILS_LOADED:-}" == "true" ]]; then
    return 0
fi
readonly LIB_UTILS_LOADED="true"

# ================================
# CONFIGURACIÓN DE BIBLIOTECA
# ================================

# Colores consistentes
readonly LIB_RED='\033[0;31m'
readonly LIB_GREEN='\033[0;32m'
readonly LIB_YELLOW='\033[1;33m'
readonly LIB_BLUE='\033[0;34m'
readonly LIB_PURPLE='\033[0;35m'
readonly LIB_CYAN='\033[0;36m'
readonly LIB_NC='\033[0m'

# ================================
# MÓDULO: LOGGING
# ================================

lib_log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local caller="${BASH_SOURCE[2]##*/}:${BASH_LINENO[1]}"
    
    case $level in
        "INFO")  echo -e "${LIB_BLUE}[$timestamp] [$caller] INFO: $message${LIB_NC}" ;;
        "WARN")  echo -e "${LIB_YELLOW}[$timestamp] [$caller] WARN: $message${LIB_NC}" >&2 ;;
        "ERROR") echo -e "${LIB_RED}[$timestamp] [$caller] ERROR: $message${LIB_NC}" >&2 ;;
        "SUCCESS") echo -e "${LIB_GREEN}[$timestamp] [$caller] SUCCESS: $message${LIB_NC}" ;;
        "DEBUG") [[ "${DEBUG:-false}" == "true" ]] && echo -e "${LIB_CYAN}[$timestamp] [$caller] DEBUG: $message${LIB_NC}" ;;
    esac
}

# ================================
# MÓDULO: VALIDACIÓN
# ================================

lib_validar_archivo() {
    local archivo="$1"
    local tipo="${2:-file}"
    
    case $tipo in
        "file")
            [[ -f "$archivo" ]] || { lib_log ERROR "Archivo no existe: $archivo"; return 1; }
            [[ -r "$archivo" ]] || { lib_log ERROR "Archivo no legible: $archivo"; return 1; }
            ;;
        "dir")
            [[ -d "$archivo" ]] || { lib_log ERROR "Directorio no existe: $archivo"; return 1; }
            ;;
        "executable")
            [[ -x "$archivo" ]] || { lib_log ERROR "Archivo no ejecutable: $archivo"; return 1; }
            ;;
    esac
    
    return 0
}

lib_validar_dependencias() {
    local deps=("$@")
    local faltantes=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            faltantes+=("$dep")
        fi
    done
    
    if [[ ${#faltantes[@]} -gt 0 ]]; then
        lib_log ERROR "Dependencias faltantes: ${faltantes[*]}"
        return 1
    fi
    
    lib_log SUCCESS "Todas las dependencias están disponibles"
    return 0
}

# ================================
# MÓDULO: FORMATEO
# ================================

lib_formatear_bytes() {
    local bytes="$1"
    local precision="${2:-1}"
    
    if ((bytes < 1024)); then
        echo "${bytes} B"
    elif ((bytes < 1048576)); then
        printf "%.${precision}f KB\n" "$(bc -l <<< "scale=2; $bytes/1024")"
    elif ((bytes < 1073741824)); then
        printf "%.${precision}f MB\n" "$(bc -l <<< "scale=2; $bytes/1048576")"
    else
        printf "%.${precision}f GB\n" "$(bc -l <<< "scale=2; $bytes/1073741824")"
    fi
}

lib_formatear_tiempo() {
    local segundos="$1"
    local horas=$((segundos / 3600))
    local minutos=$(((segundos % 3600) / 60))
    local segs=$((segundos % 60))
    
    if ((horas > 0)); then
        printf "%02d:%02d:%02d\n" $horas $minutos $segs
    elif ((minutos > 0)); then
        printf "%02d:%02d\n" $minutos $segs
    else
        printf "%ds\n" $segs
    fi
}

# ================================
# MÓDULO: INTERFAZ DE USUARIO
# ================================

lib_mostrar_banner() {
    local titulo="$1"
    local subtitulo="${2:-}"
    local ancho=60
    
    echo -e "${LIB_PURPLE}"
    printf "═%.0s" $(seq 1 $ancho)
    echo
    printf "%-*s\n" $ancho " $titulo"
    [[ -n "$subtitulo" ]] && printf "%-*s\n" $ancho " $subtitulo"
    printf "═%.0s" $(seq 1 $ancho)
    echo -e "${LIB_NC}"
}

lib_confirmar() {
    local mensaje="$1"
    local respuesta
    
    while true; do
        read -p "$mensaje [y/N]: " respuesta
        case $respuesta in
            [Yy]|[Yy][Ee][Ss]) return 0 ;;
            [Nn]|[Nn][Oo]|"") return 1 ;;
            *) echo "Por favor responde 'y' o 'n'" ;;
        esac
    done
}

lib_progreso() {
    local actual="$1"
    local total="$2"
    local etiqueta="${3:-Progreso}"
    local ancho=40
    
    local porcentaje=$((actual * 100 / total))
    local completado=$((actual * ancho / total))
    local restante=$((ancho - completado))
    
    printf "\r${LIB_CYAN}%s: [" "$etiqueta"
    printf "%${completado}s" | tr ' ' '▓'
    printf "%${restante}s" | tr ' ' '░'
    printf "] %3d%% (%d/%d)${LIB_NC}" "$porcentaje" "$actual" "$total"
    
    [[ $actual -eq $total ]] && echo
}

# ================================
# MÓDULO: ARCHIVOS Y DIRECTORIOS
# ================================

lib_backup_archivo() {
    local archivo="$1"
    local backup_dir="${2:-./backups}"
    
    lib_validar_archivo "$archivo" "file" || return 1
    
    mkdir -p "$backup_dir"
    local timestamp=$(date '+%Y%m%d_%H%M%S')
    local backup_name="${backup_dir}/$(basename "$archivo").backup_${timestamp}"
    
    if cp "$archivo" "$backup_name"; then
        lib_log SUCCESS "Backup creado: $backup_name"
        echo "$backup_name"
        return 0
    else
        lib_log ERROR "Fallo al crear backup de $archivo"
        return 1
    fi
}

lib_limpiar_temporales() {
    local directorio="${1:-/tmp}"
    local patron="${2:-tmp.*}"
    local dias="${3:-7}"
    
    lib_log INFO "Limpiando archivos temporales en $directorio"
    local encontrados=$(find "$directorio" -name "$patron" -type f -mtime +$dias 2>/dev/null | wc -l)
    
    if ((encontrados > 0)); then
        find "$directorio" -name "$patron" -type f -mtime +$dias -delete 2>/dev/null
        lib_log SUCCESS "Eliminados $encontrados archivos temporales"
    else
        lib_log INFO "No se encontraron archivos temporales para limpiar"
    fi
}

# ================================
# INFORMACIÓN DE LA BIBLIOTECA
# ================================

lib_info() {
    cat << 'INFO'
BIBLIOTECA DE UTILIDADES PROFESIONAL v1.0
==========================================

Módulos disponibles:
  📝 LOGGING:     lib_log [INFO|WARN|ERROR|SUCCESS|DEBUG] <mensaje>
  ✅ VALIDACIÓN:  lib_validar_archivo, lib_validar_dependencias
  🎨 FORMATEO:    lib_formatear_bytes, lib_formatear_tiempo
  🖥️ INTERFAZ:    lib_mostrar_banner, lib_confirmar, lib_progreso
  📁 ARCHIVOS:    lib_backup_archivo, lib_limpiar_temporales

Uso:
  source lib_utils.sh
  lib_log INFO "Mensaje de información"
  lib_confirmar "¿Continuar?"
INFO
}

# Mensaje de carga
lib_log DEBUG "Biblioteca lib_utils.sh v1.0 cargada exitosamente"
EOF

# Crear script que usa la biblioteca
cat > demo_biblioteca.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# Cargar biblioteca
source ./lib_utils.sh

main() {
    lib_mostrar_banner "DEMO DE BIBLIOTECA" "Demostrando funcionalidades modulares"
    echo
    
    # Demo logging
    lib_log INFO "Iniciando demostración"
    lib_log WARN "Esta es una advertencia"
    lib_log SUCCESS "Operación exitosa"
    
    echo
    
    # Demo validación
    lib_log INFO "Validando dependencias del sistema..."
    lib_validar_dependencias "bash" "echo" "printf" "date"
    
    echo
    
    # Demo formateo
    lib_log INFO "Demostrando formateo de datos"
    echo "Tamaño formateado: $(lib_formatear_bytes 1048576)"
    echo "Tiempo formateado: $(lib_formatear_tiempo 3665)"
    
    echo
    
    # Demo progreso
    lib_log INFO "Simulando proceso con barra de progreso"
    for i in {1..25}; do
        lib_progreso $i 25 "Procesando"
        sleep 0.05
    done
    
    echo
    echo
    
    # Demo archivo
    echo "Contenido de ejemplo" > demo_temp.txt
    backup_path=$(lib_backup_archivo "demo_temp.txt")
    lib_log SUCCESS "Archivo respaldado en: $backup_path"
    
    # Limpiar
    rm -f demo_temp.txt
    rm -f "$backup_path"
    rmdir backups 2>/dev/null || true
    
    lib_log SUCCESS "Demostración completada exitosamente"
}

main "$@"
EOF

chmod +x demo_biblioteca.sh

echo ""
echo "📚 CREANDO Y USANDO BIBLIOTECA:"
echo "1. Biblioteca creada: lib_utils.sh"
echo "2. Script de demostración: demo_biblioteca.sh"
echo ""
echo "🎯 EJECUTANDO DEMO DE BIBLIOTECA:"
./demo_biblioteca.sh
```

### 💡 Mejores Prácticas para Funciones

**[PANTALLA: Lista de principios SOLID aplicados a Bash]**

> "Principios profesionales para funciones bash:
> 1. **Una responsabilidad por función**: Cada función hace una cosa y la hace bien
> 2. **Parámetros claros**: Nombres descriptivos y validación inmediata
> 3. **Valores de retorno consistentes**: 0 para éxito, código específico para errores
> 4. **Documentación integrada**: Comentarios que explican el propósito y uso
> 5. **Reutilización**: Funciones diseñadas para múltiples contextos
> 6. **Testabilidad**: Funciones que se pueden probar independientemente"

---

## 📊 PARTE 2: ARRAYS Y ESTRUCTURAS DE DATOS (12 minutos)

### 🎤 Transición

**[PANTALLA: Visualización de estructuras de datos]**

> "Si las variables son cajas individuales, los arrays son almacenes organizados. Nos permiten manejar colecciones de datos de manera eficiente, desde listas simples hasta estructuras complejas que rivalizan con bases de datos relacionales."

### 📋 Arrays Indexados: Listas Poderosas

**[DEMOSTRACIÓN DE ARRAYS BÁSICOS]**

```bash
cat > arrays_fundamentales.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# ARRAYS FUNDAMENTALES EN BASH
# ================================

# Colores
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'

echo -e "${BLUE}🗂️ ARRAYS INDEXADOS FUNDAMENTALES${NC}"
echo "============================================"
echo

# ================================
# DECLARACIÓN Y INICIALIZACIÓN
# ================================

echo -e "${CYAN}📝 Métodos de declaración de arrays:${NC}"

# Método 1: Declaración explícita
declare -a frutas
frutas=("manzana" "banana" "naranja" "kiwi" "mango")

# Método 2: Inicialización directa
colores=("rojo" "verde" "azul" "amarillo")

# Método 3: Asignación individual
declare -a numeros
numeros[0]=10
numeros[1]=20
numeros[2]=30
numeros[5]=60  # Los índices pueden no ser consecutivos

# Método 4: Lectura desde comando
readarray -t archivos < <(ls *.sh 2>/dev/null)

echo "✅ Arrays declarados exitosamente"
echo

# ================================
# OPERACIONES BÁSICAS
# ================================

echo -e "${CYAN}🔧 Operaciones básicas con arrays:${NC}"

# Mostrar todos los elementos
echo "📋 Todas las frutas: ${frutas[@]}"
echo "🎨 Todos los colores: ${colores[*]}"

# Acceso a elementos individuales
echo "🍎 Primera fruta: ${frutas[0]}"
echo "🎨 Último color: ${colores[-1]}"  # Bash 4.3+

# Cantidad de elementos
echo "📊 Cantidad de frutas: ${#frutas[@]}"
echo "📊 Cantidad de colores: ${#colores[@]}"

# Índices de array
echo "🔢 Índices de números: ${!numeros[@]}"

echo

# ================================
# MANIPULACIÓN AVANZADA
# ================================

echo -e "${CYAN}⚡ Manipulación avanzada de arrays:${NC}"

# Agregar elementos
frutas+=("piña" "uva")
echo "🍇 Frutas después de agregar: ${frutas[@]}"

# Eliminar elemento específico
unset frutas[1]  # Elimina "banana"
echo "🗑️ Frutas después de eliminar índice 1: ${frutas[@]}"

# Reemplazar elemento
frutas[0]="manzana_verde"
echo "🔄 Frutas después de reemplazar: ${frutas[@]}"

# Slice de array (subconjunto)
subset=("${frutas[@]:1:3}")  # Desde índice 1, 3 elementos
echo "✂️ Subset de frutas: ${subset[@]}"

echo

# ================================
# ARRAYS DINÁMICOS
# ================================

echo -e "${CYAN}🚀 Creación de arrays dinámicos:${NC}"

# Array para almacenar información del sistema
declare -a info_sistema

# Recopilar información
info_sistema+=("Usuario: $(whoami)")
info_sistema+=("Fecha: $(date '+%Y-%m-%d %H:%M:%S')")
info_sistema+=("Directorio: $(pwd)")
info_sistema+=("Shell: $SHELL")

# Mostrar información
echo "🖥️ Información del sistema:"
for i in "${!info_sistema[@]}"; do
    echo "  $((i+1)). ${info_sistema[i]}"
done

echo

# ================================
# ITERACIÓN AVANZADA
# ================================

echo -e "${CYAN}🔄 Métodos de iteración:${NC}"

# Método 1: Por elementos
echo "Iteración por elementos:"
for fruta in "${frutas[@]}"; do
    [[ -n "$fruta" ]] && echo "  🍓 $fruta"
done

echo

# Método 2: Por índices
echo "Iteración por índices:"
for i in "${!colores[@]}"; do
    echo "  Color[$i]: ${colores[i]}"
done

echo

# Método 3: Estilo C
echo "Iteración estilo C:"
for ((i=0; i<${#numeros[@]}; i++)); do
    [[ -n "${numeros[i]:-}" ]] && echo "  Número[$i]: ${numeros[i]}"
done

echo
EOF

chmod +x arrays_fundamentales.sh
echo "🎯 EJECUTANDO DEMOSTRACIÓN DE ARRAYS:"
./arrays_fundamentales.sh
```

### 🗃️ Arrays Asociativos: Diccionarios Poderosos

**[DEMOSTRACIÓN DE ARRAYS ASOCIATIVOS]**

```bash
cat > arrays_asociativos.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# ARRAYS ASOCIATIVOS - DICCIONARIOS EN BASH
# ================================

# Verificar soporte para arrays asociativos (Bash 4.0+)
if (( BASH_VERSINFO[0] < 4 )); then
    echo "❌ Error: Arrays asociativos requieren Bash 4.0 o superior"
    echo "Tu versión: $BASH_VERSION"
    exit 1
fi

# Colores
readonly PURPLE='\033[0;35m'
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'

echo -e "${PURPLE}🗄️ ARRAYS ASOCIATIVOS AVANZADOS${NC}"
echo "============================================"
echo

# ================================
# DECLARACIÓN DE ARRAYS ASOCIATIVOS
# ================================

echo -e "${CYAN}📝 Declaración y uso de arrays asociativos:${NC}"

# Declarar array asociativo
declare -A configuracion
declare -A usuarios
declare -A estadisticas

# Inicialización con valores
configuracion=(
    ["host"]="localhost"
    ["puerto"]="8080"
    ["debug"]="true"
    ["timeout"]="30"
    ["max_conexiones"]="100"
)

# Agregar datos de usuarios
usuarios["admin"]="Administrador del Sistema"
usuarios["user1"]="Juan Pérez"
usuarios["user2"]="María García"
usuarios["guest"]="Usuario Invitado"

echo "✅ Arrays asociativos inicializados"
echo

# ================================
# ACCESO Y MANIPULACIÓN
# ================================

echo -e "${CYAN}🔧 Acceso y manipulación de datos:${NC}"

# Acceso a valores
echo "🖥️ Host configurado: ${configuracion[host]}"
echo "🔌 Puerto: ${configuracion[puerto]}"
echo "👤 Usuario admin: ${usuarios[admin]}"

# Verificar si existe clave
if [[ -n "${configuracion[debug]:-}" ]]; then
    echo "🐛 Modo debug: ${configuracion[debug]}"
fi

# Todas las claves
echo "🔑 Claves de configuración: ${!configuracion[@]}"
echo "👥 Usuarios registrados: ${!usuarios[@]}"

# Todos los valores
echo "⚙️ Valores de configuración: ${configuracion[@]}"

echo

# ================================
# CASOS DE USO PRÁCTICOS
# ================================

echo -e "${CYAN}💼 Casos de uso profesionales:${NC}"

# Array para traducción/localización
declare -A mensajes
mensajes=(
    ["welcome"]="Bienvenido al sistema"
    ["error"]="Ha ocurrido un error"
    ["success"]="Operación exitosa"
    ["confirm"]="¿Confirmas la operación?"
    ["goodbye"]="¡Hasta luego!"
)

# Función para obtener mensaje localizado
obtener_mensaje() {
    local clave="$1"
    echo "${mensajes[$clave]:-Mensaje no encontrado: $clave}"
}

echo "🌐 Mensajes localizados:"
echo "  $(obtener_mensaje welcome)"
echo "  $(obtener_mensaje error)"
echo "  $(obtener_mensaje success)"

echo

# Array para configuración de bases de datos
declare -A db_config
db_config=(
    ["host"]="database.ejemplo.com"
    ["usuario"]="app_user"
    ["base_datos"]="mi_aplicacion"
    ["puerto"]="5432"
    ["ssl"]="require"
)

# Función para construir string de conexión
construir_conexion() {
    local host="${db_config[host]}"
    local usuario="${db_config[usuario]}"
    local bd="${db_config[base_datos]}"
    local puerto="${db_config[puerto]}"
    
    echo "postgresql://${usuario}@${host}:${puerto}/${bd}"
}

echo "🗄️ String de conexión: $(construir_conexion)"

echo

# ================================
# ESTADÍSTICAS Y CONTADORES
# ================================

echo -e "${CYAN}📊 Sistema de estadísticas dinámico:${NC}"

# Simular procesamiento de logs
declare -A contadores
declare -A tiempos_respuesta

# Simular datos
eventos=("login" "logout" "error" "login" "success" "error" "login" "success" "success")

for evento in "${eventos[@]}"; do
    # Incrementar contador
    ((contadores[$evento]++))
    
    # Simular tiempo de respuesta
    tiempo=$((RANDOM % 1000 + 100))
    tiempos_respuesta[$evento]="${tiempos_respuesta[$evento]:-0},$tiempo"
done

echo "📈 Estadísticas de eventos:"
for evento in "${!contadores[@]}"; do
    echo "  $evento: ${contadores[$evento]} veces"
done

echo

# Función para calcular promedio de tiempos
calcular_promedio() {
    local evento="$1"
    local tiempos="${tiempos_respuesta[$evento]}"
    local suma=0
    local cuenta=0
    
    IFS=',' read -ra TIEMPOS <<< "$tiempos"
    for tiempo in "${TIEMPOS[@]}"; do
        [[ "$tiempo" != "0" ]] && {
            suma=$((suma + tiempo))
            ((cuenta++))
        }
    done
    
    if ((cuenta > 0)); then
        echo $((suma / cuenta))
    else
        echo "0"
    fi
}

echo "⏱️ Tiempos promedio de respuesta:"
for evento in "${!tiempos_respuesta[@]}"; do
    promedio=$(calcular_promedio "$evento")
    echo "  $evento: ${promedio}ms"
done

echo

# ================================
# FUNCIONES AVANZADAS PARA ARRAYS ASOCIATIVOS
# ================================

# Función para serializar array asociativo
serializar_array() {
    local -n arr_ref=$1
    local resultado=""
    
    for clave in "${!arr_ref[@]}"; do
        resultado+="$clave=${arr_ref[$clave]};"
    done
    
    echo "${resultado%;}"  # Remover último punto y coma
}

# Función para deserializar array asociativo
deserializar_array() {
    local datos="$1"
    local -n arr_ref=$2
    
    IFS=';' read -ra PARES <<< "$datos"
    for par in "${PARES[@]}"; do
        IFS='=' read -r clave valor <<< "$par"
        arr_ref["$clave"]="$valor"
    done
}

echo -e "${CYAN}💾 Serialización y deserialización:${NC}"

# Serializar configuración
config_serializada=$(serializar_array configuracion)
echo "📦 Configuración serializada: $config_serializada"

# Crear nuevo array y deserializar
declare -A nueva_config
deserializar_array "$config_serializada" nueva_config

echo "📤 Configuración deserializada:"
for clave in "${!nueva_config[@]}"; do
    echo "  $clave: ${nueva_config[$clave]}"
done

echo
echo -e "${GREEN}✅ Demostración de arrays asociativos completada${NC}"
EOF

chmod +x arrays_asociativos.sh
echo ""
echo "🎯 EJECUTANDO DEMOSTRACIÓN DE ARRAYS ASOCIATIVOS:"
./arrays_asociativos.sh
```

### 🔄 Algoritmos con Arrays

**[DEMOSTRACIÓN DE ALGORITMOS]**

```bash
cat > algoritmos_arrays.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# ALGORITMOS AVANZADOS CON ARRAYS
# ================================

# Colores
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly PURPLE='\033[0;35m'
readonly NC='\033[0m'

echo -e "${PURPLE}🧮 ALGORITMOS AVANZADOS CON ARRAYS${NC}"
echo "============================================"
echo

# ================================
# ALGORITMO: ORDENAMIENTO BURBUJA
# ================================

ordenamiento_burbuja() {
    local -n arr=$1
    local n=${#arr[@]}
    local temp
    
    echo -e "${BLUE}🔄 Ordenamiento burbuja en progreso...${NC}"
    
    for ((i = 0; i < n-1; i++)); do
        for ((j = 0; j < n-i-1; j++)); do
            if ((arr[j] > arr[j+1])); then
                # Intercambiar elementos
                temp=${arr[j]}
                arr[j]=${arr[j+1]}
                arr[j+1]=$temp
            fi
        done
        echo "  Pasada $((i+1)): ${arr[*]}"
    done
    
    echo -e "${GREEN}✅ Ordenamiento completado${NC}"
}

# ================================
# ALGORITMO: BÚSQUEDA BINARIA
# ================================

busqueda_binaria() {
    local -n arr=$1
    local objetivo=$2
    local izquierda=0
    local derecha=$((${#arr[@]} - 1))
    local medio
    
    echo -e "${BLUE}🔍 Búsqueda binaria de: $objetivo${NC}"
    
    while ((izquierda <= derecha)); do
        medio=$(((izquierda + derecha) / 2))
        echo "  Buscando en rango [$izquierda, $derecha], medio=$medio, valor=${arr[medio]}"
        
        if ((arr[medio] == objetivo)); then
            echo -e "${GREEN}✅ Encontrado en posición: $medio${NC}"
            return $medio
        elif ((arr[medio] < objetivo)); then
            izquierda=$((medio + 1))
        else
            derecha=$((medio - 1))
        fi
    done
    
    echo -e "${RED}❌ No encontrado${NC}"
    return -1
}

# ================================
# ALGORITMO: FILTRADO AVANZADO
# ================================

filtrar_array() {
    local -n origen=$1
    local -n destino=$2
    local condicion=$3
    
    destino=()
    
    case $condicion in
        "pares")
            for num in "${origen[@]}"; do
                ((num % 2 == 0)) && destino+=($num)
            done
            ;;
        "impares")
            for num in "${origen[@]}"; do
                ((num % 2 != 0)) && destino+=($num)
            done
            ;;
        "mayores_10")
            for num in "${origen[@]}"; do
                ((num > 10)) && destino+=($num)
            done
            ;;
    esac
}

# ================================
# ALGORITMO: REDUCCIÓN (FOLD)
# ================================

reducir_array() {
    local -n arr=$1
    local operacion=$2
    local acumulador=${3:-0}
    
    for elemento in "${arr[@]}"; do
        case $operacion in
            "suma")
                acumulador=$((acumulador + elemento))
                ;;
            "producto")
                acumulador=$((acumulador * elemento))
                ;;
            "maximo")
                ((elemento > acumulador)) && acumulador=$elemento
                ;;
            "minimo")
                ((elemento < acumulador)) && acumulador=$elemento
                ;;
        esac
    done
    
    echo $acumulador
}

# ================================
# DEMOSTRACIÓN COMPLETA
# ================================

demo_algoritmos() {
    echo -e "${YELLOW}📊 Datos iniciales:${NC}"
    
    # Array para demos
    numeros=(64 34 25 12 22 11 90 5 77 30)
    echo "Números originales: ${numeros[*]}"
    echo
    
    # Demo 1: Ordenamiento
    echo -e "${YELLOW}1️⃣ ORDENAMIENTO BURBUJA:${NC}"
    numeros_copia=("${numeros[@]}")
    ordenamiento_burbuja numeros_copia
    echo "Resultado final: ${numeros_copia[*]}"
    echo
    
    # Demo 2: Búsqueda binaria
    echo -e "${YELLOW}2️⃣ BÚSQUEDA BINARIA:${NC}"
    busqueda_binaria numeros_copia 25
    busqueda_binaria numeros_copia 100
    echo
    
    # Demo 3: Filtrado
    echo -e "${YELLOW}3️⃣ FILTRADO DE DATOS:${NC}"
    declare -a pares impares mayores
    
    filtrar_array numeros pares "pares"
    filtrar_array numeros impares "impares"
    filtrar_array numeros mayores "mayores_10"
    
    echo "Números pares: ${pares[*]}"
    echo "Números impares: ${impares[*]}"
    echo "Mayores a 10: ${mayores[*]}"
    echo
    
    # Demo 4: Reducción
    echo -e "${YELLOW}4️⃣ OPERACIONES DE REDUCCIÓN:${NC}"
    suma=$(reducir_array numeros "suma")
    producto=$(reducir_array numeros "producto" 1)
    maximo=$(reducir_array numeros "maximo" ${numeros[0]})
    minimo=$(reducir_array numeros "minimo" ${numeros[0]})
    
    echo "Suma total: $suma"
    echo "Producto: $producto"
    echo "Máximo: $maximo"
    echo "Mínimo: $minimo"
    echo
    
    # Estadísticas
    promedio=$((suma / ${#numeros[@]}))
    echo "Promedio: $promedio"
    echo "Cantidad de elementos: ${#numeros[@]}"
}

# Ejecutar demostración
demo_algoritmos

echo -e "${GREEN}✅ Demostración de algoritmos completada${NC}"
EOF

chmod +x algoritmos_arrays.sh
echo ""
echo "🎯 EJECUTANDO ALGORITMOS CON ARRAYS:"
./algoritmos_arrays.sh
```

### 💡 Mejores Prácticas para Arrays

**[PANTALLA: Guía de optimización de arrays]**

> "Optimización y mejores prácticas para arrays:
> 1. **Usa arrays asociativos** para datos clave-valor complejos
> 2. **Comillas dobles**: Siempre usa "${array[@]}" para preservar espacios
> 3. **Validación de índices**: Verifica que los índices existan antes de acceder
> 4. **Arrays grandes**: Considera alternativas como archivos temporales
> 5. **Inicialización clara**: Declara el tipo de array explícitamente
> 6. **Funciones específicas**: Pasa arrays por referencia con nameref"

---
## 🏗️ PARTE 3: PATRONES DE DISEÑO EN BASH (13 minutos)

### 🎤 Transición

**[PANTALLA: Arquitectura de software mostrando patrones]**

> "Los patrones de diseño son como planos arquitectónicos probados. No reinventamos la rueda, sino que aplicamos soluciones elegantes que han funcionado en miles de proyectos. En bash, estos patrones nos permiten crear scripts mantenibles y escalables."

### 🎨 Factory Pattern: Creación Dinámica

**[DEMOSTRACIÓN DEL PATRÓN FACTORY]**

```bash
cat > patron_factory.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# PATRÓN FACTORY EN BASH
# ================================

# Colores
readonly BLUE='\033[0;34m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly PURPLE='\033[0;35m'
readonly NC='\033[0m'

echo -e "${PURPLE}🏭 PATRÓN FACTORY - CREACIÓN DINÁMICA${NC}"
echo "============================================"
echo

# ================================
# FACTORY DE LOGGERS
# ================================

# Función factory para crear diferentes tipos de loggers
crear_logger() {
    local tipo="$1"
    local archivo="${2:-}"
    
    case $tipo in
        "consola")
            cat << 'LOGGER_CONSOLA'
log_mensaje() {
    local nivel="$1"
    local mensaje="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $nivel: $mensaje"
}
LOGGER_CONSOLA
            ;;
        "archivo")
            cat << LOGGER_ARCHIVO
log_mensaje() {
    local nivel="\$1"
    local mensaje="\$2"
    local timestamp=\$(date '+%Y-%m-%d %H:%M:%S')
    echo "[\$timestamp] \$nivel: \$mensaje" >> "$archivo"
}
LOGGER_ARCHIVO
            ;;
        "syslog")
            cat << 'LOGGER_SYSLOG'
log_mensaje() {
    local nivel="$1"
    local mensaje="$2"
    logger -t "mi_script" "$nivel: $mensaje"
}
LOGGER_SYSLOG
            ;;
        "json")
            cat << 'LOGGER_JSON'
log_mensaje() {
    local nivel="$1"
    local mensaje="$2"
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    echo "{\"timestamp\":\"$timestamp\",\"level\":\"$nivel\",\"message\":\"$mensaje\"}"
}
LOGGER_JSON
            ;;
        *)
            echo "Error: Tipo de logger no soportado: $tipo" >&2
            return 1
            ;;
    esac
}

# ================================
# FACTORY DE VALIDADORES
# ================================

crear_validador() {
    local tipo="$1"
    
    case $tipo in
        "email")
            cat << 'VALIDADOR_EMAIL'
validar() {
    local valor="$1"
    local regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
    [[ $valor =~ $regex ]]
}
VALIDADOR_EMAIL
            ;;
        "numero")
            cat << 'VALIDADOR_NUMERO'
validar() {
    local valor="$1"
    [[ $valor =~ ^-?[0-9]+$ ]]
}
VALIDADOR_NUMERO
            ;;
        "telefono")
            cat << 'VALIDADOR_TELEFONO'
validar() {
    local valor="$1"
    local regex="^(\+?[0-9]{1,3})?[0-9]{7,14}$"
    [[ $valor =~ $regex ]]
}
VALIDADOR_TELEFONO
            ;;
        "url")
            cat << 'VALIDADOR_URL'
validar() {
    local valor="$1"
    local regex="^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$"
    [[ $valor =~ $regex ]]
}
VALIDADOR_URL
            ;;
        *)
            echo "Error: Tipo de validador no soportado: $tipo" >&2
            return 1
            ;;
    esac
}

# ================================
# FACTORY DE FORMATEADORES
# ================================

crear_formateador() {
    local tipo="$1"
    
    case $tipo in
        "tabla")
            cat << 'FORMATEADOR_TABLA'
formatear() {
    local -n datos=$1
    local separador="${2:-|}"
    
    # Encontrar anchos máximos
    local max_width=0
    for elemento in "${datos[@]}"; do
        [[ ${#elemento} -gt $max_width ]] && max_width=${#elemento}
    done
    
    # Imprimir tabla
    for elemento in "${datos[@]}"; do
        printf "%-${max_width}s %s\n" "$elemento" "$separador"
    done
}
FORMATEADOR_TABLA
            ;;
        "json")
            cat << 'FORMATEADOR_JSON'
formatear() {
    local -n datos=$1
    echo "["
    local first=true
    for elemento in "${datos[@]}"; do
        [[ $first == false ]] && echo ","
        echo -n "  \"$elemento\""
        first=false
    done
    echo ""
    echo "]"
}
FORMATEADOR_JSON
            ;;
        "csv")
            cat << 'FORMATEADOR_CSV'
formatear() {
    local -n datos=$1
    local separador="${2:-,}"
    local primera_linea=true
    
    for elemento in "${datos[@]}"; do
        [[ $primera_linea == false ]] && echo -n "$separador"
        echo -n "$elemento"
        primera_linea=false
    done
    echo
}
FORMATEADOR_CSV
            ;;
        *)
            echo "Error: Tipo de formateador no soportado: $tipo" >&2
            return 1
            ;;
    esac
}

# ================================
# DEMOSTRACIÓN DEL FACTORY
# ================================

demo_factory() {
    echo -e "${BLUE}📝 Creando loggers dinámicamente:${NC}"
    
    # Crear y usar logger de consola
    eval "$(crear_logger consola)"
    log_mensaje "INFO" "Logger de consola creado"
    
    # Crear y usar logger JSON
    eval "$(crear_logger json)"
    log_mensaje "DEBUG" "Logger JSON activo"
    
    echo
    
    echo -e "${BLUE}✅ Creando validadores dinámicamente:${NC}"
    
    # Probar validador de email
    eval "$(crear_validador email)"
    if validar "usuario@ejemplo.com"; then
        echo "✅ Email válido"
    else
        echo "❌ Email inválido"
    fi
    
    # Probar validador de número
    eval "$(crear_validador numero)"
    if validar "123"; then
        echo "✅ Número válido"
    else
        echo "❌ Número inválido"
    fi
    
    echo
    
    echo -e "${BLUE}🎨 Creando formateadores dinámicamente:${NC}"
    
    # Datos de ejemplo
    datos=("Nombre" "Email" "Edad" "Ciudad")
    
    # Formatear como tabla
    eval "$(crear_formateador tabla)"
    echo "Formato tabla:"
    formatear datos
    
    echo
    
    # Formatear como JSON
    eval "$(crear_formateador json)"
    echo "Formato JSON:"
    formatear datos
}

demo_factory
echo -e "${GREEN}✅ Demostración del patrón Factory completada${NC}"
EOF

chmod +x patron_factory.sh
echo "🎯 EJECUTANDO PATRÓN FACTORY:"
./patron_factory.sh
```

### 🔗 Observer Pattern: Notificaciones Automáticas

**[DEMOSTRACIÓN DEL PATRÓN OBSERVER]**

```bash
cat > patron_observer.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# PATRÓN OBSERVER EN BASH
# ================================

# Colores
readonly BLUE='\033[0;34m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly RED='\033[0;31m'
readonly PURPLE='\033[0;35m'
readonly NC='\033[0m'

echo -e "${PURPLE}👁️ PATRÓN OBSERVER - SISTEMA DE EVENTOS${NC}"
echo "============================================"
echo

# ================================
# SISTEMA DE EVENTOS CENTRALIZADO
# ================================

# Array para almacenar observadores
declare -A observadores

# Función para registrar observador
suscribir() {
    local evento="$1"
    local callback="$2"
    
    # Agregar callback a la lista de observadores del evento
    observadores["$evento"]+="$callback;"
    echo -e "${GREEN}✅ Observador registrado para evento: $evento${NC}"
}

# Función para desuscribir observador
desuscribir() {
    local evento="$1"
    local callback="$2"
    
    # Remover callback de la lista
    observadores["$evento"]="${observadores["$evento"]/$callback;/}"
    echo -e "${YELLOW}⚠️ Observador removido del evento: $evento${NC}"
}

# Función para emitir evento
emitir() {
    local evento="$1"
    shift
    local datos="$*"
    
    echo -e "${BLUE}📡 Emitiendo evento: $evento${NC}"
    
    # Verificar si hay observadores para este evento
    if [[ -n "${observadores[$evento]:-}" ]]; then
        # Separar callbacks y ejecutar cada uno
        IFS=';' read -ra CALLBACKS <<< "${observadores[$evento]}"
        for callback in "${CALLBACKS[@]}"; do
            [[ -n "$callback" ]] && $callback "$evento" "$datos"
        done
    else
        echo -e "${YELLOW}⚠️ No hay observadores para el evento: $evento${NC}"
    fi
}

# ================================
# OBSERVADORES ESPECÍFICOS
# ================================

# Observador para logging
log_observer() {
    local evento="$1"
    local datos="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] LOG: Evento '$evento' - $datos" >> eventos.log
    echo -e "${BLUE}📝 Evento registrado en log${NC}"
}

# Observador para notificaciones por email (simulado)
email_observer() {
    local evento="$1"
    local datos="$2"
    echo -e "${GREEN}📧 Email enviado: Evento '$evento' ocurrió - $datos${NC}"
}

# Observador para estadísticas
stats_observer() {
    local evento="$1"
    local datos="$2"
    
    # Incrementar contador en archivo
    echo "$evento:$(date '+%Y-%m-%d %H:%M:%S'):$datos" >> estadisticas.csv
    echo -e "${PURPLE}📊 Estadística actualizada para: $evento${NC}"
}

# Observador para alertas críticas
alert_observer() {
    local evento="$1"
    local datos="$2"
    
    case $evento in
        "error_critico"|"sistema_caido"|"intrusion")
            echo -e "${RED}🚨 ALERTA CRÍTICA: $evento - $datos${NC}"
            # En un sistema real, aquí se enviarían notificaciones urgentes
            ;;
        *)
            echo -e "${YELLOW}⚠️ Alerta: $evento - $datos${NC}"
            ;;
    esac
}

# ================================
# SISTEMA DE MONITOREO
# ================================

# Función que simula monitoreo del sistema
monitorear_sistema() {
    echo -e "${BLUE}🔍 Iniciando monitoreo del sistema...${NC}"
    
    # Simular diferentes eventos del sistema
    local eventos=(
        "usuario_login:Juan ha iniciado sesión"
        "archivo_modificado:config.ini fue modificado"
        "error_critico:Fallo en la base de datos"
        "usuario_logout:Juan ha cerrado sesión"
        "backup_completado:Backup diario finalizado"
        "sistema_caido:Servidor principal no responde"
    )
    
    for evento_completo in "${eventos[@]}"; do
        IFS=':' read -r tipo descripcion <<< "$evento_completo"
        
        echo
        echo -e "${BLUE}🎯 Detectado: $tipo${NC}"
        emitir "$tipo" "$descripcion"
        sleep 1
    done
}

# ================================
# CONFIGURACIÓN Y DEMO
# ================================

configurar_observadores() {
    echo -e "${BLUE}⚙️ Configurando sistema de observadores...${NC}"
    
    # Suscribir observadores a eventos específicos
    suscribir "usuario_login" "log_observer"
    suscribir "usuario_login" "stats_observer"
    
    suscribir "usuario_logout" "log_observer"
    suscribir "usuario_logout" "stats_observer"
    
    suscribir "archivo_modificado" "log_observer"
    suscribir "archivo_modificado" "email_observer"
    
    suscribir "error_critico" "log_observer"
    suscribir "error_critico" "email_observer"
    suscribir "error_critico" "alert_observer"
    
    suscribir "sistema_caido" "log_observer"
    suscribir "sistema_caido" "email_observer"
    suscribir "sistema_caido" "alert_observer"
    
    suscribir "backup_completado" "log_observer"
    suscribir "backup_completado" "stats_observer"
    
    echo -e "${GREEN}✅ Observadores configurados${NC}"
}

# ================================
# DEMO COMPLETA
# ================================

demo_observer() {
    # Limpiar archivos anteriores
    rm -f eventos.log estadisticas.csv
    
    # Configurar sistema
    configurar_observadores
    
    echo
    echo -e "${PURPLE}🚀 Iniciando demostración del patrón Observer${NC}"
    echo
    
    # Ejecutar monitoreo
    monitorear_sistema
    
    echo
    echo -e "${BLUE}📋 Resultados de la demostración:${NC}"
    
    # Mostrar logs generados
    if [[ -f eventos.log ]]; then
        echo
        echo "📝 Eventos registrados en log:"
        cat eventos.log
    fi
    
    # Mostrar estadísticas
    if [[ -f estadisticas.csv ]]; then
        echo
        echo "📊 Estadísticas recopiladas:"
        cat estadisticas.csv
    fi
    
    # Limpiar archivos temporales
    rm -f eventos.log estadisticas.csv
}

demo_observer
echo
echo -e "${GREEN}✅ Demostración del patrón Observer completada${NC}"
EOF

chmod +x patron_observer.sh
echo ""
echo "🎯 EJECUTANDO PATRÓN OBSERVER:"
./patron_observer.sh
```

### 🔧 Strategy Pattern: Algoritmos Intercambiables

**[DEMOSTRACIÓN DEL PATRÓN STRATEGY]**

```bash
cat > patron_strategy.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# PATRÓN STRATEGY EN BASH
# ================================

# Colores
readonly BLUE='\033[0;34m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'

echo -e "${PURPLE}⚡ PATRÓN STRATEGY - ALGORITMOS INTERCAMBIABLES${NC}"
echo "============================================"
echo

# ================================
# ESTRATEGIAS DE ORDENAMIENTO
# ================================

# Estrategia: Ordenamiento burbuja
estrategia_burbuja() {
    local -n arr=$1
    local n=${#arr[@]}
    local temp
    
    echo -e "${CYAN}🔄 Usando estrategia: Ordenamiento Burbuja${NC}"
    
    for ((i = 0; i < n-1; i++)); do
        for ((j = 0; j < n-i-1; j++)); do
            if ((arr[j] > arr[j+1])); then
                temp=${arr[j]}
                arr[j]=${arr[j+1]}
                arr[j+1]=$temp
            fi
        done
    done
}

# Estrategia: Ordenamiento por selección
estrategia_seleccion() {
    local -n arr=$1
    local n=${#arr[@]}
    local temp min_idx
    
    echo -e "${CYAN}🎯 Usando estrategia: Ordenamiento por Selección${NC}"
    
    for ((i = 0; i < n-1; i++)); do
        min_idx=$i
        for ((j = i+1; j < n; j++)); do
            if ((arr[j] < arr[min_idx])); then
                min_idx=$j
            fi
        done
        
        # Intercambiar
        temp=${arr[min_idx]}
        arr[min_idx]=${arr[i]}
        arr[i]=$temp
    done
}

# Estrategia: Ordenamiento por inserción
estrategia_insercion() {
    local -n arr=$1
    local n=${#arr[@]}
    local key j
    
    echo -e "${CYAN}📥 Usando estrategia: Ordenamiento por Inserción${NC}"
    
    for ((i = 1; i < n; i++)); do
        key=${arr[i]}
        j=$((i-1))
        
        while ((j >= 0 && arr[j] > key)); do
            arr[$((j+1))]=${arr[j]}
            ((j--))
        done
        
        arr[$((j+1))]=$key
    done
}

# ================================
# ESTRATEGIAS DE COMPRESIÓN
# ================================

# Estrategia: Compresión GZIP
estrategia_gzip() {
    local archivo="$1"
    local destino="${2:-${archivo}.gz}"
    
    echo -e "${CYAN}📦 Usando estrategia: Compresión GZIP${NC}"
    
    if command -v gzip &> /dev/null; then
        gzip -c "$archivo" > "$destino"
        echo "✅ Archivo comprimido con GZIP: $destino"
        return 0
    else
        echo "❌ GZIP no disponible"
        return 1
    fi
}

# Estrategia: Compresión ZIP
estrategia_zip() {
    local archivo="$1"
    local destino="${2:-${archivo}.zip}"
    
    echo -e "${CYAN}🗜️ Usando estrategia: Compresión ZIP${NC}"
    
    if command -v zip &> /dev/null; then
        zip -q "$destino" "$archivo"
        echo "✅ Archivo comprimido con ZIP: $destino"
        return 0
    else
        echo "❌ ZIP no disponible"
        return 1
    fi
}

# Estrategia: Compresión TAR.BZ2
estrategia_tar_bz2() {
    local archivo="$1"
    local destino="${2:-${archivo}.tar.bz2}"
    
    echo -e "${CYAN}📁 Usando estrategia: Compresión TAR.BZ2${NC}"
    
    if command -v tar &> /dev/null && command -v bzip2 &> /dev/null; then
        tar -cjf "$destino" "$archivo"
        echo "✅ Archivo comprimido con TAR.BZ2: $destino"
        return 0
    else
        echo "❌ TAR/BZIP2 no disponible"
        return 1
    fi
}

# ================================
# CONTEXTO - SELECTOR DE ESTRATEGIAS
# ================================

# Contexto para ordenamiento
ejecutar_ordenamiento() {
    local estrategia="$1"
    local -n datos=$2
    
    case $estrategia in
        "burbuja")
            estrategia_burbuja datos
            ;;
        "seleccion")
            estrategia_seleccion datos
            ;;
        "insercion")
            estrategia_insercion datos
            ;;
        *)
            echo "❌ Estrategia de ordenamiento no válida: $estrategia"
            return 1
            ;;
    esac
}

# Contexto para compresión
ejecutar_compresion() {
    local estrategia="$1"
    local archivo="$2"
    local destino="$3"
    
    case $estrategia in
        "gzip")
            estrategia_gzip "$archivo" "$destino"
            ;;
        "zip")
            estrategia_zip "$archivo" "$destino"
            ;;
        "tar_bz2")
            estrategia_tar_bz2 "$archivo" "$destino"
            ;;
        *)
            echo "❌ Estrategia de compresión no válida: $estrategia"
            return 1
            ;;
    esac
}

# ================================
# ESTRATEGIAS DE BACKUP
# ================================

# Estrategia: Backup incremental
estrategia_backup_incremental() {
    local origen="$1"
    local destino="$2"
    
    echo -e "${CYAN}📈 Usando estrategia: Backup Incremental${NC}"
    
    # Buscar archivos modificados en las últimas 24 horas
    local archivos_modificados
    readarray -t archivos_modificados < <(find "$origen" -type f -mtime -1 2>/dev/null)
    
    if [[ ${#archivos_modificados[@]} -gt 0 ]]; then
        mkdir -p "$destino"
        for archivo in "${archivos_modificados[@]}"; do
            cp "$archivo" "$destino/"
            echo "  📄 Copiado: $(basename "$archivo")"
        done
        echo "✅ Backup incremental completado: ${#archivos_modificados[@]} archivos"
    else
        echo "ℹ️ No hay archivos modificados para respaldar"
    fi
}

# Estrategia: Backup completo
estrategia_backup_completo() {
    local origen="$1"
    local destino="$2"
    
    echo -e "${CYAN}📋 Usando estrategia: Backup Completo${NC}"
    
    if cp -r "$origen" "$destino" 2>/dev/null; then
        echo "✅ Backup completo realizado de: $origen"
    else
        echo "❌ Error en backup completo"
        return 1
    fi
}

# Estrategia: Backup sincronizado
estrategia_backup_sync() {
    local origen="$1"
    local destino="$2"
    
    echo -e "${CYAN}🔄 Usando estrategia: Backup Sincronizado${NC}"
    
    if command -v rsync &> /dev/null; then
        rsync -av --delete "$origen/" "$destino/" 2>/dev/null
        echo "✅ Sincronización completada con rsync"
    else
        echo "❌ rsync no disponible, usando cp alternativo"
        estrategia_backup_completo "$origen" "$destino"
    fi
}

# ================================
# DEMOSTRACIÓN COMPLETA
# ================================

demo_strategy() {
    echo -e "${BLUE}📊 Demostración de estrategias de ordenamiento:${NC}"
    
    # Datos de prueba
    datos_originales=(64 34 25 12 22 11 90)
    
    # Probar cada estrategia de ordenamiento
    for estrategia in "burbuja" "seleccion" "insercion"; do
        echo
        echo -e "${YELLOW}Probando estrategia: $estrategia${NC}"
        datos=("${datos_originales[@]}")
        echo "Datos originales: ${datos[*]}"
        
        ejecutar_ordenamiento "$estrategia" datos
        echo "Datos ordenados: ${datos[*]}"
    done
    
    echo
    echo -e "${BLUE}📦 Demostración de estrategias de compresión:${NC}"
    
    # Crear archivo de prueba
    echo "Contenido de ejemplo para compresión" > archivo_prueba.txt
    echo "Segunda línea del archivo" >> archivo_prueba.txt
    echo "Tercera línea con más contenido" >> archivo_prueba.txt
    
    # Probar estrategias de compresión disponibles
    for estrategia in "gzip" "zip" "tar_bz2"; do
        echo
        echo -e "${YELLOW}Probando compresión: $estrategia${NC}"
        ejecutar_compresion "$estrategia" "archivo_prueba.txt" "prueba.$estrategia"
    done
    
    echo
    echo -e "${BLUE}💾 Demostración de estrategias de backup:${NC}"
    
    # Crear directorio de prueba
    mkdir -p prueba_origen
    echo "Archivo 1" > prueba_origen/archivo1.txt
    echo "Archivo 2" > prueba_origen/archivo2.txt
    
    # Probar estrategias de backup
    for estrategia in "incremental" "completo" "sync"; do
        echo
        echo -e "${YELLOW}Probando backup: $estrategia${NC}"
        
        case $estrategia in
            "incremental")
                estrategia_backup_incremental "prueba_origen" "backup_incremental"
                ;;
            "completo")
                estrategia_backup_completo "prueba_origen" "backup_completo"
                ;;
            "sync")
                estrategia_backup_sync "prueba_origen" "backup_sync"
                ;;
        esac
    done
    
    # Limpiar archivos de prueba
    rm -f archivo_prueba.txt prueba.* 2>/dev/null
    rm -rf prueba_origen backup_* 2>/dev/null
}

demo_strategy
echo
echo -e "${GREEN}✅ Demostración del patrón Strategy completada${NC}"
EOF

chmod +x patron_strategy.sh
echo ""
echo "🎯 EJECUTANDO PATRÓN STRATEGY:"
./patron_strategy.sh
```

### 💡 Principios SOLID en Bash

**[PANTALLA: Aplicación de principios SOLID]**

> "Los principios SOLID aplicados a bash scripting:
> 
> **S - Single Responsibility**: Cada función tiene una sola razón para cambiar
> **O - Open/Closed**: Abierto para extensión, cerrado para modificación
> **L - Liskov Substitution**: Las implementaciones son intercambiables
> **I - Interface Segregation**: Interfaces pequeñas y específicas
> **D - Dependency Inversion**: Depender de abstracciones, no implementaciones"

---

## 📁 PARTE 4: MANEJO DE ARCHIVOS Y DIRECTORIOS (10 minutos)

### 🎤 Transición

**[PANTALLA: Sistema de archivos como base de datos]**

> "El sistema de archivos es nuestra base de datos universal. Dominar su manipulación es como tener superpoderes en automatización. Vamos a crear herramientas que transforman operaciones tediosas en procesos elegantes y eficientes."

### 🗂️ Operaciones de Archivos Avanzadas

**[DEMOSTRACIÓN DE MANIPULACIÓN DE ARCHIVOS]**

```bash
cat > manejo_archivos_avanzado.sh << 'EOF'
#!/bin/bash
set -euo pipefail

# ================================
# MANEJO AVANZADO DE ARCHIVOS Y DIRECTORIOS
# ================================

# Colores
readonly BLUE='\033[0;34m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly RED='\033[0;31m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'

echo -e "${PURPLE}📁 MANEJO AVANZADO DE ARCHIVOS${NC}"
echo "============================================"
echo

# ================================
# FUNCIONES DE ANÁLISIS DE ARCHIVOS
# ================================

analizar_directorio() {
    local directorio="$1"
    local profundidad="${2:-1}"
    
    echo -e "${BLUE}📊 Analizando directorio: $directorio${NC}"
    
    if [[ ! -d "$directorio" ]]; then
        echo -e "${RED}❌ Error: '$directorio' no es un directorio válido${NC}"
        return 1
    fi
    
    # Contadores
    local total_archivos=0
    local total_directorios=0
    local tamaño_total=0
    local archivos_vacios=0
    local archivos_grandes=0
    
    # Arrays para estadísticas
    declare -A tipos_archivo
    declare -A tamaños_por_tipo
    
    echo "🔍 Escaneando contenido..."
    
    # Recorrer archivos con find
    while IFS= read -r -d '' elemento; do
        if [[ -f "$elemento" ]]; then
            ((total_archivos++))
            
            # Obtener información del archivo
            local tamaño
            tamaño=$(stat -f%z "$elemento" 2>/dev/null || stat -c%s "$elemento")
            tamaño_total=$((tamaño_total + tamaño))
            
            # Clasificar por tamaño
            if ((tamaño == 0)); then
                ((archivos_vacios++))
            elif ((tamaño > 1048576)); then  # > 1MB
                ((archivos_grandes++))
            fi
            
            # Clasificar por extensión
            local extension="${elemento##*.}"
            [[ "$extension" == "$elemento" ]] && extension="sin_extension"
            
            ((tipos_archivo[$extension]++))
            tamaños_por_tipo[$extension]=$((${tamaños_por_tipo[$extension]:-0} + tamaño))
            
        elif [[ -d "$elemento" ]]; then
            ((total_directorios++))
        fi
    done < <(find "$directorio" -maxdepth "$profundidad" -print0 2>/dev/null)
    
    # Mostrar resultados
    echo
    echo -e "${CYAN}📋 RESUMEN DEL ANÁLISIS:${NC}"
    echo "  📁 Directorios: $total_directorios"
    echo "  📄 Archivos: $total_archivos"
    echo "  💾 Tamaño total: $(formatear_bytes $tamaño_total)"
    echo "  📭 Archivos vacíos: $archivos_vacios"
    echo "  📈 Archivos grandes (>1MB): $archivos_grandes"
    
    if [[ ${#tipos_archivo[@]} -gt 0 ]]; then
        echo
        echo -e "${CYAN}📊 DISTRIBUCIÓN POR TIPO:${NC}"
        for tipo in "${!tipos_archivo[@]}"; do
            local cantidad=${tipos_archivo[$tipo]}
            local tamaño_tipo=${tamaños_por_tipo[$tipo]}
            printf "  %-15s: %3d archivos (%s)\n" \
                "$tipo" "$cantidad" "$(formatear_bytes $tamaño_tipo)"
        done
    fi
}

formatear_bytes() {
    local bytes="$1"
    
    if ((bytes < 1024)); then
        echo "${bytes} B"
    elif ((bytes < 1048576)); then
        echo "$((bytes / 1024)) KB"
    elif ((bytes < 1073741824)); then
        echo "$((bytes / 1048576)) MB"
    else
        echo "$((bytes / 1073741824)) GB"
    fi
}

# ================================
# FUNCIONES DE ORGANIZACIÓN
# ================================

organizar_por_extension() {
    local directorio_origen="$1"
    local directorio_destino="${2:-${directorio_origen}_organizado}"
    
    echo -e "${BLUE}🗂️ Organizando archivos por extensión${NC}"
    echo "Origen: $directorio_origen"
    echo "Destino: $directorio_destino"
    
    if [[ ! -d "$directorio_origen" ]]; then
        echo -e "${RED}❌ Directorio origen no existe${NC}"
        return 1
    fi
    
    mkdir -p "$directorio_destino"
    
    # Procesar archivos
    local archivos_movidos=0
    
    find "$directorio_origen" -type f -print0 | while IFS= read -r -d '' archivo; do
        local nombre_archivo
        nombre_archivo=$(basename "$archivo")
        local extension="${nombre_archivo##*.}"
        
        # Si no tiene extensión, usar "otros"
        [[ "$extension" == "$nombre_archivo" ]] && extension="otros"
        
        # Crear directorio para la extensión
        local dir_extension="$directorio_destino/$extension"
        mkdir -p "$dir_extension"
        
        # Mover archivo
        if cp "$archivo" "$dir_extension/"; then
            echo "  📄 $nombre_archivo → $extension/"
            ((archivos_movidos++))
        else
            echo -e "${RED}  ❌ Error moviendo: $nombre_archivo${NC}"
        fi
    done
    
    echo -e "${GREEN}✅ Organización completada: $archivos_movidos archivos procesados${NC}"
}

organizar_por_fecha() {
    local directorio_origen="$1"
    local directorio_destino="${2:-${directorio_origen}_por_fecha}"
    
    echo -e "${BLUE}📅 Organizando archivos por fecha de modificación${NC}"
    
    mkdir -p "$directorio_destino"
    
    find "$directorio_origen" -type f -print0 | while IFS= read -r -d '' archivo; do
        local nombre_archivo
        nombre_archivo=$(basename "$archivo")
        
        # Obtener fecha de modificación
        local fecha_mod
        fecha_mod=$(stat -f%m "$archivo" 2>/dev/null || stat -c%Y "$archivo")
        local año_mes
        año_mes=$(date -r "$fecha_mod" '+%Y-%m' 2>/dev/null || date -d "@$fecha_mod" '+%Y-%m')
        
        # Crear directorio para el año-mes
        local dir_fecha="$directorio_destino/$año_mes"
        mkdir -p "$dir_fecha"
        
        # Copiar archivo
        if cp "$archivo" "$dir_fecha/"; then
            echo "  📄 $nombre_archivo → $año_mes/"
        fi
    done
    
    echo -e "${GREEN}✅ Organización por fecha completada${NC}"
}

# ================================
# FUNCIONES DE LIMPIEZA
# ================================

limpiar_duplicados() {
    local directorio="$1"
    local accion="${2:-listar}"  # listar, eliminar
    
    echo -e "${BLUE}🔍 Buscando archivos duplicados en: $directorio${NC}"
    
    # Array asociativo para almacenar checksums
    declare -A checksums
    declare -a duplicados
    
    # Calcular checksums de todos los archivos
    find "$directorio" -type f -print0 | while IFS= read -r -d '' archivo; do
        local checksum
        checksum=$(md5sum "$archivo" 2>/dev/null | cut -d' ' -f1)
        
        if [[ -n "${checksums[$checksum]:-}" ]]; then
            echo -e "${YELLOW}🔄 Duplicado encontrado:${NC}"
            echo "  Original: ${checksums[$checksum]}"
            echo "  Duplicado: $archivo"
            
            if [[ "$accion" == "eliminar" ]]; then
                echo "  🗑️ Eliminando duplicado..."
                rm "$archivo"
            fi
        else
            checksums[$checksum]="$archivo"
        fi
    done
}

limpiar_archivos_temporales() {
    local directorio="$1"
    local dias="${2:-7}"
    
    echo -e "${BLUE}🧹 Limpiando archivos temporales mayores a $dias días${NC}"
    
    # Patrones de archivos temporales
    local patrones=(
        "*.tmp"
        "*.temp"
        "*~"
        ".DS_Store"
        "Thumbs.db"
        "*.log"
        "*.cache"
    )
    
    local archivos_eliminados=0
    
    for patron in "${patrones[@]}"; do
        while IFS= read -r -d '' archivo; do
            echo "  🗑️ Eliminando: $(basename "$archivo")"
            rm "$archivo"
            ((archivos_eliminados++))
        done < <(find "$directorio" -name "$patron" -type f -mtime +$dias -print0 2>/dev/null)
    done
    
    echo -e "${GREEN}✅ Limpieza completada: $archivos_eliminados archivos eliminados${NC}"
}

# ================================
# FUNCIONES DE BACKUP INTELIGENTE
# ================================

backup_inteligente() {
    local origen="$1"
    local destino="$2"
    local tipo="${3:-incremental}"  # completo, incremental, diferencial
    
    echo -e "${BLUE}💾 Iniciando backup $tipo${NC}"
    echo "Origen: $origen"
    echo "Destino: $destino"
    
    mkdir -p "$destino"
    
    case $tipo in
        "completo")
            echo "📋 Realizando backup completo..."
            if command -v rsync &> /dev/null; then
                rsync -av --progress "$origen/" "$destino/completo_$(date +%Y%m%d_%H%M%S)/"
            else
                cp -r "$origen" "$destino/completo_$(date +%Y%m%d_%H%M%S)"
            fi
            ;;
        "incremental")
            echo "📈 Realizando backup incremental..."
            # Buscar archivos modificados en las últimas 24 horas
            local backup_dir="$destino/incremental_$(date +%Y%m%d_%H%M%S)"
            mkdir -p "$backup_dir"
            
            find "$origen" -type f -mtime -1 -print0 | while IFS= read -r -d '' archivo; do
                local ruta_relativa="${archivo#$origen/}"
                local dir_destino="$backup_dir/$(dirname "$ruta_relativa")"
                mkdir -p "$dir_destino"
                cp "$archivo" "$dir_destino/"
                echo "  📄 $(basename "$archivo")"
            done
            ;;
        "diferencial")
            echo "📊 Realizando backup diferencial..."
            # Implementación simplificada: archivos modificados en la última semana
            local backup_dir="$destino/diferencial_$(date +%Y%m%d_%H%M%S)"
            mkdir -p "$backup_dir"
            
            find "$origen" -type f -mtime -7 -print0 | while IFS= read -r -d '' archivo; do
                local ruta_relativa="${archivo#$origen/}"
                local dir_destino="$backup_dir/$(dirname "$ruta_relativa")"
                mkdir -p "$dir_destino"
                cp "$archivo" "$dir_destino/"
            done
            ;;
    esac
    
    echo -e "${GREEN}✅ Backup $tipo completado${NC}"
}

# ================================
# DEMOSTRACIÓN COMPLETA
# ================================

demo_manejo_archivos() {
    echo -e "${PURPLE}🚀 DEMOSTRACIÓN DE MANEJO AVANZADO DE ARCHIVOS${NC}"
    echo "============================================"
    
    # Crear estructura de prueba
    echo -e "${BLUE}📁 Creando estructura de prueba...${NC}"
    mkdir -p demo_files/{documentos,imagenes,codigo,otros}
    
    # Crear archivos de ejemplo
    echo "Contenido de texto" > demo_files/documentos/documento1.txt
    echo "Otro documento" > demo_files/documentos/documento2.doc
    echo "Código de ejemplo" > demo_files/codigo/script.sh
    echo "Código Python" > demo_files/codigo/programa.py
    echo "Imagen vacía" > demo_files/imagenes/foto.jpg
    echo "Otra imagen" > demo_files/imagenes/imagen.png
    echo "Archivo sin extensión" > demo_files/otros/readme
    
    # Crear algunos duplicados
    cp demo_files/documentos/documento1.txt demo_files/otros/copia.txt
    
    echo
    
    # Demo 1: Análisis de directorio
    echo -e "${YELLOW}1️⃣ ANÁLISIS DE DIRECTORIO:${NC}"
    analizar_directorio "demo_files" 2
    
    echo
    
    # Demo 2: Organización por extensión
    echo -e "${YELLOW}2️⃣ ORGANIZACIÓN POR EXTENSIÓN:${NC}"
    organizar_por_extension "demo_files" "demo_organizados"
    
    echo
    
    # Demo 3: Búsqueda de duplicados
    echo -e "${YELLOW}3️⃣ BÚSQUEDA DE DUPLICADOS:${NC}"
    limpiar_duplicados "demo_files" "listar"
    
    echo
    
    # Demo 4: Backup inteligente
    echo -e "${YELLOW}4️⃣ BACKUP INTELIGENTE:${NC}"
    backup_inteligente "demo_files" "backups_demo" "incremental"
    
    # Limpiar archivos de demo
    echo
    echo -e "${BLUE}🧹 Limpiando archivos de demostración...${NC}"
    rm -rf demo_files demo_organizados backups_demo 2>/dev/null
    
    echo -e "${GREEN}✅ Demostración completada${NC}"
}

# Ejecutar demostración
demo_manejo_archivos
EOF

chmod +x manejo_archivos_avanzado.sh
echo "🎯 EJECUTANDO MANEJO AVANZADO DE ARCHIVOS:"
./manejo_archivos_avanzado.sh
```

### 💡 Mejores Prácticas para Archivos

**[PANTALLA: Checklist de operaciones seguras]**

> "Principios para manipulación segura de archivos:
> 1. **Siempre crear backups** antes de operaciones destructivas
> 2. **Validar permisos** antes de intentar operaciones
> 3. **Usar rutas absolutas** para evitar confusión
> 4. **Implementar dry-run** para operaciones masivas
> 5. **Logging detallado** de todas las operaciones
> 6. **Manejo de errores** robusto con rollback cuando sea posible"

---
