# Bootcamp Bash - Módulo 3: Desarrollo Paso a Paso

## Guión para Video de YouTube - Variables y Control de Flujo

---

## 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bootcamp Bash - Módulo 3: Variables y Control de Flujo - Programación Lógica e Interactiva"

**Duración Estimada:** 55-70 minutos

**Audiencia:** Estudiantes que dominan comandos básicos y procesamiento de texto, listos para programar con lógica

**Objetivo:** Dominar variables, estructuras de control y crear scripts interactivos con lógica condicional

---

## 🎯 OBJETIVOS DE APRENDIZAJE

Al finalizar este video, los estudiantes podrán:

1. **Dominar** variables y expansión de parámetros en Bash
2. **Implementar** estructuras condicionales (if, case)
3. **Crear** bucles eficientes (for, while, until)
4. **Manejar** argumentos de script y entrada del usuario
5. **Desarrollar** scripts interactivos con menús
6. **Construir** un Sistema de Menús Interactivo completo

---

## 📝 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y VARIABLES (15 minutos)

### PARTE 2: ESTRUCTURAS CONDICIONALES (15 minutos)

### PARTE 3: BUCLES Y ITERACIÓN (15 minutos)

### PARTE 4: ARGUMENTOS Y ENTRADA INTERACTIVA (10 minutos)

### PARTE 5: PROYECTO PRÁCTICO - SISTEMA DE MENÚS (15 minutos)

---

## 🎬 PARTE 1: INTRODUCCIÓN Y VARIABLES (15 minutos)

### 🎤 Guión de Presentación

**[PANTALLA: Logo del Módulo 3 con SVG]**

> "¡Bienvenidos de vuelta al Bootcamp Bash! En el Módulo 3 vamos a dar el salto de ejecutar comandos a crear programas reales con lógica, variables y control de flujo."

**[TRANSICIÓN: Repaso de módulos anteriores]**

> "Ya dominamos los comandos básicos del Módulo 1 y el potente procesamiento de texto del Módulo 2. Ahora es momento de añadir inteligencia a nuestros scripts."

### 🧠 El Poder de la Programación

**[PANTALLA: Diagrama conceptual]**

> "Hasta ahora hemos ejecutado comandos secuencialmente. Con variables y control de flujo, nuestros scripts pueden tomar decisiones, repetir tareas, y adaptarse a diferentes situaciones."

**[PANTALLA: Ejemplo visual]**

> "Imagina un script que puede procesar archivos diferentes según su tipo, crear menús interactivos, o automatizar tareas basándose en condiciones específicas."

### 🗺️ Roadmap del Módulo 3

**[PANTALLA: Estructura del módulo]**

> "En este módulo cubriremos:
>
> - Variables y expansión de parámetros
> - Condicionales: if/else, case
> - Bucles: for, while, until
> - Argumentos de script y entrada del usuario
> - Proyecto: Sistema de Menús Interactivo"

### 📦 Variables en Bash

**[PANTALLA: Terminal en vivo]**

> "Las variables son contenedores que almacenan información. En Bash son fundamentales para crear scripts dinámicos:"

```bash
# Configurar entorno del módulo 3
cd ~/bootcamp-bash
mkdir -p modulo3/{ejercicios,proyectos,datos,scripts}
cd modulo3

# Variables básicas
nombre="Juan"
edad=30
empresa="TechCorp"

echo "Hola $nombre"
echo "Tienes $edad años"
echo "Trabajas en $empresa"

# Variables del sistema
echo "Usuario actual: $USER"
echo "Directorio home: $HOME"
echo "Directorio actual: $PWD"
echo "Shell actual: $SHELL"
```

### 🎯 Tipos de Variables

**[PANTALLA: Demostración de tipos]**

> "Bash tiene diferentes tipos de variables según su alcance y uso:"

```bash
# Variables locales (solo en el script actual)
mi_variable="valor local"

# Variables de entorno (disponibles para procesos hijos)
export MI_VAR_GLOBAL="valor global"

# Variables especiales
echo "Nombre del script: $0"
echo "Primer argumento: $1"
echo "Todos los argumentos: $@"
echo "Número de argumentos: $#"
echo "PID del proceso: $$"
echo "Código de salida del último comando: $?"

# Variables de solo lectura
readonly PI=3.14159
declare -r EMPRESA="TechCorp"
```

### 🔧 Expansión de Parámetros

**[PANTALLA: Técnicas avanzadas]**

> "La expansión de parámetros nos da control total sobre cómo usar las variables:"

```bash
# Crear variable de ejemplo
archivo="/home/usuario/documentos/reporte.txt"

# Expansión básica
echo "Archivo completo: $archivo"
echo "Archivo completo: ${archivo}"

# Extracción de partes
echo "Solo el nombre: ${archivo##*/}"        # reporte.txt
echo "Solo el directorio: ${archivo%/*}"     # /home/usuario/documentos
echo "Sin extensión: ${archivo%.*}"          # /home/usuario/documentos/reporte
echo "Solo extensión: ${archivo##*.}"        # txt

# Valores por defecto
echo "Valor o defecto: ${variable:-'valor por defecto'}"
echo "Asignar si vacío: ${variable:='nuevo valor'}"

# Longitud de cadenas
echo "Longitud del archivo: ${#archivo}"

# Subcadenas
echo "Primeros 10 caracteres: ${archivo:0:10}"
echo "Desde posición 6: ${archivo:6}"
```

### 🧮 Operaciones con Variables

**[PANTALLA: Aritmética y manipulación]**

> "Bash puede realizar operaciones matemáticas y manipular strings:"

```bash
# Aritmética básica
a=10
b=5

# Método 1: $(( ))
suma=$((a + b))
resta=$((a - b))
multiplicacion=$((a * b))
division=$((a / b))
modulo=$((a % b))

echo "Suma: $suma"
echo "Resta: $resta"
echo "Multiplicación: $multiplicacion"
echo "División: $division"
echo "Módulo: $modulo"

# Incrementos y decrementos
contador=0
((contador++))
echo "Contador después de incremento: $contador"
((contador += 5))
echo "Contador después de sumar 5: $contador"

# Operaciones con strings
texto="Hola Mundo"
echo "En mayúsculas: ${texto^^}"
echo "En minúsculas: ${texto,,}"
echo "Reemplazar: ${texto/Mundo/Bash}"
echo "Reemplazar todo: ${texto//o/0}"
```

### 📝 Script de Demostración de Variables

**[PANTALLA: Creación de script completo]**

> "Creemos un script que demuestre el poder de las variables:"

```bash
# Crear script de demostración
cat > scripts/demo_variables.sh << 'EOF'
#!/bin/bash
# Demostración de Variables - Módulo 3
# Muestra diferentes tipos y usos de variables

set -euo pipefail

echo "🔧 DEMOSTRACIÓN DE VARIABLES EN BASH"
echo "==================================="
echo

# 1. Variables básicas
echo "📦 1. VARIABLES BÁSICAS"
echo "---------------------"
nombre="María García"
edad=28
salario=2500.50

echo "Nombre: $nombre"
echo "Edad: $edad años"
echo "Salario: $salario €"
echo

# 2. Variables del sistema
echo "🖥️  2. VARIABLES DEL SISTEMA"
echo "--------------------------"
echo "Usuario: $USER"
echo "Home: $HOME"
echo "PWD: $PWD"
echo "Fecha: $(date)"
echo "Hostname: $(hostname)"
echo

# 3. Operaciones aritméticas
echo "🧮 3. OPERACIONES ARITMÉTICAS"
echo "----------------------------"
a=15
b=4

echo "a = $a, b = $b"
echo "Suma: $((a + b))"
echo "Resta: $((a - b))"
echo "Multiplicación: $((a * b))"
echo "División: $((a / b))"
echo "Módulo: $((a % b))"
echo

# 4. Manipulación de strings
echo "📝 4. MANIPULACIÓN DE STRINGS"
echo "----------------------------"
archivo="reporte_ventas_2024.xlsx"
echo "Archivo: $archivo"
echo "Longitud: ${#archivo}"
echo "Sin extensión: ${archivo%.*}"
echo "Solo extensión: ${archivo##*.}"
echo "En mayúsculas: ${archivo^^}"
echo

# 5. Arrays básicos
echo "📋 5. ARRAYS BÁSICOS"
echo "------------------"
frutas=("manzana" "banana" "naranja" "uva")
echo "Todas las frutas: ${frutas[@]}"
echo "Primera fruta: ${frutas[0]}"
echo "Número de frutas: ${#frutas[@]}"
echo

# 6. Información del script
echo "📄 6. INFORMACIÓN DEL SCRIPT"
echo "---------------------------"
echo "Nombre del script: $0"
echo "Número de argumentos: $#"
echo "Todos los argumentos: $@"
echo "PID del proceso: $$"

echo
echo "✅ Demostración completada!"
EOF

chmod +x scripts/demo_variables.sh

# Ejecutar demostración
./scripts/demo_variables.sh arg1 arg2 arg3
```

---

## 🔀 PARTE 2: ESTRUCTURAS CONDICIONALES (15 minutos)

### 🎤 Transición

**[PANTALLA: Diagrama de flujo condicional]**

> "Las estructuras condicionales permiten que nuestros scripts tomen decisiones. Es como darle inteligencia a nuestros programas."

### 🤔 Condicionales IF/ELSE

**[PANTALLA: Demostración paso a paso]**

> "La estructura if es la base de toda lógica condicional:"

```bash
# Condicional básico
edad=25

if [ $edad -ge 18 ]; then
    echo "Eres mayor de edad"
fi

# If-else completo
if [ $edad -ge 65 ]; then
    echo "Eres jubilado"
elif [ $edad -ge 18 ]; then
    echo "Eres adulto"
else
    echo "Eres menor de edad"
fi

# Múltiples condiciones
nombre="Ana"
edad=30

if [ "$nombre" = "Ana" ] && [ $edad -gt 25 ]; then
    echo "Hola Ana, eres mayor de 25"
fi

# Verificar archivos y directorios
archivo="datos/ejemplo.txt"

if [ -f "$archivo" ]; then
    echo "El archivo existe"
elif [ -d "$archivo" ]; then
    echo "Es un directorio"
else
    echo "No existe"
fi
```

### 🎛️ Operadores de Comparación

**[PANTALLA: Tabla de operadores]**

> "Bash tiene operadores específicos para diferentes tipos de comparaciones:"

```bash
# Operadores numéricos
a=10
b=20

[ $a -eq $b ]    # Igual
[ $a -ne $b ]    # No igual
[ $a -lt $b ]    # Menor que
[ $a -le $b ]    # Menor o igual
[ $a -gt $b ]    # Mayor que
[ $a -ge $b ]    # Mayor o igual

# Operadores de cadenas
str1="hola"
str2="mundo"

[ "$str1" = "$str2" ]     # Igual
[ "$str1" != "$str2" ]    # No igual
[ -z "$str1" ]            # Cadena vacía
[ -n "$str1" ]            # Cadena no vacía

# Operadores de archivos
[ -f "archivo.txt" ]      # Es archivo regular
[ -d "directorio" ]       # Es directorio
[ -e "algo" ]             # Existe (archivo o directorio)
[ -r "archivo.txt" ]      # Es legible
[ -w "archivo.txt" ]      # Es escribible
[ -x "script.sh" ]        # Es ejecutable
```

### 🎯 Estructura CASE

**[PANTALLA: Alternativa elegante a múltiples if]**

> "Para múltiples opciones, case es más elegante que muchos if-elif:"

```bash
# Crear script de ejemplo con case
cat > scripts/menu_case.sh << 'EOF'
#!/bin/bash
# Demostración de estructura CASE

echo "Selecciona una opción:"
echo "1) Listar archivos"
echo "2) Mostrar fecha"
echo "3) Mostrar usuario"
echo "4) Salir"

read -p "Tu opción: " opcion

case $opcion in
    1)
        echo "Listando archivos:"
        ls -la
        ;;
    2)
        echo "Fecha actual:"
        date
        ;;
    3)
        echo "Usuario actual:"
        whoami
        ;;
    4)
        echo "¡Hasta luego!"
        exit 0
        ;;
    *)
        echo "Opción no válida"
        ;;
esac
EOF

chmod +x scripts/menu_case.sh

# Ejemplo con patrones
dia=$(date +%u)

case $dia in
    1|2|3|4|5)
        echo "Es día laboral"
        ;;
    6|7)
        echo "Es fin de semana"
        ;;
    *)
        echo "Día desconocido"
        ;;
esac
```

### 🧪 Ejemplos Prácticos de Condicionales

**[PANTALLA: Casos de uso reales]**

> "Veamos ejemplos prácticos donde las condicionales son esenciales:"

`````bash
# 1. Verificar prerrequisitos
verificar_prerequisitos() {
    echo "🔍 Verificando prerrequisitos..."

    if ! command -v git &> /dev/null; then
        echo "❌ Git no está instalado"
        exit 1
    fi

    if [ ! -d ".git" ]; then
        echo "❌ No estás en un repositorio Git"
        exit 1
    fi

    echo "✅ Todos los prerrequisitos están ok"
}

# 2. Procesar archivos según extensión
procesar_archivo() {
    local archivo="$1"

    case "${archivo##*.}" in
        txt)
            echo "Procesando archivo de texto: $archivo"
            wc -l "$archivo"
            ;;
        jpg|png|gif)
            echo "Procesando imagen: $archivo"
            file "$archivo"
            ;;
        sh)
            echo "Procesando script: $archivo"
            bash -n "$archivo" && echo "Sintaxis correcta"
            ;;
        *)
            echo "Tipo de archivo no reconocido: $archivo"
            ;;
    esac
}

# 3. Gestión de errores inteligente
ejecutar_con_reintento() {
    local comando="$1"
    local max_intentos=3
    local intento=1

    while [ $intento -le $max_intentos ]; do
        if $comando; then
            echo "✅ Comando ejecutado exitosamente"
            return 0
        else
            echo "❌ Intento $intento falló"
            if [ $intento -eq $max_intentos ]; then
                echo "💥 Máximo de intentos alcanzado"
                return 1
            fi
            ((intento++))
            sleep 2
        fi
    done
}
````markdown

---

## 🔄 PARTE 3: BUCLES Y ITERACIÓN (15 minutos)

### 🎤 Transición

**[PANTALLA: Animación de bucles]**

> "Los bucles nos permiten repetir tareas automáticamente. Son fundamentales para procesar múltiples elementos, automatizar tareas repetitivas, y crear programas eficientes."

### 🔁 Bucle FOR

**[PANTALLA: Demostración de for loops]**

> "El bucle for es perfecto para iterar sobre listas conocidas:"

```bash
# For básico con lista
echo "🍎 Iterando sobre frutas:"
for fruta in manzana banana naranja uva; do
    echo "- $fruta"
done

# For con archivos
echo "📁 Archivos en el directorio actual:"
for archivo in *.txt; do
    if [ -f "$archivo" ]; then
        echo "Archivo encontrado: $archivo"
        echo "Líneas: $(wc -l < "$archivo")"
    fi
done

# For con rango numérico
echo "🔢 Números del 1 al 5:"
for i in {1..5}; do
    echo "Número: $i"
done

# For con incremento específico
echo "📊 Números pares del 2 al 10:"
for i in {2..10..2}; do
    echo "Par: $i"
done

# For estilo C
echo "🎯 Contador estilo C:"
for ((i=1; i<=5; i++)); do
    echo "Iteración $i"
done
`````

### ⏳ Bucle WHILE

**[PANTALLA: Bucles condicionales]**

> "While ejecuta mientras una condición sea verdadera:"

```bash
# While básico
contador=1
echo "⏰ Contador con while:"
while [ $contador -le 5 ]; do
    echo "Contador: $contador"
    ((contador++))
done

# While con entrada del usuario
echo "💬 Bucle interactivo:"
while true; do
    read -p "Escribe 'salir' para terminar: " entrada
    if [ "$entrada" = "salir" ]; then
        echo "¡Hasta luego!"
        break
    fi
    echo "Dijiste: $entrada"
done

# While con archivos
echo "📋 Leyendo archivo línea por línea:"
cat > datos/ejemplo_bucle.txt << 'EOF'
Línea 1: Datos importantes
Línea 2: Más información
Línea 3: Conclusión
EOF

while IFS= read -r linea; do
    echo "Procesando: $linea"
done < datos/ejemplo_bucle.txt
```

### 🔚 Bucle UNTIL

**[PANTALLA: Bucle hasta que se cumpla condición]**

> "Until es lo opuesto a while - ejecuta hasta que la condición sea verdadera:"

```bash
# Until básico
contador=1
echo "🎯 Contador con until:"
until [ $contador -gt 5 ]; do
    echo "Contador: $contador"
    ((contador++))
done

# Until esperando un archivo
echo "⏳ Esperando archivo..."
until [ -f "archivo_esperado.txt" ]; do
    echo "Archivo no existe, esperando..."
    sleep 1
    # Para demo, creamos el archivo después de 3 segundos
    if [ ! -f "contador_demo.tmp" ]; then
        echo "3" > contador_demo.tmp
    fi
    contador_espera=$(cat contador_demo.tmp)
    if [ $contador_espera -le 1 ]; then
        touch archivo_esperado.txt
    else
        echo $((contador_espera - 1)) > contador_demo.tmp
    fi
done
echo "✅ ¡Archivo encontrado!"
rm -f contador_demo.tmp archivo_esperado.txt
```

### 🛑 Control de Bucles

**[PANTALLA: Break y continue]**

> "Podemos controlar el flujo de bucles con break y continue:"

```bash
# Ejemplo con break
echo "🛑 Usando break:"
for i in {1..10}; do
    if [ $i -eq 6 ]; then
        echo "Llegué a 6, saliendo..."
        break
    fi
    echo "Número: $i"
done

# Ejemplo con continue
echo "⏭️  Usando continue:"
for i in {1..10}; do
    if [ $((i % 2)) -eq 0 ]; then
        continue  # Saltar números pares
    fi
    echo "Impar: $i"
done

# Bucles anidados con break específico
echo "🎯 Bucles anidados:"
for i in {1..3}; do
    echo "Grupo $i:"
    for j in {1..5}; do
        if [ $j -eq 4 ]; then
            break  # Solo sale del bucle interno
        fi
        echo "  Item $j"
    done
done
```

### 🚀 Casos Prácticos de Bucles

**[PANTALLA: Ejemplos reales]**

> "Veamos ejemplos prácticos donde los bucles son esenciales:"

```bash
# Crear script de ejemplos prácticos
cat > scripts/ejemplos_bucles.sh << 'EOF'
#!/bin/bash
# Ejemplos Prácticos de Bucles - Módulo 3

set -euo pipefail

echo "🔄 EJEMPLOS PRÁCTICOS DE BUCLES"
echo "=============================="
echo

# 1. Procesamiento de archivos por lotes
echo "📁 1. PROCESAMIENTO POR LOTES"
echo "-----------------------------"
mkdir -p temp_bucles
for i in {1..5}; do
    echo "Contenido del archivo $i" > "temp_bucles/archivo_$i.txt"
done

for archivo in temp_bucles/*.txt; do
    echo "Procesando: $(basename "$archivo")"
    echo "Líneas: $(wc -l < "$archivo")"
    echo "Palabras: $(wc -w < "$archivo")"
    echo "---"
done

# 2. Backup con timestamping
echo "💾 2. SISTEMA DE BACKUP"
echo "---------------------"
for directorio in ejercicios proyectos datos; do
    if [ -d "$directorio" ]; then
        timestamp=$(date +%Y%m%d_%H%M%S)
        backup_name="backup_${directorio}_${timestamp}.tar.gz"
        echo "Creando backup: $backup_name"
        tar -czf "$backup_name" "$directorio" 2>/dev/null || echo "Error en backup de $directorio"
    fi
done

# 3. Monitor de sistema simple
echo "🖥️  3. MONITOR DE SISTEMA"
echo "-----------------------"
for i in {1..3}; do
    echo "Medición $i:"
    echo "  CPU: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)%"
    echo "  Memoria: $(free -h | awk 'NR==2{printf "%.1f%%", $3*100/$2}')"
    echo "  Fecha: $(date)"
    [ $i -lt 3 ] && sleep 2
done

# 4. Validación de entrada
echo "✅ 4. VALIDACIÓN DE ENTRADA"
echo "-------------------------"
intentos=0
max_intentos=3

while [ $intentos -lt $max_intentos ]; do
    read -p "Introduce un número entre 1 y 10: " numero

    if [[ "$numero" =~ ^[0-9]+$ ]] && [ "$numero" -ge 1 ] && [ "$numero" -le 10 ]; then
        echo "✅ Número válido: $numero"
        break
    else
        ((intentos++))
        echo "❌ Número inválido. Intentos restantes: $((max_intentos - intentos))"
    fi

    if [ $intentos -eq $max_intentos ]; then
        echo "💥 Máximo de intentos alcanzado"
    fi
done

# Limpiar archivos temporales
rm -rf temp_bucles backup_*.tar.gz

echo
echo "✅ Ejemplos de bucles completados!"
EOF

chmod +x scripts/ejemplos_bucles.sh
```

```````
This is the description of what the code block changes:
<changeDescription>
Añadir la sección de argumentos y entrada interactiva
</changeDescription>

This is the code block that represents the suggested code change:
````markdown
---

## 📥 PARTE 4: ARGUMENTOS Y ENTRADA INTERACTIVA (10 minutos)

### 🎤 Transición

**[PANTALLA: Diagrama de flujo de datos]**

> "Los scripts realmente útiles pueden recibir información del usuario y del sistema. Aprendamos a manejar argumentos y crear interfaces interactivas."

### 📋 Argumentos de Script

**[PANTALLA: Demostración de argumentos]**

> "Los argumentos permiten que nuestros scripts sean flexibles y reutilizables:"

```bash
# Crear script para demostrar argumentos
cat > scripts/demo_argumentos.sh << 'EOF'
#!/bin/bash
# Demostración de Argumentos - Módulo 3

echo "📋 INFORMACIÓN DE ARGUMENTOS"
echo "============================"
echo "Nombre del script: $0"
echo "Número de argumentos: $#"
echo "Todos los argumentos: $@"
echo "Todos los argumentos (como string): $*"
echo "PID del script: $$"
echo

# Argumentos individuales
echo "🎯 ARGUMENTOS INDIVIDUALES:"
echo "Primer argumento: ${1:-'No proporcionado'}"
echo "Segundo argumento: ${2:-'No proporcionado'}"
echo "Tercer argumento: ${3:-'No proporcionado'}"
echo

# Iterar sobre todos los argumentos
echo "🔄 ITERANDO ARGUMENTOS:"
contador=1
for arg in "$@"; do
    echo "Argumento $contador: $arg"
    ((contador++))
done

# Validación de argumentos
if [ $# -eq 0 ]; then
    echo "❌ No se proporcionaron argumentos"
    echo "Uso: $0 arg1 arg2 arg3"
    exit 1
fi

echo "✅ Script ejecutado correctamente"
EOF

chmod +x scripts/demo_argumentos.sh

# Ejecutar con diferentes argumentos
echo "Ejecutando con argumentos:"
./scripts/demo_argumentos.sh uno dos tres "cuatro con espacios"
```

### ⚙️ Procesamiento de Opciones

**[PANTALLA: getopts para opciones profesionales]**

> "Para opciones complejas, usamos getopts como los comandos profesionales:"

```bash
# Script con opciones avanzadas
cat > scripts/script_con_opciones.sh << 'EOF'
#!/bin/bash
# Script con opciones usando getopts

# Valores por defecto
verbose=false
archivo=""
numero=1

# Función de ayuda
mostrar_ayuda() {
    echo "Uso: $0 [-v] [-f archivo] [-n numero] [-h]"
    echo "Opciones:"
    echo "  -v          Modo verbose"
    echo "  -f archivo  Especificar archivo a procesar"
    echo "  -n numero   Especificar número (por defecto: 1)"
    echo "  -h          Mostrar esta ayuda"
}

# Procesar opciones
while getopts "vf:n:h" opt; do
    case $opt in
        v)
            verbose=true
            ;;
        f)
            archivo="$OPTARG"
            ;;
        n)
            numero="$OPTARG"
            ;;
        h)
            mostrar_ayuda
            exit 0
            ;;
        \?)
            echo "Opción inválida: -$OPTARG" >&2
            mostrar_ayuda
            exit 1
            ;;
    esac
done

# Remover opciones procesadas
shift $((OPTIND-1))

# Mostrar configuración
echo "🔧 CONFIGURACIÓN:"
echo "Verbose: $verbose"
echo "Archivo: ${archivo:-'No especificado'}"
echo "Número: $numero"
echo "Argumentos restantes: $@"

# Lógica principal
if [ "$verbose" = true ]; then
    echo "🔍 Modo verbose activado"
fi

if [ -n "$archivo" ]; then
    if [ -f "$archivo" ]; then
        echo "📄 Procesando archivo: $archivo"
        echo "Líneas: $(wc -l < "$archivo")"
    else
        echo "❌ Archivo no encontrado: $archivo"
    fi
fi

echo "🎯 Número especificado: $numero"
EOF

chmod +x scripts/script_con_opciones.sh

# Demostrar diferentes usos
echo "Ejemplos de uso:"
./scripts/script_con_opciones.sh -h
./scripts/script_con_opciones.sh -v -n 42
./scripts/script_con_opciones.sh -f "datos/ejemplo.txt" -v
```

### 💬 Entrada Interactiva

**[PANTALLA: read y técnicas interactivas]**

> "Para crear scripts verdaderamente interactivos:"

```bash
# Entrada básica
echo "💬 ENTRADA BÁSICA:"
read -p "¿Cómo te llamas? " nombre
echo "Hola, $nombre!"

# Entrada con timeout
echo "⏰ ENTRADA CON TIMEOUT:"
if read -t 5 -p "Tienes 5 segundos para responder: " respuesta; then
    echo "Respondiste: $respuesta"
else
    echo "Tiempo agotado"
fi

# Entrada silencosa (contraseñas)
echo "🔒 ENTRADA SILENCIOSA:"
read -s -p "Introduce una contraseña: " password
echo
echo "Contraseña introducida (longitud: ${#password})"

# Múltiples opciones
echo "🎯 MENÚ DE OPCIONES:"
echo "1) Opción A"
echo "2) Opción B"
echo "3) Salir"

read -p "Elige una opción [1-3]: " opcion

case $opcion in
    1) echo "Elegiste Opción A" ;;
    2) echo "Elegiste Opción B" ;;
    3) echo "Saliendo..." ;;
    *) echo "Opción inválida" ;;
esac

# Confirmación
read -p "¿Estás seguro? (s/n): " confirmacion
if [[ "$confirmacion" =~ ^[sS]$ ]]; then
    echo "Confirmado"
else
    echo "Cancelado"
fi
```

### 🎨 Interfaz de Usuario Mejorada

**[PANTALLA: Técnicas para mejor UX]**

> "Técnicas para crear interfaces más profesionales:"

```bash
# Crear script con interfaz mejorada
cat > scripts/interfaz_profesional.sh << 'EOF'
#!/bin/bash
# Interfaz de Usuario Profesional

# Colores para mejor presentación
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para mensajes coloreados
mensaje() {
    local tipo="$1"
    local texto="$2"

    case $tipo in
        "error")   echo -e "${RED}❌ $texto${NC}" ;;
        "exito")   echo -e "${GREEN}✅ $texto${NC}" ;;
        "aviso")   echo -e "${YELLOW}⚠️  $texto${NC}" ;;
        "info")    echo -e "${BLUE}ℹ️  $texto${NC}" ;;
        *)         echo "$texto" ;;
    esac
}

# Función para progreso
mostrar_progreso() {
    local actual=$1
    local total=$2
    local ancho=30
    local porcentaje=$((actual * 100 / total))
    local completado=$((actual * ancho / total))

    printf "\r["
    for ((i=0; i<completado; i++)); do printf "="; done
    for ((i=completado; i<ancho; i++)); do printf " "; done
    printf "] %d%%" $porcentaje
}

# Función para entrada validada
entrada_validada() {
    local prompt="$1"
    local validacion="$2"
    local valor

    while true; do
        read -p "$prompt" valor
        if [[ "$valor" =~ $validacion ]]; then
            echo "$valor"
            return 0
        else
            mensaje "error" "Entrada inválida. Inténtalo de nuevo."
        fi
    done
}

# Demostración
clear
echo "🎨 INTERFAZ PROFESIONAL"
echo "======================"
echo

mensaje "info" "Iniciando demostración..."
sleep 1

# Progreso simulado
echo "Procesando..."
for i in {1..10}; do
    mostrar_progreso $i 10
    sleep 0.2
done
echo

mensaje "exito" "Procesamiento completado"

# Entrada validada
email=$(entrada_validada "Introduce tu email: " "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
mensaje "exito" "Email válido: $email"

edad=$(entrada_validada "Introduce tu edad (18-100): " "^[1-9][0-9]?$|^100$")
if [ $edad -ge 18 ]; then
    mensaje "exito" "Edad válida: $edad años"
else
    mensaje "aviso" "Eres menor de edad"
fi

mensaje "info" "Demostración completada"
EOF

chmod +x scripts/interfaz_profesional.sh
```
``````markdown
---

## 🎯 PARTE 5: PROYECTO PRÁCTICO - SISTEMA DE MENÚS INTERACTIVO (15 minutos)

### 🎤 Transición

**[PANTALLA: Logo del proyecto final]**

> "¡Es hora de integrar todo lo aprendido! Crearemos un Sistema de Menús Interactivo completo que combine variables, condicionales, bucles y entrada del usuario."

### 🏗️ Diseño del Sistema

**[PANTALLA: Arquitectura del sistema]**

> "Nuestro sistema tendrá múltiples funcionalidades organizadas en menús jerárquicos:"

- Gestión de archivos
- Información del sistema
- Calculadora interactiva
- Administración de usuarios
- Configuración y salida

### 🚀 Construcción del Proyecto

**[PANTALLA: Desarrollo paso a paso]**

```bash
# Crear el sistema completo
cat > proyectos/sistema_menus_interactivo.sh << 'EOF'
#!/bin/bash
# Sistema de Menús Interactivo - Proyecto Módulo 3
# Integra variables, condicionales, bucles y entrada interactiva

set -euo pipefail

# Configuración global
readonly SCRIPT_NAME="Sistema de Menús Interactivo"
readonly VERSION="1.0"
readonly AUTOR="Bootcamp Bash"
readonly LOG_FILE="logs/sistema.log"

# Colores para la interfaz
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m'

# Variables globales
usuario_actual="$USER"
sesion_inicio=$(date)
contador_operaciones=0

# Crear directorio de logs si no existe
mkdir -p logs

# Función de logging
log() {
    local nivel="$1"
    local mensaje="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$nivel] $mensaje" >> "$LOG_FILE"
}

# Función para mensajes
imprimir() {
    local tipo="$1"
    local mensaje="$2"

    case $tipo in
        "titulo")  echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
                   echo -e "${BLUE}║${NC} ${CYAN}$mensaje${NC}"
                   echo -e "${BLUE}╚══════════════════════════════════════╝${NC}" ;;
        "exito")   echo -e "${GREEN}✅ $mensaje${NC}" ;;
        "error")   echo -e "${RED}❌ $mensaje${NC}" ;;
        "aviso")   echo -e "${YELLOW}⚠️  $mensaje${NC}" ;;
        "info")    echo -e "${BLUE}ℹ️  $mensaje${NC}" ;;
        *)         echo "$mensaje" ;;
    esac
}

# Función para pausar
pausar() {
    echo
    read -p "Presiona Enter para continuar..."
    clear
}

# Función para validar entrada numérica
validar_numero() {
    local entrada="$1"
    local min="$2"
    local max="$3"

    if [[ "$entrada" =~ ^[0-9]+$ ]] && [ "$entrada" -ge "$min" ] && [ "$entrada" -le "$max" ]; then
        return 0
    else
        return 1
    fi
}

# ============= MENÚS =============

# Menú principal
menu_principal() {
    while true; do
        clear
        imprimir "titulo" "$SCRIPT_NAME v$VERSION"
        echo
        echo -e "${PURPLE}👤 Usuario:${NC} $usuario_actual"
        echo -e "${PURPLE}📅 Sesión iniciada:${NC} $sesion_inicio"
        echo -e "${PURPLE}🔢 Operaciones realizadas:${NC} $contador_operaciones"
        echo
        echo "🏠 MENÚ PRINCIPAL"
        echo "=================="
        echo "1) 📁 Gestión de Archivos"
        echo "2) 🖥️  Información del Sistema"
        echo "3) 🧮 Calculadora"
        echo "4) 👥 Administración de Usuarios"
        echo "5) ⚙️  Configuración"
        echo "6) 📊 Ver Logs"
        echo "7) ❌ Salir"
        echo

        read -p "Selecciona una opción [1-7]: " opcion

        case $opcion in
            1) menu_archivos ;;
            2) menu_sistema ;;
            3) menu_calculadora ;;
            4) menu_usuarios ;;
            5) menu_configuracion ;;
            6) ver_logs ;;
            7) salir_sistema ;;
            *)
                imprimir "error" "Opción inválida"
                sleep 2
                ;;
        esac
    done
}

# Menú de gestión de archivos
menu_archivos() {
    while true; do
        clear
        imprimir "titulo" "GESTIÓN DE ARCHIVOS"
        echo
        echo "1) 📄 Listar archivos"
        echo "2) 📁 Crear directorio"
        echo "3) 📝 Crear archivo"
        echo "4) 🔍 Buscar archivos"
        echo "5) 📊 Estadísticas de directorio"
        echo "6) 🗑️  Limpiar archivos temporales"
        echo "7) ↩️  Volver al menú principal"
        echo

        read -p "Selecciona una opción [1-7]: " opcion

        case $opcion in
            1) listar_archivos ;;
            2) crear_directorio ;;
            3) crear_archivo ;;
            4) buscar_archivos ;;
            5) estadisticas_directorio ;;
            6) limpiar_temporales ;;
            7) break ;;
            *)
                imprimir "error" "Opción inválida"
                sleep 2
                ;;
        esac
        ((contador_operaciones++))
    done
}

# Función para listar archivos
listar_archivos() {
    clear
    imprimir "titulo" "LISTAR ARCHIVOS"
    echo

    read -p "Introduce la ruta (Enter para directorio actual): " ruta
    ruta=${ruta:-"."}

    if [ -d "$ruta" ]; then
        echo
        imprimir "info" "Contenido de: $(realpath "$ruta")"
        echo
        ls -lah "$ruta"
        log "INFO" "Listado de archivos en: $ruta"
    else
        imprimir "error" "El directorio no existe: $ruta"
        log "ERROR" "Intento de listar directorio inexistente: $ruta"
    fi

    pausar
}

# Menú de información del sistema
menu_sistema() {
    while true; do
        clear
        imprimir "titulo" "INFORMACIÓN DEL SISTEMA"
        echo
        echo "1) 💻 Información básica"
        echo "2) 💾 Uso de memoria"
        echo "3) 💽 Uso de disco"
        echo "4) 🔄 Procesos activos"
        echo "5) 🌐 Información de red"
        echo "6) ↩️  Volver al menú principal"
        echo

        read -p "Selecciona una opción [1-6]: " opcion

        case $opcion in
            1) info_basica ;;
            2) info_memoria ;;
            3) info_disco ;;
            4) info_procesos ;;
            5) info_red ;;
            6) break ;;
            *)
                imprimir "error" "Opción inválida"
                sleep 2
                ;;
        esac
        ((contador_operaciones++))
    done
}

# Función de información básica
info_basica() {
    clear
    imprimir "titulo" "INFORMACIÓN BÁSICA DEL SISTEMA"
    echo
    echo "🖥️  Sistema: $(uname -s)"
    echo "📋 Nombre del host: $(hostname)"
    echo "👤 Usuario actual: $(whoami)"
    echo "🏠 Directorio home: $HOME"
    echo "📅 Fecha actual: $(date)"
    echo "⏰ Tiempo de actividad: $(uptime -p 2>/dev/null || echo "No disponible")"
    echo "🐚 Shell actual: $SHELL"
    echo "📊 Carga del sistema: $(uptime | awk -F'load average:' '{print $2}')"

    log "INFO" "Consulta de información básica del sistema"
    pausar
}

# Calculadora interactiva
menu_calculadora() {
    while true; do
        clear
        imprimir "titulo" "CALCULADORA INTERACTIVA"
        echo
        echo "1) ➕ Suma"
        echo "2) ➖ Resta"
        echo "3) ✖️  Multiplicación"
        echo "4) ➗ División"
        echo "5) 📊 Operaciones avanzadas"
        echo "6) ↩️  Volver al menú principal"
        echo

        read -p "Selecciona una opción [1-6]: " opcion

        case $opcion in
            1|2|3|4) operacion_basica "$opcion" ;;
            5) operaciones_avanzadas ;;
            6) break ;;
            *)
                imprimir "error" "Opción inválida"
                sleep 2
                ;;
        esac
        ((contador_operaciones++))
    done
}

# Función para operaciones básicas
operacion_basica() {
    local tipo="$1"

    clear
    case $tipo in
        1) imprimir "titulo" "SUMA" ;;
        2) imprimir "titulo" "RESTA" ;;
        3) imprimir "titulo" "MULTIPLICACIÓN" ;;
        4) imprimir "titulo" "DIVISIÓN" ;;
    esac
    echo

    read -p "Primer número: " num1
    read -p "Segundo número: " num2

    if [[ "$num1" =~ ^-?[0-9]+\.?[0-9]*$ ]] && [[ "$num2" =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
        case $tipo in
            1) resultado=$(echo "$num1 + $num2" | bc) ;;
            2) resultado=$(echo "$num1 - $num2" | bc) ;;
            3) resultado=$(echo "$num1 * $num2" | bc) ;;
            4)
                if [ "$num2" != "0" ]; then
                    resultado=$(echo "scale=2; $num1 / $num2" | bc)
                else
                    imprimir "error" "No se puede dividir por cero"
                    pausar
                    return
                fi
                ;;
        esac

        echo
        imprimir "exito" "Resultado: $resultado"
        log "INFO" "Operación realizada: $num1 op $num2 = $resultado"
    else
        imprimir "error" "Por favor introduce números válidos"
        log "ERROR" "Números inválidos introducidos: $num1, $num2"
    fi

    pausar
}

# Función para salir del sistema
salir_sistema() {
    clear
    imprimir "titulo" "SALIENDO DEL SISTEMA"
    echo

    echo "📊 RESUMEN DE LA SESIÓN:"
    echo "========================"
    echo "👤 Usuario: $usuario_actual"
    echo "⏰ Duración: Desde $sesion_inicio hasta $(date)"
    echo "🔢 Operaciones realizadas: $contador_operaciones"
    echo

    read -p "¿Estás seguro de que quieres salir? (s/n): " confirmacion

    if [[ "$confirmacion" =~ ^[sS]$ ]]; then
        log "INFO" "Sistema cerrado por el usuario. Operaciones: $contador_operaciones"
        imprimir "exito" "¡Gracias por usar $SCRIPT_NAME!"
        echo
        exit 0
    fi
}

# Función para ver logs
ver_logs() {
    clear
    imprimir "titulo" "LOGS DEL SISTEMA"
    echo

    if [ -f "$LOG_FILE" ]; then
        echo "📄 Últimas 20 entradas del log:"
        echo "================================"
        tail -20 "$LOG_FILE"
    else
        imprimir "aviso" "No hay logs disponibles"
    fi

    pausar
}

# Funciones simplificadas para el demo
crear_directorio() {
    clear
    imprimir "titulo" "CREAR DIRECTORIO"
    echo
    read -p "Nombre del directorio: " nombre
    if mkdir -p "$nombre" 2>/dev/null; then
        imprimir "exito" "Directorio '$nombre' creado"
        log "INFO" "Directorio creado: $nombre"
    else
        imprimir "error" "Error al crear directorio"
        log "ERROR" "Error al crear directorio: $nombre"
    fi
    pausar
}

crear_archivo() {
    clear
    imprimir "titulo" "CREAR ARCHIVO"
    echo
    read -p "Nombre del archivo: " nombre
    if touch "$nombre" 2>/dev/null; then
        imprimir "exito" "Archivo '$nombre' creado"
        log "INFO" "Archivo creado: $nombre"
    else
        imprimir "error" "Error al crear archivo"
        log "ERROR" "Error al crear archivo: $nombre"
    fi
    pausar
}

buscar_archivos() {
    clear
    imprimir "titulo" "BUSCAR ARCHIVOS"
    echo
    read -p "Patrón de búsqueda: " patron
    echo
    imprimir "info" "Buscando archivos que coincidan con: $patron"
    find . -name "*$patron*" -type f 2>/dev/null | head -10
    log "INFO" "Búsqueda realizada: $patron"
    pausar
}

estadisticas_directorio() {
    clear
    imprimir "titulo" "ESTADÍSTICAS DE DIRECTORIO"
    echo
    read -p "Directorio (Enter para actual): " dir
    dir=${dir:-"."}

    if [ -d "$dir" ]; then
        archivos=$(find "$dir" -type f | wc -l)
        directorios=$(find "$dir" -type d | wc -l)
        tamaño=$(du -sh "$dir" 2>/dev/null | cut -f1)

        echo "📊 Estadísticas de: $(realpath "$dir")"
        echo "================================"
        echo "📄 Archivos: $archivos"
        echo "📁 Directorios: $directorios"
        echo "💾 Tamaño: $tamaño"
        log "INFO" "Estadísticas consultadas para: $dir"
    else
        imprimir "error" "Directorio no existe"
    fi
    pausar
}

limpiar_temporales() {
    clear
    imprimir "titulo" "LIMPIAR ARCHIVOS TEMPORALES"
    echo
    archivos_temp=$(find . -name "*.tmp" -o -name "*.temp" 2>/dev/null | wc -l)

    if [ "$archivos_temp" -gt 0 ]; then
        echo "🗑️  Archivos temporales encontrados: $archivos_temp"
        read -p "¿Eliminar archivos temporales? (s/n): " confirmacion
        if [[ "$confirmacion" =~ ^[sS]$ ]]; then
            find . -name "*.tmp" -o -name "*.temp" -delete 2>/dev/null
            imprimir "exito" "Archivos temporales eliminados"
            log "INFO" "Limpieza de archivos temporales realizada"
        fi
    else
        imprimir "info" "No se encontraron archivos temporales"
    fi
    pausar
}

menu_usuarios() {
    imprimir "info" "Funcionalidad en desarrollo"
    pausar
}

menu_configuracion() {
    imprimir "info" "Configuración en desarrollo"
    pausar
}

info_memoria() {
    clear
    imprimir "titulo" "USO DE MEMORIA"
    echo
    free -h
    pausar
}

info_disco() {
    clear
    imprimir "titulo" "USO DE DISCO"
    echo
    df -h
    pausar
}

info_procesos() {
    clear
    imprimir "titulo" "PROCESOS ACTIVOS"
    echo
    ps aux | head -10
    pausar
}

info_red() {
    clear
    imprimir "titulo" "INFORMACIÓN DE RED"
    echo
    echo "🌐 Interfaces de red:"
    ip addr show 2>/dev/null | grep -E "^[0-9]" | head -5 || ifconfig 2>/dev/null | grep -E "^[a-z]" | head -5
    pausar
}

operaciones_avanzadas() {
    imprimir "info" "Operaciones avanzadas en desarrollo"
    pausar
}

# Función principal
main() {
    # Verificar dependencias
    if ! command -v bc &> /dev/null; then
        imprimir "aviso" "bc no está instalado. Algunas funciones pueden no funcionar."
    fi

    # Inicializar log
    log "INFO" "Sistema iniciado por usuario: $usuario_actual"

    # Mostrar pantalla de bienvenida
    clear
    imprimir "titulo" "¡BIENVENIDO AL $SCRIPT_NAME!"
    echo
    imprimir "info" "Versión: $VERSION"
    imprimir "info" "Autor: $AUTOR"
    echo
    imprimir "exito" "Sistema inicializado correctamente"
    sleep 2

    # Ejecutar menú principal
    menu_principal
}

# Manejo de señales
trap 'echo; imprimir "aviso" "Sistema interrumpido por el usuario"; exit 1' INT TERM

# Ejecutar programa principal
main "$@"
EOF

chmod +x proyectos/sistema_menus_interactivo.sh
```

### 🚀 Demostración del Sistema

**[PANTALLA: Ejecución completa del sistema]**

> "¡Ejecutemos nuestro sistema completo y exploremos todas sus funcionalidades!"

```bash
# Ejecutar el sistema
./proyectos/sistema_menus_interactivo.sh

# El sistema mostrará:
# - Menú principal con opciones coloreadas
# - Gestión de archivos interactiva
# - Información del sistema en tiempo real
# - Calculadora funcional
# - Sistema de logging
# - Validación de entrada
# - Interfaz profesional
```

### 🎓 Resumen de Logros del Módulo 3

**[PANTALLA: Checklist completo]**

> "¡Increíble progreso! Has dominado todos los conceptos fundamentales de programación en Bash:"

- ✅ **Variables y expansión de parámetros** - Almacenamiento y manipulación de datos
- ✅ **Estructuras condicionales** - Lógica de decisión con if/else y case
- ✅ **Bucles eficientes** - Automatización con for, while y until
- ✅ **Argumentos de script** - Flexibilidad con getopts y parámetros
- ✅ **Entrada interactiva** - Interfaces de usuario profesionales
- ✅ **Sistema completo** - Proyecto integrado con todas las técnicas

### 🚀 Próximo Módulo

**[PANTALLA: Preview del Módulo 4]**

> "En el Módulo 4 - Funciones y Arrays aprenderemos:"

- Definición y uso de funciones
- Parámetros y valores de retorno
- Arrays unidimensionales y asociativos
- Bibliotecas de funciones reutilizables
- Proyecto: Gestor Interactivo de Archivos

### 🎬 Despedida

**[PANTALLA: Logo del bootcamp]**

> "¡Excelente trabajo en el Módulo 3! Has dado un salto enorme: ahora puedes crear programas reales con lógica, interactividad y funcionalidad profesional."

> "El sistema de menús que acabas de crear demuestra que ya tienes las habilidades para desarrollar herramientas útiles. En el próximo módulo organizaremos mejor nuestro código con funciones y manejaremos datos complejos con arrays."

> "¡Practica creando diferentes menús y sistemas interactivos, y nos vemos en el Módulo 4! ¡Hasta la próxima!"

---

## 📋 CHECKLIST DE PRODUCCIÓN

### Preparación del Entorno

- [ ] Scripts de demostración probados y funcionales
- [ ] Datos de ejemplo creados
- [ ] Colores de terminal configurados
- [ ] Dependencias verificadas (bc, etc.)

### Durante la Grabación

- [ ] Demostración completa del sistema interactivo
- [ ] Explicación de cada concepto paso a paso
- [ ] Ejecución en vivo de todos los ejemplos
- [ ] Manejo de errores y casos edge
- [ ] Enfoque en casos de uso reales

### Post-Producción

- [ ] Timestamps para navegación rápida
- [ ] Highlights en conceptos clave
- [ ] Zoom en código complejo
- [ ] Overlay con estructura actual
- [ ] Thumbnail atractivo con proyecto final

---

## 🎥 NOTAS TÉCNICAS

### Configuración Visual

- **Terminal**: Colores habilitados para mejor demostración
- **Split screen**: Código y ejecución simultáneos
- **Zoom apropiado**: Para scripts largos y menús
- **Transiciones suaves**: Entre diferentes secciones

### Puntos Clave para Edición

- Explicar la lógica detrás de cada estructura
- Mostrar alternativas para diferentes casos
- Enfatizar mejores prácticas desde el inicio
- Demostrar debugging de lógica compleja
- Incluir consejos de optimización

---

**¡Listo para crear un video excepcional del Módulo 3! 🚀**
```````
