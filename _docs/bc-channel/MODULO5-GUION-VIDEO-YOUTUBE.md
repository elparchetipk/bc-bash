# GUIÓN PARA VIDEO DE YOUTUBE - MÓDULO 5

## BOOTCAMP BASH SCRIPTING: MANIPULACIÓN AVANZADA DE DATOS

---

### 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bash Scripting Avanzado: Manipulación de Datos, Arrays y Expresiones Regulares | Módulo 5"

**Duración estimada:** 90-120 minutos

**Audiencia:** Programadores intermedios que han completado los módulos 1-4

**Objetivos del módulo:**

- Dominar arrays indexados y asociativos en Bash
- Comprender y aplicar expresiones regulares avanzadas
- Utilizar sed y awk para procesamiento complejo de texto
- Desarrollar un analizador de logs profesional

---

## 🎬 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y ARRAYS (0:00 - 25:00)

- Bienvenida e introducción al módulo
- Arrays indexados: declaración, acceso y manipulación
- Arrays asociativos: conceptos y casos de uso
- Operaciones avanzadas con arrays

### PARTE 2: EXPRESIONES REGULARES (25:00 - 50:00)

- Fundamentos de expresiones regulares
- Cuantificadores y clases de caracteres
- Grupos y capturas
- Integración con herramientas de Bash

### PARTE 3: SED Y AWK AVANZADOS (50:00 - 75:00)

- sed: hold space y comandos múltiples
- awk: variables, funciones y lógica compleja
- Casos de uso prácticos y pipelines

### PARTE 4: PROYECTO PRÁCTICO (75:00 - 120:00)

- Diseño del analizador de logs
- Implementación modular
- Testing y demostración
- Conclusiones y siguientes pasos

---

## 🎯 PARTE 1: INTRODUCCIÓN Y ARRAYS

### Tiempo: 0:00 - 25:00

#### [0:00 - 2:00] BIENVENIDA E INTRODUCCIÓN

**[PANTALLA: Logo del Bootcamp + Título del Módulo]**

¡Hola y bienvenidos de nuevo al Bootcamp de Bash Scripting! Soy tu instructor y hoy vamos a abordar uno de los módulos más emocionantes y transformadores de todo nuestro programa: el **Módulo 5 - Manipulación Avanzada de Datos**.

**[PANTALLA: Transición con gráfico mostrando la progresión del bootcamp]**

Si has seguido el bootcamp desde el principio, ya tienes una base sólida. En el Módulo 1 aprendiste los fundamentos, en el 2 dominaste comandos avanzados y pipes, en el 3 controlaste variables y flujo, y en el 4 conquistaste funciones y arrays básicos.

**[PANTALLA: Diagrama mostrando cómo se conectan los módulos]**

Hoy, en el Módulo 5, vamos a hacer un salto cualitativo. Vamos a transformarte de un programador de bash competente a alguien que puede manejar datos complejos como un verdadero experto. Al final de este módulo, podrás crear herramientas que rivalizan con scripts de Python para ciertas tareas.

**[PANTALLA: Preview del proyecto final - screenshots del analizador de logs]**

Y para demostrarlo, vamos a construir juntos un analizador de logs profesional que puede procesar logs de Apache, Nginx, aplicaciones personalizadas, detectar anomalías de seguridad, generar reportes ejecutivos, y crear dashboards HTML interactivos. ¡Es el tipo de herramienta que podrías usar mañana mismo en tu trabajo!

#### [2:00 - 3:30] ESTRUCTURA DEL MÓDULO

**[PANTALLA: Índice visual del módulo con iconos]**

Nuestro viaje de hoy está estructurado en tres lecciones principales más un proyecto práctico:

1. **Lección 5.1: Arrays y Estructuras de Datos** - Aprenderemos a organizar información compleja de manera eficiente
2. **Lección 5.2: Expresiones Regulares** - Dominaremos el "superpoder" para encontrar patrones en texto
3. **Lección 5.3: Procesamiento Avanzado con sed y awk** - Integraremos herramientas poderosas para transformaciones complejas
4. **Proyecto Práctico 5: Analizador de Logs** - Aplicaremos todo en una herramienta profesional

**[PANTALLA: Diagrama de flujo mostrando cómo cada lección contribuye al proyecto]**

Cada lección construye sobre la anterior, creando una progresión natural hacia la maestría. Los arrays nos dan la estructura, las expresiones regulares nos dan la precisión, sed y awk nos dan la potencia, y el proyecto final nos da la experiencia práctica.

#### [3:30 - 5:00] ¿POR QUÉ ESTE MÓDULO ES CRUCIAL?

**[PANTALLA: Gráfico mostrando estadísticas sobre volumen de datos en empresas]**

En el mundo actual, manejamos cantidades masivas de datos textuales: logs de servidores, archivos CSV, APIs JSON, configuraciones XML, reportes de sistemas. La capacidad de procesar, analizar y extraer insights de estos datos no es solo una habilidad técnica nice-to-have, es una **competencia esencial** para cualquier profesional técnico.

**[PANTALLA: Ejemplos visuales de tipos de datos que procesaremos]**

Las técnicas que aprenderás hoy te permitirán:

- Analizar logs de millones de líneas en segundos
- Extraer patrones complejos de datasets grandes
- Crear reportes automáticos que ahorren horas de trabajo manual
- Detectar problemas de seguridad y rendimiento proactivamente

**[PANTALLA: Testimonial imaginario o case study]**

Y lo mejor de todo: estas son habilidades nativas de Unix/Linux. No necesitas instalar Python, Java, o frameworks complejos. Todo lo que aprenderás funciona en cualquier sistema Unix/Linux out-of-the-box.

#### [5:00 - 8:00] LECCIÓN 5.1: INTRODUCCIÓN A ARRAYS

**[PANTALLA: Transición a Lección 5.1 con animación]**

¡Empezamos con la Lección 5.1: Arrays y Estructuras de Datos!

**[PANTALLA: Analogía visual - caja de herramientas con compartimentos numerados]**

Imagina que tienes una caja de herramientas donde cada compartimento tiene un número y dentro guardas diferentes herramientas. Esto es exactamente lo que hace un array: es un contenedor que nos permite almacenar múltiples valores bajo un mismo nombre, organizados por posición o por clave.

**[PANTALLA: Código en pantalla - terminal preparado]**

En Bash tenemos dos tipos principales de arrays:

1. **Arrays indexados**: Usan números como índices (0, 1, 2, etc.)
2. **Arrays asociativos**: Usan cadenas como índices (como "nombre", "edad", etc.)

Empezemos con los arrays indexados, que son los más comunes y fáciles de entender.

#### [8:00 - 12:00] ARRAYS INDEXADOS: DECLARACIÓN Y ASIGNACIÓN

**[PANTALLA: Terminal en vivo - creando archivo de ejemplo]**

```bash
# Vamos a crear nuestro primer script de ejemplo
nano arrays_basicos.sh
```

**[PANTALLA: Escribiendo código en vivo en el editor]**

```bash
#!/bin/bash
# arrays_basicos.sh - Ejemplos de arrays indexados
set -euo pipefail

echo "=== DECLARACIÓN DE ARRAYS ==="

# Método 1: Declaración explícita
declare -a servidores
servidores[0]="web01"
servidores[1]="web02"
servidores[2]="db01"

echo "Servidores declarados individualmente:"
echo "${servidores[@]}"

# Método 2: Asignación directa
nombres=("Juan" "María" "Carlos" "Ana")
echo "Nombres asignados directamente: ${nombres[@]}"

# Método 3: Desde la salida de un comando
archivos=($(ls *.sh))
echo "Scripts en el directorio actual: ${archivos[@]}"

# Método 4: Lectura desde archivo
# Primero creamos un archivo de ejemplo
echo -e "192.168.1.1\n192.168.1.2\n192.168.1.3" > ips.txt
readarray -t direcciones_ip < ips.txt
echo "IPs leídas desde archivo: ${direcciones_ip[@]}"
```

**[PANTALLA: Ejecutando el script paso a paso]**

```bash
chmod +x arrays_basicos.sh
./arrays_basicos.sh
```

**[EXPLICACIÓN MIENTRAS SE EJECUTA]**

Fíjate en varios puntos importantes aquí:

1. **`declare -a`** es la forma explícita de declarar un array, aunque no siempre es necesaria
2. **Los índices empiezan en 0**, como en la mayoría de lenguajes de programación
3. **`${array[@]}`** expande todos los elementos del array
4. **`readarray -t`** es la forma más robusta de leer líneas desde un archivo

#### [12:00 - 16:00] ACCESO Y MODIFICACIÓN DE ARRAYS

**[PANTALLA: Creando nuevo script más avanzado]**

```bash
nano arrays_avanzados.sh
```

```bash
#!/bin/bash
# arrays_avanzados.sh - Operaciones avanzadas con arrays
set -euo pipefail

# Inicializamos un array de ejemplo
servicios=("apache" "nginx" "mysql" "postgresql" "redis")

echo "=== ACCESO A ELEMENTOS ==="
echo "Primer servicio: ${servicios[0]}"
echo "Último servicio: ${servicios[-1]}"  # Bash 4.3+
echo "Tercer servicio: ${servicios[2]}"

echo -e "\n=== INFORMACIÓN DEL ARRAY ==="
echo "Todos los elementos: ${servicios[@]}"
echo "Número de elementos: ${#servicios[@]}"
echo "Índices disponibles: ${!servicios[@]}"

echo -e "\n=== MODIFICACIÓN DE ELEMENTOS ==="
servicios[1]="nginx-updated"
echo "Después de modificar índice 1: ${servicios[@]}"

# Agregar elementos
servicios+=("mongodb")
servicios+=("elasticsearch")
echo "Después de agregar elementos: ${servicios[@]}"

echo -e "\n=== SLICING DE ARRAYS ==="
echo "Primeros 3 elementos: ${servicios[@]:0:3}"
echo "Desde el índice 2: ${servicios[@]:2}"
echo "Últimos 2 elementos: ${servicios[@]: -2}"

echo -e "\n=== BÚSQUEDA EN ARRAYS ==="
buscar="mysql"
for i in "${!servicios[@]}"; do
    if [[ "${servicios[$i]}" == "$buscar" ]]; then
        echo "Encontrado '$buscar' en índice $i"
        break
    fi
done
```

**[PANTALLA: Ejecutando y explicando cada sección]**

```bash
chmod +x arrays_avanzados.sh
./arrays_avanzados.sh
```

**[EXPLICACIÓN EN VIVO]**

Lo que acabas de ver son técnicas que separan a un programador principiante de uno intermedio:

- **`${array[-1]}`** para acceder al último elemento (requiere Bash 4.3+)
- **`${#array[@]}`** para obtener la longitud
- **`${!array[@]}`** para obtener los índices (súper útil para arrays con gaps)
- **Slicing con `${array[@]:start:length}`** como en Python
- **Array expansion con `+=`** para agregar elementos eficientemente

#### [16:00 - 20:00] ITERACIÓN SOBRE ARRAYS

**[PANTALLA: Nuevo script enfocado en iteración]**

```bash
nano arrays_iteracion.sh
```

```bash
#!/bin/bash
# arrays_iteracion.sh - Técnicas de iteración
set -euo pipefail

# Array de ejemplo con datos de log
log_files=("/var/log/apache2/access.log" "/var/log/nginx/access.log"
           "/var/log/mysql/error.log" "/var/log/syslog")

echo "=== ITERACIÓN MÉTODO 1: Sobre elementos ==="
for archivo in "${log_files[@]}"; do
    echo "Procesando: $archivo"
    # Simulamos procesamiento
    echo "  - Tamaño: $(wc -c <<< "$archivo") bytes (simulado)"
done

echo -e "\n=== ITERACIÓN MÉTODO 2: Por índices ==="
for i in "${!log_files[@]}"; do
    echo "Archivo #$i: ${log_files[$i]}"
    # Útil cuando necesitas tanto el índice como el valor
done

echo -e "\n=== ITERACIÓN MÉTODO 3: Estilo C ==="
for ((i=0; i<${#log_files[@]}; i++)); do
    echo "Posición $i contiene: ${log_files[$i]}"
done

echo -e "\n=== ITERACIÓN CONDICIONAL ==="
for archivo in "${log_files[@]}"; do
    if [[ "$archivo" == *"error"* ]]; then
        echo "🚨 ARCHIVO DE ERROR ENCONTRADO: $archivo"
    elif [[ "$archivo" == *"access"* ]]; then
        echo "📊 Archivo de acceso: $archivo"
    else
        echo "📝 Otro tipo de log: $archivo"
    fi
done

echo -e "\n=== PROCESAMIENTO CON WHILE ==="
i=0
while [[ $i -lt ${#log_files[@]} ]]; do
    archivo="${log_files[$i]}"
    echo "Procesando archivo $((i+1))/${#log_files[@]}: $(basename "$archivo")"
    ((i++))
done
```

**[PANTALLA: Ejecutando con explicaciones detalladas]**

```bash
chmod +x arrays_iteracion.sh
./arrays_iteracion.sh
```

**[EXPLICACIÓN MIENTRAS SE EJECUTA]**

Fíjate en las diferentes técnicas de iteración:

1. **Iteración directa sobre elementos**: Más simple y legible
2. **Iteración por índices**: Útil cuando necesitas la posición
3. **Estilo C**: Familiar para programadores de otros lenguajes
4. **Iteración condicional**: Combina loops con lógica de negocio
5. **While loops**: Más control sobre la iteración

#### [20:00 - 25:00] ARRAYS ASOCIATIVOS

**[PANTALLA: Transición a arrays asociativos con animación]**

Ahora vamos a dar un salto conceptual importante. Los arrays asociativos son como un paso evolutivo de los arrays indexados. En lugar de usar números como índices, puedes usar palabras o frases que tengan significado.

**[PANTALLA: Analogía visual - agenda telefónica vs lista numerada]**

Piensa en un array asociativo como una agenda telefónica: en lugar de buscar por posición numérica, buscas por nombre de persona. Esto hace que tu código sea mucho más legible y mantenible.

**[PANTALLA: Nuevo script para arrays asociativos]**

```bash
nano arrays_asociativos.sh
```

```bash
#!/bin/bash
# arrays_asociativos.sh - Trabajando con arrays asociativos
set -euo pipefail

# Declaración obligatoria para arrays asociativos
declare -A servidor_info
declare -A metricas_sistema
declare -A usuarios_activos

echo "=== DECLARACIÓN Y ASIGNACIÓN ==="

# Método 1: Asignación individual
servidor_info["nombre"]="web01"
servidor_info["ip"]="192.168.1.10"
servidor_info["os"]="Ubuntu 22.04"
servidor_info["ram"]="16GB"
servidor_info["cpu"]="Intel Xeon"

echo "Información del servidor:"
for clave in "${!servidor_info[@]}"; do
    echo "  $clave: ${servidor_info[$clave]}"
done

# Método 2: Asignación múltiple
metricas_sistema=(
    ["cpu_usage"]="15%"
    ["memory_usage"]="8.2GB"
    ["disk_usage"]="45%"
    ["network_rx"]="1.2MB/s"
    ["network_tx"]="800KB/s"
    ["uptime"]="15 days"
)

echo -e "\nMétricas del sistema:"
for metrica in "${!metricas_sistema[@]}"; do
    echo "  $metrica: ${metricas_sistema[$metrica]}"
done

echo -e "\n=== OPERACIONES AVANZADAS ==="

# Verificar si existe una clave
if [[ -v servidor_info["ip"] ]]; then
    echo "✅ La IP del servidor está configurada: ${servidor_info["ip"]}"
fi

# Agregar nuevas entradas dinámicamente
servidor_info["puerto_ssh"]="22"
servidor_info["estado"]="activo"

echo -e "\nServidor después de agregar campos:"
for campo in nombre ip estado puerto_ssh; do
    if [[ -v servidor_info["$campo"] ]]; then
        echo "  $campo: ${servidor_info[$campo]}"
    fi
done

# Eliminar entradas
unset servidor_info["puerto_ssh"]
echo -e "\nDespués de eliminar puerto_ssh:"
echo "Claves restantes: ${!servidor_info[@]}"
```

**[PANTALLA: Ejecutando y explicando conceptos clave]**

```bash
chmod +x arrays_asociativos.sh
./arrays_asociativos.sh
```

**[EXPLICACIÓN FUNDAMENTAL]**

Los arrays asociativos requieren algunas consideraciones especiales:

1. **`declare -A` es obligatorio** - Sin esto, Bash los trata como arrays normales
2. **Las claves pueden ser cualquier string** - Incluso con espacios si usas comillas
3. **`-v` para verificar existencia** - `[[ -v array["key"] ]]` es la forma correcta
4. **`unset` para eliminar** - Elimina tanto la clave como el valor

---

**[PANTALLA: Transición visual indicando final de Parte 1]**

¡Perfecto! Hemos completado la primera parte de nuestro módulo. Has dominado arrays indexados y asociativos, que son la base para todo lo que viene. En los próximos 25 minutos, vamos a explorar el fascinante mundo de las expresiones regulares.

**[PANTALLA: Preview de la Parte 2 con ejemplos visuales de regex]**

Las expresiones regulares son como un "lenguaje secreto" que te permite encontrar patrones en texto de manera increíblemente precisa. Te veo en la Parte 2, donde aprenderemos a buscar emails, validar números de teléfono, y extraer datos complejos con patrones sofisticados.

¡No te vayas, que esto se pone muy emocionante!

---

_[Fin de la Parte 1 del guión]_
