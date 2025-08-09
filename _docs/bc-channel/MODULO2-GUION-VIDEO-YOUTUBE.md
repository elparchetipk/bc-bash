# Bootcamp Bash - Módulo 2: Desarrollo Paso a Paso

## Guión para Video de YouTube - Comandos Avanzados y Pipes

---

## 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bootcamp Bash - Módulo 2: Comandos Avanzados y Pipes - Dominando el Procesamiento de Texto"

**Duración Estimada:** 50-65 minutos

**Audiencia:** Estudiantes que completaron el Módulo 1 y quieren dominar el procesamiento de texto en Bash

**Objetivo:** Dominar pipes, redirección y herramientas de procesamiento de texto para crear flujos de trabajo potentes

---

## 🎯 OBJETIVOS DE APRENDIZAJE

Al finalizar este video, los estudiantes podrán:

1. **Dominar** el uso de pipes para encadenar comandos
2. **Implementar** redirección avanzada de entrada y salida
3. **Procesar** texto eficientemente con grep, sed, awk
4. **Utilizar** wildcards y pattern matching avanzado
5. **Crear** filtros complejos de datos
6. **Desarrollar** un procesador de logs funcional

---

## 📝 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y REPASO (5 minutos)

### PARTE 2: PIPES Y REDIRECCIÓN AVANZADA (15 minutos)

### PARTE 3: MAESTRÍA EN GREP Y EXPRESIONES REGULARES (15 minutos)

### PARTE 4: SED - EL EDITOR DE FLUJO (10 minutos)

### PARTE 5: AWK - PROCESAMIENTO ESTRUCTURADO (10 minutos)

### PARTE 6: PROYECTO PRÁCTICO - PROCESADOR DE LOGS (10 minutos)

---

## 🎬 PARTE 1: INTRODUCCIÓN Y REPASO (5 minutos)

### 🎤 Guión de Presentación

**[PANTALLA: Logo del Módulo 2 con SVG]**

> "¡Bienvenidos de vuelta al Bootcamp Bash! Soy tu instructor y hoy vamos a elevar tus habilidades al siguiente nivel con el Módulo 2: Comandos Avanzados y Pipes."

**[TRANSICIÓN: Mostrar logros del Módulo 1]**

> "En el módulo anterior aprendimos los fundamentos: navegación, comandos básicos, nuestro primer script. Hoy vamos a aprender a combinar estos comandos para crear flujos de trabajo realmente potentes."

### 📊 El Poder de los Pipes

**[PANTALLA: Diagrama conceptual de pipes]**

> "Los pipes son como tuberías que conectan comandos. La salida de un comando se convierte en la entrada del siguiente, creando cadenas de procesamiento increíblemente eficientes."

**[PANTALLA: Ejemplo visual]**

> "Imagina procesar un archivo de 10GB de logs en segundos, extraer información específica, formatearla y generar un reporte. Eso es el poder que vamos a dominar hoy."

### 🗺️ Roadmap del Módulo 2

**[PANTALLA: Estructura del módulo]**

> "En este módulo cubriremos:
>
> - Pipes y redirección avanzada
> - Grep con expresiones regulares
> - Sed para edición de flujo
> - Awk para procesamiento estructurado
> - Wildcards y pattern matching
> - Proyecto: Procesador de Logs Avanzado"

### 🔄 Repaso Rápido

**[PANTALLA: Terminal]**

> "Repasemos rápidamente el Módulo 1 creando algunos archivos de prueba:"

```bash
# Configurar entorno para el módulo 2
cd ~/bootcamp-bash
mkdir -p modulo2/{ejercicios,proyectos,datos}
cd modulo2

# Crear datos de ejemplo
cat > datos/empleados.txt << 'EOF'
Juan Pérez,Desarrollador,2500,Madrid,juan@empresa.com
María García,Diseñadora,2200,Barcelona,maria@empresa.com
Pedro López,Administrador,2800,Valencia,pedro@empresa.com
Ana Martín,DevOps,3000,Sevilla,ana@empresa.com
Carlos Ruiz,Backend,2600,Bilbao,carlos@empresa.com
Laura Torres,Frontend,2400,Málaga,laura@empresa.com
EOF

echo "✅ Datos preparados para el módulo 2"
```

---

## 🔗 PARTE 2: PIPES Y REDIRECCIÓN AVANZADA (15 minutos)

### 🎤 Transición

**[PANTALLA: Diagrama de flujo de datos]**

> "Los pipes son la columna vertebral del procesamiento en Bash. Permiten que la salida de un comando se convierta automáticamente en la entrada del siguiente."

### 🚰 Fundamentos de Pipes

**[PANTALLA: Demostración en vivo]**

> "Empezamos con pipes básicos y vamos escalando la complejidad:"

```bash
# Pipe básico
cat datos/empleados.txt | head -3

# Encadenar múltiples comandos
cat datos/empleados.txt | grep "Madrid" | cut -d',' -f1

# Contar elementos
cat datos/empleados.txt | wc -l
ls | wc -l

# Ordenar y mostrar únicos
echo -e "manzana\nbanana\nmanzana\nnaranja\nbanana" | sort | uniq

# Pipeline complejo
cat datos/empleados.txt | grep -v "Diseñadora" | sort | head -2
```

### 📤 Redirección Avanzada

**[PANTALLA: Explicación de redirección]**

> "La redirección nos permite controlar exactamente dónde van los datos:"

```bash
# Redirección básica
echo "Log de inicio: $(date)" > logs/sistema.log
echo "Proceso completado" >> logs/sistema.log

# Redirección de errores
ls archivo_inexistente 2> errores.log
ls archivo_inexistente 2>> errores.log

# Redireccionar salida y errores por separado
comando_ejemplo > salida.txt 2> errores.txt

# Redireccionar ambos al mismo archivo
ls /etc /directorio_falso > completo.log 2>&1

# Here documents
cat << 'EOF' > script_generado.sh
#!/bin/bash
echo "Script generado automáticamente"
date
EOF
```

### 🔄 Pipes Avanzados y Tee

**[PANTALLA: Demostración de tee]**

> "El comando tee es como una 'T' en fontanería - divide el flujo:"

```bash
# Guardar y mostrar simultáneamente
cat datos/empleados.txt | grep "Madrid" | tee madrid_empleados.txt

# Múltiples destinos
echo "Mensaje importante" | tee archivo1.txt archivo2.txt archivo3.txt

# Añadir a archivos existentes
date | tee -a logs/acceso.log logs/general.log

# Pipeline con tee para debugging
cat datos/empleados.txt |
  grep "Desarrollador\|Backend" |
  tee desarrolladores_temp.txt |
  cut -d',' -f1,3 |
  sort -t',' -k2 -n
```

### 🔧 Herramientas de Filtrado

**[PANTALLA: Comandos de filtrado]**

> "Herramientas específicas para filtrar y transformar datos:"

```bash
# cut - extraer columnas
cut -d',' -f1,3 datos/empleados.txt  # Nombre y salario
cut -d',' -f1-2 datos/empleados.txt  # Primeras dos columnas

# sort - ordenamiento avanzado
sort datos/empleados.txt                    # Orden alfabético
sort -t',' -k3 -n datos/empleados.txt      # Por salario (numérico)
sort -t',' -k4 datos/empleados.txt         # Por ciudad

# uniq - elementos únicos
cut -d',' -f4 datos/empleados.txt | sort | uniq  # Ciudades únicas
cut -d',' -f4 datos/empleados.txt | sort | uniq -c  # Con conteos

# tr - transformar caracteres
cat datos/empleados.txt | tr ',' '\t'       # Comas a tabs
echo "TEXTO EN MAYÚSCULAS" | tr 'A-Z' 'a-z'  # A minúsculas
```

---

## 🔍 PARTE 3: MAESTRÍA EN GREP Y EXPRESIONES REGULARES (15 minutos)

### 🎤 Transición

**[PANTALLA: Logo de grep con ejemplos]**

> "Grep es probablemente la herramienta de búsqueda más potente en Unix. Vamos a dominar desde búsquedas básicas hasta expresiones regulares complejas."

### 🎯 Grep Básico a Avanzado

**[PANTALLA: Demostración progresiva]**

> "Empezamos con grep básico y escalamos la complejidad:"

```bash
# Crear archivo de logs para practicar
cat > datos/servidor.log << 'EOF'
2024-01-15 08:30:01 INFO Usuario juan@empresa.com conectado
2024-01-15 08:31:15 ERROR Fallo de conexión en 192.168.1.100
2024-01-15 08:32:30 INFO Usuario maria@empresa.com conectado
2024-01-15 08:33:45 WARNING Memoria al 85% en servidor web
2024-01-15 08:35:00 ERROR Base de datos no responde
2024-01-15 08:36:12 INFO Usuario pedro@empresa.com desconectado
2024-01-15 08:37:30 INFO Backup completado exitosamente
2024-01-15 08:38:45 ERROR Timeout en API externa
EOF

# Búsquedas básicas
grep "ERROR" datos/servidor.log
grep -i "info" datos/servidor.log           # Case insensitive
grep -n "WARNING" datos/servidor.log        # Con números de línea
grep -v "INFO" datos/servidor.log           # Excluir líneas
grep -c "ERROR" datos/servidor.log          # Contar coincidencias
```

### 🎭 Expresiones Regulares

**[PANTALLA: Introducción a regex]**

> "Las expresiones regulares son patrones que describen texto. Son increíblemente poderosas:"

```bash
# Metacaracteres básicos
grep "^2024" datos/servidor.log             # Líneas que empiezan con 2024
grep "conectado$" datos/servidor.log        # Líneas que terminan con 'conectado'
grep "08:3[0-9]" datos/servidor.log         # Minutos entre 30-39

# Clases de caracteres
grep "[0-9]" datos/servidor.log             # Cualquier dígito
grep "[A-Z][A-Z][A-Z]" datos/servidor.log   # Tres mayúsculas seguidas
grep "[0-9]\{1,3\}\.[0-9]\{1,3\}" datos/servidor.log  # IPs parciales

# Cuantificadores
grep "o\+" datos/servidor.log               # Una o más 'o'
grep "o*" datos/servidor.log                # Cero o más 'o'
grep "o\?" datos/servidor.log               # Cero o una 'o'

# Ejemplos prácticos
grep "[a-zA-Z]\+@[a-zA-Z]\+\.[a-zA-Z]\+" datos/servidor.log  # Emails
grep "192\.168\.[0-9]\+\.[0-9]\+" datos/servidor.log        # IPs locales
```

### 🔧 Grep con Opciones Avanzadas

**[PANTALLA: Opciones potentes]**

> "Opciones que multiplican el poder de grep:"

```bash
# Búsqueda en múltiples archivos
grep -r "ERROR" logs/                       # Recursivo en directorio
grep -l "ERROR" *.log                       # Solo nombres de archivos
grep -L "SUCCESS" *.log                     # Archivos SIN el patrón

# Contexto alrededor de coincidencias
grep -A 2 "ERROR" datos/servidor.log        # 2 líneas después
grep -B 2 "ERROR" datos/servidor.log        # 2 líneas antes
grep -C 2 "ERROR" datos/servidor.log        # 2 líneas antes y después

# Múltiples patrones
grep -E "ERROR|WARNING" datos/servidor.log   # OR lógico
grep -F "192.168.1.100" datos/servidor.log   # Literal (sin regex)

# Pipeline con grep
cat datos/empleados.txt | grep "Madrid\|Barcelona" | grep "Desarrollador"
```

### 🚀 Casos de Uso Reales

**[PANTALLA: Ejemplos prácticos]**

> "Casos reales donde grep es imprescindible:"

```bash
# Analizar logs de Apache
grep "404" /var/log/apache2/access.log | head -10

# Encontrar procesos
ps aux | grep python | grep -v grep

# Buscar configuraciones
grep -r "port.*80" /etc/ 2>/dev/null

# Extraer IPs únicas de logs
grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" datos/servidor.log | sort | uniq
```

---

## ✏️ PARTE 4: SED - EL EDITOR DE FLUJO (10 minutos)

### 🎤 Transición

**[PANTALLA: Logo conceptual de sed]**

> "Sed significa 'Stream Editor' - editor de flujo. Es como un editor de texto que trabaja con pipes, perfecto para transformaciones automatizadas."

### 🔄 Operaciones Básicas de Sed

**[PANTALLA: Demostración en vivo]**

> "Sed trabaja línea por línea, aplicando transformaciones según patrones:"

```bash
# Sustituir texto (primera ocurrencia por línea)
sed 's/ERROR/FALLO/' datos/servidor.log

# Sustituir todas las ocurrencias
sed 's/ERROR/FALLO/g' datos/servidor.log

# Sustituir solo en líneas específicas
sed '2s/INFO/INFORMACIÓN/' datos/servidor.log

# Guardar cambios en archivo
sed 's/ERROR/FALLO/g' datos/servidor.log > datos/servidor_modificado.log

# Modificar archivo in-place (¡CUIDADO!)
cp datos/servidor.log datos/servidor_backup.log
sed -i 's/WARNING/ALERTA/g' datos/servidor_backup.log
```

### 🎯 Operaciones Avanzadas

**[PANTALLA: Comandos complejos]**

> "Sed puede hacer mucho más que sustituir texto:"

```bash
# Eliminar líneas
sed '/INFO/d' datos/servidor.log            # Eliminar líneas con INFO
sed '1d' datos/servidor.log                 # Eliminar primera línea
sed '$d' datos/servidor.log                 # Eliminar última línea
sed '2,4d' datos/servidor.log               # Eliminar líneas 2-4

# Agregar líneas
sed '1i\=== INICIO DE LOG ===' datos/servidor.log    # Insertar al principio
sed '$a\=== FIN DE LOG ===' datos/servidor.log       # Agregar al final

# Imprimir líneas específicas
sed -n '2,4p' datos/servidor.log            # Solo líneas 2-4
sed -n '/ERROR/p' datos/servidor.log        # Solo líneas con ERROR

# Múltiples operaciones
sed -e 's/ERROR/FALLO/g' -e 's/WARNING/ALERTA/g' datos/servidor.log
```

### 🔧 Sed con Expresiones Regulares

**[PANTALLA: Regex en sed]**

> "Combinando sed con regex para transformaciones sofisticadas:"

```bash
# Extraer partes específicas
sed 's/.*\([0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}\).*/\1/' datos/servidor.log

# Formatear datos CSV
echo "Juan,Pérez,Desarrollador" | sed 's/\([^,]*\),\([^,]*\),\(.*\)/Nombre: \1, Apellido: \2, Puesto: \3/'

# Limpiar espacios
echo "  texto con espacios  " | sed 's/^[ \t]*//;s/[ \t]*$//'

# Validar y transformar emails
echo "usuario@dominio.com" | sed 's/\([^@]*\)@\(.*\)/Usuario: \1, Dominio: \2/'
```

### 📊 Pipeline con Sed

**[PANTALLA: Integración en pipelines]**

> "Sed brilla cuando se integra en pipelines complejos:"

```bash
# Pipeline completo de procesamiento
cat datos/empleados.txt |
  sed 's/,/ | /g' |                         # Reemplazar comas con separadores
  sed 's/Desarrollador/DEV/g' |             # Abreviar puestos
  sed 's/Administrador/ADMIN/g' |
  head -3

# Procesar logs y generar reporte
cat datos/servidor.log |
  sed '/INFO/d' |                           # Quitar mensajes informativos
  sed 's/ERROR/🔴 ERROR/g' |                # Añadir emoji a errores
  sed 's/WARNING/🟡 WARNING/g'              # Añadir emoji a warnings
```

---

## 📊 PARTE 5: AWK - PROCESAMIENTO ESTRUCTURADO (10 minutos)

### 🎤 Transición

**[PANTALLA: Logo conceptual de awk]**

> "AWK es un lenguaje de programación completo especializado en procesamiento de texto estructurado. Es perfecto para datos en columnas como CSV, logs, y reportes."

### 🗂️ Conceptos Básicos de AWK

**[PANTALLA: Estructura de AWK]**

> "AWK procesa texto línea por línea, dividiendo cada línea en campos:"

```bash
# Imprimir columnas específicas
awk -F',' '{print $1}' datos/empleados.txt        # Primera columna (nombres)
awk -F',' '{print $1, $3}' datos/empleados.txt    # Nombre y salario
awk -F',' '{print $NF}' datos/empleados.txt       # Última columna (emails)

# Información sobre campos
awk -F',' '{print NF, $0}' datos/empleados.txt    # Número de campos por línea
awk -F',' '{print "Empleado:", $1, "Salario:", $3}' datos/empleados.txt

# Con headers personalizados
awk -F',' 'BEGIN{print "NOMBRE\t\tSALARIO"} {print $1 "\t\t" $3}' datos/empleados.txt
```

### 🔢 Operaciones y Cálculos

**[PANTALLA: AWK para cálculos]**

> "AWK puede realizar cálculos y operaciones sobre los datos:"

```bash
# Sumar salarios
awk -F',' '{sum += $3} END {print "Total salarios:", sum}' datos/empleados.txt

# Calcular promedio
awk -F',' '{sum += $3; count++} END {print "Promedio:", sum/count}' datos/empleados.txt

# Encontrar máximo y mínimo
awk -F',' 'NR==1{max=$3; min=$3} {if($3>max) max=$3; if($3<min) min=$3} END {print "Max:", max, "Min:", min}' datos/empleados.txt

# Contar por categorías
awk -F',' '{count[$2]++} END {for (i in count) print i, count[i]}' datos/empleados.txt
```

### 🎯 Filtros y Condiciones

**[PANTALLA: Lógica condicional]**

> "AWK permite filtrar datos con condiciones complejas:"

```bash
# Filtrar por salario
awk -F',' '$3 > 2500 {print $1, $3}' datos/empleados.txt

# Múltiples condiciones
awk -F',' '$3 > 2400 && $4 ~ /Madrid|Barcelona/ {print $0}' datos/empleados.txt

# Usar patrones
awk -F',' '/Desarrollador|Backend/ {print $1, "trabaja en", $4}' datos/empleados.txt

# Numerar líneas que cumplen condición
awk -F',' '$3 > 2500 {printf "%d: %s - %s\n", NR, $1, $3}' datos/empleados.txt
```

### 🚀 AWK Avanzado

**[PANTALLA: Funciones avanzadas]**

> "AWK tiene funciones integradas muy útiles:"

```bash
# Funciones de string
awk -F',' '{print toupper($1), length($1)}' datos/empleados.txt
awk -F',' '{print substr($1, 1, 3)}' datos/empleados.txt  # Primeras 3 letras

# Formateo avanzado
awk -F',' '{printf "%-15s %-12s %6d %-10s\n", $1, $2, $3, $4}' datos/empleados.txt

# Procesar logs con awk
awk '/ERROR/ {errors++} /WARNING/ {warnings++} END {print "Errores:", errors, "Warnings:", warnings}' datos/servidor.log

# Generar reporte completo
awk -F',' '
BEGIN {
    print "=== REPORTE DE EMPLEADOS ==="
    print "Nombre\t\tPuesto\t\tSalario\tCiudad"
    print "----------------------------------------"
}
{
    printf "%-15s %-12s %6d\t%s\n", $1, $2, $3, $4
    total += $3
    count++
}
END {
    print "----------------------------------------"
    printf "Total empleados: %d\n", count
    printf "Gasto total: %d\n", total
    printf "Salario promedio: %.2f\n", total/count
}' datos/empleados.txt
```

---

## 🎯 PARTE 6: PROYECTO PRÁCTICO - PROCESADOR DE LOGS (10 minutos)

### 🎤 Transición

**[PANTALLA: Logo del proyecto]**

> "¡Es hora de integrar todo lo aprendido! Crearemos un procesador de logs completo que combine pipes, grep, sed y awk."

### 🏗️ Diseño del Proyecto

**[PANTALLA: Arquitectura del procesador]**

> "Nuestro procesador analizará logs de servidor y generará reportes detallados:"

```bash
# Crear datos de ejemplo más extensos
cat > datos/servidor_completo.log << 'EOF'
2024-01-15 08:30:01 INFO [web] Usuario juan@empresa.com conectado desde 192.168.1.50
2024-01-15 08:31:15 ERROR [db] Fallo de conexión en 192.168.1.100 - timeout 30s
2024-01-15 08:32:30 INFO [web] Usuario maria@empresa.com conectado desde 192.168.1.51
2024-01-15 08:33:45 WARNING [system] Memoria al 85% en servidor web - 6.8GB/8GB
2024-01-15 08:35:00 ERROR [db] Base de datos no responde - conexión perdida
2024-01-15 08:36:12 INFO [web] Usuario pedro@empresa.com desconectado
2024-01-15 08:37:30 INFO [backup] Backup completado exitosamente - 2.3GB
2024-01-15 08:38:45 ERROR [api] Timeout en API externa servicio-pagos - 45s
2024-01-15 08:40:00 INFO [web] Usuario ana@empresa.com conectado desde 192.168.1.52
2024-01-15 08:41:30 WARNING [system] CPU al 92% - proceso heavy-task consumiendo recursos
2024-01-15 08:42:15 ERROR [web] Error 500 en /api/users - excepción no manejada
2024-01-15 08:43:00 INFO [web] Usuario carlos@empresa.com desconectado
EOF
```

### 🔧 Construcción del Procesador

**[PANTALLA: Desarrollo paso a paso]**

> "Construyamos el procesador paso a paso, combinando todas las herramientas:"

```bash
# Crear el script procesador
cat > proyectos/procesador_logs.sh << 'EOF'
#!/bin/bash
# Procesador de Logs Avanzado - Módulo 2
# Combina pipes, grep, sed y awk para análisis completo

set -euo pipefail

LOG_FILE="${1:-datos/servidor_completo.log}"
REPORTE_DIR="reportes"

# Crear directorio de reportes
mkdir -p "$REPORTE_DIR"

echo "🔍 PROCESADOR DE LOGS AVANZADO"
echo "=============================="
echo "📁 Procesando: $LOG_FILE"
echo

# 1. Estadísticas generales
echo "📊 ESTADÍSTICAS GENERALES"
echo "------------------------"
total_lineas=$(wc -l < "$LOG_FILE")
errores=$(grep -c "ERROR" "$LOG_FILE" || echo "0")
warnings=$(grep -c "WARNING" "$LOG_FILE" || echo "0")
info=$(grep -c "INFO" "$LOG_FILE" || echo "0")

echo "Total de entradas: $total_lineas"
echo "Errores: $errores"
echo "Warnings: $warnings"
echo "Info: $info"
echo

# 2. Top errores por componente
echo "🔴 TOP ERRORES POR COMPONENTE"
echo "----------------------------"
grep "ERROR" "$LOG_FILE" |
sed 's/.*\[\([^]]*\)\].*/\1/' |
sort | uniq -c | sort -nr |
awk '{printf "%-10s: %d errores\n", $2, $1}'
echo

# 3. Análisis de usuarios
echo "👥 ANÁLISIS DE USUARIOS"
echo "---------------------"
grep -o "[a-zA-Z]\+@[a-zA-Z]\+\.[a-zA-Z]\+" "$LOG_FILE" |
sort | uniq -c | sort -nr |
awk '{printf "%-20s: %d actividades\n", $2, $1}'
echo

# 4. IPs más activas
echo "🌐 IPs MÁS ACTIVAS"
echo "-----------------"
grep -o "192\.168\.[0-9]\+\.[0-9]\+" "$LOG_FILE" |
sort | uniq -c | sort -nr |
awk '{printf "%-15s: %d conexiones\n", $2, $1}'
echo

# 5. Timeline de errores críticos
echo "⏰ TIMELINE DE ERRORES CRÍTICOS"
echo "------------------------------"
grep "ERROR" "$LOG_FILE" |
awk '{
    time = $2
    component = gensub(/.*\[([^]]*)\].*/, "\\1", "g", $0)
    message = substr($0, index($0, "] ") + 2)
    printf "%s [%s] %s\n", time, component, message
}' | head -5
echo

# 6. Generar reporte en archivo
echo "📄 Generando reportes en archivos..."

# Reporte de errores
grep "ERROR" "$LOG_FILE" > "$REPORTE_DIR/errores.log"

# Reporte estadístico
cat > "$REPORTE_DIR/estadisticas.txt" << EOL
REPORTE ESTADÍSTICO - $(date)
===============================

Total de entradas: $total_lineas
Errores: $errores
Warnings: $warnings
Mensajes informativos: $info

Porcentaje de errores: $(echo "scale=2; $errores * 100 / $total_lineas" | bc)%
Porcentaje de warnings: $(echo "scale=2; $warnings * 100 / $total_lineas" | bc)%
EOL

# CSV para análisis posterior
echo "fecha,hora,nivel,componente,mensaje" > "$REPORTE_DIR/logs_procesados.csv"
awk '{
    date = $1
    time = $2
    level = $3
    component = gensub(/.*\[([^]]*)\].*/, "\\1", "g", $0)
    message = gensub(/.*\] (.*)/, "\\1", "g", $0)
    gsub(/,/, ";", message)  # Escapar comas en mensaje
    printf "%s,%s,%s,%s,%s\n", date, time, level, component, message
}' "$LOG_FILE" >> "$REPORTE_DIR/logs_procesados.csv"

echo "✅ Reportes generados en: $REPORTE_DIR/"
echo "   - errores.log: Solo mensajes de error"
echo "   - estadisticas.txt: Resumen estadístico"
echo "   - logs_procesados.csv: Datos estructurados para análisis"
echo
echo "🎉 ¡Procesamiento completado!"
EOF

chmod +x proyectos/procesador_logs.sh
```

### 🚀 Demostración del Procesador

**[PANTALLA: Ejecución en vivo]**

> "¡Ejecutemos nuestro procesador y veamos la magia en acción!"

```bash
# Ejecutar el procesador
./proyectos/procesador_logs.sh

# Verificar los reportes generados
ls -la reportes/
head reportes/estadisticas.txt
head reportes/logs_procesados.csv
```

### 🎓 Extensiones del Proyecto

**[PANTALLA: Ideas para mejoras]**

> "Ideas para expandir el procesador:"

```bash
# Versión con parámetros
echo "Mejoras posibles:"
echo "- Filtros por fecha/hora"
echo "- Alertas automáticas por umbral de errores"
echo "- Generación de gráficos con gnuplot"
echo "- Envío de reportes por email"
echo "- Análisis de patrones de comportamiento"
echo "- Integración con herramientas de monitoreo"
```

### 🏆 Resumen de Logros

**[PANTALLA: Checklist del módulo]**

> "¡Excelente trabajo! Has dominado:"

- ✅ Pipes para encadenar comandos eficientemente
- ✅ Redirección avanzada de datos
- ✅ Grep con expresiones regulares complejas
- ✅ Sed para edición automatizada de texto
- ✅ AWK para procesamiento estructurado
- ✅ Desarrollo de un procesador de logs completo

### 🚀 Próximo Módulo

**[PANTALLA: Preview del Módulo 3]**

> "En el Módulo 3 - Variables y Control de Flujo aprenderemos:"

- Variables y expansión de parámetros
- Estructuras condicionales (if, case)
- Bucles (for, while, until)
- Argumentos de script y parsing de opciones
- Proyecto: Sistema de Menús Interactivo

### 🎬 Despedida

**[PANTALLA: Logo del bootcamp]**

> "¡Increíble progreso! Has dado un salto enorme en tus habilidades de Bash. El procesamiento de texto que acabas de dominar es la base de muchísimas tareas de automatización y administración de sistemas."

> "Practica combinando estos comandos en diferentes escenarios, y nos vemos en el Módulo 3 donde añadiremos lógica e interactividad a nuestros scripts. ¡Hasta la próxima!"

---

## 📋 CHECKLIST DE PRODUCCIÓN

### Preparación de Datos

- [ ] Archivos de ejemplo creados y verificados
- [ ] Scripts de demostración probados
- [ ] Directorios de trabajo organizados
- [ ] Datos realistas para ejercicios

### Durante la Grabación

- [ ] Terminal con fuente grande y legible
- [ ] Ejecución paso a paso de cada comando
- [ ] Explicación del output de cada pipeline
- [ ] Manejo de errores comunes
- [ ] Enfoque en casos de uso reales

### Post-Producción

- [ ] Timestamps para cada sección
- [ ] Highlights en comandos importantes
- [ ] Zoom en outputs complejos
- [ ] Overlay con pipeline actual
- [ ] Thumbnail con herramientas principales

---

## 🎥 NOTAS TÉCNICAS

### Configuración Visual

- **Terminal**: Esquema de colores que diferencie grep matches
- **Editor**: Syntax highlighting para scripts
- **Split screen**: Terminal y editor simultáneamente
- **Zoom**: Nivel apropiado para comandos largos

### Puntos Clave

- Explicar cada parte de pipelines complejos
- Mostrar alternatives para diferentes casos
- Enfatizar eficiencia vs legibilidad
- Demostrar debugging de pipelines
- Incluir mejores prácticas de rendimiento

---

**¡Listo para crear un video excepcional del Módulo 2! 🚀**
