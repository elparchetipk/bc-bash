# Bootcamp Bash - Módulo 5: Desarrollo Paso a Paso

## Guión para Video de YouTube - Operaciones de Archivos y Texto

---

## 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bootcamp Bash - Módulo 5: Operaciones de Archivos y Texto - Procesamiento Avanzado de Datos"

**Duración Estimada:** 65-80 minutos

**Audiencia:** Estudiantes que dominan funciones y arrays, listos para procesamiento avanzado de texto y datos

**Objetivo:** Dominar expresiones regulares, herramientas avanzadas de texto (sed, awk) y crear sistemas de análisis de datos

---

## 🎯 OBJETIVOS DE APRENDIZAJE

Al finalizar este video, los estudiantes podrán:

1. **Dominar** expresiones regulares para búsquedas complejas
2. **Utilizar** sed para edición y transformación de texto
3. **Programar** con awk para análisis de datos estructurados
4. **Procesar** archivos CSV, JSON y logs de manera eficiente
5. **Implementar** pipelines de transformación de datos
6. **Desarrollar** un Analizador de Logs con Reportes completo

---

## 📝 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y EXPRESIONES REGULARES (20 minutos)

### PARTE 2: SED - EDITOR DE FLUJO AVANZADO (15 minutos)

### PARTE 3: AWK - LENGUAJE DE PROCESAMIENTO (20 minutos)

### PARTE 4: PROCESAMIENTO DE FORMATOS ESTRUCTURADOS (10 minutos)

### PARTE 5: PROYECTO PRÁCTICO - ANALIZADOR DE LOGS (15 minutos)

---

## 🎬 PARTE 1: INTRODUCCIÓN Y EXPRESIONES REGULARES (20 minutos)

### 🎤 Guión de Presentación

**[PANTALLA: Logo del Módulo 5 con SVG]**

> "¡Bienvenidos al Módulo 5 del Bootcamp Bash! Hoy vamos a dominar el procesamiento avanzado de texto y datos. Este es el módulo donde realmente comenzamos a trabajar como analistas de datos y administradores de sistemas profesionales."

**[TRANSICIÓN: Evolución del aprendizaje]**

> "Hasta ahora hemos construido una base sólida: comandos, pipes, variables, control de flujo, funciones y arrays. Ahora vamos a usar toda esa base para procesar información real del mundo empresarial."

### 🔍 El Poder del Procesamiento de Texto

**[PANTALLA: Casos de uso reales]**

> "En el mundo real, gran parte del trabajo con Bash involucra procesar texto: logs de servidores, archivos de configuración, datos CSV, APIs JSON, reportes de sistemas. Las herramientas que dominaremos hoy son las que usan los DevOps, SysAdmins y Data Engineers diariamente."

**[PANTALLA: Antes vs después]**

> "Imagina procesar un archivo de 100MB de logs en segundos, extraer patrones específicos, generar reportes automáticos y alertas. Eso es lo que lograremos al final de este módulo."

### 🗺️ Roadmap del Módulo 5

**[PANTALLA: Estructura del módulo]**

> "En este módulo cubriremos:
>
> - Expresiones regulares maestras
> - Sed para transformación de texto
> - AWK como lenguaje de análisis
> - Procesamiento de CSV, JSON y logs
> - Pipelines de datos complejos
> - Proyecto: Analizador de Logs con Reportes"

### 🎯 Expresiones Regulares Fundamentales

**[PANTALLA: Terminal en vivo]**

> "Las expresiones regulares son patrones que describen texto. Son como un lenguaje universal para búsquedas complejas:"

```bash
# Configurar entorno del módulo 5
cd ~/bootcamp-bash
mkdir -p modulo5/{ejercicios,proyectos,datos,logs,reportes}
cd modulo5

# Crear datos de ejemplo para practicar
cat > datos/usuarios.txt << 'EOF'
juan.perez@empresa.com,Juan Pérez,28,Madrid,+34-600-123-456
maria.garcia@empresa.com,María García,32,Barcelona,+34-650-789-012
pedro.lopez@empresa.com,Pedro López,45,Valencia,+34-620-345-678
ana.martin@empresa.com,Ana Martín,29,Sevilla,+34-680-901-234
carlos.ruiz@empresa.com,Carlos Ruiz,38,Bilbao,+34-610-567-890
laura.torres@empresa.com,Laura Torres,26,Málaga,+34-640-123-789
EOF

cat > datos/servidor.log << 'EOF'
2024-08-09 08:30:15 [INFO] Usuario juan.perez conectado desde 192.168.1.100
2024-08-09 08:31:22 [ERROR] Fallo en conexión a base de datos - timeout 30s
2024-08-09 08:32:45 [WARN] Memoria al 85% - PID 1234 consumiendo 2.3GB
2024-08-09 08:33:10 [INFO] Backup iniciado - directorio /var/backups/
2024-08-09 08:34:55 [ERROR] API externa no responde - código 500
2024-08-09 08:35:30 [INFO] Usuario maria.garcia desconectado
2024-08-09 08:36:12 [DEBUG] Cache limpiado - 150MB liberados
2024-08-09 08:37:45 [ERROR] Espacio en disco bajo - /var/log 95% lleno
2024-08-09 08:38:20 [INFO] Proceso de limpieza automática iniciado
2024-08-09 08:39:15 [WARN] CPU al 92% durante 5 minutos consecutivos
EOF

echo "📁 Datos de ejemplo creados"
```

### 🔎 Regex Básicas y Avanzadas

**[PANTALLA: Progresión de complejidad]**

> "Empezamos con patrones básicos y escalamos a expresiones complejas:"

```bash
# Metacaracteres básicos
echo "📍 METACARACTERES BÁSICOS:"
echo "=========================="

# Punto (.) - cualquier carácter
grep "..@.." datos/usuarios.txt           # Dos caracteres antes y después de @

# Asterisco (*) - cero o más del anterior
grep "a.*a" datos/usuarios.txt            # 'a' seguida de cualquier cosa y otra 'a'

# Inicio (^) y fin ($) de línea
grep "^[Aa]" datos/usuarios.txt           # Líneas que empiezan con A o a
grep "com$" datos/usuarios.txt            # Líneas que terminan con 'com'

# Clases de caracteres
grep "[0-9]" datos/usuarios.txt           # Cualquier dígito
grep "[A-Z]" datos/usuarios.txt           # Cualquier mayúscula
grep "[aeiou]" datos/usuarios.txt         # Cualquier vocal

echo
echo "🎯 CUANTIFICADORES:"
echo "=================="

# Cuantificadores específicos
grep -E "[0-9]{2}" datos/usuarios.txt     # Exactamente 2 dígitos
grep -E "[0-9]{2,4}" datos/usuarios.txt   # Entre 2 y 4 dígitos
grep -E "[0-9]{3,}" datos/usuarios.txt    # 3 o más dígitos

# Operador más (+) - uno o más
grep -E "[0-9]+" datos/usuarios.txt       # Uno o más dígitos

# Operador interrogación (?) - cero o uno
grep -E "colou?r" datos/usuarios.txt      # "color" o "colour"
```

### 📧 Patrones del Mundo Real

**[PANTALLA: Casos prácticos empresariales]**

> "Veamos patrones que usarás constantemente en el trabajo real:"

```bash
echo "📧 VALIDACIÓN DE EMAILS:"
echo "======================="

# Email básico
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" datos/usuarios.txt

# Extraer solo emails
grep -oE "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" datos/usuarios.txt

echo
echo "📞 NÚMEROS DE TELÉFONO:"
echo "====================="

# Teléfonos españoles
grep -E "\+34-[0-9]{3}-[0-9]{3}-[0-9]{3}" datos/usuarios.txt

# Solo los números
grep -oE "\+34-[0-9]{3}-[0-9]{3}-[0-9]{3}" datos/usuarios.txt

echo
echo "🌐 DIRECCIONES IP:"
echo "================="

# IPs en logs
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" datos/servidor.log

# IPs específicas (192.168.x.x)
grep -E "192\.168\.[0-9]{1,3}\.[0-9]{1,3}" datos/servidor.log

echo
echo "📅 FECHAS Y HORAS:"
echo "================="

# Formato YYYY-MM-DD HH:MM:SS
grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" datos/servidor.log

# Solo las horas
grep -oE "[0-9]{2}:[0-9]{2}:[0-9]{2}" datos/servidor.log
```

### 🚀 Regex Avanzadas y Grupos

**[PANTALLA: Técnicas profesionales]**

> "Técnicas avanzadas para extraer y manipular información específica:"

```bash
echo "🎭 GRUPOS Y CAPTURA:"
echo "=================="

# Crear script para demostrar grupos
cat > ejercicios/demo_regex_avanzadas.sh << 'EOF'
#!/bin/bash
# Demostración de Regex Avanzadas - Módulo 5

set -euo pipefail

echo "🎯 ANÁLISIS AVANZADO CON REGEX"
echo "=============================="
echo

# Extraer componentes de emails
echo "📧 Descomponiendo emails:"
echo "------------------------"
while IFS= read -r linea; do
    if [[ "$linea" =~ ([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,}) ]]; then
        usuario="${BASH_REMATCH[1]}"
        dominio="${BASH_REMATCH[2]}"
        extension="${BASH_REMATCH[3]}"
        echo "Usuario: $usuario | Dominio: $dominio | Ext: $extension"
    fi
done < "../datos/usuarios.txt"

echo
echo "📞 Analizando teléfonos:"
echo "----------------------"
while IFS= read -r linea; do
    if [[ "$linea" =~ \+([0-9]{2})-([0-9]{3})-([0-9]{3})-([0-9]{3}) ]]; then
        pais="${BASH_REMATCH[1]}"
        area="${BASH_REMATCH[2]}"
        num1="${BASH_REMATCH[3]}"
        num2="${BASH_REMATCH[4]}"
        echo "País: +$pais | Área: $area | Número: $num1-$num2"
    fi
done < "../datos/usuarios.txt"

echo
echo "🕐 Procesando timestamps de logs:"
echo "-------------------------------"
while IFS= read -r linea; do
    if [[ "$linea" =~ ([0-9]{4}-[0-9]{2}-[0-9]{2})\ ([0-9]{2}):([0-9]{2}):([0-9]{2})\ \[([A-Z]+)\]\ (.*) ]]; then
        fecha="${BASH_REMATCH[1]}"
        hora="${BASH_REMATCH[2]}"
        minuto="${BASH_REMATCH[3]}"
        segundo="${BASH_REMATCH[4]}"
        nivel="${BASH_REMATCH[5]}"
        mensaje="${BASH_REMATCH[6]}"

        echo "[$nivel] $hora:$minuto - ${mensaje:0:50}..."
    fi
done < "../datos/servidor.log"

echo
echo "📊 Estadísticas de logs por nivel:"
echo "---------------------------------"

declare -A contadores
while IFS= read -r linea; do
    if [[ "$linea" =~ \[([A-Z]+)\] ]]; then
        nivel="${BASH_REMATCH[1]}"
        ((contadores[$nivel]++))
    fi
done < "../datos/servidor.log"

for nivel in "${!contadores[@]}"; do
    echo "$nivel: ${contadores[$nivel]} entradas"
done

echo
echo "🔍 Búsquedas especializadas:"
echo "----------------------------"

# Usuarios con nombres que empiezan con vocal
echo "Usuarios con nombres que empiezan con vocal:"
grep -E "^[a-z.]+@[^,]+,[AEIOU][a-z]+ [A-Z]" "../datos/usuarios.txt" | cut -d',' -f2

# Edades entre 25 y 35
echo
echo "Usuarios entre 25 y 35 años:"
grep -E ",[2][5-9]|,[3][0-5]," "../datos/usuarios.txt" | cut -d',' -f2,3

# Logs de errores con IPs
echo
echo "Errores con direcciones IP:"
grep -E "\[ERROR\].*[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" "../datos/servidor.log"

echo
echo "✅ Análisis regex completado!"
EOF

chmod +x ejercicios/demo_regex_avanzadas.sh

# Ejecutar demostración
./ejercicios/demo_regex_avanzadas.sh
```

### 🧪 Laboratorio de Regex

**[PANTALLA: Práctica interactiva]**

> "Practiquemos con casos reales que encontrarás en tu trabajo diario:"

```bash
# Crear más datos realistas para practicar
cat > datos/access.log << 'EOF'
192.168.1.100 - - [09/Aug/2024:08:30:15 +0000] "GET /api/users HTTP/1.1" 200 1234
10.0.0.25 - - [09/Aug/2024:08:31:22 +0000] "POST /login HTTP/1.1" 401 89
192.168.1.100 - - [09/Aug/2024:08:32:45 +0000] "GET /dashboard HTTP/1.1" 200 5678
203.0.113.45 - - [09/Aug/2024:08:33:10 +0000] "GET /api/data HTTP/1.1" 500 156
192.168.1.101 - - [09/Aug/2024:08:34:55 +0000] "DELETE /api/user/123 HTTP/1.1" 204 0
EOF

echo "🔬 LABORATORIO DE REGEX:"
echo "======================="

# Extraer IPs únicas
echo "🌐 IPs únicas que accedieron:"
grep -oE "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" datos/access.log | sort | uniq

echo
echo "📊 Códigos de estado HTTP:"
grep -oE "\" [0-9]{3} " datos/access.log | sort | uniq -c | sort -nr

echo
echo "🔍 Métodos HTTP utilizados:"
grep -oE "\"[A-Z]+ " datos/access.log | sort | uniq -c

echo
echo "⚠️  Errores (4xx y 5xx):"
grep -E "\" [45][0-9]{2} " datos/access.log

echo
echo "📈 Tráfico por hora:"
grep -oE "[0-9]{2}:[0-9]{2}:[0-9]{2}" datos/access.log | cut -d: -f1 | sort | uniq -c
```

---

## 🎬 PARTE 2: SED - EDITOR DE FLUJO AVANZADO (15 minutos)

### 🎤 Transición de Regex a Sed

**[PANTALLA: De búsqueda a transformación]**

> "Excelente trabajo con regex. Ahora que sabemos ENCONTRAR patrones, vamos a aprender a TRANSFORMAR texto. Sed es el editor de flujo que convierte datos en bruto en información procesada."

**[PANTALLA: Casos de uso sed]**

> "Sed es fundamental para: automatizar ediciones masivas, limpiar datos, formatear reportes, procesar configuraciones y generar código. Es como tener un editor de texto programable para flujos de datos."

### ⚙️ Sed Fundamentales

**[PANTALLA: Terminal en vivo - Fundamentos]**

> "Sed opera en tres pasos: lee línea, aplica comandos, imprime resultado. Dominemos la sintaxis básica:"

```bash
echo "🔧 SED FUNDAMENTALS:"
echo "==================="

# Crear archivo para demonstraciones
cat > datos/demo.txt << 'EOF'
Hola mundo
Esta es una línea de prueba
Tengo 25 años
Me gusta el café y el té
Programar en bash es divertido
EOF

# Sustitución básica
echo "📝 Sustitución básica (s///)"
echo "----------------------------"

# Primera ocurrencia en cada línea
sed 's/a/A/' datos/demo.txt

# Todas las ocurrencias (flag g)
sed 's/a/A/g' datos/demo.txt

# Solo líneas específicas
sed '3s/25/treinta y cinco/' datos/demo.txt

# Múltiples comandos
sed -e 's/bash/BASH/g' -e 's/es/ES/g' datos/demo.txt

echo
echo "📍 Dirección de líneas:"
echo "----------------------"

# Líneas específicas
sed -n '2,4p' datos/demo.txt    # Imprimir líneas 2-4 (solo ellas)

# Patrones
sed -n '/café/p' datos/demo.txt  # Líneas que contienen "café"

# Rangos con patrones
sed -n '/Esta/,/divertido/p' datos/demo.txt

echo
echo "🗑️  Eliminación de líneas:"
echo "-------------------------"

# Eliminar líneas específicas
sed '1d' datos/demo.txt         # Eliminar primera línea

# Eliminar por patrón
sed '/mundo/d' datos/demo.txt   # Eliminar líneas con "mundo"

# Eliminar líneas vacías
sed '/^$/d' datos/demo.txt      # Eliminar líneas vacías
```

### 🚀 Sed Avanzado para Datos Reales

**[PANTALLA: Transformaciones empresariales]**

> "Ahora aplicamos sed a transformaciones que harás diariamente en entornos profesionales:"

```bash
echo "💼 SED PARA DATOS EMPRESARIALES:"
echo "==============================="

# Transformar formato de usuarios
echo "👥 Transformando datos de usuarios:"
echo "-----------------------------------"

# De CSV a formato legible
sed 's/,/ | /g' datos/usuarios.txt | head -3

# Extraer solo emails
sed 's/^\([^,]*\),.*/\1/' datos/usuarios.txt

# Formatear teléfonos
sed 's/+34-\([0-9]*\)-\([0-9]*\)-\([0-9]*\)/(\1) \2-\3/' datos/usuarios.txt

echo
echo "📊 Procesando logs de servidor:"
echo "------------------------------"

# Simplificar formato de logs
sed 's/^\([0-9-]*\) \([0-9:]*\) \[\([A-Z]*\)\] \(.*\)/[\3] \2 - \4/' datos/servidor.log

# Convertir niveles a minúsculas
sed 's/\[ERROR\]/[error]/g; s/\[WARN\]/[warning]/g; s/\[INFO\]/[info]/g' datos/servidor.log

# Enmascarar IPs por seguridad
sed 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/XXX.XXX.XXX.XXX/g' datos/servidor.log

echo
echo "🔄 Transformaciones complejas:"
echo "-----------------------------"

# Crear script de transformación avanzada
cat > ejercicios/transformar_datos.sh << 'EOF'
#!/bin/bash
# Transformador de Datos con Sed - Módulo 5

set -euo pipefail

echo "🔄 TRANSFORMADOR DE DATOS AVANZADO"
echo "=================================="
echo

# Función para transformar usuarios a JSON-like
transformar_usuarios() {
    echo "📦 Convertir CSV a formato JSON-like:"
    echo "------------------------------------"

    sed 's/^\([^,]*\),\([^,]*\),\([^,]*\),\([^,]*\),\(.*\)$/{"email": "\1", "nombre": "\2", "edad": \3, "ciudad": "\4", "telefono": "\5"}/' "../datos/usuarios.txt"
}

# Función para limpiar logs
limpiar_logs() {
    echo
    echo "🧹 Limpiando y formateando logs:"
    echo "-------------------------------"

    # Pipeline de limpieza
    sed '
        # Normalizar timestamps
        s/^\([0-9-]*\) \([0-9:]*\)/\1T\2/

        # Simplificar niveles
        s/\[ERROR\]/🔴/g
        s/\[WARN\]/🟡/g
        s/\[INFO\]/🔵/g
        s/\[DEBUG\]/⚪/g

        # Limpiar mensajes
        s/- timeout [0-9]*s/- timeout/g
        s/PID [0-9]*/PID XXX/g
        s/[0-9]*\.[0-9]*GB/XXX.XXX GB/g
    ' "../datos/servidor.log"
}

# Función para generar reporte
generar_reporte() {
    echo
    echo "📋 Generando reporte ejecutivo:"
    echo "------------------------------"

    # Header del reporte
    echo "=== REPORTE DE SISTEMA $(date +%Y-%m-%d) ==="
    echo

    # Estadísticas de usuarios
    echo "👥 USUARIOS ACTIVOS:"
    total_usuarios=$(wc -l < "../datos/usuarios.txt")
    echo "   Total: $total_usuarios usuarios registrados"

    # Análisis de edades con sed
    echo "   Distribución por edad:"
    sed 's/^[^,]*,[^,]*,\([0-9]*\),.*/\1/' "../datos/usuarios.txt" | \
    sed '
        s/^2[0-9]$/20-29 años/
        s/^3[0-9]$/30-39 años/
        s/^4[0-9]$/40-49 años
    ' | sort | uniq -c

    echo
    echo "🚨 ALERTAS DEL SISTEMA:"

    # Contar errores
    errores=$(grep -c "ERROR" "../datos/servidor.log" || echo "0")
    warnings=$(grep -c "WARN" "../datos/servidor.log" || echo "0")

    echo "   Errores críticos: $errores"
    echo "   Advertencias: $warnings"

    if [[ $errores -gt 0 ]]; then
        echo "   ⚠️  Se requiere atención inmediata"
    fi

    echo
    echo "=== FIN DEL REPORTE ==="
}

# Ejecutar transformaciones
echo "🎯 Ejecutando transformaciones..."
echo

transformar_usuarios
limpiar_logs
generar_reporte

echo
echo "✅ Transformaciones completadas!"
EOF

chmod +x ejercicios/transformar_datos.sh

# Ejecutar transformador
./ejercicios/transformar_datos.sh
```

### 🎨 Sed para Automatización

**[PANTALLA: Automatización práctica]**

> "El poder real de sed surge cuando lo incorporamos en scripts de automatización. Veamos casos reales:"

```bash
echo "🤖 SED EN AUTOMATIZACIÓN:"
echo "========================"

# Script para configurar archivos automáticamente
cat > ejercicios/auto_configurar.sh << 'EOF'
#!/bin/bash
# Auto-configurador con Sed - Módulo 5

set -euo pipefail

echo "⚙️  AUTO-CONFIGURADOR DE SISTEMA"
echo "==============================="

# Crear archivo de configuración demo
cat > "../datos/config_demo.conf" << 'CONFIG'
# Configuración del servidor
server_port=8080
server_host=localhost
debug_mode=true
max_connections=100
timeout=30
log_level=info
database_url=mysql://localhost:3306/app
redis_host=127.0.0.1
redis_port=6379
CONFIG

echo "📝 Configuración original:"
cat "../datos/config_demo.conf"

echo
echo "🔧 Aplicando configuración de producción..."

# Configurar para producción
sed -i.bak '
    # Cambiar puerto a producción
    s/server_port=8080/server_port=80/

    # Desactivar debug
    s/debug_mode=true/debug_mode=false/

    # Aumentar conexiones
    s/max_connections=100/max_connections=1000/

    # Configurar log para producción
    s/log_level=info/log_level=warning/

    # Actualizar URLs
    s/localhost:3306/prod-db.empresa.com:3306/
    s/127\.0\.0\.1/redis-cluster.empresa.com/
' "../datos/config_demo.conf"

echo "✅ Configuración actualizada:"
cat "../datos/config_demo.conf"

echo
echo "💾 Backup guardado como config_demo.conf.bak"

# Generar script de configuración dinámica
echo
echo "🎛️  Generando configurador dinámico..."

cat > "configurador_dinamico.sh" << 'DYNAMIC'
#!/bin/bash
# Configurador dinámico generado automáticamente

configurar_servidor() {
    local entorno=${1:-desarrollo}
    local archivo_config=${2:-config.conf}

    case "$entorno" in
        "desarrollo")
            sed -i "
                s/server_port=[0-9]*/server_port=8080/
                s/debug_mode=.*/debug_mode=true/
                s/max_connections=[0-9]*/max_connections=10/
                s/log_level=.*/log_level=debug/
            " "$archivo_config"
            echo "🔧 Configurado para DESARROLLO"
            ;;
        "testing")
            sed -i "
                s/server_port=[0-9]*/server_port=8081/
                s/debug_mode=.*/debug_mode=true/
                s/max_connections=[0-9]*/max_connections=50/
                s/log_level=.*/log_level=info/
            " "$archivo_config"
            echo "🧪 Configurado para TESTING"
            ;;
        "produccion")
            sed -i "
                s/server_port=[0-9]*/server_port=80/
                s/debug_mode=.*/debug_mode=false/
                s/max_connections=[0-9]*/max_connections=1000/
                s/log_level=.*/log_level=error/
            " "$archivo_config"
            echo "🚀 Configurado para PRODUCCIÓN"
            ;;
        *)
            echo "❌ Entorno no reconocido: $entorno"
            exit 1
            ;;
    esac
}

# Exportar función para uso externo
export -f configurar_servidor
DYNAMIC

chmod +x configurador_dinamico.sh

echo "✅ Configurador dinámico creado"
echo "💡 Uso: ./configurador_dinamico.sh"
echo "   configurar_servidor desarrollo config.conf"
EOF

chmod +x ejercicios/auto_configurar.sh

# Ejecutar auto-configurador
./ejercicios/auto_configurar.sh
```

### 📚 Biblioteca de Patrones Sed

**[PANTALLA: Referencia rápida]**

> "Crear una biblioteca de patrones sed te ahorrará horas en el futuro. Estas son las transformaciones más comunes:"

```bash
# Crear biblioteca de patrones
cat > datos/patrones_sed_comunes.txt << 'EOF'
🔧 BIBLIOTECA DE PATRONES SED COMUNES
===================================

📝 SUSTITUCIONES BÁSICAS:
- Reemplazar primera ocurrencia: s/viejo/nuevo/
- Reemplazar todas: s/viejo/nuevo/g
- Reemplazar en línea específica: 3s/viejo/nuevo/
- Reemplazar insensible a mayúsculas: s/viejo/nuevo/gi

🎯 DIRECCIONAMIENTO:
- Líneas específicas: 1,5s/viejo/nuevo/
- Desde línea hasta final: 5,$s/viejo/nuevo/
- Por patrón: /patrón/s/viejo/nuevo/
- Rango de patrones: /inicio/,/fin/s/viejo/nuevo/

🗑️ ELIMINACIÓN:
- Eliminar líneas vacías: /^$/d
- Eliminar línea específica: 3d
- Eliminar por patrón: /patrón/d
- Eliminar líneas duplicadas: N;/^\(.*\)\n\1$/!P;D

🔄 TRANSFORMACIONES:
- Mayúsculas: y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
- Invertir líneas: 1!G;h;$!d
- Numerar líneas: =;N;s/\n/ /
- Eliminar espacios: s/[[:space:]]*//g

📋 FORMATEO:
- CSV a columnas: s/,/ | /g
- Añadir prefijo: s/^/PREFIJO: /
- Añadir sufijo: s/$/ - SUFIJO/
- Centrar texto: s/.*/      &      /

🔍 EXTRACCIÓN:
- Solo números: s/[^0-9]//g
- Solo letras: s/[^a-zA-Z]//g
- Primera palabra: s/ .*//
- Última palabra: s/.* //

🌐 DATOS ESTRUCTURADOS:
- Extraer emails: s/.*\([a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]*\.[a-zA-Z]{2,}\).*/\1/
- Extraer IPs: s/.*\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\).*/\1/
- Limpiar HTML: s/<[^>]*>//g
- Extraer URLs: s/.*\(https\?:\/\/[^ ]*\).*/\1/
EOF

echo "📚 Biblioteca de patrones creada en datos/patrones_sed_comunes.txt"
echo "💡 Consúltala cuando necesites transformaciones específicas"
```

---

## 🎬 PARTE 3: AWK - LENGUAJE DE PROCESAMIENTO (20 minutos)

### 🎤 De Editor a Lenguaje de Programación

**[PANTALLA: Evolución de herramientas]**

> "Hemos dominado grep para buscar y sed para transformar. Ahora vamos por AWK, que es prácticamente un lenguaje de programación completo especializado en procesamiento de texto estructurado."

**[PANTALLA: AWK vs otras herramientas]**

> "AWK es perfecto para: análisis de datos tabulares, generación de reportes, cálculos sobre columnas, procesamiento de logs complejos y análisis estadístico básico. Es como tener Excel pero en la línea de comandos."

### 🏗️ Fundamentos de AWK

**[PANTALLA: Terminal en vivo - Arquitectura AWK]**

> "AWK opera con tres secciones: BEGIN (antes de procesar), main (por cada línea), END (después de procesar). Es como tener un pipeline programable:"

```bash
echo "🏗️  FUNDAMENTOS DE AWK:"
echo "======================"

# Crear datos estructurados para AWK
cat > datos/ventas.csv << 'EOF'
fecha,vendedor,producto,cantidad,precio
2024-08-01,Juan,Laptop,2,1200
2024-08-01,Maria,Mouse,5,25
2024-08-01,Pedro,Teclado,3,80
2024-08-02,Juan,Monitor,1,300
2024-08-02,Maria,Laptop,1,1200
2024-08-02,Ana,Mouse,10,25
2024-08-03,Pedro,Teclado,2,80
2024-08-03,Ana,Monitor,2,300
2024-08-03,Juan,Laptop,1,1200
EOF

echo "💰 Datos de ventas creados"
echo "========================="
cat datos/ventas.csv

echo
echo "🎯 AWK BÁSICO:"
echo "============="

# Imprimir columnas específicas
echo "📊 Vendedores y productos:"
awk -F',' 'NR>1 {print $2, "vendió", $3}' datos/ventas.csv

# Operaciones aritméticas
echo
echo "💵 Cálculo de totales por línea:"
awk -F',' 'NR>1 {total = $4 * $5; print $2, $3, "Total:", total}' datos/ventas.csv

# Usar condiciones
echo
echo "🎯 Ventas de alto valor (>500):"
awk -F',' 'NR>1 && ($4 * $5) > 500 {print $0, "| Total:", $4*$5}' datos/ventas.csv
```

### 📊 AWK para Análisis de Datos

**[PANTALLA: Análisis empresarial]**

> "El verdadero poder de AWK aparece cuando hacemos análisis de datos complejos. Vamos a crear reportes que impresionarán a tu jefe:"

```bash
echo "📊 ANÁLISIS DE DATOS CON AWK:"
echo "============================"

# Script completo de análisis de ventas
cat > ejercicios/analisis_ventas.awk << 'EOF'
# Analizador de Ventas con AWK - Módulo 5
BEGIN {
    FS = ","                    # Field Separator
    OFS = " | "                 # Output Field Separator
    print "=== ANÁLISIS DE VENTAS ==="
    print "=========================="
    total_general = 0
    contador_lineas = 0
}

# Procesar cada línea (excepto header)
NR > 1 {
    # Extraer campos
    fecha = $1
    vendedor = $2
    producto = $3
    cantidad = $4
    precio = $5

    # Calcular total de la línea
    total_linea = cantidad * precio
    total_general += total_linea
    contador_lineas++

    # Acumular por vendedor
    ventas_vendedor[vendedor] += total_linea
    productos_vendedor[vendedor]++

    # Acumular por producto
    ventas_producto[producto] += total_linea
    cantidad_producto[producto] += cantidad

    # Acumular por fecha
    ventas_fecha[fecha] += total_linea

    # Guardar mejor venta
    if (total_linea > mejor_venta_total) {
        mejor_venta_total = total_linea
        mejor_venta_vendedor = vendedor
        mejor_venta_producto = producto
        mejor_venta_fecha = fecha
    }
}

END {
    print ""
    print "📈 RESUMEN EJECUTIVO:"
    print "===================="
    printf "Total de ventas: $%.2f\n", total_general
    printf "Promedio por venta: $%.2f\n", total_general/contador_lineas
    printf "Número de transacciones: %d\n", contador_lineas

    print ""
    print "🏆 TOP VENDEDORES:"
    print "=================="
    # Ordenar vendedores por ventas (simulación de sort)
    for (vendedor in ventas_vendedor) {
        printf "%-10s: $%8.2f (%d ventas)\n", vendedor, ventas_vendedor[vendedor], productos_vendedor[vendedor]
    }

    print ""
    print "📦 ANÁLISIS DE PRODUCTOS:"
    print "========================"
    for (producto in ventas_producto) {
        printf "%-10s: $%8.2f (%d unidades)\n", producto, ventas_producto[producto], cantidad_producto[producto]
    }

    print ""
    print "📅 VENTAS POR FECHA:"
    print "==================="
    for (fecha in ventas_fecha) {
        printf "%s: $%.2f\n", fecha, ventas_fecha[fecha]
    }

    print ""
    print "🥇 MEJOR VENTA:"
    print "==============="
    printf "Vendedor: %s\n", mejor_venta_vendedor
    printf "Producto: %s\n", mejor_venta_producto
    printf "Fecha: %s\n", mejor_venta_fecha
    printf "Total: $%.2f\n", mejor_venta_total

    print ""
    print "✅ Análisis completado!"
}
EOF

# Ejecutar análisis
echo "🎯 Ejecutando análisis completo de ventas..."
awk -f ejercicios/analisis_ventas.awk datos/ventas.csv
```

### 🔧 AWK Avanzado para Logs

**[PANTALLA: Análisis de logs empresariales]**

> "Los logs son oro puro de información. AWK puede extraer insights valiosos que otros no ven:"

```bash
echo "🔍 ANÁLISIS AVANZADO DE LOGS:"
echo "============================"

# Crear script especializado para logs
cat > ejercicios/analizador_logs.awk << 'EOF'
# Analizador de Logs del Sistema - Módulo 5
BEGIN {
    print "🔍 ANALIZADOR DE LOGS DEL SISTEMA"
    print "================================="

    # Inicializar contadores
    total_lineas = 0

    # Colores para output (si el terminal los soporta)
    RED = "\033[31m"
    YELLOW = "\033[33m"
    GREEN = "\033[32m"
    BLUE = "\033[34m"
    RESET = "\033[0m"
}

# Procesar cada línea de log
{
    total_lineas++

    # Extraer timestamp y nivel
    if (match($0, /([0-9-]+) ([0-9:]+) \[([A-Z]+)\] (.*)/, grupos)) {
        fecha = grupos[1]
        hora = grupos[2]
        minuto = grupos[3]
        segundo = grupos[4]
        nivel = grupos[5]
        mensaje = grupos[6]

        # Contar por nivel
        contador_nivel[nivel]++

        # Extraer hora para análisis temporal
        split(hora, tiempo, ":")
        hora_num = tiempo[1]
        contador_hora[hora_num]++

        # Buscar patrones específicos
        if (mensaje ~ /Usuario.*conectado/) {
            conexiones++
            match(mensaje, /Usuario ([a-z.]+)/, user)
            usuarios_conectados[user[1]]++
        }

        if (mensaje ~ /Usuario.*desconectado/) {
            desconexiones++
        }

        if (mensaje ~ /IP|ip/) {
            # Extraer IPs
            if (match(mensaje, /([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/, ip)) {
                ips_acceso[ip[1]]++
            }
        }

        if (nivel == "ERROR") {
            errores_detalle[mensaje]++

            # Clasificar tipos de error
            if (mensaje ~ /base de datos|database/) errores_bd++
            else if (mensaje ~ /conexión|connection/) errores_conexion++
            else if (mensaje ~ /memoria|memory/) errores_memoria++
            else if (mensaje ~ /disco|disk/) errores_disco++
            else errores_otros++
        }

        # Detectar posibles problemas de rendimiento
        if (mensaje ~ /[0-9]+%/) {
            if (match(mensaje, /([0-9]+)%/, porcentaje)) {
                valor = porcentaje[1]
                if (valor > 80) {
                    if (mensaje ~ /CPU|cpu/) alertas_cpu++
                    else if (mensaje ~ /memoria|memory/) alertas_memoria++
                    else if (mensaje ~ /disco|disk/) alertas_disco++
                }
            }
        }
    }
}

END {
    print ""
    print "📊 ESTADÍSTICAS GENERALES:"
    print "=========================="
    printf "Total de líneas procesadas: %d\n", total_lineas

    print ""
    print "📈 DISTRIBUCIÓN POR NIVEL:"
    print "========================="
    for (nivel in contador_nivel) {
        color = ""
        if (nivel == "ERROR") color = RED
        else if (nivel == "WARN") color = YELLOW
        else if (nivel == "INFO") color = GREEN
        else color = BLUE

        printf "%s%-8s%s: %6d (%.1f%%)\n", color, nivel, RESET, contador_nivel[nivel], (contador_nivel[nivel]/total_lineas)*100
    }

    print ""
    print "🕐 ACTIVIDAD POR HORA:"
    print "====================="
    for (h = 0; h < 24; h++) {
        hora_formato = sprintf("%02d", h)
        actividad = contador_hora[hora_formato]
        if (actividad > 0) {
            # Crear barra visual simple
            barras = ""
            for (i = 0; i < int(actividad/2); i++) barras = barras "#"
            printf "%s:00 [%3d] %s\n", hora_formato, actividad, barras
        }
    }

    if (conexiones > 0) {
        print ""
        print "👥 ACTIVIDAD DE USUARIOS:"
        print "========================"
        printf "Conexiones: %d | Desconexiones: %d\n", conexiones, desconexiones
        printf "Usuarios activos: %d\n", length(usuarios_conectados)

        print "Top usuarios:"
        for (usuario in usuarios_conectados) {
            printf "  %-15s: %d conexiones\n", usuario, usuarios_conectados[usuario]
        }
    }

    if (length(ips_acceso) > 0) {
        print ""
        print "🌐 DIRECCIONES IP:"
        print "=================="
        for (ip in ips_acceso) {
            printf "%-15s: %d accesos\n", ip, ips_acceso[ip]
        }
    }

    if (contador_nivel["ERROR"] > 0) {
        print ""
        print RED "🚨 ANÁLISIS DE ERRORES:" RESET
        print "======================="
        printf "Base de datos: %d\n", errores_bd
        printf "Conexión: %d\n", errores_conexion
        printf "Memoria: %d\n", errores_memoria
        printf "Disco: %d\n", errores_disco
        printf "Otros: %d\n", errores_otros

        print ""
        print "Errores más frecuentes:"
        for (error in errores_detalle) {
            if (errores_detalle[error] > 1) {
                printf "  [%d] %s\n", errores_detalle[error], substr(error, 1, 60) "..."
            }
        }
    }

    # Reportar alertas de rendimiento
    total_alertas = alertas_cpu + alertas_memoria + alertas_disco
    if (total_alertas > 0) {
        print ""
        print YELLOW "⚠️  ALERTAS DE RENDIMIENTO:" RESET
        print "=========================="
        if (alertas_cpu > 0) printf "CPU alta: %d alertas\n", alertas_cpu
        if (alertas_memoria > 0) printf "Memoria alta: %d alertas\n", alertas_memoria
        if (alertas_disco > 0) printf "Disco lleno: %d alertas\n", alertas_disco
    }

    print ""
    print GREEN "✅ Análisis de logs completado!" RESET
}
EOF

# Ejecutar análisis de logs
echo "🎯 Analizando logs del sistema..."
awk -f ejercicios/analizador_logs.awk datos/servidor.log
```

### 💡 AWK para Generación de Reportes

**[PANTALLA: Reportes ejecutivos automatizados]**

> "Crear reportes profesionales con AWK que puedes enviar directamente a gerencia:"

```bash
echo "📋 GENERADOR DE REPORTES EJECUTIVOS:"
echo "==================================="

# Script para generar reporte completo
cat > ejercicios/generar_reporte_ejecutivo.sh << 'EOF'
#!/bin/bash
# Generador de Reportes Ejecutivos - Módulo 5

set -euo pipefail

echo "📋 GENERANDO REPORTE EJECUTIVO"
echo "=============================="

# Crear reporte en HTML
cat > "../reportes/reporte_$(date +%Y%m%d_%H%M).html" << 'HTML'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte Ejecutivo - Sistema</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background: #2c3e50; color: white; padding: 20px; text-align: center; }
        .section { margin: 20px 0; padding: 15px; border-left: 4px solid #3498db; }
        .metric { display: inline-block; margin: 10px; padding: 15px; background: #ecf0f1; border-radius: 5px; }
        .error { color: #e74c3c; font-weight: bold; }
        .success { color: #27ae60; font-weight: bold; }
        .warning { color: #f39c12; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; margin: 10px 0; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #3498db; color: white; }
    </style>
</head>
<body>
    <div class="header">
        <h1>📊 Reporte Ejecutivo del Sistema</h1>
        <p>Generado automáticamente el $(date +"%d de %B de %Y a las %H:%M")</p>
    </div>

    <div class="section">
        <h2>🔍 Estado General</h2>
        <div class="metric">
            <span class="label">Total de líneas procesadas</span>
            <span class="value" id="total-lineas">0</span>
        </div>
        <div class="metric">
            <span class="label">Errores críticos</span>
            <span class="value" id="total-errores">0</span>
        </div>
        <div class="metric">
            <span class="label">Advertencias</span>
            <span class="value" id="total-warnings">0</span>
        </div>
        <div class="metric">
            <span class="label">Eventos OK</span>
            <span class="value" id="total-ok">0</span>
        </div>
    </div>

    <div class="section">
        <h2>📊 Métricas Detalladas</h2>
        <table>
            <tr>
                <th>Métrica</th>
                <th>Valor</th>
            </tr>
            <tr>
                <td>Total de usuarios</td>
                <td id="total-usuarios">0</td>
            </tr>
            <tr>
                <td>Promedio de edad</td>
                <td id="promedio-edad">0</td>
            </tr>
            <tr>
                <td>Ventas totales</td>
                <td id="ventas-totales">0</td>
            </tr>
            <tr>
                <td>Promedio por venta</td>
                <td id="promedio-venta">0</td>
            </tr>
        </table>
    </div>

    <div class="section">
        <h2>📈 Tendencias</h2>
        <div class="chart" id="tendencias-ventas" style="height: 300px;"></div>
    </div>

    <div class="section">
        <h2>📅 Actividad por Fecha</h2>
        <div class="chart" id="actividad-fechas" style="height: 300px;"></div>
    </div>

    <div class="section">
        <h2>🌐 Top Direcciones IP</h2>
        <table id="top-ips">
            <tr>
                <th>IP Address</th>
                <th>Accesos</th>
            </tr>
        </table>
    </div>

    <div class="section">
        <h2>🚨 Errores Críticos Detectados</h2>
        <table id="errores-criticos">
            <tr>
                <th>Línea</th>
                <th>Descripción</th>
            </tr>
        </table>
    </div>

    <div class="footer">
        <p>🤖 Generado automáticamente por el Sistema de Análisis Bash</p>
        <p>🔄 Próxima actualización programada en 24 horas</p>
    </div>
</body>
</html>
HTML

# Generar métricas con AWK e insertar en HTML
echo "🔢 Calculando métricas..."

# Análisis de ventas
awk -F',' '
BEGIN {
    print "    <div class=\"section\">"
    print "        <h2>💰 Resumen de Ventas</h2>"
    print "        <table>"
    print "            <tr><th>Métrica</th><th>Valor</th></tr>"
}
NR > 1 {
    total += $4 * $5
    ventas++
}
END {
    print "        </table>"
    print "    </div>"
}' "../datos/ventas.csv" >> "../reportes/reporte_$(date +%Y%m%d_%H%M).html"

# Análisis de logs
awk '
BEGIN {
    print "    <div class=\"section\">"
    print "        <h2>🔍 Estado del Sistema</h2>"
    print "        <table>"
    print "            <tr><th>Métrica</th><th>Valor</th></tr>"
}
{
    total++
    if ($2 == "ERROR") errores++
    else if ($2 == "WARN") warnings++
    else if ($2 == "INFO") info++
}
END {
    print "        </table>"
    print "    </div>"
}' "../datos/logs_procesados.csv" >> "../reportes/reporte_$(date +%Y%m%d_%H%M).html"

# Cerrar HTML
cat >> "../reportes/reporte_$(date +%Y%m%d_%H%M).html" << 'HTML'

    <div class="section">
        <h2>📈 Recomendaciones</h2>
        <ul>
            <li>✅ Monitorear errores críticos diariamente</li>
            <li>✅ Optimizar rendimiento en horas pico</li>
            <li>✅ Implementar alertas automáticas</li>
            <li>✅ Revisar logs de seguridad semanalmente</li>
        </ul>
    </div>

    <div style="text-align: center; margin-top: 30px; color: #7f8c8d;">
        <p>📄 Reporte generado automáticamente por el Sistema de Análisis Bash</p>
        <p>🔄 Próxima actualización programada en 24 horas</p>
    </div>
</body>
</html>
HTML

# Mostrar ubicación del reporte
archivo_reporte="../reportes/reporte_$(date +%Y%m%d_%H%M).html"
echo "✅ Reporte ejecutivo generado:"
echo "   📁 $archivo_reporte"
echo "   🌐 Abre el archivo en tu navegador para ver el reporte completo"

# Generar también versión texto para terminal
echo
echo "📋 VISTA PREVIA DEL REPORTE:"
echo "=========================="

# Mostrar resumen en terminal
awk -F',' 'NR>1 {total+=$4*$5; ventas++} END {printf "💰 Total ventas: $%.2f (%d transacciones)\n", total, ventas}' "../datos/ventas.csv"

awk '/ERROR/ {e++} /WARN/ {w++} /INFO/ {i++} END {printf "🚨 Sistema: %d errores, %d warnings, %d eventos info\n", e+0, w+0, i+0}' "../datos/servidor.log"

echo "✅ Reporte completado exitosamente!"
EOF

chmod +x ejercicios/generar_reporte_ejecutivo.sh

# Crear directorio de reportes si no existe
mkdir -p reportes

# Ejecutar generador de reportes
./ejercicios/generar_reporte_ejecutivo.sh
```

---

## 🎬 PARTE 4: PROCESAMIENTO DE FORMATOS ESTRUCTURADOS (10 minutos)

### 🎤 Del Texto Plano a Datos Estructurados

**[PANTALLA: Evolución de formatos de datos]**

> "En el mundo moderno, los datos vienen en formatos estructurados: JSON de APIs, CSV de exportaciones, XML de sistemas legacy. Vamos a dominar el procesamiento de estos formatos con nuestras herramientas Bash."

### 📊 Dominando CSV con Herramientas Avanzadas

**[PANTALLA: Terminal en vivo - CSV profesional]**

> "CSV no es solo 'valores separados por comas'. En entornos empresariales encontrarás casos complejos que requieren técnicas avanzadas:"

```bash
echo "📊 PROCESAMIENTO AVANZADO DE CSV:"
echo "================================"

# Crear CSV complejo con casos problemáticos
cat > datos/datos_complejos.csv << 'EOF'
id,nombre,descripcion,precio,categoria,stock,fecha_actualizacion
1,"Laptop Pro 15""","Laptop con pantalla de 15"", 16GB RAM",1299.99,Electrónicos,25,"2024-08-09 10:30:00"
2,"Mouse, Inalámbrico","Mouse ergonómico, batería recargable",49.99,Accesorios,150,"2024-08-09 10:45:00"
3,"Teclado ""Gaming""","Teclado mecánico RGB, switches azules",129.99,Accesorios,75,"2024-08-09 11:00:00"
4,"Monitor 4K","Monitor 27"" Ultra HD, 144Hz",399.99,Electrónicos,30,"2024-08-09 11:15:00"
5,"Silla de Oficina","Silla ergonómica, ajustable en altura",249.99,Mobiliario,12,"2024-08-09 11:30:00"
EOF

echo "📋 Datos CSV complejos creados:"
head -3 datos/datos_complejos.csv

echo
echo "🔧 PROCESAMIENTO CON AWK AVANZADO:"
echo "================================="

# Script para manejar CSV con comillas y comas
cat > ejercicios/procesador_csv_avanzado.awk << 'EOF'
# Procesador CSV Robusto - Módulo 5
BEGIN {
    FS = ","
    OFS = "|"
    en_comillas = 0
    campo_actual = ""

    print "🔍 PROCESADOR CSV AVANZADO"
    print "=========================="
}

# Función para limpiar campo
function limpiar_campo(campo) {
    # Remover comillas externas
    gsub(/^"/, "", campo)
    gsub(/"$/, "", campo)
    # Convertir dobles comillas internas a simples
    gsub(/""/, "\"", campo)
    return campo
}

# Procesar header
NR == 1 {
    print "📊 COLUMNAS DETECTADAS:"
    for (i = 1; i <= NF; i++) {
        campos[i] = limpiar_campo($i)
        printf "  [%d] %s\n", i, campos[i]
    }
    print ""
    next
}

# Procesar datos
NR > 1 {
    # Limpiar todos los campos
    for (i = 1; i <= NF; i++) {
        $i = limpiar_campo($i)
    }

    # Análisis de datos
    total_registros++

    # Precio (campo 4)
    precio = $4
    suma_precios += precio

    if (precio > precio_max || precio_max == 0) {
        precio_max = precio
        producto_mas_caro = $2
    }

    # Stock (campo 6)
    stock = $6
    suma_stock += stock

    if (stock < 20) {
        productos_bajo_stock++
    }

    # Categoría (campo 5)
    categorias[$5]++

    # Mostrar registro procesado
    printf "ID: %s | %s | $%.2f | Stock: %s\n", $1, $2, $4, $6
}

END {
    print ""
    print "📈 ESTADÍSTICAS:"
    print "==============="
    printf "Total productos: %d\n", total_registros
    printf "Precio promedio: $%.2f\n", suma_precios/total_registros
    printf "Producto más caro: %s ($%.2f)\n", producto_mas_caro, precio_max
    printf "Stock total: %d unidades\n", suma_stock
    printf "Productos con stock bajo: %d\n", productos_bajo_stock

    print ""
    print "📦 POR CATEGORÍA:"
    print "================"
    for (cat in categorias) {
        printf "%-15s: %d productos\n", cat, categorias[cat]
    }
}
EOF

# Ejecutar procesador
awk -f ejercicios/procesador_csv_avanzado.awk datos/datos_complejos.csv
```

### 🌐 Procesamiento de JSON sin jq

**[PANTALLA: JSON con herramientas básicas]**

> "No siempre tendremos jq disponible. Vamos a procesar JSON con las herramientas que siempre están presentes:"

```bash
echo
echo "🌐 PROCESAMIENTO DE JSON:"
echo "========================"

# Crear datos JSON
cat > datos/api_response.json << 'EOF'
{
  "status": "success",
  "data": {
    "users": [
      {"id": 1, "name": "Juan Pérez", "email": "juan@empresa.com", "active": true, "score": 85.5},
      {"id": 2, "name": "María García", "email": "maria@empresa.com", "active": true, "score": 92.3},
      {"id": 3, "name": "Pedro López", "email": "pedro@empresa.com", "active": false, "score": 78.1}
    ],
    "summary": {
      "total": 3,
      "active": 2,
      "average_score": 85.3
    }
  },
  "timestamp": "2024-08-09T10:30:00Z"
}
EOF

echo "📄 JSON de ejemplo creado"

echo
echo "🔍 EXTRACCIÓN SIN JQ:"
echo "===================="

# Extraer información específica con grep y sed
echo "👥 Usuarios activos:"
grep -o '"name": "[^"]*"' datos/api_response.json | sed 's/"name": "\(.*\)"/\1/'

echo
echo "📧 Emails:"
grep -o '"email": "[^"]*"' datos/api_response.json | sed 's/"email": "\(.*\)"/\1/'

echo
echo "📊 Scores:"
grep -o '"score": [0-9.]*' datos/api_response.json | sed 's/"score": \(.*\)/\1/'

# Script avanzado para JSON
cat > ejercicios/json_processor.sh << 'EOF'
#!/bin/bash
# Procesador JSON Básico - Módulo 5

set -euo pipefail

json_file="${1:-../datos/api_response.json}"

echo "🌐 PROCESADOR JSON BÁSICO"
echo "========================"
echo

if [[ ! -f "$json_file" ]]; then
    echo "❌ Archivo JSON no encontrado: $json_file"
    exit 1
fi

echo "📄 Procesando: $json_file"
echo

# Función para extraer valor simple
extraer_valor() {
    local clave="$1"
    local archivo="$2"
    grep -o "\"$clave\": \"[^\"]*\"" "$archivo" | sed "s/\"$clave\": \"\(.*\)\"/\1/" | head -1
}

# Función para extraer número
extraer_numero() {
    local clave="$1"
    local archivo="$2"
    grep -o "\"$clave\": [0-9.]*" "$archivo" | sed "s/\"$clave\": \(.*\)/\1/" | head -1
}

# Extraer información básica
echo "ℹ️  INFORMACIÓN GENERAL:"
echo "======================"
status=$(extraer_valor "status" "$json_file")
timestamp=$(extraer_valor "timestamp" "$json_file")
echo "Estado: $status"
echo "Timestamp: $timestamp"

echo
echo "📊 RESUMEN:"
echo "=========="
total=$(extraer_numero "total" "$json_file")
active=$(extraer_numero "active" "$json_file")
average_score=$(extraer_numero "average_score" "$json_file")

echo "Total usuarios: $total"
echo "Usuarios activos: $active"
echo "Score promedio: $average_score"

echo
echo "👥 USUARIOS:"
echo "==========="

# Extraer datos de usuarios con AWK
awk '
BEGIN {
    in_users = 0
    user_count = 0
}

# Detectar inicio de array de usuarios
/"users": \[/ { in_users = 1; next }

# Detectar fin de array
/\]/ && in_users { in_users = 0; next }

# Procesar líneas dentro del array de usuarios
in_users && /\{/ { user_count++; print "Usuario " user_count ":" }
in_users && /"id":/ {
    gsub(/[^0-9]/, "", $0)
    printf "  ID: %s\n", $0
}
in_users && /"name":/ {
    match($0, /"([^"]*)"/, arr)
    printf "  Nombre: %s\n", arr[1]
}
in_users && /"email":/ {
    match($0, /"([^"]*)"/, arr)
    printf "  Email: %s\n", arr[1]
}
in_users && /"active":/ {
    if ($0 ~ /true/) printf "  Estado: ✅ Activo\n"
    else printf "  Estado: ❌ Inactivo\n"
}
in_users && /"score":/ {
    match($0, /([0-9.]+)/, arr)
    printf "  Score: %.1f\n", arr[1]
    print ""
}
' "$json_file"

echo "✅ Procesamiento JSON completado!"
EOF

chmod +x ejercicios/json_processor.sh

# Ejecutar procesador JSON
./ejercicios/json_processor.sh
```

### 📋 Pipeline de Datos Completo

**[PANTALLA: Integración de todas las herramientas]**

> "El poder real surge cuando combinamos todas las herramientas en pipelines de datos complejos:"

```bash
echo
echo "🔄 PIPELINE DE DATOS COMPLETO:"
echo "============================="

# Crear script de pipeline integrado
cat > ejercicios/pipeline_datos_completo.sh << 'EOF'
#!/bin/bash
# Pipeline de Datos Empresarial - Módulo 5

set -euo pipefail

echo "🔄 PIPELINE DE DATOS EMPRESARIAL"
echo "==============================="
echo

# Función para procesar logs y generar métricas
procesar_logs() {
    echo "📊 Procesando logs del sistema..."

    awk '
    BEGIN {
        print "timestamp,nivel,tipo_evento,detalle"
    }
    {
        # Extraer componentes del log
        if (match($0, /([0-9-]+) ([0-9:]+) \[([A-Z]+)\] (.*)/, grupos)) {
            timestamp = grupos[1] "T" grupos[2]
            nivel = grupos[3]
            mensaje = grupos[4]

            # Clasificar tipo de evento
            if (mensaje ~ /Usuario.*conectado/) tipo = "login"
            else if (mensaje ~ /Usuario.*desconectado/) tipo = "logout"
            else if (mensaje ~ /base de datos/) tipo = "database"
            else if (mensaje ~ /memoria|CPU|disco/) tipo = "performance"
            else if (mensaje ~ /Backup/) tipo = "backup"
            else tipo = "system"

            # Limpiar mensaje para CSV
            gsub(/,/, ";", mensaje)
            gsub(/"/, "'", mensaje)

            printf "%s,%s,%s,\"%s\"\n", timestamp, nivel, tipo, mensaje
        }
    }' "../datos/servidor.log" > "../datos/logs_procesados.csv"

    echo "✅ Logs procesados y guardados en CSV"
}

# Función para combinar datos de múltiples fuentes
combinar_datos() {
    echo "🔗 Combinando datos de múltiples fuentes..."

    cat > "../datos/reporte_combinado.txt" << 'HEADER'
=== REPORTE INTEGRAL DEL SISTEMA ===
Generado: $(date +"%Y-%m-%d %H:%M:%S")
==========================================

HEADER

    # Agregar análisis de ventas
    echo "💰 RESUMEN DE VENTAS:" >> "../datos/reporte_combinado.txt"
    echo "===================" >> "../datos/reporte_combinado.txt"

    awk -F',' '
    NR > 1 {
        total += $4 * $5
        transacciones++
    }
    END {
        printf "Total ventas: $%.2f\n", total
        printf "Transacciones: %d\n", transacciones
        printf "Promedio por venta: $%.2f\n", total/transacciones
        print ""
    }' "../datos/ventas.csv" >> "../datos/reporte_combinado.txt"

    # Agregar estado del sistema
    echo "🔍 ESTADO DEL SISTEMA:" >> "../datos/reporte_combinado.txt"
    echo "=====================" >> "../datos/reporte_combinado.txt"

    awk -F',' '
    NR > 1 {
        total++
        if ($2 == "ERROR") errores++
        else if ($2 == "WARN") warnings++
        else if ($2 == "INFO") info++
    }
    END {
        printf "Total eventos: %d\n", total
        printf "Errores: %d (%.1f%%)\n", errores, (errores/total)*100
        printf "Warnings: %d (%.1f%%)\n", warnings, (warnings/total)*100
        printf "Info: %d (%.1f%%)\n", info, (info/total)*100
        print ""

        print "Distribución por tipo:"
        for (tipo in tipos) {
            printf "  %-12s: %d\n", tipo, tipos[tipo]
        }
        print ""
    }' "../datos/logs_procesados.csv" >> "../datos/reporte_combinado.txt"

    echo "✅ Reporte combinado generado"
}

# Función para generar alertas
generar_alertas() {
    echo "🚨 Generando alertas automáticas..."

    # Buscar condiciones de alerta
    alertas_encontradas=false

    cat > "../datos/alertas.txt" << 'ALERT_HEADER'
🚨 ALERTAS DEL SISTEMA
Generado: $(date +"%Y-%m-%d %H:%M:%S")
========================

ALERT_HEADER

    # Verificar errores críticos
    errores_criticos=$(awk -F',' '$2=="ERROR" && $3=="database" {count++} END {print count+0}' "../datos/logs_procesados.csv")

    if [[ $errores_criticos -gt 0 ]]; then
        echo "🔴 CRÍTICO: $errores_criticos errores de base de datos detectados" >> "../datos/alertas.txt"
        alertas_encontradas=true
    fi

    # Verificar problemas de rendimiento
    problemas_rendimiento=$(awk -F',' '$2=="WARN" && $3=="performance" {count++} END {print count+0}' "../datos/logs_procesados.csv")

    if [[ $problemas_rendimiento -gt 2 ]]; then
        echo "🟡 ADVERTENCIA: $problemas_rendimiento problemas de rendimiento" >> "../datos/alertas.txt"
        alertas_encontradas=true
    fi

    # Verificar ventas bajas
    ventas_hoy=$(awk -F',' 'NR>1 {total+=$4*$5; count++} END {print total}' "../datos/ventas.csv")

    if (( $(echo "$ventas_hoy < 5000" | bc -l) )); then
        echo "📉 ATENCIÓN: Ventas del día por debajo del objetivo (\$${ventas_hoy})" >> "../datos/alertas.txt"
        alertas_encontradas=true
    fi

    if [[ "$alertas_encontradas" == "false" ]]; then
        echo "✅ No se encontraron alertas críticas" >> "../datos/alertas.txt"
    fi

    echo "✅ Alertas generadas"
}

# Función para exportar a diferentes formatos
exportar_datos() {
    echo "📤 Exportando datos en múltiples formatos..."

    # Exportar a JSON
    awk -F',' '
    BEGIN {
        print "{"
        print "  \"reporte\": {"
        print "    \"timestamp\": \"" strftime("%Y-%m-%dT%H:%M:%SZ") "\","
        print "    \"ventas\": ["
    }
    NR > 1 {
        if (NR > 2) print ","
        printf "      {\"vendedor\": \"%s\", \"producto\": \"%s\", \"total\": %.2f}", $2, $3, $4*$5
    }
    END {
        print ""
        print "    ]"
        print "  }"
        print "}"
    }' "../datos/ventas.csv" > "../datos/ventas_export.json"

    # Exportar logs a XML
    awk -F',' '
    BEGIN {
        print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        print "<logs>"
    }
    NR > 1 {
        gsub(/&/, "\\&amp;", $4)
        gsub(/</, "\\&lt;", $4)
        gsub(/>/, "\\&gt;", $4)
        printf "  <evento timestamp=\"%s\" nivel=\"%s\" tipo=\"%s\">%s</evento>\n", $1, $2, $3, $4
    }
    END {
        print "</logs>"
    }' "../datos/logs_procesados.csv" > "../datos/logs_export.xml"

    echo "✅ Datos exportados a JSON y XML"
}

# Ejecutar pipeline completo
echo "🚀 Iniciando pipeline de datos..."
echo

procesar_logs
combinar_datos
generar_alertas
exportar_datos

echo
echo "📋 RESUMEN DEL PIPELINE:"
echo "======================="
echo "✅ Logs procesados y convertidos a CSV"
echo "✅ Reporte combinado generado"
echo "✅ Alertas automáticas creadas"
echo "✅ Datos exportados a JSON y XML"
echo
echo "📁 Archivos generados:"
echo "  - logs_procesados.csv"
echo "  - reporte_combinado.txt"
echo "  - alertas.txt"
echo "  - ventas_export.json"
echo "  - logs_export.xml"
echo
echo "🎯 Pipeline completado exitosamente!"
EOF

chmod +x ejercicios/pipeline_datos_completo.sh

# Ejecutar pipeline
./ejercicios/pipeline_datos_completo.sh
```

---

## 🎬 PARTE 5: PROYECTO PRÁCTICO - ANALIZADOR DE LOGS (15 minutos)

### 🎤 Proyecto Integral del Módulo

**[PANTALLA: Proyecto final épico]**

> "Es hora de crear nuestro proyecto maestro: un Analizador de Logs profesional que combina todo lo aprendido. Este sistema podría usarse en cualquier empresa para monitorear servidores en tiempo real."

### 🏗️ Arquitectura del Analizador

**[PANTALLA: Diagrama de arquitectura]**

> "Nuestro analizador tendrá: módulo de ingesta de logs, motor de análisis con regex y AWK, generador de reportes automáticos, sistema de alertas y dashboard web básico."

```bash
echo "🏗️  ANALIZADOR DE LOGS EMPRESARIAL:"
echo "=================================="

# Crear estructura del proyecto
mkdir -p proyectos/analizador_logs/{config,logs,reports,alerts,dashboard,scripts}

cd proyectos/analizador_logs

echo "📁 Estructura del proyecto creada"

# Crear sistema principal del analizador
cat > scripts/analizador_principal.sh << 'EOF'
#!/bin/bash
# Analizador de Logs Empresarial - Proyecto Final Módulo 5

set -euo pipefail

# Configuración
CONFIG_FILE="config/analizador.conf"
LOG_DIR="logs"
REPORTS_DIR="reports"
ALERTS_DIR="alerts"
DASHBOARD_DIR="dashboard"

# Cargar configuración
if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    echo "⚠️  Archivo de configuración no encontrado, usando valores por defecto"
    ALERT_THRESHOLD_ERROR=5
    ALERT_THRESHOLD_WARNING=10
    REPORT_INTERVAL=3600
    DASHBOARD_REFRESH=300
fi

echo "🔍 ANALIZADOR DE LOGS EMPRESARIAL v2.0"
echo "======================================"
echo "🕐 Iniciado: $(date)"
echo

# Función principal de análisis
analizar_logs() {
    local archivo_log="$1"
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local reporte="$REPORTS_DIR/analisis_$timestamp.html"

    echo "📊 Analizando: $archivo_log"

    # Crear reporte HTML profesional
    cat > "$reporte" << 'HTML'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📊 Análisis de Logs - Sistema de Monitoreo</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 30px; border-radius: 10px; margin-bottom: 30px; }
        .header h1 { font-size: 2.5em; margin-bottom: 10px; }
        .header p { font-size: 1.2em; opacity: 0.9; }
        .metrics { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-bottom: 30px; }
        .metric-card { background: white; padding: 25px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); border-left: 5px solid #3498db; }
        .metric-card h3 { color: #2c3e50; margin-bottom: 10px; font-size: 1.1em; }
        .metric-card .value { font-size: 2.5em; font-weight: bold; color: #3498db; }
        .metric-card .label { color: #7f8c8d; text-transform: uppercase; font-size: 0.9em; }
        .section { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); margin-bottom: 30px; }
        .section h2 { color: #2c3e50; margin-bottom: 20px; font-size: 1.8em; }
        .chart { height: 300px; background: #f8f9fa; border-radius: 5px; display: flex; align-items: end; padding: 20px; margin: 20px 0; }
        .bar { background: #3498db; margin: 0 2px; border-radius: 3px 3px 0 0; min-height: 10px; flex: 1; max-width: 30px; }
        .error { border-left-color: #e74c3c !important; }
        .error .value { color: #e74c3c; }
        .warning { border-left-color: #f39c12 !important; }
        .warning .value { color: #f39c12; }
        .success { border-left-color: #27ae60 !important; }
        .success .value { color: #27ae60; }
        table { width: 100%; border-collapse: collapse; margin: 10px 0; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ecf0f1; }
        th { background-color: #34495e; color: white; }
        .timestamp { font-family: monospace; color: #7f8c8d; }
        .footer { text-align: center; padding: 20px; color: #7f8c8d; }
    </style>
    <script>
        function actualizarDashboard() {
            // En un entorno real, esto haría una llamada AJAX
            // para obtener datos actualizados del servidor
            console.log('Actualizando dashboard...');
            document.getElementById('last-update').innerText = 'Última actualización: ' + new Date().toLocaleString();
        }

        // Actualizar cada 5 minutos
        setInterval(actualizarDashboard, 300000);

        // Actualizar al cargar
        window.onload = actualizarDashboard;
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📊 Dashboard de Monitoreo del Sistema</h1>
            <p>Monitoreo en tiempo real de logs y métricas del sistema</p>
        </div>

        <div class="dashboard">
            <div class="widget">
                <h3>🔍 Estado General</h3>
                <div class="status-indicator status-ok"></div>Sistema Operativo
                <div class="status-indicator status-warning"></div>Base de Datos
                <div class="status-indicator status-ok"></div>Servicios Web
                <div class="status-indicator status-error"></div>Monitoreo de Logs
            </div>

            <div class="widget">
                <h3>📊 Métricas en Tiempo Real</h3>
                <div>Errores: <span class="metric error">3</span></div>
                <div>Warnings: <span class="metric warning">12</span></div>
                <div>Eventos OK: <span class="metric success">2,847</span></div>
            </div>

            <div class="widget">
                <h3>⏱️ Rendimiento</h3>
                <div>CPU: 65%</div>
                <div>Memoria: 78%</div>
                <div>Disco: 45%</div>
                <div>Red: 23%</div>
            </div>

            <div class="widget">
                <h3>🌐 Actividad de Red</h3>
                <div>Conexiones activas: 156</div>
                <div>Usuarios conectados: 23</div>
                <div>Tráfico: 45.2 MB/s</div>
            </div>
        </div>

        <div class="last-update" id="last-update">
            Cargando datos...
        </div>
    </div>
</body>
</html>
DASHBOARD

    echo "✅ Dashboard creado en: $DASHBOARD_DIR/index.html"
    echo "🌐 Abre el archivo en tu navegador para ver el dashboard"
}

# Crear archivo de configuración
crear_configuracion() {
    cat > "$CONFIG_FILE" << 'CONFIG'
# Configuración del Analizador de Logs Empresarial

# Umbrales de alertas
ALERT_THRESHOLD_ERROR=5
ALERT_THRESHOLD_WARNING=10

# Intervalos (en segundos)
REPORT_INTERVAL=3600
DASHBOARD_REFRESH=300

# Configuración de notificaciones
EMAIL_ALERTS=true
SLACK_WEBHOOK=""
TEAMS_WEBHOOK=""

# Configuración de archivos
MAX_LOG_SIZE=100M
RETENTION_DAYS=30
COMPRESS_OLD_LOGS=true

# Configuración del dashboard
DASHBOARD_PORT=8080
ENABLE_REALTIME=true
CONFIG

    echo "✅ Configuración creada: $CONFIG_FILE"
}

# Función principal
main() {
    local comando="${1:-help}"

    case "$comando" in
        "analizar")
            if [[ -z "${2:-}" ]]; then
                echo "❌ Uso: $0 analizar <archivo_log>"
                exit 1
            fi
            analizar_logs "$2"
            ;;
        "dashboard")
            crear_dashboard
            ;;
        "config")
            crear_configuracion
            ;;
        "demo")
            echo "🎬 Ejecutando demostración completa..."
            crear_configuracion
            analizar_logs "../../datos/servidor.log"
            crear_dashboard
            echo "✅ Demostración completada!"
            ;;
        "help"|*)
            echo "🔍 ANALIZADOR DE LOGS EMPRESARIAL"
            echo "================================"
            echo
            echo "Comandos disponibles:"
            echo "  analizar <archivo>  - Analizar archivo de logs específico"
            echo "  dashboard          - Crear dashboard web"
            echo "  config             - Crear archivo de configuración"
            echo "  demo               - Ejecutar demostración completa"
            echo "  help               - Mostrar esta ayuda"
            echo
            echo "Ejemplos:"
            echo "  $0 demo"
            echo "  $0 analizar /var/log/sistema.log"
            echo "  $0 dashboard"
            ;;
    esac
}

# Crear directorios necesarios
mkdir -p "$LOG_DIR" "$REPORTS_DIR" "$ALERTS_DIR" "$DASHBOARD_DIR" "$(dirname "$CONFIG_FILE")"

# Ejecutar función principal
main "$@"
EOF

chmod +x scripts/analizador_principal.sh

echo "🚀 Sistema principal creado"

# Ejecutar demostración
echo
echo "🎬 EJECUTANDO DEMOSTRACIÓN COMPLETA:"
echo "==================================="

./scripts/analizador_principal.sh demo

echo
echo "📋 PROYECTO COMPLETADO:"
echo "======================"
echo "✅ Analizador de logs empresarial funcional"
echo "✅ Reportes HTML profesionales"
echo "✅ Sistema de alertas automáticas"
echo "✅ Dashboard web en tiempo real"
echo "✅ Configuración personalizable"
echo
echo "📁 Archivos del proyecto:"
ls -la scripts/
ls -la reports/ 2>/dev/null || echo "   (reportes se generan al ejecutar)"
ls -la dashboard/
echo
echo "🎯 El proyecto está listo para uso empresarial!"
```

---

## 🎯 CHECKLIST DE PRODUCCIÓN

### ✅ Habilidades Dominadas

**[PANTALLA: Checklist de verificación]**

> "Antes de pasar al siguiente módulo, verifica que dominas estas habilidades esenciales:"

```bash
echo "🎯 CHECKLIST DE HABILIDADES - MÓDULO 5:"
echo "======================================"

cat > ../../_docs/cheatsheets/modulo5-checklist.md << 'CHECKLIST'
# ✅ Checklist de Habilidades - Módulo 5

## 🔍 Expresiones Regulares
- [ ] Puedo escribir regex básicas (., *, ^, $)
- [ ] Domino cuantificadores ({}, +, ?)
- [ ] Uso clases de caracteres ([a-z], [0-9])
- [ ] Extraigo información con grupos de captura
- [ ] Valido emails, IPs, teléfonos y fechas
- [ ] Combino regex con grep, sed y awk

## ⚙️ SED - Editor de Flujo
- [ ] Hago sustituciones básicas (s///)
- [ ] Uso direccionamiento de líneas
- [ ] Elimino líneas específicas o por patrón
- [ ] Transformo formatos de datos (CSV, logs)
- [ ] Creo scripts de sed para automatización
- [ ] Genero archivos de configuración dinámicos

## 📊 AWK - Procesamiento de Datos
- [ ] Entiendo la estructura BEGIN/main/END
- [ ] Proceso datos tabulares (CSV, TSV)
- [ ] Hago cálculos y estadísticas
- [ ] Uso arrays asociativos para conteos
- [ ] Genero reportes formateados
- [ ] Analizo logs complejos con AWK

## 🌐 Formatos Estructurados
- [ ] Proceso CSV con casos complejos (comillas, comas)
- [ ] Extraer información de JSON sin jq
- [ ] Combino múltiples fuentes de datos
- [ ] Exporto a diferentes formatos (JSON, XML, HTML)
- [ ] Creo pipelines de transformación de datos

## 🔄 Integración y Automatización
- [ ] Combino grep, sed y awk en pipelines
- [ ] Creo sistemas de análisis de logs
- [ ] Genero reportes automáticos
- [ ] Implemento sistemas de alertas
- [ ] Desarrollo dashboards básicos

## 🏗️ Proyecto del Módulo
- [ ] Construí un analizador de logs funcional
- [ ] Genero reportes HTML profesionales
- [ ] Implementé sistema de alertas automáticas
- [ ] Creé dashboard web básico
- [ ] El sistema es configurable y extensible

## 📝 Evaluación Práctica

### Ejercicio 1: Análisis de Logs de Apache
Procesa un log de Apache y extrae:
- IPs únicas
- Códigos de estado HTTP
- Páginas más visitadas
- Análisis temporal por hora

### Ejercicio 2: Procesamiento de Datos CSV
Dado un CSV de ventas:
- Calcula totales por vendedor
- Identifica trends por mes
- Genera reporte ejecutivo
- Detecta anomalías en ventas

### Ejercicio 3: Sistema de Monitoreo
Crea un script que:
- Monitoree múltiples archivos de log
- Detecte patrones de error
- Genere alertas automáticas
- Produzca reportes periódicos

## 🏆 Certificación de Habilidades

Para considerar completado el Módulo 5:
- [ ] Completé todos los ejercicios del módulo
- [ ] Mi analizador de logs procesa datos reales
- [ ] Puedo explicar cada herramienta y cuándo usarla
- [ ] Soy capaz de crear pipelines de datos complejos
- [ ] Entiendo las limitaciones y cuándo usar otras herramientas

## 🚀 Preparación para Módulo 6

Temas del próximo módulo:
- Manipulación avanzada de datos
- Bases de datos desde Bash
- APIs y servicios web
- Optimización de rendimiento
- Análisis estadístico

## 📚 Recursos Adicionales

- RegExr.com - Probador de expresiones regulares
- Documentación oficial de GNU AWK
- Guías de optimización de sed
- Ejemplos de logs reales para practicar
CHECKLIST

echo "✅ Checklist creado en _docs/cheatsheets/modulo5-checklist.md"
```

### 🎓 Palabras de Cierre

**[PANTALLA: Felicitaciones y próximos pasos]**

> "¡Felicitaciones! Has completado uno de los módulos más importantes del bootcamp. Las habilidades que adquiriste hoy - expresiones regulares, sed y AWK - son herramientas que usarás diariamente en tu carrera profesional."

**[PANTALLA: Impacto en el mundo real]**

> "Estos conocimientos te permiten: automatizar análisis de datos, crear sistemas de monitoreo, procesar información empresarial y generar reportes automáticos. Muchos profesionales con años de experiencia no dominan estas herramientas como tú lo harás."

### 🌟 Reflexión y Aprendizaje

**[PANTALLA: Reflexión del módulo]**

> "En el Módulo 5 hemos construido sobre todo lo anterior: usamos variables y funciones del Módulo 4, aplicamos pipes y redirección del Módulo 2, y combinamos todo con el control de flujo del Módulo 3. Esto es programación real."

### 🚀 Próximos Pasos

**[PANTALLA: Adelanto Módulo 6]**

> "En el Módulo 6 llevaremos el procesamiento de datos al siguiente nivel: manipulación avanzada de estructuras, conexión con bases de datos, integración con APIs, y análisis estadístico. Será increíble."

### 📝 Tarea para Casa

**[PANTALLA: Práctica continua]**

> "Tu tarea: encuentra logs reales en tu sistema (pueden ser del navegador, del sistema operativo, o aplicaciones). Aplica las técnicas del módulo para analizarlos. Sorpréndete de lo que puedes descubrir."

**[PANTALLA: Despedida]**

> "Sigue practicando, sigue experimentando, y nos vemos en el Módulo 6. ¡Has hecho un trabajo extraordinario!"

---

## 📚 RECURSOS Y REFERENCIAS ADICIONALES

### 🔗 Enlaces Útiles

- **RegExr:** <https://regexr.com/> - Probador interactivo de expresiones regulares
- **AWK Tutorial:** <https://www.grymoire.com/Unix/Awk.html>
- **SED Manual:** <https://www.gnu.org/software/sed/manual/sed.html>
- **Bash Regex Guide:** <https://tldp.org/LDP/Bash-Beginners-Guide/html/>

### 📖 Documentación Oficial

- GNU AWK User's Guide
- GNU sed Documentation
- POSIX Regular Expressions
- Bash Pattern Matching

### 🛠️ Herramientas Recomendadas

- **VS Code** con extensiones de regex
- **RegexBuddy** para desarrollo avanzado
- **jq** para JSON (complemento a nuestras técnicas)
- **csvkit** para análisis CSV profesional
