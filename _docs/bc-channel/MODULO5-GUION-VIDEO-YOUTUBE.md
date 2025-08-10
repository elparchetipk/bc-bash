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

## 🎯 PARTE 2: EXPRESIONES REGULARES

### Tiempo: 25:00 - 50:00

#### [25:00 - 27:00] BIENVENIDA A LA PARTE 2 E INTRODUCCIÓN

**[PANTALLA: Transición animada con título "Parte 2: Expresiones Regulares"]**

¡Bienvenidos de vuelta! Espero que hayas disfrutado experimentando con arrays durante el descanso. Ahora vamos a adentrarnos en uno de los temas más poderosos y transformadores del bash scripting: **las Expresiones Regulares**.

**[PANTALLA: Analogía visual - detective con lupa examinando documentos]**

Imagina que eres detective y necesitas encontrar pistas específicas en miles de documentos. Las expresiones regulares son como tener una lupa mágica que puede encontrar exactamente lo que buscas, sin importar cuán complejo sea el patrón.

**[PANTALLA: Comparación visual entre búsqueda literal vs búsqueda por patrones]**

No buscan solo texto literal como "buscar juan en el documento", sino que pueden buscar **patrones** como:

- "Cualquier palabra que empiece con J, tenga entre 4 y 8 letras, y termine en vocal"
- "Todos los emails en este archivo"
- "Fechas en formato dd/mm/yyyy"
- "Números de teléfono en cualquier formato común"

**[PANTALLA: Estadística visual sobre el impacto de dominar regex]**

Las expresiones regulares son una de esas habilidades que, una vez que las dominas, cambian completamente tu forma de trabajar con texto y datos. Son utilizadas en prácticamente todos los lenguajes de programación y herramientas de procesamiento de texto.

#### [27:00 - 32:00] FUNDAMENTOS Y PATRONES BÁSICOS

**[PANTALLA: Terminal preparado + editor de texto]**

Empezemos con los elementos más básicos. Cada símbolo en una expresión regular tiene un significado específico, como aprender el alfabeto antes de formar palabras.

**[PANTALLA: Creando archivo de práctica]**

```bash
# Primero creamos datos de ejemplo para practicar
nano datos_ejemplo.txt
```

**[PANTALLA: Escribiendo datos de ejemplo en vivo]**

```text
Juan Pérez - email: juan.perez@empresa.com - Tel: 555-1234
María García - email: maria.garcia@universidad.edu - Tel: (555) 987-6543
Carlos López - email: c.lopez@startup.io - Tel: 555.789.0123
Ana Rodríguez - email: ana.rodriguez@consultoria.org - Tel: +1-555-456-7890

Logs del servidor:
[2024-03-15 09:15:30] INFO: Usuario 'admin' inició sesión desde 192.168.1.100
[2024-03-15 09:16:45] WARNING: Intento de acceso fallido desde 10.0.0.50
[2024-03-15 09:17:12] ERROR: Base de datos no responde en puerto 3306
[2024-03-15 10:25:18] INFO: Backup completado - 2.5GB transferidos

Productos y precios:
- Laptop HP ProBook: $899.99
- Mouse inalámbrico: $29.95
- Monitor 24": $199.00
- Teclado mecánico: $79.99
```

**[PANTALLA: Guardando y empezando con ejemplos básicos]**

Ahora vamos a crear nuestro primer script de expresiones regulares:

```bash
nano regex_basicos.sh
```

```bash
#!/bin/bash
# regex_basicos.sh - Fundamentos de expresiones regulares
set -euo pipefail

ARCHIVO="datos_ejemplo.txt"

echo "=== PATRONES LITERALES ==="
echo "Buscando la palabra 'email':"
grep "email" "$ARCHIVO"

echo -e "\n=== METACARACTERES BÁSICOS ==="
echo "El punto (.) coincide con cualquier carácter:"
grep "..@" "$ARCHIVO"  # Cualquier cosa seguida de @

echo -e "\nEl asterisco (*) significa 'cero o más del carácter anterior':"
grep "55*" "$ARCHIVO"  # 5 seguido de cero o más 5s

echo -e "\n=== ANCLAS ==="
echo "Líneas que empiezan con '[' (inicio de línea):"
grep "^\\[" "$ARCHIVO"

echo -e "\nLíneas que terminan con un número (final de línea):"
grep "[0-9]$" "$ARCHIVO"

echo -e "\n=== CLASES DE CARACTERES ==="
echo "Cualquier dígito [0-9]:"
grep "[0-9]" "$ARCHIVO"

echo -e "\nVocales [aeiou]:"
grep "[aeiou]" "$ARCHIVO"

echo -e "\nNo dígitos [^0-9] (negación):"
grep "[^0-9]" "$ARCHIVO" | head -3  # Solo primeras 3 líneas
```

**[PANTALLA: Ejecutando y explicando cada patrón]**

```bash
chmod +x regex_basicos.sh
./regex_basicos.sh
```

**[EXPLICACIÓN MIENTRAS SE EJECUTA]**

Fíjate en los conceptos fundamentales:

1. **Caracteres literales**: Buscan exactamente lo que escribes
2. **Metacaracteres**: Tienen significados especiales (. \* ^ $ [ ] \ | ( ) + ? { })
3. **Anclas**: `^` para inicio de línea, `$` para final
4. **Clases de caracteres**: `[abc]` coincide con a, b, o c
5. **Negación**: `[^abc]` coincide con cualquier cosa EXCEPTO a, b, o c

#### [32:00 - 37:00] CUANTIFICADORES - EL PODER DE LA REPETICIÓN

**[PANTALLA: Nuevo script enfocado en cuantificadores]**

Los cuantificadores son como especificar "cuántas veces" quieres que algo aparezca. Es la diferencia entre buscar "una letra" versus "entre 3 y 5 letras".

```bash
nano regex_cuantificadores.sh
```

```bash
#!/bin/bash
# regex_cuantificadores.sh - Cuantificadores y repetición
set -euo pipefail

ARCHIVO="datos_ejemplo.txt"

echo "=== CUANTIFICADORES BÁSICOS ==="

echo "* = cero o más repeticiones:"
echo "Números seguidos de ceros o más dígitos:"
grep -E "[0-9][0-9]*" "$ARCHIVO"

echo -e "\n+ = una o más repeticiones:"
echo "Al menos un dígito seguido de más dígitos:"
grep -E "[0-9]+" "$ARCHIVO"

echo -e "\n? = cero o una repetición (opcional):"
echo "Color con 'u' opcional (color/colour):"
echo -e "color\ncolour\ncolooour" | grep -E "colou?r"

echo -e "\n=== CUANTIFICADORES ESPECÍFICOS ==="

echo "{n} = exactamente n repeticiones:"
echo "Exactamente 3 dígitos seguidos:"
grep -E "[0-9]{3}" "$ARCHIVO"

echo -e "\n{n,} = n o más repeticiones:"
echo "4 o más dígitos seguidos:"
grep -E "[0-9]{4,}" "$ARCHIVO"

echo -e "\n{n,m} = entre n y m repeticiones:"
echo "Entre 2 y 4 letras seguidas:"
grep -E "[a-zA-Z]{2,4}" "$ARCHIVO"

echo -e "\n=== EJEMPLOS PRÁCTICOS ==="

echo "Validando formatos de teléfono:"
echo "Patrón: 3 dígitos, guión, 4 dígitos"
grep -E "[0-9]{3}-[0-9]{4}" "$ARCHIVO"

echo -e "\nBuscando precios ($ seguido de dígitos y punto decimal):"
grep -E "\\$[0-9]+\\.[0-9]{2}" "$ARCHIVO"

echo -e "\nFechas en formato YYYY-MM-DD:"
grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}" "$ARCHIVO"
```

**[PANTALLA: Ejecutando con explicaciones detalladas]**

```bash
chmod +x regex_cuantificadores.sh
./regex_cuantificadores.sh
```

**[EXPLICACIÓN EN VIVO]**

Los cuantificadores transforman las expresiones regulares de herramientas básicas a instrumentos precisos:

- **`*`**: "Cero o más" - muy permisivo
- **`+`**: "Uno o más" - requiere al menos una ocurrencia
- **`?`**: "Opcional" - puede estar o no estar
- **`{n}`**: "Exactamente n" - precisión exacta
- **`{n,m}`**: "Entre n y m" - rangos flexibles

#### [37:00 - 42:00] CLASES DE CARACTERES AVANZADAS

**[PANTALLA: Transición a clases POSIX y caracteres especiales]**

Las clases de caracteres básicas como `[0-9]` son útiles, pero existe un mundo mucho más rico. Las clases POSIX nos dan precisión profesional para trabajar con texto internacional.

```bash
nano regex_clases_avanzadas.sh
```

```bash
#!/bin/bash
# regex_clases_avanzadas.sh - Clases de caracteres profesionales
set -euo pipefail

# Creamos datos con caracteres internacionales
cat << 'EOF' > datos_internacionales.txt
Nombres: José, François, Müller, Øystein, Łukasz
Emails: jose@example.com, françois@université.fr, müller@firma.de
URLs: https://www.google.com, http://españa.es, ftp://files.org
Códigos: ABC123, XYZ789, #hashtag, @usuario, 50% descuento
Fechas: 2024-03-15, 15/03/2024, Mar 15 2024
EOF

ARCHIVO="datos_internacionales.txt"

echo "=== CLASES POSIX BÁSICAS ==="

echo "[:alpha:] = letras (incluyendo acentos):"
grep -E "[[:alpha:]]+" "$ARCHIVO"

echo -e "\n[:digit:] = dígitos:"
grep -E "[[:digit:]]+" "$ARCHIVO"

echo -e "\n[:alnum:] = alfanumérico:"
grep -E "[[:alnum:]]+" "$ARCHIVO"

echo -e "\n[:space:] = espacios en blanco:"
grep -E "[[:space:]]" "$ARCHIVO" | head -2

echo -e "\n=== CLASES POSIX AVANZADAS ==="

echo "[:upper:] = mayúsculas:"
grep -E "[[:upper:]]{2,}" "$ARCHIVO"

echo -e "\n[:lower:] = minúsculas:"
grep -E "[[:lower:]]{3,}" "$ARCHIVO"

echo -e "\n[:punct:] = puntuación:"
grep -E "[[:punct:]]" "$ARCHIVO"

echo -e "\n=== COMBINACIONES PROFESIONALES ==="

echo "Emails válidos (patrón básico):"
grep -E "[[:alnum:]._-]+@[[:alnum:].-]+\\.[[:alpha:]]{2,}" "$ARCHIVO"

echo -e "\nURLs (http/https/ftp):"
grep -E "(https?|ftp)://[[:alnum:].-]+\\.[[:alpha:]]{2,}" "$ARCHIVO"

echo -e "\nCódigos alfanuméricos (letras + números):"
grep -E "[[:upper:]]+[[:digit:]]+" "$ARCHIVO"

echo -e "\n=== ESCAPES Y CARACTERES ESPECIALES ==="

echo "Símbolos especiales escapados:"
grep -E "\\$|%|#|@" "$ARCHIVO"

echo -e "\nParéntesis literales (escapados):"
echo "(ejemplo)" | grep -E "\\([[:alpha:]]+\\)"

echo -e "\nPuntos literales en nombres de archivo:"
echo "archivo.txt" | grep -E "[[:alnum:]]+\\.[[:alpha:]]{3}"
```

**[PANTALLA: Ejecutando con explicaciones sobre internacionalización]**

```bash
chmod +x regex_clases_avanzadas.sh
./regex_clases_avanzadas.sh
```

**[EXPLICACIÓN CRÍTICA]**

Las clases POSIX son cruciales para código profesional porque:

1. **`[[:alpha:]]` incluye acentos** - `[a-z]` no reconoce ñ, é, ü
2. **Son independientes del locale** - Funcionan consistentemente
3. **Más legibles** - `[[:digit:]]` es más claro que `[0-9]`
4. **Compatibilidad internacional** - Esencial para aplicaciones globales

#### [42:00 - 47:00] GRUPOS Y CAPTURAS

**[PANTALLA: Transición a la característica más poderosa]**

Los grupos y capturas son la característica más poderosa de las expresiones regulares. No solo te permiten buscar patrones, sino también extraer y manipular partes específicas.

```bash
nano regex_grupos_capturas.sh
```

```bash
#!/bin/bash
# regex_grupos_capturas.sh - Grupos y capturas avanzadas
set -euo pipefail

# Datos de ejemplo más complejos
cat << 'EOF' > logs_servidor.txt
2024-03-15 09:15:30 [SECURITY] LOGIN_SUCCESS user=admin ip=192.168.1.100 session=abc123
2024-03-15 09:16:45 [SECURITY] LOGIN_FAILED user=guest ip=10.0.0.50 reason=invalid_password
2024-03-15 09:17:12 [SECURITY] LOGIN_FAILED user=guest ip=10.0.0.50 reason=invalid_password
2024-03-15 09:18:01 [SECURITY] LOGIN_FAILED user=admin ip=10.0.0.50 reason=invalid_password
2024-03-15 09:19:33 [SECURITY] FILE_ACCESS user=admin file=/etc/passwd action=read
2024-03-15 09:20:15 [SECURITY] LOGIN_SUCCESS user=operator ip=192.168.1.101 session=def456
2024-03-15 09:21:22 [SECURITY] LOGIN_FAILED user=guest ip=10.0.0.50 reason=invalid_password
2024-03-15 09:22:45 [SECURITY] PERMISSION_DENIED user=operator file=/root/secret.txt
2024-03-15 09:23:12 [SECURITY] LOGOUT user=admin session=abc123
EOF

ARCHIVO="logs_servidor.txt"

echo "=== GRUPOS BÁSICOS ==="

echo "Agrupando con paréntesis ():"
echo "Fechas y horas juntas:"
grep -E "(2024-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})" "$ARCHIVO"

echo -e "\nAlternativas con | (OR):"
echo "Métodos HTTP específicos:"
grep -E "(GET|POST|DELETE)" "$ARCHIVO"

echo -e "\n=== CAPTURAS CON SED ==="

echo "Extrayendo solo las fechas:"
sed -E 's/^([0-9]{4}-[0-9]{2}-[0-9]{2}).*/\\1/' "$ARCHIVO"

echo -e "\nExtrayendo método y URL:"
sed -E 's/.*\\[.*\\] ([A-Z]+) ([^ ]+).*/Método: \\1, URL: \\2/' "$ARCHIVO"

echo -e "\nTransformando formato de hora:"
sed -E 's/([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}):[0-9]{2}/\\1 \\2/' "$ARCHIVO"

echo -e "\n=== CAPTURAS CON AWK ==="

echo "Analizando tiempos de respuesta:"
awk '{
    if (match($0, /([0-9]+\.[0-9]+)s/, tiempo)) {
        if (tiempo[1] > 1.0) {
            print "⚠️  LENTO:", $0
        } else if (tiempo[1] > 0.5) {
            print "⚡ MEDIO:", $0
        } else {
            print "✅ RÁPIDO:", $0
        }
    }
}' "$ARCHIVO"

echo -e "\n=== VALIDACIÓN AVANZADA ==="

# Creamos datos para validar
cat << 'EOF' > datos_validacion.txt
juan.perez@empresa.com
maria.garcia@universidad.edu
invalido@
@dominio.com
correo.valido@sub.dominio.org
usuario_123@test-site.co.uk
EOF

echo "Emails válidos (patrón robusto):"
grep -E "^[[:alnum:]._-]+@[[:alnum:]-]+\\.[[:alpha:]]{2,}(\\.[[:alpha:]]{2,})?$" datos_validacion.txt

echo -e "\n=== REEMPLAZO INTELIGENTE ==="

echo "Anonimizando IPs en logs (manteniendo estructura):"
echo "192.168.1.100 - Usuario accedió" | sed -E 's/([0-9]{1,3}\\.){3}[0-9]{1,3}/XXX.XXX.XXX.XXX/'

echo -e "\nFormateando números de teléfono:"
echo "5551234567" | sed -E 's/([0-9]{3})([0-9]{3})([0-9]{4})/(\\1) \\2-\\3/'

echo -e "\nExtrayendo dominios de emails:"
sed -E 's/.*@([[:alnum:]-]+\\.[[:alpha:]]{2,}).*/\\1/' datos_validacion.txt | grep -v "@"
```

**[PANTALLA: Ejecutando paso a paso con explicaciones detalladas]**

```bash
chmod +x regex_grupos_capturas.sh
./regex_grupos_capturas.sh
```

**[EXPLICACIÓN AVANZADA]**

Los grupos y capturas nos permiten:

1. **`()` para agrupar** - Tratar múltiples caracteres como unidad
2. **`|` para alternativas** - "esto O aquello"
3. **`\\1, \\2, \\3`** - Referencias a grupos capturados
4. **Validación robusta** - Patrones que rechazan datos inválidos
5. **Transformación inteligente** - Reorganizar datos manteniendo estructura

#### [47:00 - 50:00] INTEGRACIÓN CON HERRAMIENTAS DE BASH

**[PANTALLA: Mostrando el poder combinado]**

Ahora que dominas las expresiones regulares, veamos cómo se integran perfectamente con las herramientas más poderosas de Bash. Esta integración es donde la magia realmente sucede.

```bash
nano regex_herramientas_bash.sh
```

```bash
#!/bin/bash
# regex_herramientas_bash.sh - Integración con herramientas de Bash
set -euo pipefail

# Creamos un log más realista
cat << 'EOF' > access_log.txt
192.168.1.101 - - [15/Mar/2024:09:15:30 +0000] "GET /index.html HTTP/1.1" 200 2326
10.0.0.50 - - [15/Mar/2024:09:16:45 +0000] "POST /login HTTP/1.1" 401 1024
192.168.1.102 - - [15/Mar/2024:09:17:12 +0000] "GET /api/users HTTP/1.1" 200 5120
10.0.0.50 - - [15/Mar/2024:09:18:01 +0000] "POST /login HTTP/1.1" 401 1024
192.168.1.103 - - [15/Mar/2024:09:19:33 +0000] "GET /products HTTP/1.1" 200 8192
192.168.1.101 - - [15/Mar/2024:09:20:15 +0000] "GET /cart HTTP/1.1" 200 3072
10.0.0.50 - - [15/Mar/2024:09:21:22 +0000] "POST /login HTTP/1.1" 401 1024
EOF

ARCHIVO="access_log.txt"

echo "=== GREP AVANZADO ==="

echo "Encontrar intentos de login fallidos:"
grep -E "POST /login.*401" "$ARCHIVO"

echo -e "\nIPs sospechosas (múltiples 401s):"
grep -E "POST /login.*401" "$ARCHIVO" | \
grep -oE "^[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+" | \
sort | uniq -c | sort -nr

echo -e "\n=== SED PARA TRANSFORMACIÓN ==="

echo "Extraer solo IP, hora y código de estado:"
sed -E 's/^([0-9.]+).*\\[([^]]+)\\].*" ([0-9]{3}).*/\\1 \\2 \\3/' "$ARCHIVO"

echo -e "\nConvertir a formato CSV:"
sed -E 's/^([0-9.]+).*\\[([^]]+)\\].*"([^"]+)".*([0-9]{3}) ([0-9]+)/\\1,\\2,\\3,\\4,\\5/' "$ARCHIVO"

echo -e "\n=== AWK PARA ANÁLISIS ==="

echo "Análisis estadístico por código de estado:"
awk '{
    if (match($0, /" ([0-9]{3}) /, codigo)) {
        contadores[codigo[1]]++
        total++
    }
} END {
    print "📊 RESUMEN DE CÓDIGOS DE ESTADO:"
    for (codigo in contadores) {
        porcentaje = (contadores[codigo] / total) * 100
        printf "  %s: %d requests (%.1f%%)\n", codigo, contadores[codigo], porcentaje
    }
}' "$ARCHIVO"

echo -e "\nDetección de ataques de fuerza bruta:"
awk '{
    if (match($0, /^([0-9.]+).*POST \/login.*401/, datos)) {
        ip = datos[1]
        intentos_fallidos[ip]++
        if (intentos_fallidos[ip] >= 3) {
            if (!alertado[ip]) {
                print "🚨 ALERTA: IP " ip " tiene " intentos_fallidos[ip] " intentos fallidos"
                alertado[ip] = 1
            }
        }
    }
}' "$ARCHIVO"

echo -e "\n=== PIPELINE COMPLEJO ==="

echo "Top 3 IPs por tráfico (bytes transferidos):"
grep -E "GET.*200" "$ARCHIVO" | \
sed -E 's/^([0-9.]+).*" 200 ([0-9]+)/\\1 \\2/' | \
awk '{bytes[$1] += $2} END {
    for (ip in bytes) {
        print bytes[ip], ip
    }
}' | \
sort -nr | \
head -3 | \
awk '{printf "  %s: %d bytes\n", $2, $1}'

echo -e "\nHorario de mayor actividad:"
sed -E 's/.*\\[.*:([0-9]{2}):[0-9]{2}:[0-9]{2}.*/\\1/' "$ARCHIVO" | \
sort | uniq -c | sort -nr | head -1 | \
awk '{print "🕐 Hora pico: " $2 ":00 con " $1 " requests"}'
```

**[PANTALLA: Ejecutando el pipeline completo]**

```bash
chmod +x regex_herramientas_bash.sh
./regex_herramientas_bash.sh
```

**[EXPLICACIÓN FINAL DE PARTE 2]**

¡Mira lo que acabas de lograr! Has combinado expresiones regulares con:

- **grep** para encontrar patrones complejos
- **sed** para transformar y extraer datos
- **awk** para análisis estadístico en tiempo real
- **pipelines** para crear soluciones sofisticadas como un verdadero profesional

Esta integración te permite crear herramientas de análisis que rivalizan con scripts de Python, pero usando solo herramientas nativas de Unix/Linux.

---

**[PANTALLA: Resumen visual de logros de Parte 2]**

¡Increíble progreso! En estos 25 minutos has dominado:

✅ **Fundamentos sólidos**: Caracteres literales, metacaracteres y anclas
✅ **Cuantificadores precisos**: Control exacto sobre repeticiones  
✅ **Clases POSIX profesionales**: Soporte internacional robusto
✅ **Grupos y capturas**: Extracción y transformación inteligente
✅ **Integración experta**: Combinación poderosa con grep, sed y awk

**[PANTALLA: Preview de la Parte 3]**

En la Parte 3 vamos a llevar sed y awk al siguiente nivel. Aprenderás técnicas avanzadas como el "hold space" de sed para manipulaciones multi-línea, funciones personalizadas en awk, y cómo crear pipelines que pueden procesar datos tan sofisticadamente como herramientas de ciencia de datos.

¡Nos vemos en la Parte 3, donde construiremos soluciones de nivel profesional!

---

_[Fin de la Parte 2 del guión]_

## 🎯 PARTE 3: SED Y AWK AVANZADOS

### Tiempo: 50:00 - 75:00

#### [50:00 - 52:00] BIENVENIDA A LA PARTE 3 Y VISIÓN GENERAL

**[PANTALLA: Transición animada con título "Parte 3: sed y awk Avanzados"]**

¡Bienvenidos de vuelta a la Parte 3! Si has seguido las dos partes anteriores, ya tienes una base sólida en arrays y expresiones regulares. Ahora vamos a integrar todo ese conocimiento en herramientas que son verdaderamente transformadoras.

**[PANTALLA: Analogía visual - director de orquesta coordinando músicos]**

Imagina que eres el director de una orquesta sinfónica. En las partes anteriores aprendiste a leer partituras (expresiones regulares) y a organizar instrumentos (arrays). Ahora vas a aprender a dirigir la orquesta completa, donde sed y awk son tus músicos virtuosos, cada uno con habilidades únicas y complementarias.

**[PANTALLA: Comparación visual entre herramientas básicas vs avanzadas]**

Lo que veremos hoy trasciende el uso básico de sed y awk:

- **sed básico**: "buscar y reemplazar"
- **sed avanzado**: "memoria temporal, comandos múltiples, transformaciones complejas"
- **awk básico**: "imprimir columnas"
- **awk avanzado**: "funciones personalizadas, análisis estadístico, mini-programas"

**[PANTALLA: Preview de lo que construiremos]**

Al final de esta parte, habrás creado soluciones que pueden:

- Procesar logs multi-línea complejos
- Generar reportes financieros automáticos
- Detectar patrones de seguridad sofisticados
- Transformar datos como un científico de datos

#### [52:00 - 58:00] SED AVANZADO: HOLD SPACE Y COMANDOS MÚLTIPLES

**[PANTALLA: Introducción conceptual al hold space]**

sed tiene un concepto único llamado **"hold space"** que es como tener una memoria temporal donde puedes guardar líneas de texto para usarlas más tarde. Es como tener un bloc de notas al lado mientras trabajas, donde anotas información importante para consultarla después.

**[PANTALLA: Diagrama visual del pattern space vs hold space]**

sed maneja dos espacios de memoria:

- **Pattern space**: donde procesa la línea actual
- **Hold space**: memoria temporal persistente entre líneas

**[PANTALLA: Terminal preparado para ejemplos prácticos]**

Vamos a crear ejemplos que demuestren el poder del hold space:

```bash
nano sed_avanzado.sh
```

```bash
#!/bin/bash
# sed_avanzado.sh - Técnicas avanzadas de sed
set -euo pipefail

# Creamos datos de ejemplo complejos
cat << 'EOF' > transacciones.txt
INICIO_TRANSACCION
Usuario: juan.perez
Fecha: 2024-03-15
Tipo: COMPRA
Producto: Laptop HP
Precio: 899.99
Estado: COMPLETADA
FIN_TRANSACCION

INICIO_TRANSACCION
Usuario: maria.garcia
Fecha: 2024-03-15
Tipo: DEVOLUCION
Producto: Mouse inalámbrico
Precio: -29.95
Estado: PROCESANDO
FIN_TRANSACCION

INICIO_TRANSACCION
Usuario: carlos.lopez
Fecha: 2024-03-16
Tipo: COMPRA
Producto: Monitor 24"
Precio: 199.00
Estado: COMPLETADA
FIN_TRANSACCION
EOF

echo "=== HOLD SPACE BÁSICO ==="

echo "Intercambiar líneas consecutivas:"
echo -e "línea 1\nlínea 2\nlínea 3\nlínea 4" | sed 'N;s/\(.*\)\n\(.*\)/\2\n\1/'

echo -e "\n=== ACUMULACIÓN EN HOLD SPACE ==="

echo "Acumular todas las líneas y mostrar al final:"
echo -e "primera\nsegunda\ntercera" | sed '1h;2,$H;$!d;${g;s/\n/ | /g;}'

echo -e "\n=== PROCESAMIENTO DE BLOQUES ==="

echo "Extraer solo transacciones COMPLETADAS:"
sed -n '/INICIO_TRANSACCION/,/FIN_TRANSACCION/{
    /INICIO_TRANSACCION/h
    /Usuario:/H
    /Producto:/H
    /Precio:/H
    /Estado: COMPLETADA/H
    /Estado: COMPLETADA/{
        g
        s/\n/ | /g
        p
    }
}' transacciones.txt

echo -e "\n=== COMANDOS MÚLTIPLES AVANZADOS ==="

echo "Formatear transacciones como resumen:"
sed -n '/INICIO_TRANSACCION/,/FIN_TRANSACCION/{
    /Usuario:/{
        s/Usuario: //
        h
    }
    /Producto:/{
        s/Producto: //
        H
    }
    /Precio:/{
        s/Precio: //
        H
    }
    /Estado: COMPLETADA/{
        g
        s/\n/ - /g
        s/^/✅ COMPLETADA: /
        p
    }
    /Estado: PROCESANDO/{
        g
        s/\n/ - /g
        s/^/⏳ PROCESANDO: /
        p
    }
}' transacciones.txt

echo -e "\n=== TRANSFORMACIÓN COMPLEJA ==="

echo "Convertir a formato CSV:"
sed -n '/INICIO_TRANSACCION/,/FIN_TRANSACCION/{
    /Usuario:/s/Usuario: //
    /Fecha:/s/Fecha: //
    /Tipo:/s/Tipo: //
    /Producto:/s/Producto: //
    /Precio:/s/Precio: //
    /Estado:/s/Estado: //
    /INICIO_TRANSACCION/{
        x
        s/.*//
        x
    }
    /Usuario:\|Fecha:\|Tipo:\|Producto:\|Precio:\|Estado:/{
        H
    }
    /FIN_TRANSACCION/{
        g
        s/\n/,/g
        s/^,//
        p
    }
}' transacciones.txt
```

**[PANTALLA: Ejecutando paso a paso con explicaciones detalladas]**

```bash
chmod +x sed_avanzado.sh
./sed_avanzado.sh
```

**[EXPLICACIÓN MIENTRAS SE EJECUTA]**

Los comandos de hold space que acabas de ver:

- **`h`**: Copia pattern space a hold space (sobrescribe)
- **`H`**: Añade pattern space a hold space (acumula)
- **`g`**: Copia hold space a pattern space
- **`G`**: Añade hold space a pattern space
- **`x`**: Intercambia pattern space y hold space

#### [58:00 - 65:00] AWK AVANZADO: VARIABLES, FUNCIONES Y LÓGICA COMPLEJA

**[PANTALLA: Transición conceptual a awk como lenguaje de programación]**

Mientras que sed es como un cirujano especializado, awk es como un científico de datos completo. No solo puede procesar texto línea por línea, sino que puede llevar registros, hacer cálculos complejos, mantener variables entre líneas, y hasta definir sus propias funciones personalizadas.

**[PANTALLA: Arquitectura de awk: BEGIN, main, END]**

awk opera en tres fases:

1. **BEGIN**: Inicialización (una sola vez)
2. **Main**: Procesamiento línea por línea
3. **END**: Finalización y reportes (una sola vez)

```bash
nano awk_avanzado.sh
```

```bash
#!/bin/bash
# awk_avanzado.sh - Técnicas avanzadas de awk
set -euo pipefail

# Creamos datos financieros realistas
cat << 'EOF' > ventas_datos.txt
2024-03-15,ELECTRONICA,Laptop HP,899.99,juan.perez,COMPLETADA
2024-03-15,HOGAR,Aspiradora,129.99,maria.garcia,COMPLETADA
2024-03-15,ELECTRONICA,Mouse,29.95,carlos.lopez,COMPLETADA
2024-03-16,ROPA,Camiseta,19.99,ana.rodriguez,DEVOLUCION
2024-03-16,ELECTRONICA,Monitor,199.00,luis.martin,COMPLETADA
2024-03-16,HOGAR,Cafetera,79.99,sofia.ruiz,COMPLETADA
2024-03-17,ELECTRONICA,Teclado,89.99,miguel.torres,COMPLETADA
2024-03-17,ROPA,Pantalones,49.99,elena.jimenez,COMPLETADA
2024-03-17,ELECTRONICA,Auriculares,159.99,david.morales,COMPLETADA
EOF

echo "=== VARIABLES Y CONTADORES AVANZADOS ==="

awk -F',' '
BEGIN {
    print "📊 ANÁLISIS DE VENTAS AVANZADO"
    print "================================"
    total_ventas = 0
    total_transacciones = 0
}

# Procesamiento principal
{
    fecha = $1
    categoria = $2
    producto = $3
    precio = $4
    vendedor = $5
    estado = $6

    # Solo procesar ventas completadas
    if (estado == "COMPLETADA") {
        # Contadores por categoría
        ventas_categoria[categoria] += precio
        cantidad_categoria[categoria]++

        # Contadores por vendedor
        ventas_vendedor[vendedor] += precio
        cantidad_vendedor[vendedor]++

        # Contadores por fecha
        ventas_fecha[fecha] += precio

        # Totales generales
        total_ventas += precio
        total_transacciones++

        # Tracking del producto más caro
        if (precio > precio_maximo) {
            precio_maximo = precio
            producto_mas_caro = producto
        }
    } else {
        devoluciones++
    }
}

END {
    print "\n🏆 RESUMEN EJECUTIVO:"
    printf "   Total ventas: $%.2f\n", total_ventas
    printf "   Transacciones: %d\n", total_transacciones
    printf "   Promedio por venta: $%.2f\n", total_ventas/total_transacciones
    printf "   Producto más caro: %s ($%.2f)\n", producto_mas_caro, precio_maximo
    if (devoluciones > 0) printf "   Devoluciones: %d\n", devoluciones

    print "\n📈 VENTAS POR CATEGORÍA:"
    for (cat in ventas_categoria) {
        promedio = ventas_categoria[cat] / cantidad_categoria[cat]
        porcentaje = (ventas_categoria[cat] / total_ventas) * 100
        printf "   %-12s: $%7.2f (%2d ventas, promedio: $%.2f, %.1f%%)\n",
               cat, ventas_categoria[cat], cantidad_categoria[cat], promedio, porcentaje
    }

    print "\n👥 TOP 3 VENDEDORES:"
    # Crear array ordenado por ventas
    n = asorti(ventas_vendedor, vendedores_ordenados)
    for (i = n; i >= n-2 && i >= 1; i--) {
        vendedor = vendedores_ordenados[i]
        printf "   %d. %-15s: $%7.2f (%d ventas)\n",
               n-i+1, vendedor, ventas_vendedor[vendedor], cantidad_vendedor[vendedor]
    }

    print "\n📅 VENTAS POR DÍA:"
    for (fecha in ventas_fecha) {
        printf "   %s: $%.2f\n", fecha, ventas_fecha[fecha]
    }
}' ventas_datos.txt

echo -e "\n=== FUNCIONES PERSONALIZADAS ==="

awk -F',' '
# Función para formatear moneda
function formatear_moneda(cantidad) {
    return sprintf("$%,.2f", cantidad)
}

# Función para categorizar precio
function categorizar_precio(precio) {
    if (precio < 50) return "BAJO"
    else if (precio < 200) return "MEDIO"
    else return "ALTO"
}

# Función para calcular comisión
function calcular_comision(precio, categoria) {
    if (categoria == "ELECTRONICA") return precio * 0.05
    else if (categoria == "HOGAR") return precio * 0.03
    else return precio * 0.02
}

BEGIN {
    print "🧮 ANÁLISIS CON FUNCIONES PERSONALIZADAS"
    print "========================================"
}

$6 == "COMPLETADA" {
    precio = $4
    categoria = $2
    vendedor = $5

    categoria_precio = categorizar_precio(precio)
    comision = calcular_comision(precio, categoria)

    printf "%-20s | %-12s | %s | %-5s | Comisión: %s\n",
           $3, categoria, formatear_moneda(precio), categoria_precio, formatear_moneda(comision)

    total_comisiones += comision
}

END {
    print "\n💰 TOTAL COMISIONES: " formatear_moneda(total_comisiones)
}' ventas_datos.txt

echo -e "\n=== ANÁLISIS ESTADÍSTICO AVANZADO ==="

awk -F',' '
BEGIN {
    print "📊 ANÁLISIS ESTADÍSTICO DETALLADO"
    print "================================="
}

$6 == "COMPLETADA" {
    precios[NR] = $4
    suma += $4
    suma_cuadrados += ($4 * $4)
    n++

    # Para calcular mediana
    if (n == 1) {
        min = max = $4
    } else {
        if ($4 < min) min = $4
        if ($4 > max) max = $4
    }
}

END {
    if (n > 0) {
        media = suma / n
        varianza = (suma_cuadrados / n) - (media * media)
        desviacion = sqrt(varianza)

        print "\n📈 ESTADÍSTICAS DESCRIPTIVAS:"
        printf "   Transacciones analizadas: %d\n", n
        printf "   Media: $%.2f\n", media
        printf "   Mínimo: $%.2f\n", min
        printf "   Máximo: $%.2f\n", max
        printf "   Rango: $%.2f\n", max - min
        printf "   Desviación estándar: $%.2f\n", desviacion
        printf "   Coeficiente de variación: %.2f%%\n", (desviacion/media)*100

        # Análisis de distribución
        bajo = medio = alto = 0
        for (i = 1; i <= n; i++) {
            if (precios[i] < media - desviacion) bajo++
            else if (precios[i] > media + desviacion) alto++
            else medio++
        }

        print "\n📊 DISTRIBUCIÓN DE PRECIOS:"
        printf "   Bajo (< $%.2f): %d (%.1f%%)\n", media-desviacion, bajo, (bajo/n)*100
        printf "   Medio: %d (%.1f%%)\n", medio, (medio/n)*100
        printf "   Alto (> $%.2f): %d (%.1f%%)\n", media+desviacion, alto, (alto/n)*100
    }
}' ventas_datos.txt
```

**[PANTALLA: Ejecutando con explicaciones profundas]**

```bash
chmod +x awk_avanzado.sh
./awk_avanzado.sh
```

**[EXPLICACIÓN TÉCNICA AVANZADA]**

Lo que acabas de ver representa técnicas de nivel profesional:

1. **Arrays asociativos multidimensionales** para análisis por categoría y vendedor
2. **Funciones personalizadas** que encapsulan lógica compleja
3. **Análisis estadístico** con cálculos de media, varianza y desviación estándar
4. **Formateo profesional** con alineación y moneda
5. **Lógica condicional compleja** para categorización automática

#### [65:00 - 72:00] CASOS DE USO PRÁCTICOS - INTEGRANDO TODO

**[PANTALLA: Transición a casos de uso del mundo real]**

Ahora que dominas las técnicas avanzadas tanto de sed como de awk, vamos a ver cómo estas herramientas trabajan juntas para resolver problemas reales que encontrarías en un entorno profesional.

```bash
nano casos_practicos_avanzados.sh
```

```bash
#!/bin/bash
# casos_practicos_avanzados.sh - Soluciones reales integradas
set -euo pipefail

echo "=== CASO 1: ANÁLISIS DE LOGS DE SEGURIDAD ==="

# Creamos logs de seguridad realistas
cat << 'EOF' > security.log
2024-03-15 09:15:30 [SECURITY] LOGIN_SUCCESS user=admin ip=192.168.1.100 session=abc123
2024-03-15 09:16:45 [SECURITY] LOGIN_FAILED user=guest ip=10.0.0.50 reason=invalid_password
2024-03-15 09:17:12 [SECURITY] LOGIN_FAILED user=guest ip=10.0.0.50 reason=invalid_password
2024-03-15 09:18:01 [SECURITY] LOGIN_FAILED user=admin ip=10.0.0.50 reason=invalid_password
2024-03-15 09:19:33 [SECURITY] FILE_ACCESS user=admin file=/etc/passwd action=read
2024-03-15 09:20:15 [SECURITY] LOGIN_SUCCESS user=operator ip=192.168.1.101 session=def456
2024-03-15 09:21:22 [SECURITY] LOGIN_FAILED user=guest ip=10.0.0.50 reason=invalid_password
2024-03-15 09:22:45 [SECURITY] PERMISSION_DENIED user=operator file=/root/secret.txt
2024-03-15 09:23:12 [SECURITY] LOGOUT user=admin session=abc123
EOF

echo "Pipeline completo: sed para normalizar + awk para analizar"

sed -E 's/\[SECURITY\] //g' security.log | \
awk '
BEGIN {
    print "🔒 ANÁLISIS DE SEGURIDAD AUTOMÁTICO"
    print "==================================="
}

/LOGIN_FAILED/ {
    match($0, /ip=([0-9.]+)/, ip_match)
    match($0, /user=([^ ]+)/, user_match)

    if (ip_match[1] && user_match[1]) {
        intentos_fallidos[ip_match[1]]++
        usuarios_atacados[user_match[1]]++
        total_fallos++

        # Detectar ataques de fuerza bruta
        if (intentos_fallidos[ip_match[1]] >= 3) {
            if (!alertado[ip_match[1]]) {
                print "🚨 ALERTA: Posible ataque de fuerza bruta desde " ip_match[1]
                alertado[ip_match[1]] = 1
            }
        }
    }
}

/LOGIN_SUCCESS/ {
    match($0, /user=([^ ]+)/, user_match)
    if (user_match[1]) {
        logins_exitosos[user_match[1]]++
    }
}

/PERMISSION_DENIED/ {
    match($0, /user=([^ ]+)/, user_match)
    match($0, /file=([^ ]+)/, file_match)
    if (user_match[1] && file_match[1]) {
        print "⚠️  ACCESO DENEGADO: " user_match[1] " intentó acceder a " file_match[1]
        accesos_denegados++
    }
}

END {
    print "\n📊 RESUMEN DE SEGURIDAD:"
    printf "   Total intentos fallidos: %d\n", total_fallos
    printf "   Accesos denegados: %d\n", accesos_denegados

    print "\n🎯 IPs SOSPECHOSAS:"
    for (ip in intentos_fallidos) {
        if (intentos_fallidos[ip] >= 2) {
            printf "   %s: %d intentos fallidos\n", ip, intentos_fallidos[ip]
        }
    }

    print "\n👥 USUARIOS MÁS ATACADOS:"
    for (user in usuarios_atacados) {
        printf "   %s: %d intentos\n", user, usuarios_atacados[user]
    }
}'

echo -e "\n=== CASO 2: PROCESAMIENTO DE DATOS FINANCIEROS ==="

# Datos financieros complejos
cat << 'EOF' > transacciones_financieras.txt
HEADER|REPORTE_DIARIO|2024-03-15
CUENTA|12345|Juan Pérez|ACTIVA
TRANSACCION|12345|2024-03-15 09:15|DEPOSITO|500.00|Nómina marzo
TRANSACCION|12345|2024-03-15 10:30|RETIRO|-150.00|Cajero automático
TRANSACCION|12345|2024-03-15 14:45|COMPRA|-89.99|Amazon.com
CUENTA|67890|María García|ACTIVA
TRANSACCION|67890|2024-03-15 08:00|DEPOSITO|1200.00|Freelance trabajo
TRANSACCION|67890|2024-03-15 11:15|TRANSFERENCIA|-300.00|Pago alquiler
TRANSACCION|67890|2024-03-15 16:20|COMPRA|-45.50|Supermercado
CUENTA|54321|Carlos López|SUSPENDIDA
TRANSACCION|54321|2024-03-15 12:00|INTENTO_RETIRO|-200.00|RECHAZADO
FOOTER|TOTAL_CUENTAS|3|TOTAL_TRANSACCIONES|8
EOF

echo "Procesamiento complejo: análisis por cuenta con estados"

# Primero normalizamos con sed, luego analizamos con awk
sed -E '
    # Limpiar headers y footers
    /^HEADER|^FOOTER/d
    # Separar información de cuenta de transacciones
    s/^CUENTA\|([0-9]+)\|([^|]+)\|(.+)/CUENTA:\1:\2:\3/
    s/^TRANSACCION\|([0-9]+)\|([^|]+)\|([^|]+)\|([0-9.-]+)\|(.+)/TRANS:\1:\2:\3:\4:\5/
' transacciones_financieras.txt | \
awk -F':' '
BEGIN {
    print "💰 ANÁLISIS FINANCIERO AUTOMATIZADO"
    print "===================================="
}

/^CUENTA/ {
    cuenta_id = $2
    nombre = $3
    estado = $4

    cuentas[cuenta_id] = nombre
    estados[cuenta_id] = estado
    saldo[cuenta_id] = 0
    transacciones_cuenta[cuenta_id] = 0
}

/^TRANS/ {
    cuenta_id = $2
    fecha_hora = $3
    tipo = $4
    monto = $5
    concepto = $6

    if (estados[cuenta_id] == "ACTIVA") {
        saldo[cuenta_id] += monto
        transacciones_cuenta[cuenta_id]++

        # Categorizar transacciones
        if (monto > 0) {
            ingresos[cuenta_id] += monto
            total_ingresos += monto
        } else {
            gastos[cuenta_id] += (-monto)
            total_gastos += (-monto)

            # Detectar gastos grandes
            if (-monto > 100) {
                print "💳 GASTO GRANDE: " cuentas[cuenta_id] " gastó $" (-monto) " en " concepto
            }
        }

        # Análisis por tipo
        tipos_transaccion[tipo]++
    } else {
        print "🚫 TRANSACCIÓN RECHAZADA: Cuenta " cuenta_id " (" cuentas[cuenta_id] ") está " estados[cuenta_id]
        rechazadas++
    }
}

END {
    print "\n📈 RESUMEN POR CUENTA:"
    for (cuenta in cuentas) {
        printf "   %s (%s):\n", cuentas[cuenta], cuenta
        printf "     Estado: %s\n", estados[cuenta]
        if (estados[cuenta] == "ACTIVA") {
            printf "     Saldo: $%.2f\n", saldo[cuenta]
            printf "     Transacciones: %d\n", transacciones_cuenta[cuenta]
            printf "     Ingresos: $%.2f\n", ingresos[cuenta]
            printf "     Gastos: $%.2f\n", gastos[cuenta]

            if (saldo[cuenta] < 0) {
                print "     ⚠️  SALDO NEGATIVO"
            }
        }
        print ""
    }

    print "💼 RESUMEN GENERAL:"
    printf "   Total ingresos: $%.2f\n", total_ingresos
    printf "   Total gastos: $%.2f\n", total_gastos
    printf "   Flujo neto: $%.2f\n", total_ingresos - total_gastos
    if (rechazadas > 0) printf "   Transacciones rechazadas: %d\n", rechazadas

    print "\n📊 TIPOS DE TRANSACCIÓN:"
    for (tipo in tipos_transaccion) {
        printf "   %-15s: %d\n", tipo, tipos_transaccion[tipo]
    }
}'

echo -e "\n=== CASO 3: MONITOREO DE SISTEMA EN TIEMPO REAL ==="

# Simulamos datos de sistema
cat << 'EOF' > system_metrics.txt
2024-03-15 09:15:30|CPU|75.5|%|server01
2024-03-15 09:15:30|MEMORY|8.2|GB|server01
2024-03-15 09:15:30|DISK|45.8|%|server01
2024-03-15 09:15:30|NETWORK_RX|1250|KB/s|server01
2024-03-15 09:15:30|NETWORK_TX|890|KB/s|server01
2024-03-15 09:16:30|CPU|82.1|%|server01
2024-03-15 09:16:30|MEMORY|8.9|GB|server01
2024-03-15 09:16:30|DISK|46.2|%|server01
2024-03-15 09:17:30|CPU|95.8|%|server01
2024-03-15 09:17:30|MEMORY|12.1|GB|server01
2024-03-15 09:17:30|DISK|47.1|%|server01
EOF

echo "Monitoreo inteligente con alertas automáticas:"

awk -F'|' '
BEGIN {
    print "🖥️  MONITOREO DE SISTEMA INTELIGENTE"
    print "===================================="

    # Umbrales de alerta
    umbral_cpu = 90
    umbral_memory = 10
    umbral_disk = 80
}

{
    timestamp = $1
    metrica = $2
    valor = $3
    unidad = $4
    servidor = $5

    # Almacenar última medición
    ultimas_metricas[servidor "_" metrica] = valor
    servidores[servidor] = 1

    # Detectar alertas
    if (metrica == "CPU" && valor > umbral_cpu) {
        print "🔥 ALERTA CPU: " servidor " al " valor "% (umbral: " umbral_cpu "%)"
        alertas_cpu++
    }

    if (metrica == "MEMORY" && valor > umbral_memory) {
        print "🧠 ALERTA MEMORIA: " servidor " usando " valor "GB (umbral: " umbral_memory "GB)"
        alertas_memory++
    }

    if (metrica == "DISK" && valor > umbral_disk) {
        print "💾 ALERTA DISCO: " servidor " al " valor "% (umbral: " umbral_disk "%)"
        alertas_disk++
    }

    # Acumular para promedios
    suma_metricas[metrica] += valor
    count_metricas[metrica]++
}

END {
    print "\n📊 ESTADO ACTUAL DEL SISTEMA:"
    for (servidor in servidores) {
        printf "\n🖥️  %s:\n", servidor
        printf "   CPU: %.1f%%\n", ultimas_metricas[servidor "_CPU"]
        printf "   Memoria: %.1fGB\n", ultimas_metricas[servidor "_MEMORY"]
        printf "   Disco: %.1f%%\n", ultimas_metricas[servidor "_DISK"]

        # Estado general del servidor
        cpu_val = ultimas_metricas[servidor "_CPU"]
        mem_val = ultimas_metricas[servidor "_MEMORY"]
        disk_val = ultimas_metricas[servidor "_DISK"]

        if (cpu_val > 90 || mem_val > 10 || disk_val > 80) {
            print "   🚨 ESTADO: CRÍTICO"
        } else if (cpu_val > 70 || mem_val > 8 || disk_val > 60) {
            print "   ⚠️  ESTADO: ADVERTENCIA"
        } else {
            print "   ✅ ESTADO: NORMAL"
        }
    }

    print "\n📈 PROMEDIOS HISTÓRICOS:"
    for (metrica in suma_metricas) {
        promedio = suma_metricas[metrica] / count_metricas[metrica]
        printf "   %-10s: %.1f\n", metrica, promedio
    }

    if (alertas_cpu + alertas_memory + alertas_disk > 0) {
        print "\n🚨 RESUMEN DE ALERTAS:"
        if (alertas_cpu > 0) printf "   CPU: %d alertas\n", alertas_cpu
        if (alertas_memory > 0) printf "   Memoria: %d alertas\n", alertas_memory
        if (alertas_disk > 0) printf "   Disco: %d alertas\n", alertas_disk
    } else {
        print "\n✅ Sin alertas activas"
    }
}' system_metrics.txt
```

**[PANTALLA: Ejecutando la demostración completa]**

```bash
chmod +x casos_practicos_avanzados.sh
./casos_practicos_avanzados.sh
```

**[EXPLICACIÓN DE NIVEL EMPRESARIAL]**

Lo que acabas de ver son soluciones de nivel profesional que podrías implementar inmediatamente en un entorno empresarial:

1. **Análisis de seguridad**: Detección automática de ataques de fuerza bruta
2. **Procesamiento financiero**: Análisis de flujo de efectivo con alertas
3. **Monitoreo de sistemas**: Dashboard en tiempo real con umbrales inteligentes

#### [72:00 - 75:00] SÍNTESIS Y PREPARACIÓN PARA EL PROYECTO

**[PANTALLA: Transición hacia la integración final]**

¡Increíble! Has completado las tres lecciones fundamentales del Módulo 5. Has construido una base extraordinariamente sólida que integra:

✅ **Arrays complejos** para organizar datos multidimensionales
✅ **Expresiones regulares expertas** para extracción precisa de patrones
✅ **sed avanzado** con hold space para transformaciones complejas
✅ **awk profesional** con funciones y análisis estadístico

**[PANTALLA: Visualización de la progresión del aprendizaje]**

Piensa en el viaje que has completado:

- **Módulo 1-2**: Fundamentos y herramientas básicas
- **Módulo 3-4**: Control de flujo y organización del código
- **Módulo 5**: Manipulación avanzada de datos (¡donde estás ahora!)

**[PANTALLA: Preview del proyecto final]**

Ahora llega el momento de la síntesis: el **Proyecto Práctico 5 - Analizador de Logs Profesional**. Este proyecto integrará todo lo que has aprendido en una herramienta real que podrías usar en tu trabajo mañana mismo.

El analizador que construirás será capaz de:

- Procesar logs de Apache, Nginx, aplicaciones personalizadas
- Detectar anomalías de seguridad automáticamente
- Generar reportes ejecutivos con gráficos HTML
- Crear alertas inteligentes basadas en patrones
- Producir análisis estadístico profesional

**[PANTALLA: Estadísticas de transformación personal]**

En estas primeras 75 minutos has:

- Ejecutado más de 15 scripts avanzados
- Procesado datasets complejos de múltiples dominios
- Implementado algoritmos de análisis de datos
- Creado soluciones que rivalizan con herramientas comerciales

**[PANTALLA: Transición motivacional hacia el proyecto]**

La diferencia entre conocer técnicas individuales y ser capaz de crear soluciones integrales es exactamente lo que vamos a desarrollar en los próximos 45 minutos. El proyecto final es donde todo "hace click" definitivamente.

¿Estás listo para construir algo verdaderamente impresionante?

---

**[PANTALLA: Resumen visual de logros de Parte 3]**

🎯 **LOGROS DE LA PARTE 3:**

✅ **sed avanzado**: Hold space, comandos múltiples, transformaciones complejas
✅ **awk profesional**: Variables globales, funciones personalizadas, análisis estadístico
✅ **Casos reales**: Seguridad, finanzas, monitoreo de sistemas
✅ **Integración experta**: Pipelines sofisticados que combinan múltiples herramientas

**[PANTALLA: Call to action para la Parte 4]**

En la Parte 4 final, construiremos el **Analizador de Logs más sofisticado** que hayas visto en bash. Será tu obra maestra del Módulo 5, una herramienta que podrás mostrar con orgullo como ejemplo de tus habilidades técnicas.

¡Nos vemos en la Parte 4 para el gran finale!

---

_[Fin de la Parte 3 del guión]_
