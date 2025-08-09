# Bootcamp Bash - Módulo 4: Desarrollo Paso a Paso

## Guión para Video de YouTube - Funciones y Arrays

---

## 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bootcamp Bash - Módulo 4: Funciones y Arrays - Organización y Estructuras de Datos"

**Duración Estimada:** 60-75 minutos

**Audiencia:** Estudiantes que dominan variables y control de flujo, listos para organizar código y manejar datos complejos

**Objetivo:** Dominar funciones para organizar código y arrays para manejar estructuras de datos complejas

---

## 🎯 OBJETIVOS DE APRENDIZAJE

Al finalizar este video, los estudiantes podrán:

1. **Crear** funciones modulares y reutilizables
2. **Manejar** parámetros y valores de retorno
3. **Implementar** arrays unidimensionales y asociativos
4. **Organizar** código en bibliotecas de funciones
5. **Desarrollar** sistemas de logging profesionales
6. **Construir** un Gestor Interactivo de Archivos completo

---

## 📝 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y FUNCIONES BÁSICAS (20 minutos)

### PARTE 2: FUNCIONES AVANZADAS Y BIBLIOTECAS (15 minutos)

### PARTE 3: ARRAYS UNIDIMENSIONALES (15 minutos)

### PARTE 4: ARRAYS ASOCIATIVOS (10 minutos)

### PARTE 5: PROYECTO PRÁCTICO - GESTOR DE ARCHIVOS (15 minutos)

---

## 🎬 PARTE 1: INTRODUCCIÓN Y FUNCIONES BÁSICAS (20 minutos)

### 🎤 Guión de Presentación

**[PANTALLA: Logo del Módulo 4 con SVG]**

> "¡Bienvenidos al Módulo 4 del Bootcamp Bash! Hoy vamos a aprender a organizar nuestro código con funciones y manejar datos complejos con arrays. Estas son herramientas fundamentales para crear programas profesionales."

**[TRANSICIÓN: Repaso de la evolución]**

> "Hemos recorrido un camino increíble: comandos básicos, procesamiento de texto, variables y control de flujo. Ahora es momento de escribir código más limpio, modular y eficiente."

### 🧩 El Poder de las Funciones

**[PANTALLA: Diagrama conceptual de modularidad]**

> "Las funciones son como bloques de construcción reutilizables. Nos permiten escribir código una vez y usarlo muchas veces, hacer nuestros scripts más legibles y fáciles de mantener."

**[PANTALLA: Comparación antes/después]**

> "Imagina escribir 500 líneas de código sin funciones vs. el mismo programa organizado en 10 funciones de 50 líneas cada una. ¿Cuál sería más fácil de entender y mantener?"

### 🗺️ Roadmap del Módulo 4

**[PANTALLA: Estructura del módulo]**

> "En este módulo cubriremos:
>
> - Funciones básicas y avanzadas
> - Parámetros y valores de retorno
> - Scope de variables (local vs global)
> - Arrays unidimensionales y asociativos
> - Bibliotecas de funciones reutilizables
> - Proyecto: Gestor Interactivo de Archivos"

### 🔧 Funciones Básicas

**[PANTALLA: Terminal en vivo]**

> "Empezamos con funciones básicas. Son como mini-programas dentro de nuestro programa:"

```bash
# Configurar entorno del módulo 4
cd ~/bootcamp-bash
mkdir -p modulo4/{ejercicios,proyectos,libs,datos}
cd modulo4

# Función básica
saludar() {
    echo "¡Hola desde una función!"
}

# Llamar la función
saludar

# Función con lógica
mostrar_fecha_hora() {
    echo "📅 Fecha: $(date +%Y-%m-%d)"
    echo "🕐 Hora: $(date +%H:%M:%S)"
    echo "👤 Usuario: $USER"
}

mostrar_fecha_hora
```

### 📥 Funciones con Parámetros

**[PANTALLA: Demostración de parámetros]**

> "Las funciones pueden recibir información a través de parámetros:"

```bash
# Función con un parámetro
saludar_usuario() {
    local nombre="$1"
    echo "¡Hola $nombre! Bienvenido al sistema."
}

# Función con múltiples parámetros
sumar() {
    local num1="$1"
    local num2="$2"
    local resultado=$((num1 + num2))
    echo "La suma de $num1 + $num2 = $resultado"
}

# Llamar funciones con parámetros
saludar_usuario "María"
sumar 15 27

# Función con parámetros por defecto
crear_archivo() {
    local nombre="${1:-archivo_default.txt}"
    local contenido="${2:-Contenido por defecto}"

    echo "$contenido" > "$nombre"
    echo "✅ Archivo '$nombre' creado"
}

crear_archivo "mi_archivo.txt" "Este es mi contenido"
crear_archivo  # Usa valores por defecto
```

### 🔄 Valores de Retorno

**[PANTALLA: Return values y códigos de salida]**

> "Las funciones pueden devolver valores de diferentes maneras:"

```bash
# Método 1: Código de salida (0-255)
verificar_archivo() {
    local archivo="$1"

    if [ -f "$archivo" ]; then
        return 0  # Éxito
    else
        return 1  # Error
    fi
}

# Uso del código de salida
if verificar_archivo "datos/test.txt"; then
    echo "El archivo existe"
else
    echo "El archivo no existe"
fi

# Método 2: Echo para devolver texto
obtener_extension() {
    local archivo="$1"
    echo "${archivo##*.}"
}

# Capturar salida de función
archivo="documento.pdf"
extension=$(obtener_extension "$archivo")
echo "La extensión de $archivo es: $extension"

# Método 3: Variable global
calcular_estadisticas() {
    local archivo="$1"

    if [ -f "$archivo" ]; then
        STATS_LINEAS=$(wc -l < "$archivo")
        STATS_PALABRAS=$(wc -w < "$archivo")
        STATS_CARACTERES=$(wc -c < "$archivo")
        return 0
    else
        return 1
    fi
}

# Crear archivo de prueba
echo -e "Línea 1\nLínea 2\nLínea 3" > "datos/prueba.txt"

# Usar función que modifica variables globales
if calcular_estadisticas "datos/prueba.txt"; then
    echo "📊 Estadísticas del archivo:"
    echo "   Líneas: $STATS_LINEAS"
    echo "   Palabras: $STATS_PALABRAS"
    echo "   Caracteres: $STATS_CARACTERES"
fi
```

### 🎯 Scope de Variables

**[PANTALLA: Local vs Global]**

> "El scope determina dónde son visibles nuestras variables:"

```bash
# Variable global
contador_global=0

demo_scope() {
    local variable_local="Solo visible en la función"
    variable_global="Visible en todo el script"

    # Modificar variable global
    ((contador_global++))

    echo "Dentro de la función:"
    echo "  Local: $variable_local"
    echo "  Global: $variable_global"
    echo "  Contador: $contador_global"
}

echo "Antes de llamar la función:"
echo "  Contador global: $contador_global"

demo_scope

echo "Después de llamar la función:"
echo "  Contador global: $contador_global"
echo "  Variable global: $variable_global"
# echo "  Variable local: $variable_local"  # Esto daría error
```

### 🚀 Script de Demostración de Funciones

**[PANTALLA: Creación de script completo]**

> "Creemos un script que demuestre el poder de las funciones organizadas:"

```bash
# Crear script de demostración
cat > ejercicios/demo_funciones.sh << 'EOF'
#!/bin/bash
# Demostración de Funciones - Módulo 4
# Muestra organización de código con funciones

set -euo pipefail

# Variables globales
readonly SCRIPT_NAME="Demo de Funciones"
readonly VERSION="1.0"
LOG_LEVEL="INFO"

# Función de logging
log() {
    local nivel="$1"
    local mensaje="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    case $nivel in
        ERROR) echo "[$timestamp] ❌ ERROR: $mensaje" >&2 ;;
        WARN)  echo "[$timestamp] ⚠️  WARN: $mensaje" ;;
        INFO)  echo "[$timestamp] ℹ️  INFO: $mensaje" ;;
        DEBUG) [ "$LOG_LEVEL" = "DEBUG" ] && echo "[$timestamp] 🐛 DEBUG: $mensaje" ;;
    esac
}

# Función para mostrar banner
mostrar_banner() {
    echo "╔══════════════════════════════════════╗"
    echo "║         $SCRIPT_NAME v$VERSION         ║"
    echo "╚══════════════════════════════════════╝"
}

# Función de utilidad para archivos
procesar_archivo() {
    local archivo="$1"
    local accion="${2:-info}"

    log "DEBUG" "Procesando archivo: $archivo con acción: $accion"

    if [ ! -f "$archivo" ]; then
        log "ERROR" "Archivo no encontrado: $archivo"
        return 1
    fi

    case $accion in
        info)
            local lineas=$(wc -l < "$archivo")
            local palabras=$(wc -w < "$archivo")
            local tamaño=$(du -h "$archivo" | cut -f1)

            echo "📄 Información de: $archivo"
            echo "   Líneas: $lineas"
            echo "   Palabras: $palabras"
            echo "   Tamaño: $tamaño"
            ;;
        backup)
            local backup_name="${archivo}.backup.$(date +%Y%m%d_%H%M%S)"
            cp "$archivo" "$backup_name"
            log "INFO" "Backup creado: $backup_name"
            echo "✅ Backup realizado: $backup_name"
            ;;
        *)
            log "WARN" "Acción desconocida: $accion"
            return 1
            ;;
    esac
}

# Función matemática
calculadora() {
    local operacion="$1"
    local num1="$2"
    local num2="$3"

    # Validar que son números
    if ! [[ "$num1" =~ ^-?[0-9]+\.?[0-9]*$ ]] || ! [[ "$num2" =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
        log "ERROR" "Parámetros no son números válidos: $num1, $num2"
        return 1
    fi

    local resultado
    case $operacion in
        suma)     resultado=$(echo "$num1 + $num2" | bc) ;;
        resta)    resultado=$(echo "$num1 - $num2" | bc) ;;
        mult)     resultado=$(echo "$num1 * $num2" | bc) ;;
        div)
            if [ "$num2" != "0" ]; then
                resultado=$(echo "scale=2; $num1 / $num2" | bc)
            else
                log "ERROR" "División por cero no permitida"
                return 1
            fi
            ;;
        *)
            log "ERROR" "Operación no soportada: $operacion"
            return 1
            ;;
    esac

    echo "$resultado"
    log "INFO" "Calculado: $num1 $operacion $num2 = $resultado"
}

# Función de sistema
info_sistema() {
    local detalle="${1:-basico}"

    case $detalle in
        basico)
            echo "🖥️  Sistema: $(uname -s)"
            echo "👤 Usuario: $USER"
            echo "📅 Fecha: $(date)"
            ;;
        completo)
            echo "🖥️  Sistema completo: $(uname -a)"
            echo "💾 Memoria: $(free -h | awk 'NR==2{printf "%.1f%%", $3*100/$2}')"
            echo "💽 Disco: $(df -h / | awk 'NR==2{print $5}')"
            echo "⚡ Carga: $(uptime | awk -F'load average:' '{print $2}')"
            ;;
    esac
}

# Función principal
main() {
    mostrar_banner
    log "INFO" "Iniciando demostración de funciones"

    # Crear archivo de prueba
    echo -e "Primera línea\nSegunda línea\nTercera línea con más palabras" > "test_funciones.txt"

    # Demostrar funciones
    echo
    echo "🔧 Demostrando funciones:"
    echo "========================"

    # Procesar archivo
    procesar_archivo "test_funciones.txt" "info"
    echo

    # Calculadora
    echo "🧮 Calculadora:"
    echo "   5 + 3 = $(calculadora suma 5 3)"
    echo "   10 - 4 = $(calculadora resta 10 4)"
    echo "   6 * 7 = $(calculadora mult 6 7)"
    echo "   15 / 3 = $(calculadora div 15 3)"
    echo

    # Información del sistema
    echo "💻 Sistema básico:"
    info_sistema basico
    echo

    echo "💻 Sistema completo:"
    info_sistema completo

    # Backup del archivo de prueba
    echo
    procesar_archivo "test_funciones.txt" "backup"

    log "INFO" "Demostración completada exitosamente"
    echo
    echo "✅ ¡Demostración de funciones completada!"
}

# Verificar dependencias
if ! command -v bc &> /dev/null; then
    log "WARN" "bc no está instalado. Algunas funciones matemáticas pueden fallar."
fi

# Ejecutar programa principal
main "$@"

# Limpiar archivos temporales
rm -f test_funciones.txt test_funciones.txt.backup.*
EOF

chmod +x ejercicios/demo_funciones.sh

# Ejecutar demostración
./ejercicios/demo_funciones.sh
```

---

## 📚 PARTE 2: FUNCIONES AVANZADAS Y BIBLIOTECAS (15 minutos)

### 🎤 Transición

**[PANTALLA: Evolución hacia bibliotecas]**

> "Ahora que dominamos funciones básicas, vamos a crear bibliotecas reutilizables. Esto nos permitirá compartir código entre diferentes scripts."

### 📦 Creando Bibliotecas de Funciones

**[PANTALLA: Desarrollo de librería]**

> "Las bibliotecas son archivos que contienen funciones que podemos reutilizar en múltiples scripts:"

```bash
# Crear biblioteca de utilidades
cat > libs/utilidades.sh << 'EOF'
#!/bin/bash
# Biblioteca de Utilidades - Módulo 4
# Funciones reutilizables para proyectos

# Colores para output
readonly COLOR_RED='\033[0;31m'
readonly COLOR_GREEN='\033[0;32m'
readonly COLOR_YELLOW='\033[1;33m'
readonly COLOR_BLUE='\033[0;34m'
readonly COLOR_PURPLE='\033[0;35m'
readonly COLOR_CYAN='\033[0;36m'
readonly COLOR_NC='\033[0m'

# Función para mensajes coloreados
imprimir() {
    local tipo="$1"
    local mensaje="$2"

    case $tipo in
        error)   echo -e "${COLOR_RED}❌ $mensaje${COLOR_NC}" >&2 ;;
        exito)   echo -e "${COLOR_GREEN}✅ $mensaje${COLOR_NC}" ;;
        aviso)   echo -e "${COLOR_YELLOW}⚠️  $mensaje${COLOR_NC}" ;;
        info)    echo -e "${COLOR_BLUE}ℹ️  $mensaje${COLOR_NC}" ;;
        titulo)  echo -e "${COLOR_PURPLE}🎯 $mensaje${COLOR_NC}" ;;
        *)       echo "$mensaje" ;;
    esac
}

# Función para logging con niveles
log_avanzado() {
    local nivel="$1"
    local mensaje="$2"
    local archivo_log="${3:-sistema.log}"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    # Escribir al archivo de log
    echo "[$timestamp] [$nivel] $mensaje" >> "$archivo_log"

    # Mostrar en pantalla según nivel
    case $nivel in
        ERROR) imprimir error "$mensaje" ;;
        WARN)  imprimir aviso "$mensaje" ;;
        INFO)  imprimir info "$mensaje" ;;
    esac
}

# Función para validar entrada
validar_entrada() {
    local valor="$1"
    local tipo="$2"

    case $tipo in
        numero)
            [[ "$valor" =~ ^-?[0-9]+\.?[0-9]*$ ]]
            ;;
        entero)
            [[ "$valor" =~ ^-?[0-9]+$ ]]
            ;;
        email)
            [[ "$valor" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]
            ;;
        archivo)
            [ -f "$valor" ]
            ;;
        directorio)
            [ -d "$valor" ]
            ;;
        no_vacio)
            [ -n "$valor" ]
            ;;
        *)
            false
            ;;
    esac
}

# Función para mostrar progreso
mostrar_progreso() {
    local actual="$1"
    local total="$2"
    local ancho="${3:-50}"
    local mensaje="${4:-Procesando}"

    local porcentaje=$((actual * 100 / total))
    local completado=$((actual * ancho / total))

    printf "\r%s [" "$mensaje"
    for ((i=0; i<completado; i++)); do printf "="; done
    for ((i=completado; i<ancho; i++)); do printf " "; done
    printf "] %d%%" $porcentaje

    if [ $actual -eq $total ]; then
        echo
    fi
}

# Función para manejar archivos
gestionar_archivo() {
    local accion="$1"
    local archivo="$2"
    local destino="${3:-}"

    case $accion in
        existe)
            [ -f "$archivo" ]
            ;;
        crear)
            touch "$archivo" && imprimir exito "Archivo creado: $archivo"
            ;;
        copiar)
            if [ -n "$destino" ]; then
                cp "$archivo" "$destino" && imprimir exito "Archivo copiado: $archivo -> $destino"
            else
                imprimir error "Destino no especificado para copiar"
                return 1
            fi
            ;;
        mover)
            if [ -n "$destino" ]; then
                mv "$archivo" "$destino" && imprimir exito "Archivo movido: $archivo -> $destino"
            else
                imprimir error "Destino no especificado para mover"
                return 1
            fi
            ;;
        eliminar)
            rm -f "$archivo" && imprimir exito "Archivo eliminado: $archivo"
            ;;
        info)
            if [ -f "$archivo" ]; then
                echo "📄 Información de: $archivo"
                echo "   Tamaño: $(du -h "$archivo" | cut -f1)"
                echo "   Líneas: $(wc -l < "$archivo")"
                echo "   Modificado: $(date -r "$archivo" '+%Y-%m-%d %H:%M:%S')"
            else
                imprimir error "Archivo no encontrado: $archivo"
                return 1
            fi
            ;;
        *)
            imprimir error "Acción no soportada: $accion"
            return 1
            ;;
    esac
}

# Función para operaciones matemáticas
calc() {
    local expresion="$1"

    # Usar bc si está disponible, sino usar aritmética de bash
    if command -v bc &> /dev/null; then
        echo "$expresion" | bc -l
    else
        echo $(($expresion))
    fi
}

# Función para formatear tiempo
formatear_tiempo() {
    local segundos="$1"
    local dias=$((segundos / 86400))
    local horas=$(((segundos % 86400) / 3600))
    local minutos=$(((segundos % 3600) / 60))
    local segs=$((segundos % 60))

    if [ $dias -gt 0 ]; then
        echo "${dias}d ${horas}h ${minutos}m ${segs}s"
    elif [ $horas -gt 0 ]; then
        echo "${horas}h ${minutos}m ${segs}s"
    elif [ $minutos -gt 0 ]; then
        echo "${minutos}m ${segs}s"
    else
        echo "${segs}s"
    fi
}

# Función para verificar dependencias
verificar_dependencias() {
    local dependencias=("$@")
    local faltantes=()

    for cmd in "${dependencias[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            faltantes+=("$cmd")
        fi
    done

    if [ ${#faltantes[@]} -gt 0 ]; then
        imprimir error "Dependencias faltantes: ${faltantes[*]}"
        return 1
    else
        imprimir exito "Todas las dependencias están disponibles"
        return 0
    fi
}
EOF

echo "📚 Biblioteca de utilidades creada"
```

### 🔗 Usando Bibliotecas

**[PANTALLA: Importar y usar bibliotecas]**

> "Ahora aprendamos a usar nuestras bibliotecas en otros scripts:"

```bash
# Crear script que usa la biblioteca
cat > ejercicios/demo_biblioteca.sh << 'EOF'
#!/bin/bash
# Demostración de uso de biblioteca

set -euo pipefail

# Importar biblioteca
source "$(dirname "$0")/../libs/utilidades.sh"

# Función principal
main() {
    imprimir titulo "Demostración de Biblioteca de Utilidades"
    echo

    # Verificar dependencias
    verificar_dependencias "date" "wc" "du"
    echo

    # Crear archivo de prueba
    echo "Contenido de prueba para demostrar la biblioteca" > "archivo_prueba.txt"

    # Gestionar archivos
    imprimir info "Gestionando archivos..."
    gestionar_archivo info "archivo_prueba.txt"
    echo

    # Validar diferentes tipos de entrada
    imprimir info "Validando entradas..."

    if validar_entrada "25" "numero"; then
        imprimir exito "25 es un número válido"
    fi

    if validar_entrada "test@example.com" "email"; then
        imprimir exito "Email válido"
    fi

    if ! validar_entrada "no-es-numero" "numero"; then
        imprimir aviso "Texto no es un número"
    fi
    echo

    # Operaciones matemáticas
    imprimir info "Calculando..."
    resultado=$(calc "15 + 27 * 2")
    echo "15 + 27 * 2 = $resultado"
    echo

    # Formatear tiempo
    imprimir info "Formateando tiempo..."
    echo "3661 segundos = $(formatear_tiempo 3661)"
    echo "90061 segundos = $(formatear_tiempo 90061)"
    echo

    # Progreso simulado
    imprimir info "Simulando progreso..."
    for i in {1..10}; do
        mostrar_progreso $i 10 30 "Procesando"
        sleep 0.2
    done
    echo

    # Logging
    log_avanzado "INFO" "Demostración completada exitosamente"

    # Limpiar
    gestionar_archivo eliminar "archivo_prueba.txt"

    imprimir exito "¡Demostración de biblioteca completada!"
}

main "$@"
EOF

chmod +x ejercicios/demo_biblioteca.sh

# Ejecutar demostración
./ejercicios/demo_biblioteca.sh
```

---

## 📊 PARTE 3: ARRAYS UNIDIMENSIONALES (15 minutos)

### 🎤 Transición

**[PANTALLA: Concepto de arrays]**

> "Los arrays nos permiten almacenar múltiples valores en una sola variable. Son fundamentales para manejar listas de datos, procesar múltiples elementos y crear estructuras más complejas."

### 📝 Arrays Básicos

**[PANTALLA: Creación y manipulación básica]**

> "Empezamos con arrays unidimensionales - listas simples de elementos:"

```bash
# Declarar arrays
frutas=("manzana" "banana" "naranja" "uva" "pera")
numeros=(1 2 3 4 5 10 20 30)
mixto=("texto" 42 "otro texto" 3.14)

# Acceder a elementos
echo "Primera fruta: ${frutas[0]}"
echo "Tercera fruta: ${frutas[2]}"
echo "Último número: ${numeros[-1]}"  # -1 es el último elemento

# Mostrar todos los elementos
echo "Todas las frutas: ${frutas[@]}"
echo "Todos los números: ${numeros[*]}"

# Longitud del array
echo "Número de frutas: ${#frutas[@]}"
echo "Número de números: ${#numeros[@]}"

# Índices del array
echo "Índices de frutas: ${!frutas[@]}"
```

### 🔧 Manipulación de Arrays

**[PANTALLA: Operaciones avanzadas]**

> "Los arrays en Bash son muy flexibles y permiten muchas operaciones:"

```bash
# Agregar elementos
frutas+=("kiwi")  # Agregar al final
frutas[10]="mango"  # Agregar en posición específica

echo "Frutas después de agregar: ${frutas[@]}"
echo "Índices: ${!frutas[@]}"

# Modificar elementos
frutas[1]="plátano"  # Cambiar "banana" por "plátano"
echo "Frutas modificadas: ${frutas[@]}"

# Eliminar elementos
unset frutas[2]  # Eliminar "naranja"
echo "Frutas después de eliminar: ${frutas[@]}"
echo "Índices después de eliminar: ${!frutas[@]}"

# Slicing (subcadenas de arrays)
numeros=(1 2 3 4 5 6 7 8 9 10)
echo "Elementos del 2 al 5: ${numeros[@]:2:4}"
echo "Desde el elemento 5: ${numeros[@]:5}"
echo "Últimos 3 elementos: ${numeros[@]: -3}"
```

### 🔄 Iteración sobre Arrays

**[PANTALLA: Bucles con arrays]**

> "Los arrays brillan cuando los combinamos con bucles:"

```bash
# Crear array de archivos
archivos=("documento.txt" "imagen.jpg" "script.sh" "datos.csv")

# Método 1: Iterar sobre valores
echo "🔄 Iterando sobre valores:"
for archivo in "${archivos[@]}"; do
    echo "Procesando: $archivo"
    # Simular procesamiento
    case "${archivo##*.}" in
        txt) echo "  → Es un documento de texto" ;;
        jpg) echo "  → Es una imagen" ;;
        sh)  echo "  → Es un script de Bash" ;;
        csv) echo "  → Es un archivo de datos" ;;
        *)   echo "  → Tipo desconocido" ;;
    esac
done

echo

# Método 2: Iterar con índices
echo "📊 Iterando con índices:"
for i in "${!archivos[@]}"; do
    echo "Índice $i: ${archivos[i]}"
done

echo

# Método 3: Bucle estilo C
echo "🎯 Bucle estilo C:"
for ((i=0; i<${#archivos[@]}; i++)); do
    echo "Posición $i: ${archivos[i]}"
done
```

### 🧮 Operaciones Avanzadas con Arrays

**[PANTALLA: Casos prácticos]**

> "Veamos operaciones más sofisticadas que podemos hacer con arrays:"

```bash
# Crear script de demostración avanzada
cat > ejercicios/demo_arrays.sh << 'EOF'
#!/bin/bash
# Demostración Avanzada de Arrays - Módulo 4

set -euo pipefail

# Importar utilidades
source "$(dirname "$0")/../libs/utilidades.sh"

main() {
    imprimir titulo "Demostración Avanzada de Arrays"
    echo

    # 1. Array de estudiantes y calificaciones
    imprimir info "1. Gestión de Calificaciones"
    echo "----------------------------"

    estudiantes=("Ana" "Carlos" "María" "Pedro" "Lucía")
    calificaciones=(85 92 78 95 88)

    echo "📚 Lista de estudiantes y calificaciones:"
    for i in "${!estudiantes[@]}"; do
        echo "   ${estudiantes[i]}: ${calificaciones[i]} puntos"
    done

    # Calcular promedio
    suma=0
    for nota in "${calificaciones[@]}"; do
        suma=$((suma + nota))
    done
    promedio=$((suma / ${#calificaciones[@]}))
    echo "📊 Promedio de la clase: $promedio puntos"
    echo

    # 2. Filtrado y búsqueda
    imprimir info "2. Filtrado y Búsqueda"
    echo "---------------------"

    # Encontrar estudiantes con calificación > 90
    echo "🏆 Estudiantes destacados (>90 puntos):"
    for i in "${!calificaciones[@]}"; do
        if [ "${calificaciones[i]}" -gt 90 ]; then
            echo "   ${estudiantes[i]}: ${calificaciones[i]} puntos"
        fi
    done
    echo

    # 3. Ordenamiento básico (bubble sort)
    imprimir info "3. Ordenamiento de Arrays"
    echo "------------------------"

    # Copiar arrays para ordenar
    estudiantes_copia=("${estudiantes[@]}")
    calificaciones_copia=("${calificaciones[@]}")

    # Bubble sort por calificaciones (descendente)
    n=${#calificaciones_copia[@]}
    for ((i=0; i<n-1; i++)); do
        for ((j=0; j<n-i-1; j++)); do
            if [ "${calificaciones_copia[j]}" -lt "${calificaciones_copia[j+1]}" ]; then
                # Intercambiar calificaciones
                temp="${calificaciones_copia[j]}"
                calificaciones_copia[j]="${calificaciones_copia[j+1]}"
                calificaciones_copia[j+1]="$temp"

                # Intercambiar nombres correspondientes
                temp="${estudiantes_copia[j]}"
                estudiantes_copia[j]="${estudiantes_copia[j+1]}"
                estudiantes_copia[j+1]="$temp"
            fi
        done
    done

    echo "📈 Ranking de estudiantes (mayor a menor):"
    for i in "${!estudiantes_copia[@]}"; do
        echo "   $((i+1)). ${estudiantes_copia[i]}: ${calificaciones_copia[i]} puntos"
    done
    echo

    # 4. Procesamiento de archivos
    imprimir info "4. Procesamiento de Archivos por Lotes"
    echo "------------------------------------"

    # Crear archivos de prueba
    mkdir -p temp_arrays
    test_files=("reporte1.txt" "datos2.csv" "imagen3.jpg" "script4.sh")

    for archivo in "${test_files[@]}"; do
        echo "Contenido de ejemplo para $archivo" > "temp_arrays/$archivo"
    done

    # Procesar por tipo
    declare -A contadores
    contadores[txt]=0
    contadores[csv]=0
    contadores[jpg]=0
    contadores[sh]=0
    contadores[otros]=0

    echo "🗂️  Procesando archivos..."
    for archivo in temp_arrays/*; do
        nombre=$(basename "$archivo")
        extension="${nombre##*.}"

        case $extension in
            txt|csv|jpg|sh)
                ((contadores[$extension]++))
                ;;
            *)
                ((contadores[otros]++))
                ;;
        esac

        echo "   Procesado: $nombre (.$extension)"
    done

    echo
    echo "📊 Resumen por tipo:"
    for tipo in txt csv jpg sh otros; do
        echo "   .$tipo: ${contadores[$tipo]} archivo(s)"
    done

    # Limpiar archivos temporales
    rm -rf temp_arrays
    echo

    # 5. Array dinámico
    imprimir info "5. Array Dinámico Interactivo"
    echo "----------------------------"

    tareas=()
    echo "✅ Sistema de tareas (escribe 'fin' para terminar):"

    while true; do
        read -p "Agregar tarea: " tarea
        if [ "$tarea" = "fin" ]; then
            break
        fi
        tareas+=("$tarea")
        echo "   Tareas actuales: ${#tareas[@]}"
    done

    if [ ${#tareas[@]} -gt 0 ]; then
        echo
        echo "📋 Lista de tareas:"
        for i in "${!tareas[@]}"; do
            echo "   $((i+1)). ${tareas[i]}"
        done
    else
        echo "   No se agregaron tareas"
    fi

    echo
    imprimir exito "¡Demostración de arrays completada!"
}

main "$@"
EOF

chmod +x ejercicios/demo_arrays.sh

echo "📊 Script de demostración de arrays creado"
echo "Ejecuta: ./ejercicios/demo_arrays.sh"
```

### 🎯 Patrones Comunes con Arrays

**[PANTALLA: Casos de uso frecuentes]**

> "Estos son patrones que usarás constantemente al trabajar con arrays:"

```bash
# Patrón 1: Procesar argumentos del script
procesar_argumentos() {
    local argumentos=("$@")

    echo "📋 Argumentos recibidos:"
    for i in "${!argumentos[@]}"; do
        echo "   Arg $((i+1)): ${argumentos[i]}"
    done
}

# Patrón 2: Leer archivo a array
leer_archivo_a_array() {
    local archivo="$1"
    local lineas=()

    while IFS= read -r linea; do
        lineas+=("$linea")
    done < "$archivo"

    echo "Líneas leídas: ${#lineas[@]}"
    printf '%s\n' "${lineas[@]}"
}

# Patrón 3: Filtrar array
filtrar_array() {
    local -n array_ref=$1  # Referencia al array
    local patron="$2"
    local filtrados=()

    for elemento in "${array_ref[@]}"; do
        if [[ "$elemento" =~ $patron ]]; then
            filtrados+=("$elemento")
        fi
    done

    printf '%s\n' "${filtrados[@]}"
}

# Patrón 4: Convertir string a array
string_a_array() {
    local string="$1"
    local delimitador="${2:-,}"
    local resultado

    IFS="$delimitador" read -ra resultado <<< "$string"
    printf '%s\n' "${resultado[@]}"
}

# Demostraciones
echo "🎯 Patrones comunes con arrays:"
echo

# Demo argumentos
procesar_argumentos "arg1" "arg2" "arg3"
echo

# Demo string a array
echo "📝 Convertir CSV a array:"
csv="manzana,banana,naranja,uva"
echo "String: $csv"
echo "Array:"
string_a_array "$csv" ","
```

---

## 🗂️ PARTE 4: ARRAYS ASOCIATIVOS (10 minutos)

### 🎤 Transición a Arrays Asociativos

**[PANTALLA: Concepto de key-value pairs]**

> "Los arrays asociativos usan claves en lugar de índices numéricos. Son perfectos para crear diccionarios, configuraciones y estructuras de datos complejas."

### 🔑 Arrays Asociativos Básicos

**[PANTALLA: Declaración y uso]**

> "Los arrays asociativos se declaran con 'declare -A' y usan claves de texto:"

```bash
# Declarar array asociativo
declare -A usuario
usuario[nombre]="María García"
usuario[edad]="28"
usuario[email]="maria@empresa.com"
usuario[departamento]="Desarrollo"

# Acceder a valores
echo "Nombre: ${usuario[nombre]}"
echo "Email: ${usuario[email]}"

# Mostrar todas las claves
echo "Claves disponibles: ${!usuario[@]}"

# Mostrar todos los valores
echo "Todos los valores: ${usuario[@]}"

# Verificar si existe una clave
if [[ -v usuario[telefono] ]]; then
    echo "Teléfono: ${usuario[telefono]}"
else
    echo "Teléfono no disponible"
fi
```

### 🏗️ Casos Prácticos con Arrays Asociativos

**[PANTALLA: Ejemplos del mundo real]**

> "Los arrays asociativos son perfectos para configuraciones, conteos y mapeo de datos:"

```bash
# Ejemplo 1: Contador de extensiones
declare -A extensiones
archivos=("doc1.txt" "img1.jpg" "script1.sh" "doc2.txt" "img2.png" "data.csv")

echo "📊 Contando extensiones de archivos:"
for archivo in "${archivos[@]}"; do
    ext="${archivo##*.}"
    ((extensiones[$ext]++))
done

# Mostrar resultados
for ext in "${!extensiones[@]}"; do
    echo "   .$ext: ${extensiones[$ext]} archivo(s)"
done

echo

# Ejemplo 2: Base de datos simple
declare -A empleados
empleados["juan@empresa.com"]="Juan Pérez,Desarrollador,2500"
empleados["maria@empresa.com"]="María García,Diseñadora,2200"
empleados["pedro@empresa.com"]="Pedro López,DevOps,2800"

echo "👥 Base de datos de empleados:"
for email in "${!empleados[@]}"; do
    IFS=',' read -r nombre puesto salario <<< "${empleados[$email]}"
    echo "   📧 $email"
    echo "      Nombre: $nombre"
    echo "      Puesto: $puesto"
    echo "      Salario: $salario €"
    echo
done
```

---

## 🎯 PARTE 5: PROYECTO PRÁCTICO - GESTOR DE ARCHIVOS (15 minutos)

### 🎤 Transición al Proyecto Final

**[PANTALLA: Logo del proyecto]**

> "¡Es hora de integrar todo lo aprendido! Crearemos un Gestor Interactivo de Archivos que combine funciones, arrays y todas las técnicas del módulo."

### 🏗️ Desarrollo del Gestor Completo

**[PANTALLA: Construcción paso a paso]**

```bash
# Crear el gestor completo
cat > proyectos/gestor_archivos_interactivo.sh << 'EOF'
#!/bin/bash
# Gestor Interactivo de Archivos - Proyecto Módulo 4
# Integra funciones, arrays y estructuras de datos avanzadas

set -euo pipefail

# Importar biblioteca
source "$(dirname "$0")/../libs/utilidades.sh"

# Variables globales
readonly SCRIPT_NAME="Gestor Interactivo de Archivos"
readonly VERSION="2.0"
readonly CONFIG_FILE="config/gestor.conf"

# Arrays globales
declare -a historial_operaciones
declare -A estadisticas_archivos
declare -A configuracion

# Configuración por defecto
configuracion[mostrar_ocultos]="false"
configuracion[confirmaciones]="true"
configuracion[log_operaciones]="true"
configuracion[backup_automatico]="false"

# Función de inicialización
inicializar_sistema() {
    # Crear directorios necesarios
    mkdir -p config logs backups temp

    # Cargar configuración si existe
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    fi

    # Inicializar estadísticas
    estadisticas_archivos[operaciones_totales]=0
    estadisticas_archivos[archivos_procesados]=0
    estadisticas_archivos[errores]=0

    log_avanzado "INFO" "Sistema inicializado" "logs/gestor.log"
}

# Función para guardar configuración
guardar_configuracion() {
    cat > "$CONFIG_FILE" << EOL
# Configuración del Gestor de Archivos
# Generado automáticamente

declare -A configuracion
EOL

    for clave in "${!configuracion[@]}"; do
        echo "configuracion[$clave]=\"${configuracion[$clave]}\"" >> "$CONFIG_FILE"
    done

    imprimir exito "Configuración guardada"
}

# Función principal del menú
menu_principal() {
    while true; do
        clear
        mostrar_header
        mostrar_menu_opciones

        read -p "Selecciona una opción [1-8]: " opcion

        case $opcion in
            1) explorar_directorio ;;
            2) gestionar_archivos ;;
            3) buscar_archivos ;;
            4) estadisticas_sistema ;;
            5) configurar_sistema ;;
            6) ver_historial ;;
            7) herramientas_avanzadas ;;
            8) salir_gestor ;;
            *)
                imprimir error "Opción inválida"
                sleep 2
                ;;
        esac

        ((estadisticas_archivos[operaciones_totales]++))
    done
}

# Función para mostrar header
mostrar_header() {
    imprimir titulo "$SCRIPT_NAME v$VERSION"
    echo
    echo "📊 Estadísticas: ${estadisticas_archivos[operaciones_totales]} operaciones | ${estadisticas_archivos[archivos_procesados]} archivos procesados"
    echo "📍 Directorio actual: $(pwd)"
    echo "⚙️  Configuración: Ocultos=${configuracion[mostrar_ocultos]} | Confirmaciones=${configuracion[confirmaciones]}"
    echo
}

# Función para mostrar menú
mostrar_menu_opciones() {
    echo "🏠 MENÚ PRINCIPAL"
    echo "=================="
    echo "1) 📁 Explorar Directorio"
    echo "2) 🔧 Gestionar Archivos"
    echo "3) 🔍 Buscar Archivos"
    echo "4) 📊 Estadísticas del Sistema"
    echo "5) ⚙️  Configuración"
    echo "6) 📜 Ver Historial"
    echo "7) 🛠️  Herramientas Avanzadas"
    echo "8) ❌ Salir"
    echo
}

# Función para explorar directorio
explorar_directorio() {
    clear
    imprimir titulo "EXPLORADOR DE DIRECTORIO"
    echo

    read -p "Directorio a explorar (Enter para actual): " directorio
    directorio=${directorio:-"."}

    if [ ! -d "$directorio" ]; then
        imprimir error "Directorio no existe: $directorio"
        sleep 2
        return
    fi

    cd "$directorio" || return

    # Construir comando ls según configuración
    local cmd_ls="ls -lh"
    if [ "${configuracion[mostrar_ocultos]}" = "true" ]; then
        cmd_ls="$cmd_ls -a"
    fi

    echo "📂 Contenido de: $(pwd)"
    echo "================================"

    # Crear arrays para clasificar contenido
    local -a directorios archivos_regulares enlaces otros

    while IFS= read -r -d '' item; do
        local nombre=$(basename "$item")

        if [ -d "$item" ]; then
            directorios+=("$nombre")
        elif [ -L "$item" ]; then
            enlaces+=("$nombre")
        elif [ -f "$item" ]; then
            archivos_regulares+=("$nombre")
        else
            otros+=("$nombre")
        fi
    done < <(find . -maxdepth 1 -print0)

    # Mostrar clasificado
    if [ ${#directorios[@]} -gt 0 ]; then
        echo "📁 Directorios (${#directorios[@]}):"
        for dir in "${directorios[@]}"; do
            echo "   📁 $dir"
        done
        echo
    fi

    if [ ${#archivos_regulares[@]} -gt 0 ]; then
        echo "📄 Archivos (${#archivos_regulares[@]}):"
        for archivo in "${archivos_regulares[@]}"; do
            local tamaño=$(du -h "$archivo" 2>/dev/null | cut -f1)
            local ext="${archivo##*.}"
            echo "   📄 $archivo ($tamaño) .$ext"
        done
        echo
    fi

    if [ ${#enlaces[@]} -gt 0 ]; then
        echo "🔗 Enlaces (${#enlaces[@]}):"
        printf '   🔗 %s\n' "${enlaces[@]}"
        echo
    fi

    # Actualizar estadísticas
    local total_items=$((${#directorios[@]} + ${#archivos_regulares[@]} + ${#enlaces[@]} + ${#otros[@]}))
    echo "📊 Total de elementos: $total_items"

    historial_operaciones+=("Exploró: $(pwd) - $total_items elementos")

    read -p "Presiona Enter para continuar..."
}

# Función para gestionar archivos
gestionar_archivos() {
    while true; do
        clear
        imprimir titulo "GESTIÓN DE ARCHIVOS"
        echo
        echo "1) 📄 Crear archivo"
        echo "2) 📁 Crear directorio"
        echo "3) 📋 Copiar elemento"
        echo "4) ✂️  Mover/Renombrar"
        echo "5) 🗑️  Eliminar elemento"
        echo "6) ℹ️  Información detallada"
        echo "7) ↩️  Volver al menú principal"
        echo

        read -p "Selecciona una opción [1-7]: " opcion

        case $opcion in
            1) crear_archivo ;;
            2) crear_directorio ;;
            3) copiar_elemento ;;
            4) mover_elemento ;;
            5) eliminar_elemento ;;
            6) info_detallada ;;
            7) break ;;
            *)
                imprimir error "Opción inválida"
                sleep 2
                ;;
        esac
    done
}

# Funciones de gestión específicas
crear_archivo() {
    read -p "Nombre del archivo: " nombre
    read -p "Contenido inicial (opcional): " contenido

    if [ -n "$contenido" ]; then
        echo "$contenido" > "$nombre"
    else
        touch "$nombre"
    fi

    if [ $? -eq 0 ]; then
        imprimir exito "Archivo '$nombre' creado"
        historial_operaciones+=("Creó archivo: $nombre")
        ((estadisticas_archivos[archivos_procesados]++))
    else
        imprimir error "Error al crear archivo"
        ((estadisticas_archivos[errores]++))
    fi

    sleep 2
}

crear_directorio() {
    read -p "Nombre del directorio: " nombre

    if mkdir -p "$nombre" 2>/dev/null; then
        imprimir exito "Directorio '$nombre' creado"
        historial_operaciones+=("Creó directorio: $nombre")
    else
        imprimir error "Error al crear directorio"
        ((estadisticas_archivos[errores]++))
    fi

    sleep 2
}

# Función para ver historial
ver_historial() {
    clear
    imprimir titulo "HISTORIAL DE OPERACIONES"
    echo

    if [ ${#historial_operaciones[@]} -eq 0 ]; then
        imprimir info "No hay operaciones en el historial"
    else
        echo "📜 Últimas operaciones:"
        echo "======================"

        # Mostrar últimas 20 operaciones
        local inicio=$((${#historial_operaciones[@]} - 20))
        [ $inicio -lt 0 ] && inicio=0

        for ((i=inicio; i<${#historial_operaciones[@]}; i++)); do
            echo "$((i+1)). ${historial_operaciones[i]}"
        done
    fi

    echo
    read -p "Presiona Enter para continuar..."
}

# Función de configuración
configurar_sistema() {
    while true; do
        clear
        imprimir titulo "CONFIGURACIÓN DEL SISTEMA"
        echo
        echo "Configuración actual:"
        for clave in "${!configuracion[@]}"; do
            echo "   $clave: ${configuracion[$clave]}"
        done
        echo
        echo "1) Cambiar mostrar archivos ocultos"
        echo "2) Cambiar confirmaciones"
        echo "3) Cambiar logging"
        echo "4) Guardar configuración"
        echo "5) Volver al menú principal"
        echo

        read -p "Selecciona una opción [1-5]: " opcion

        case $opcion in
            1)
                if [ "${configuracion[mostrar_ocultos]}" = "true" ]; then
                    configuracion[mostrar_ocultos]="false"
                else
                    configuracion[mostrar_ocultos]="true"
                fi
                ;;
            2)
                if [ "${configuracion[confirmaciones]}" = "true" ]; then
                    configuracion[confirmaciones]="false"
                else
                    configuracion[confirmaciones]="true"
                fi
                ;;
            3)
                if [ "${configuracion[log_operaciones]}" = "true" ]; then
                    configuracion[log_operaciones]="false"
                else
                    configuracion[log_operaciones]="true"
                fi
                ;;
            4) guardar_configuracion ;;
            5) break ;;
            *) imprimir error "Opción inválida" ;;
        esac
    done
}

# Funciones simplificadas para el demo
copiar_elemento() { imprimir info "Función de copiar en desarrollo"; sleep 2; }
mover_elemento() { imprimir info "Función de mover en desarrollo"; sleep 2; }
eliminar_elemento() { imprimir info "Función de eliminar en desarrollo"; sleep 2; }
info_detallada() { imprimir info "Información detallada en desarrollo"; sleep 2; }
buscar_archivos() { imprimir info "Búsqueda avanzada en desarrollo"; sleep 2; }
estadisticas_sistema() { imprimir info "Estadísticas del sistema en desarrollo"; sleep 2; }
herramientas_avanzadas() { imprimir info "Herramientas avanzadas en desarrollo"; sleep 2; }

# Función de salida
salir_gestor() {
    clear
    imprimir titulo "RESUMEN DE LA SESIÓN"
    echo

    echo "📊 Estadísticas finales:"
    echo "========================"
    for clave in "${!estadisticas_archivos[@]}"; do
        echo "   $clave: ${estadisticas_archivos[$clave]}"
    done

    echo
    echo "📜 Última operación: ${historial_operaciones[-1]:-'Ninguna'}"

    if [ "${configuracion[confirmaciones]}" = "true" ]; then
        read -p "¿Estás seguro de que quieres salir? (s/n): " confirmacion
        if [[ ! "$confirmacion" =~ ^[sS]$ ]]; then
            return
        fi
    fi

    log_avanzado "INFO" "Gestor cerrado. Operaciones: ${estadisticas_archivos[operaciones_totales]}" "logs/gestor.log"
    imprimir exito "¡Gracias por usar $SCRIPT_NAME!"
    echo
    exit 0
}

# Función principal
main() {
    inicializar_sistema

    # Mostrar bienvenida
    clear
    imprimir titulo "¡BIENVENIDO AL $SCRIPT_NAME!"
    echo
    imprimir info "Sistema inicializado correctamente"
    imprimir info "Presiona cualquier tecla para continuar..."
    read -n 1

    menu_principal
}

# Manejo de señales
trap 'echo; imprimir aviso "Programa interrumpido"; exit 1' INT TERM

# Ejecutar programa principal
main "$@"
EOF

chmod +x proyectos/gestor_archivos_interactivo.sh
```

### 🎓 Resumen de Logros del Módulo 4

**[PANTALLA: Checklist completo]**

> "¡Increíble progreso! Has dominado la organización de código y estructuras de datos avanzadas:"

- ✅ **Funciones modulares** - Código limpio y reutilizable
- ✅ **Parámetros y retorno** - Comunicación eficiente entre funciones
- ✅ **Bibliotecas reutilizables** - Código compartido entre proyectos
- ✅ **Arrays unidimensionales** - Listas y procesamiento de datos
- ✅ **Arrays asociativos** - Estructuras key-value complejas
- ✅ **Gestor completo** - Proyecto integrado profesional

### 🚀 Próximo Módulo

**[PANTALLA: Preview del Módulo 5]**

> "En el Módulo 5 - Operaciones de Archivos y Texto aprenderemos:"

- Expresiones regulares avanzadas
- Sed y AWK para transformación de datos
- Procesamiento de logs y análisis
- Manipulación de archivos CSV/JSON
- Proyecto: Analizador de Logs con Reportes

### 🎬 Despedida

**[PANTALLA: Logo del bootcamp]**

> "¡Excelente trabajo en el Módulo 4! Has aprendido a escribir código profesional, organizado y escalable. Las funciones y arrays que dominaste son la base de cualquier script serio en Bash."

> "El Gestor de Archivos que creaste demuestra que ya puedes desarrollar aplicaciones complejas con interfaces profesionales. En el próximo módulo nos enfocaremos en el procesamiento avanzado de texto y datos."

> "¡Practica creando más funciones y experimentando con arrays, y nos vemos en el Módulo 5! ¡Hasta la próxima!"

---

## 📋 CHECKLIST DE PRODUCCIÓN

### Preparación

- [ ] Biblioteca de utilidades probada
- [ ] Scripts de demostración funcionales
- [ ] Ejemplos de arrays preparados
- [ ] Datos de prueba creados

### Durante la Grabación

- [ ] Demostración completa del gestor
- [ ] Explicación clara de scope y parámetros
- [ ] Ejemplos prácticos de arrays
- [ ] Casos de uso reales mostrados

### Post-Producción

- [ ] Navegación por timestamps
- [ ] Highlights en conceptos clave
- [ ] Zoom en código complejo
- [ ] Thumbnail con proyecto final

---

**¡Listo para crear un video excepcional del Módulo 4! 🚀**
