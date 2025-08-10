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
