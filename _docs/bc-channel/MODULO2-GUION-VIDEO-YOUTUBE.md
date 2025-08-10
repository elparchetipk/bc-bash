# Bootcamp Bash - Módulo 2: Guión para Video de YouTube

## 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bootcamp Bash - Módulo 2: Comandos Avanzados y Pipes - Dominando el Procesamiento de Texto"

**Duración Estimada:** 50-65 minutos

**Audiencia:** Desarrolladores y administradores de sistemas que ya dominan los fundamentos del módulo 1

**Objetivo:** Dominar el procesamiento de texto avanzado y la combinación de comandos mediante pipes para crear flujos de trabajo potentes

---

## 🎯 OBJETIVOS DE APRENDIZAJE

Al finalizar este video, los estudiantes podrán:

1. **Procesar** archivos de texto con grep, sed, awk y herramientas de filtrado
2. **Combinar** comandos usando pipes para crear flujos de trabajo complejos
3. **Redirigir** entrada, salida y errores de manera eficiente
4. **Aplicar** expresiones regulares básicas para búsquedas avanzadas
5. **Crear** scripts que procesen grandes volúmenes de datos
6. **Automatizar** tareas de análisis de logs y archivos de texto

---

## 📝 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y CONTEXTO (8 minutos)

### PARTE 2: PROCESAMIENTO DE TEXTO BÁSICO (15 minutos)

### PARTE 3: PIPES Y FLUJOS DE DATOS (12 minutos)

### PARTE 4: REDIRECCIÓN AVANZADA (8 minutos)

### PARTE 5: EXPRESIONES REGULARES Y AWK (15 minutos)

### PARTE 6: PROYECTO PRÁCTICO - ANALIZADOR DE LOGS (12 minutos)

---

## 🎬 PARTE 1: INTRODUCCIÓN Y CONTEXTO (8 minutos)

### 🎤 Guión de Presentación

**[PANTALLA: Logo del Módulo 2 con animación de pipes]**

> "¡Bienvenidos de vuelta al Bootcamp Bash! Soy tu instructor y hoy vamos a explorar uno de los aspectos más poderosos de bash: el procesamiento de texto y los pipes. Si el módulo 1 te enseñó a caminar, el módulo 2 te enseñará a correr."

**[TRANSICIÓN: Estadísticas del procesamiento de texto]**

> "¿Sabías que un administrador de sistemas promedio procesa gigabytes de logs diariamente? ¿O que las empresas como Netflix analizan petabytes de datos usando herramientas que aprenderás hoy? Los comandos que dominarás pueden procesar millones de líneas en segundos."

### 📊 El Poder del Procesamiento de Texto

**[PANTALLA: Infografía con casos de uso reales]**

> "El procesamiento de texto no es solo teoría. Es la diferencia entre:
>
> - Analizar logs manualmente durante horas vs. automatizarlo en minutos
> - Procesar archivos CSV gigantes vs. extraer insights instantáneamente
> - Depurar problemas reactivamente vs. monitorizarlos proactivamente
> - Ser un usuario de terminal vs. ser un maestro de la automatización"

**[PANTALLA: Demostración rápida del resultado final]**

> "Al final de este módulo, habrás creado un analizador de logs que puede procesar gigabytes de datos y generar reportes automáticos. Pero más importante, entenderás la filosofía Unix: herramientas simples que se combinan para resolver problemas complejos."

### 🧠 La Filosofía Unix en Acción

**[PANTALLA: Diagrama de la filosofía Unix]**

> "Unix se basa en un principio brillante: 'Haz una cosa y hazla bien'. En lugar de tener un comando monstruoso que haga todo, tenemos herramientas especializadas:
>
> - `grep`: El detective que encuentra patrones
> - `sed`: El editor que transforma texto
> - `awk`: El analista que procesa datos estructurados
> - `sort`: El organizador que ordena información
> - `uniq`: El filtro que elimina duplicados"

### 🔗 El Poder de la Combinación

**[PANTALLA: Animación de pipes conectando comandos]**

> "La magia sucede cuando conectamos estas herramientas con pipes. Es como crear una cadena de montaje donde cada comando especializado contribuye al resultado final. Un pipe no es solo un símbolo `|`, es una filosofía de trabajo."

### 🗺️ Roadmap del Módulo 2

**[PANTALLA: Cronograma visual interactivo]**

> "Hoy construiremos conocimiento progresivamente:
>
> **Fundamentos:** grep, sort, uniq, wc - Las herramientas básicas
> **Conexiones:** Pipes y redirección - Conectando el flujo
> **Transformación:** sed y expresiones regulares - Modificando datos
> **Análisis:** awk avanzado - Procesamiento inteligente
> **Proyecto:** Analizador de logs completo - Aplicación real"

**[TRANSICIÓN: Preparar terminal]**

> "¿Preparados para convertirse en maestros del procesamiento de texto? ¡Abramos la terminal y comencemos!"

---

## 🔍 PARTE 2: PROCESAMIENTO DE TEXTO BÁSICO (15 minutos)

### 🎤 Transición

**[PANTALLA: Icono de lupa con texto]**

> "Comenzamos con las herramientas fundamentales. Imaginen que son detectives digitales y estos comandos son sus herramientas de investigación. Cada uno tiene un propósito específico y cuando los dominemos, podremos resolver cualquier misterio textual."

### 🕵️ grep: El Detective de Patrones

**[DEMOSTRACIÓN EN VIVO]**

> "grep es como tener un detective súper eficiente que puede leer millones de líneas por segundo buscando exactamente lo que necesitas."

```bash
# Crear archivo de ejemplo realista
cat > empleados.csv << 'EOF'
ID,Nombre,Departamento,Salario,Ciudad,Fecha_Ingreso
001,Juan Pérez,Desarrollo,3500,Madrid,2022-01-15
002,María García,Diseño,3200,Barcelona,2021-03-22
003,Pedro López,Desarrollo,4200,Valencia,2020-07-10
004,Ana Martín,Marketing,2900,Madrid,2023-02-01
005,Luis Rodríguez,Diseño,3100,Sevilla,2021-11-30
006,Carmen Sánchez,Desarrollo,3800,Madrid,2022-05-18
007,David Torres,Marketing,3300,Barcelona,2020-12-05
EOF
```

**[BÚSQUEDAS BÁSICAS]**

```bash
# Buscar desarrolladores
grep "Desarrollo" empleados.csv

# Búsqueda insensible a mayúsculas
grep -i "madrid" empleados.csv

# Mostrar números de línea
grep -n "Diseño" empleados.csv

# Buscar líneas que NO contienen el patrón
grep -v "Madrid" empleados.csv
```

**[EXPLICACIÓN DE COLORES]**

> "¿Ven cómo grep resalta las coincidencias en color? Esto no es decorativo, es funcional. Los colores nos ayudan a identificar rápidamente lo que estamos buscando en grandes volúmenes de texto."

### 🔢 Búsquedas con Patrones Numéricos

**[DEMOSTRACIÓN PRÁCTICA]**

```bash
# Buscar salarios específicos (usando expresiones regulares básicas)
grep "3[5-9]00" empleados.csv  # Salarios entre 3500-3900

# Buscar fechas de 2022
grep "2022" empleados.csv

# Contar coincidencias
grep -c "Desarrollo" empleados.csv
sort departamentos.txt | uniq -d
```

### 📈 wc: El Contador Universal

**[DEMOSTRACIÓN PRÁCTICA]**

```bash
# Estadísticas básicas del archivo
wc empleados.csv

# Solo contar líneas (empleados)
wc -l empleados.csv

# ¿Cuántos empleados hay por departamento?
cut -d',' -f3 empleados.csv | sort | uniq -c

# ¿Cuántos caracteres tiene el nombre más largo?
cut -d',' -f2 empleados.csv | wc -L
```

### 🔨 cut: El Extractor Preciso

**[DEMOSTRACIÓN EN TIEMPO REAL]**

```bash
# Extraer solo nombres
cut -d',' -f2 empleados.csv

# Extraer múltiples campos
cut -d',' -f2,4 empleados.csv

# Extraer rangos de caracteres
cut -c1-3 empleados.csv

# Combinar con otros comandos
cut -d',' -f2,4 empleados.csv | sort -t',' -k2 -n
```

### 💡 Combinaciones Poderosas

**[DEMOSTRACIÓN DE FLUJOS SIMPLES]**

```bash
# ¿Cuál es el salario promedio por departamento?
tail -n +2 empleados.csv | cut -d',' -f3,4 | sort

# ¿Cuántos empleados únicos hay en Madrid?
grep "Madrid" empleados.csv | wc -l

# Lista de departamentos únicos
cut -d',' -f3 empleados.csv | tail -n +2 | sort | uniq

# El empleado con mayor salario
tail -n +2 empleados.csv | sort -t',' -k4 -nr | head -1
```

**[REFLEXIÓN]**

> "¿Notan cómo estamos empezando a combinar comandos? Esto es solo el comienzo. En la siguiente sección aprenderemos a crear flujos de trabajo realmente potentes."

# Mostrar solo los archivos que contienen el patrón

grep -l "Desarrollo" \*.csv

````markdown
### 📊 sort: El Organizador Inteligente

**[PANTALLA: Demostración visual del ordenamiento]**

> "sort no es solo ordenar alfabéticamente. Es una herramienta sofisticada que puede organizar datos de múltiples formas."

```bash
# Ordenamiento básico
sort empleados.csv

# Ordenar por campo específico (salario - columna 4)
sort -t',' -k4 -n empleados.csv

# Ordenar por múltiples campos: primero departamento, luego salario
sort -t',' -k3,3 -k4,4n empleados.csv

# Ordenar en reverso
sort -t',' -k4 -nr empleados.csv

# Verificar si un archivo está ordenado
sort -t',' -k4 -n empleados.csv -c 2>/dev/null && echo "Ordenado" || echo "No ordenado"
```

**[EXPLICACIÓN DE PARÁMETROS]**

> "Desglosemos los parámetros:
>
> - `-t','`: usa coma como delimitador
> - `-k4`: ordena por la columna 4
> - `-n`: ordenamiento numérico (no alfabético)
> - `-r`: orden reverso"

### 🎯 uniq: El Eliminador de Duplicados

**[DEMOSTRACIÓN INTERACTIVA]**

```bash
# Crear archivo con duplicados para demostrar
cut -d',' -f3 empleados.csv | sort > departamentos.txt
cat departamentos.txt

# Eliminar duplicados
sort departamentos.txt | uniq

# Contar ocurrencias
sort departamentos.txt | uniq -c

# Solo mostrar elementos únicos (que aparecen una vez)
sort departamentos.txt | uniq -u

# Solo mostrar duplicados
sort departamentos.txt | uniq -d
```

### 📈 wc: El Contador Universal

**[DEMOSTRACIÓN PRÁCTICA]**

```bash
# Estadísticas básicas del archivo
wc empleados.csv

# Solo contar líneas (empleados)
wc -l empleados.csv

# ¿Cuántos empleados hay por departamento?
cut -d',' -f3 empleados.csv | sort | uniq -c

# ¿Cuántos caracteres tiene el nombre más largo?
cut -d',' -f2 empleados.csv | wc -L
```

### 🔨 cut: El Extractor Preciso

**[DEMOSTRACIÓN EN TIEMPO REAL]**

```bash
# Extraer solo nombres
cut -d',' -f2 empleados.csv

# Extraer múltiples campos
cut -d',' -f2,4 empleados.csv

# Extraer rangos de caracteres
cut -c1-3 empleados.csv

# Combinar con otros comandos
cut -d',' -f2,4 empleados.csv | sort -t',' -k2 -n
```

### 💡 Combinaciones Poderosas

**[DEMOSTRACIÓN DE FLUJOS SIMPLES]**

```bash
# ¿Cuál es el salario promedio por departamento?
tail -n +2 empleados.csv | cut -d',' -f3,4 | sort

# ¿Cuántos empleados únicos hay en Madrid?
grep "Madrid" empleados.csv | wc -l

# Lista de departamentos únicos
cut -d',' -f3 empleados.csv | tail -n +2 | sort | uniq

# El empleado con mayor salario
tail -n +2 empleados.csv | sort -t',' -k4 -nr | head -1
```

**[REFLEXIÓN]**

> "¿Notan cómo estamos empezando a combinar comandos? Esto es solo el comienzo. En la siguiente sección aprenderemos a crear flujos de trabajo realmente potentes."

---

## 🔗 PARTE 3: PIPES Y FLUJOS DE DATOS (12 minutos)

### 🎤 Transición

**[PANTALLA: Animación de datos fluyendo entre comandos]**

> "Ahora llega el momento mágico: conectar comandos. El pipe `|` no es solo un símbolo, es una filosofía. Permite que programas simples trabajen juntos para resolver problemas complejos. Es como crear una cadena de montaje digital."

### 🏭 La Filosofía de la Cadena de Montaje

**[PANTALLA: Diagrama de fábrica vs comandos Unix]**

> "Imaginen una fábrica de automóviles: cada estación hace una tarea específica y pasa el resultado a la siguiente. Unix funciona igual:
>
> - Estación 1: `grep` filtra datos
> - Estación 2: `sort` los organiza
> - Estación 3: `uniq` elimina duplicados
> - Estación 4: `wc` cuenta resultados"

### 🔄 Entendiendo los Flujos: stdin, stdout, stderr

**[DEMOSTRACIÓN CONCEPTUAL]**

> "Cada programa Unix tiene tres 'tuberías' de comunicación:"

```bash
# stdout (salida estándar) - descriptor 1
echo "Esto va por stdout"

# stderr (errores estándar) - descriptor 2
ls archivo_inexistente

# stdin (entrada estándar) - descriptor 0
# El teclado es stdin por defecto, pero podemos cambiarlo
```

**[VISUALIZACIÓN PRÁCTICA]**

```bash
# Ver todos los descriptores en acción
exec 3>&1  # Guardar stdout original
exec 1>salida.txt  # Redirigir stdout a archivo
echo "Esto va al archivo"
exec 1>&3  # Restaurar stdout original
echo "Esto va a pantalla"
cat salida.txt
```

### 🚰 Pipes: Conectando la Cadena

**[DEMOSTRACIÓN PROGRESIVA]**

> "Empezemos con pipes simples y vamos construyendo complejidad:"

```bash
# Pipe básico: la salida de un comando se convierte en entrada del siguiente
ls -la | grep "txt"

# Cadena de dos pipes
ls -la | grep "txt" | wc -l

# Cadena más compleja
cat empleados.csv | grep "Desarrollo" | cut -d',' -f2,4 | sort -t',' -k2 -nr
```

**[ANÁLISIS PASO A PASO]**

> "Analicemos este último comando paso a paso:
>
> 1. `cat empleados.csv`: Lee el archivo completo
> 2. `grep "Desarrollo"`: Filtra solo desarrolladores
> 3. `cut -d',' -f2,4`: Extrae nombre y salario
> 4. `sort -t',' -k2 -nr`: Ordena por salario descendente"

### 💼 Casos de Uso Reales con Pipes

**[DEMOSTRACIÓN PRÁCTICA EMPRESARIAL]**

```bash
# Análisis de logs: encontrar los errores más frecuentes
echo "Simulando análisis de logs..."

# Crear archivo de log simulado
cat > server.log << 'EOF'
2024-08-09 10:15:23 INFO User login successful: user123
2024-08-09 10:16:45 ERROR Database connection failed
2024-08-09 10:17:12 INFO File uploaded: document.pdf
2024-08-09 10:18:33 ERROR Database connection failed
2024-08-09 10:19:44 WARNING Memory usage high: 85%
2024-08-09 10:20:15 ERROR Authentication failed: user456
2024-08-09 10:21:32 INFO User logout: user123
2024-08-09 10:22:48 ERROR Database connection failed
2024-08-09 10:23:55 ERROR Authentication failed: user789
EOF

# Análisis 1: Contar tipos de mensajes
cat server.log | cut -d' ' -f4 | sort | uniq -c

# Análisis 2: Errores más frecuentes
grep "ERROR" server.log | cut -d' ' -f5- | sort | uniq -c | sort -nr

# Análisis 3: Actividad por hora
cut -d' ' -f2 server.log | cut -d':' -f1 | sort | uniq -c
```

### 🎯 Pipes Avanzados: tee y Process Substitution

**[DEMOSTRACIÓN DE TEE]**

> "`tee` es como una tubería con una 'T': el flujo continúa Y se guarda en un archivo"

```bash
# Guardar resultado intermedio mientras continúa el procesamiento
cat empleados.csv | grep "Madrid" | tee madrid_empleados.txt | cut -d',' -f2,4

# Verificar que se guardó el archivo intermedio
echo "--- Archivo guardado por tee ---"
cat madrid_empleados.txt
```

**[PROCESS SUBSTITUTION - NIVEL AVANZADO]**

```bash
# Comparar dos conjuntos de datos simultáneamente
diff <(cut -d',' -f3 empleados.csv | sort) <(echo -e "Desarrollo\nDiseño\nMarketing" | sort)

# Combinar múltiples fuentes
paste <(cut -d',' -f2 empleados.csv) <(cut -d',' -f4 empleados.csv) | head -5
```

### 🔧 Herramientas Especializadas para Pipes

**[DEMOSTRACIÓN DE HERRAMIENTAS ÚTILES]**

```bash
# head y tail: primeros y últimos elementos
cat empleados.csv | sort -t',' -k4 -nr | head -3  # Top 3 salarios

# column: formatear salida en columnas
cut -d',' -f2,3,4 empleados.csv | column -t -s','

# xargs: convertir stdin en argumentos
find . -name "*.txt" | xargs ls -la

# parallel processing con xargs
find . -name "*.csv" | xargs -P 4 -I {} wc -l {}
```

### 💡 Patrones Comunes de Pipes

**[PANTALLA: Recetas de pipes útiles]**

```bash
# Patrón 1: Análisis de frecuencia
comando | sort | uniq -c | sort -nr

# Patrón 2: Top N resultados
comando | sort | uniq -c | sort -nr | head -10

# Patrón 3: Filtrar y contar
grep "patrón" archivo | wc -l

# Patrón 4: Extracción y análisis
cut -d'delim' -f'campo' archivo | sort | uniq -c

# Patrón 5: Limpieza y procesamiento
sed 's/patrón/reemplazo/g' archivo | grep -v "^$" | sort
```

### 🚨 Errores Comunes y Debugging

**[DEMOSTRACIÓN DE DEBUGGING]**

```bash
# Error común: olvidar que pipes procesan línea por línea
echo "Pipes procesan línea por línea, no archivo completo"

# Debugging: ver cada paso del pipe
cat empleados.csv | grep "Madrid" | tee /dev/stderr | cut -d',' -f2

# Usar ||  y && para manejo de errores
grep "patrón" archivo.txt 2>/dev/null || echo "Patrón no encontrado"

# Verificar si el pipe falló
cat empleados.csv | grep "Inexistente" | wc -l
echo "Exit code del pipe completo: $?"
```

**[MEJORES PRÁCTICAS]**

> "Consejos para pipes efectivos:
>
> 1. Construye pipes incrementalmente - prueba cada paso
> 2. Usa `tee` para debug intermedio
> 3. Maneja errores con `2>/dev/null` cuando sea apropiado
> 4. Recuerda que pipes fallan si cualquier comando falla
> 5. El performance importa: pon filtros (`grep`) al principio"
````

## 📤 PARTE 4: REDIRECCIÓN AVANZADA (8 minutos)

### 🎤 Transición

**[PANTALLA: Diagrama de flujos de datos con flechas]**

> "Los pipes conectan comandos, pero la redirección controla hacia dónde van los datos. Es como ser el director de tráfico de la información: decides qué va a archivos, qué se descarta, y qué se combina."

### 🗂️ Los Tres Canales de Comunicación

**[PANTALLA: Visualización de descriptores de archivo]**

> "Recordemos los tres canales básicos que todo programa Unix maneja:"

```bash
# Demostración visual de los descriptores
exec 3>&1  # Guardar stdout original en descriptor 3

echo "=== DEMOSTRACIÓN DE DESCRIPTORES ==="
echo "Esto va por stdout (descriptor 1)" >&1
echo "Esto va por stderr (descriptor 2)" >&2
echo "Esto va por descriptor 3" >&3

exec 3>&-  # Cerrar descriptor 3
```

### 📁 Redirección de Salida: Controlando stdout

**[DEMOSTRACIÓN PROGRESIVA]**

```bash
# Redirección básica - SOBRESCRIBE el archivo
echo "Primera línea" > archivo_salida.txt
echo "Segunda línea" > archivo_salida.txt  # ¡Borra la primera!
cat archivo_salida.txt

# Redirección append - AGREGA al archivo
echo "Primera línea" > archivo_append.txt
echo "Segunda línea" >> archivo_append.txt
echo "Tercera línea" >> archivo_append.txt
cat archivo_append.txt
```

**[CASOS PRÁCTICOS EMPRESARIALES]**

```bash
# Generar reportes automáticos
echo "=== REPORTE DIARIO ===" > reporte_$(date +%Y%m%d).txt
echo "Fecha: $(date)" >> reporte_$(date +%Y%m%d).txt
ps aux | grep -v grep | wc -l >> reporte_$(date +%Y%m%d).txt

# Separar salida normal de errores
ls -la /home /directorio_inexistente > salida_normal.txt 2> errores.txt

# Verificar ambos archivos
echo "--- Salida Normal ---"
cat salida_normal.txt
echo "--- Errores ---"
cat errores.txt
```

### ⚠️ Manejo Inteligente de Errores

**[DEMOSTRACIÓN DE STDERR]**

```bash
# Redirigir solo errores
find /etc -name "*.conf" 2> errores_find.txt

# Combinar stdout y stderr al mismo archivo
find /etc -name "*.conf" > busqueda_completa.txt 2>&1

# Método alternativo (más moderno)
find /etc -name "*.conf" &> busqueda_completa2.txt

# Descartar errores completamente
find /etc -name "*.conf" 2>/dev/null

# Descartar todo (stdout y stderr)
comando_ruidoso &>/dev/null
```

**[ESCENARIO REAL: SCRIPT DE BACKUP]**

```bash
# Script de backup con manejo de errores separado
cat > backup_demo.sh << 'EOF'
#!/bin/bash

BACKUP_DIR="/tmp/backup_$(date +%Y%m%d)"
LOG_FILE="/tmp/backup.log"
ERROR_FILE="/tmp/backup_errors.log"

echo "=== INICIO BACKUP $(date) ===" >> "$LOG_FILE" 2>> "$ERROR_FILE"

# Backup con logging separado
mkdir -p "$BACKUP_DIR" >> "$LOG_FILE" 2>> "$ERROR_FILE"
cp -r /home/usuario/documentos "$BACKUP_DIR/" >> "$LOG_FILE" 2>> "$ERROR_FILE"

echo "=== FIN BACKUP $(date) ===" >> "$LOG_FILE" 2>> "$ERROR_FILE"
EOF

chmod +x backup_demo.sh
# ./backup_demo.sh  # Ejecutaríamos en un entorno real
```

### 🔄 Redirección de Entrada: Controlando stdin

**[DEMOSTRACIÓN DE HERE DOCUMENTS]**

```bash
# Here document: enviar múltiples líneas como input
cat << 'EOF' > configuracion.txt
servidor=localhost
puerto=8080
debug=true
timeout=30
EOF

# Here string: enviar una línea como input
grep "puerto" <<< "servidor=localhost
puerto=8080
debug=true"

# Usar archivo como input
sort < empleados.csv > empleados_ordenados.csv

# Combinación potente: input y output redirection
sort < empleados.csv > empleados_ordenados.csv 2> errores_sort.txt
```

### 🔀 Redirección Avanzada: Casos Complejos

**[DEMOSTRACIÓN DE TÉCNICAS AVANZADAS]**

```bash
# Intercambiar stdout y stderr
comando 3>&1 1>&2 2>&3

# Logging completo: guardar todo pero también ver en pantalla
ls -la /home /directorio_inexistente 2>&1 | tee log_completo.txt

# Pipeline con redirección compleja
cat empleados.csv | grep "Madrid" | sort -t',' -k4 -nr | tee madrid_sorted.txt | head -3

# Redirección condicional basada en éxito/fallo
if grep "ERROR" server.log > errores_encontrados.txt 2>/dev/null; then
    echo "Se encontraron errores. Revisa errores_encontrados.txt"
else
    echo "No hay errores en el log"
fi
```

### 📊 Process Substitution: Lo Más Avanzado

**[DEMOSTRACIÓN DE PROCESS SUBSTITUTION]**

```bash
# Comparar salidas de dos comandos sin archivos temporales
diff <(sort empleados.csv) <(sort -r empleados.csv)

# Usar múltiples inputs
paste <(cut -d',' -f2 empleados.csv) <(cut -d',' -f4 empleados.csv) <(cut -d',' -f5 empleados.csv)

# Combinar con pipes normales
cat <(echo "=== ENCABEZADO ===") empleados.csv <(echo "=== PIE ===") | head -10
```

### 🔧 Named Pipes (FIFOs) - Nivel Experto

**[DEMOSTRACIÓN CONCEPTUAL]**

```bash
# Crear named pipe
mkfifo mi_pipe

# En una terminal (simularemos con comentario):
# echo "Datos por pipe" > mi_pipe &

# En otra terminal:
# cat < mi_pipe

# Limpiar
rm mi_pipe
```

### 💡 Patrones Útiles de Redirección

**[PANTALLA: Recetario de redirección]**

```bash
# Patrón 1: Log completo con timestamp
comando 2>&1 | while read line; do echo "$(date): $line"; done >> log_con_tiempo.txt

# Patrón 2: Backup antes de sobrescribir
[ -f archivo.txt ] && cp archivo.txt archivo.txt.bak
comando > archivo.txt

# Patrón 3: Capturar y mostrar errores
comando 2> >(while read line; do echo "ERROR: $line" >&2; done)

# Patrón 4: Multiplex output
comando | tee archivo1.txt archivo2.txt archivo3.txt

# Patrón 5: Silent execution con logging
{ comando 2>&1; echo "Exit code: $?"; } >> log_completo.txt
```

### 🚨 Errores Comunes en Redirección

**[DEMOSTRACIÓN DE ERRORES TÍPICOS]**

```bash
# ERROR: No se puede leer y escribir al mismo archivo
# grep "patrón" archivo.txt > archivo.txt  # ¡Esto borra el archivo!

# CORRECTO: Usar archivo temporal
grep "patrón" archivo.txt > temp.txt && mv temp.txt archivo.txt

# ERROR: Orden incorrecto de redirección
# comando 2>&1 > archivo.txt  # stderr va a pantalla, no al archivo

# CORRECTO:
comando > archivo.txt 2>&1  # Ambos van al archivo

# ERROR: Olvidar que > borra el archivo
echo "línea 1" > archivo.txt
echo "línea 2" > archivo.txt  # ¡línea 1 se perdió!

# CORRECTO:
echo "línea 1" > archivo.txt
echo "línea 2" >> archivo.txt
```

**[MEJORES PRÁCTICAS]**

> "Reglas de oro para redirección:
>
> 1. Usa `>>` para agregar, `>` solo cuando quieras sobrescribir
> 2. Siempre maneja stderr explícitamente en scripts
> 3. Usa `tee` cuando necesites ver y guardar simultáneamente
> 4. Prueba redirecciones con archivos de prueba primero
> 5. Recuerda que `2>&1` debe ir AL FINAL para capturar todo"

````

## 🎯 PARTE 5: EXPRESIONES REGULARES Y AWK (15 minutos)

### 🎤 Transición

**[PANTALLA: Patrón de regex animado]**

> "Ahora llegamos a las herramientas más poderosas del procesamiento de texto: las expresiones regulares y AWK. Si grep es un detective, las expresiones regulares son su lupa de alta precisión. Y si AWK es un analista, es uno que puede programar mientras analiza."

### 🔍 Expresiones Regulares: El Lenguaje de los Patrones

**[PANTALLA: Introducción visual a regex]**

> "Las expresiones regulares (regex) son un lenguaje para describir patrones de texto. Es como tener superpoderes para buscar: en lugar de buscar texto exacto, describes CÓMO debe verse el texto que buscas."

### 📝 Metacaracteres Básicos

**[DEMOSTRACIÓN PROGRESIVA]**

```bash
# Crear archivo de prueba para regex
cat > datos_regex.txt << 'EOF'
juan.perez@empresa.com
maria_garcia@gmail.com
pedro123@hotmail.es
ana.martin@universidad.edu
luis@dominio.co.uk
carmen.sanchez@empresa.com
david.torres@outlook.com
123-456-7890
+34-91-123-4567
(555) 123-4567
usuario@dominio
email_sin_punto@empresa
EOF

# Metacarácter . (cualquier carácter)
grep "p.dro" datos_regex.txt

# Metacarácter * (cero o más repeticiones)
grep "pe.*ez" datos_regex.txt

# Metacarácter + (una o más repeticiones)
grep -E "pe.+ez" datos_regex.txt

# Metacarácter ? (cero o una repetición)
grep -E "colou?r" datos_regex.txt
```

### 🎯 Anclas y Posiciones

**[DEMOSTRACIÓN DE ANCLAS]**

```bash
# ^ inicio de línea
grep "^maria" datos_regex.txt

# $ final de línea
grep "\.com$" datos_regex.txt

# \b límite de palabra
grep -E "\bana\b" datos_regex.txt

# Combinación: emails que empiecen y terminen con condiciones específicas
grep -E "^[a-z]+.*\.com$" datos_regex.txt
```

### 📚 Clases de Caracteres

**[DEMOSTRACIÓN INTERACTIVA]**

```bash
# [abc] uno de los caracteres listados
grep "[aei]@" datos_regex.txt

# [a-z] rango de caracteres
grep "[a-z]@[a-z]" datos_regex.txt

# [^abc] cualquier carácter EXCEPTO los listados
grep "[^a-z]@" datos_regex.txt

# Clases predefinidas con grep -E
grep -E "[[:digit:]]+" datos_regex.txt    # números
grep -E "[[:alpha:]]+" datos_regex.txt    # letras
grep -E "[[:alnum:]]+" datos_regex.txt    # letras y números
```

### 📞 Caso Práctico: Validación de Teléfonos

**[DEMOSTRACIÓN REAL]**

```bash
# Teléfonos en formato XXX-XXX-XXXX
grep -E "[0-9]{3}-[0-9]{3}-[0-9]{4}" datos_regex.txt

# Teléfonos internacionales con +
grep -E "\+[0-9]{2}-[0-9]{2}-[0-9]{3}-[0-9]{4}" datos_regex.txt

# Teléfonos con paréntesis
grep -E "\([0-9]{3}\) [0-9]{3}-[0-9]{4}" datos_regex.txt

# Cualquier formato de teléfono (regex compleja)
grep -E "(\+[0-9]{2}-[0-9]{2}-[0-9]{3}-[0-9]{4})|([0-9]{3}-[0-9]{3}-[0-9]{4})|(\([0-9]{3}\) [0-9]{3}-[0-9]{4})" datos_regex.txt
```

### 📧 Validación de Emails con Regex

**[DEMOSTRACIÓN AVANZADA]**

```bash
# Email básico: caracteres @ caracteres . caracteres
grep -E "[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" datos_regex.txt

# Emails de empresa específica
grep -E "[a-zA-Z0-9._-]+@empresa\.com" datos_regex.txt

# Emails con dominios universitarios
grep -E "[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.edu" datos_regex.txt

# Validar estructura de email completa
grep -E "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" datos_regex.txt
```

### ⚙️ sed con Expresiones Regulares

**[DEMOSTRACIÓN DE TRANSFORMACIONES]**

```bash
# Ocultar parte del email (privacidad)
sed -E 's/([a-zA-Z0-9._-]+)@([a-zA-Z0-9.-]+)/***@\2/g' datos_regex.txt

# Formatear teléfonos a un estándar
sed -E 's/\+([0-9]{2})-([0-9]{2})-([0-9]{3})-([0-9]{4})/(\1) \2-\3-\4/g' datos_regex.txt

# Extraer dominio de emails
sed -E 's/.*@([a-zA-Z0-9.-]+\.[a-zA-Z]{2,}).*/\1/g' datos_regex.txt

# Validar y limpiar datos
sed -E '/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/!d' datos_regex.txt
```

---

## 🔧 AWK: El Procesador Inteligente

### 🎤 Introducción a AWK

**[PANTALLA: Logo AWK con ejemplos]**

> "AWK no es solo un comando, es un lenguaje de programación completo diseñado para procesamiento de texto. Fue creado por Aho, Weinberger y Kernighan (de ahí AWK) y es perfecto para datos estructurados."

### 📊 Conceptos Fundamentales de AWK

**[DEMOSTRACIÓN CONCEPTUAL]**

```bash
# Archivo de datos para AWK
cat > ventas.csv << 'EOF'
Fecha,Vendedor,Producto,Cantidad,Precio
2024-01-15,Juan,Laptop,2,1500
2024-01-16,María,Mouse,10,25
2024-01-17,Pedro,Teclado,5,80
2024-01-18,Ana,Monitor,3,300
2024-01-19,Luis,Laptop,1,1500
2024-01-20,Carmen,Mouse,15,25
2024-01-21,David,Teclado,8,80
EOF

# Estructura básica de AWK: patrón { acción }
awk -F',' '{print $2, $3}' ventas.csv  # Vendedor y producto

# AWK procesa línea por línea automáticamente
awk -F',' 'NR > 1 {print "Vendedor:", $2, "vendió", $4, $3}' ventas.csv
```

### 🔢 Variables Automáticas de AWK

**[DEMOSTRACIÓN DE VARIABLES]**

```bash
# NR: número de registro (línea)
awk -F',' '{print "Línea", NR ":", $0}' ventas.csv

# NF: número de campos en la línea actual
awk -F',' '{print "Línea con", NF, "campos:", $0}' ventas.csv

# $0: línea completa, $1, $2, etc.: campos específicos
awk -F',' '{print "Campo 1:", $1, "- Campo 2:", $2}' ventas.csv

# FS: separador de campos (equivalente a -F)
awk 'BEGIN{FS=","} {print $2, $3}' ventas.csv
```

### 💰 Cálculos y Agregaciones

**[DEMOSTRACIÓN DE ANÁLISIS FINANCIERO]**

```bash
# Calcular total de ventas por producto
awk -F',' 'NR > 1 {
    total = $4 * $5;
    print $3 ":", "$" total;
}' ventas.csv

# Sumar total de ventas
awk -F',' 'NR > 1 {
    total += $4 * $5;
}
END {
    print "Total de ventas: $" total;
}' ventas.csv

# Estadísticas por vendedor
awk -F',' 'NR > 1 {
    vendedor = $2;
    ventas[vendedor] += $4 * $5;
    count[vendedor]++;
}
END {
    print "=== ESTADÍSTICAS POR VENDEDOR ===";
    for (v in ventas) {
        printf "%-10s: $%-8.2f (%d ventas)\n", v, ventas[v], count[v];
    }
}' ventas.csv
```

### 🎯 Filtros Condicionales en AWK

**[DEMOSTRACIÓN DE CONDICIONES]**

```bash
# Ventas superiores a $200
awk -F',' 'NR > 1 && $4 * $5 > 200 {
    printf "VENTA GRANDE: %s vendió %d %s por $%.2f\n", $2, $4, $3, $4*$5;
}' ventas.csv

# Vendedores específicos
awk -F',' '$2 == "Juan" || $2 == "María" {print $0}' ventas.csv

# Productos con alta cantidad
awk -F',' 'NR > 1 && $4 >= 5 {
    print $2 " vendió muchas unidades de " $3 " (" $4 " unidades)";
}' ventas.csv
```

### 📈 Reportes Avanzados con AWK

**[DEMOSTRACIÓN DE REPORTE COMPLETO]**

```bash
# Reporte ejecutivo completo
awk -F',' '
BEGIN {
    print "========================================";
    print "         REPORTE DE VENTAS";
    print "         Generado: " strftime("%Y-%m-%d %H:%M:%S");
    print "========================================\n";
}

{
    # Extraer campos del log
    ip = $1;
    timestamp = $4;
    gsub(/\[/, "", timestamp);
    method = $6;
    gsub(/"/, "", method);
    url = $7;
    status = $9;
    bytes = $10;

    # Contadores generales
    total_requests++;
    total_bytes += bytes;

    # Por IP
    requests_by_ip[ip]++;
    bytes_by_ip[ip] += bytes;

    # Por código de estado
    status_codes[status]++;

    # Por método HTTP
    methods[method]++;

    # Por URL
    urls[url]++;

    # Detectar patrones sospechosos
    if (status == 401) {
        unauthorized[ip]++;
    }
    if (url ~ /admin|login|wp-admin/) {
        sensitive_access[ip]++;
    }
}

END {
    # Resumen general
    printf "RESUMEN GENERAL:\n";
    printf "  Total de requests: %d\n", total_requests;
    printf "  Total de bytes transferidos: %.2f MB\n", total_bytes/1024/1024;
    printf "  Promedio de bytes por request: %.0f\n", total_bytes/total_requests;
    print "";

    # Top IPs por tráfico
    printf "TOP 5 IPs POR TRÁFICO:\n";
    n = asorti(bytes_by_ip, sorted_ips);
    for (i = n; i >= n-4 && i >= 1; i--) {
        ip = sorted_ips[i];
        printf "  %-15s: %d requests, %.2f MB\n",
               ip, requests_by_ip[ip], bytes_by_ip[ip]/1024/1024;
    }
    print "";

    # Códigos de estado
    printf "DISTRIBUCIÓN DE CÓDIGOS DE ESTADO:\n";
    for (code in status_codes) {
        printf "  %s: %d (%.1f%%)\n",
               code, status_codes[code],
               (status_codes[code]/total_requests)*100;
    }
    print "";

    # Alertas de seguridad
    printf "ALERTAS DE SEGURIDAD:\n";
    alert_count = 0;
    for (ip in unauthorized) {
        if (unauthorized[ip] >= 3) {
            printf "  ALERTA: IP %s tuvo %d errores 401\n", ip, unauthorized[ip];
            alert_count++;
        }
    }
    for (ip in sensitive_access) {
        if (sensitive_access[ip] >= 2) {
            printf "  ALERTA: IP %s accedió %d veces a URLs sensibles\n",
                   ip, sensitive_access[ip];
            alert_count++;
        }
    }
    if (alert_count == 0) {
        printf "  No se detectaron patrones sospechosos.\n";
    }

    print "\n========================================";
}' "$ACCESS_LOG" > "$REPORT_DIR/reporte_completo.txt"

# Mostrar reporte en pantalla
cat "$REPORT_DIR/reporte_completo.txt"
EOF
```

### 📧 Módulo 5: Sistema de Alertas

**[DEMOSTRACIÓN: Finalizando el proyecto]**

```bash
# Agregar sistema de alertas y finalización
cat >> analizador.sh << 'EOF'

# === SISTEMA DE ALERTAS ===
echo ""
echo -e "${YELLOW}=== VERIFICANDO ALERTAS CRÍTICAS ===${NC}"

# Función para enviar alerta (simulada)
send_alert() {
    local level="$1"
    local message="$2"
    echo -e "${RED}[ALERTA $level] $message${NC}"
    echo "[$(date)] [ALERTA $level] $message" >> "$REPORT_DIR/alertas.log"

    # En un entorno real, aquí enviarías email, slack, etc.
    # mail -s "Alerta de Seguridad" admin@empresa.com < alerta.txt
    # curl -X POST slack_webhook -d "{\"text\":\"$message\"}"
}

# Verificar alertas críticas
critical_ips=$(awk '$9 == 401 {print $1}' "$ACCESS_LOG" | sort | uniq -c | \
               awk -v threshold=5 '$1 >= threshold {print $2}' | wc -l)

if [ "$critical_ips" -gt 0 ]; then
    send_alert "CRÍTICA" "Se detectaron $critical_ips IPs con múltiples fallos de autenticación"
fi

# Verificar errores 500
server_errors=$(awk '$9 == 500' "$ACCESS_LOG" | wc -l)
if [ "$server_errors" -gt 0 ]; then
    send_alert "ALTA" "Se detectaron $server_errors errores internos del servidor"
fi

# === FINALIZACIÓN ===
echo ""
echo -e "${GREEN}=== ANÁLISIS COMPLETADO ===${NC}"
echo "Reportes guardados en: $REPORT_DIR/"
echo "  - reporte_completo.txt: Análisis detallado"
echo "  - ips_sospechosas.txt: IPs con actividad sospechosa"
echo "  - alertas.log: Log de alertas generadas"

# Crear script de monitoreo continuo
cat > monitor_continuo.sh << 'MONITOR_EOF'
#!/bin/bash
# Monitor continuo de logs

while true; do
    echo "$(date): Ejecutando análisis de logs..."
    ./analizador.sh
    echo "Próximo análisis en 5 minutos..."
    sleep 300
done
MONITOR_EOF

chmod +x monitor_continuo.sh

echo ""
echo -e "${BLUE}Scripts adicionales creados:${NC}"
echo "  - monitor_continuo.sh: Para monitoreo en tiempo real"
echo ""
echo -e "${GREEN}¡Analizador de logs completado con éxito!${NC}"
EOF
```

### 🧪 Probando el Analizador Completo

**[DEMOSTRACIÓN EN VIVO]**

```bash
# Ejecutar el analizador completo
echo -e "\n${BLUE}=== EJECUTANDO EL ANALIZADOR COMPLETO ===${NC}"
./analizador.sh

# Verificar los archivos generados
echo -e "\n${GREEN}=== ARCHIVOS GENERADOS ===${NC}"
ls -la reportes_*/

# Mostrar resumen del reporte
echo -e "\n${YELLOW}=== RESUMEN DEL REPORTE ===${NC}"
head -20 reportes_*/reporte_completo.txt
```

### 🎓 Lo que Hemos Logrado

**[PANTALLA: Resumen de logros]**

> "¡Increíble! En este módulo hemos creado un analizador de logs profesional que:
> ✅ **Procesa** logs de servidor web en formato estándar
> ✅ **Analiza** tráfico y detecta patrones
> ✅ **Identifica** amenazas de seguridad
> ✅ **Genera** reportes automáticos
> ✅ **Crea** alertas inteligentes
> ✅ **Combina** todas las herramientas del módulo 2"

### 🚀 Próximos Pasos y Módulo 3

**[PANTALLA: Roadmap futuro]**

> "Este analizador es solo el comienzo. En el **Módulo 3: Variables y Control de Flujo** aprenderemos:
>
> - **Variables avanzadas** y arrays
> - **Estructuras de control** (if, for, while, case)
> - **Funciones personalizadas** para modularizar código
> - **Manejo de argumentos** y configuraciones
> - **Validación de datos** robusta
> - **Scripts interactivos** con menús"

### 📚 Recursos para Continuar

**[PANTALLA: Desafíos adicionales]**

> "Para seguir practicando:
>
> **Desafíos:**
> - Agrega soporte para logs de NGINX
> - Implementa alertas por email/Slack reales
> - Crea dashboard web con los datos
> - Añade análisis de geolocalización de IPs
>
> **Lecturas:**
> - Manual de Apache/Nginx log formats
> - Guía de expresiones regulares avanzadas
> - Best practices de monitoreo de sistemas"

**[MENSAJE FINAL]**

> "¡Felicitaciones! Has dominado el procesamiento de texto avanzado en bash. Estas habilidades te convertirán en un administrador de sistemas y desarrollador más eficiente. ¡Nos vemos en el Módulo 3 para dar el siguiente gran paso!"
````
