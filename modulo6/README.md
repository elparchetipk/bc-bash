<div align="center">
  <img src="../assets/module-6-logo.svg" alt="Módulo 6: Herramientas del Sistema" width="300">
</div>

# MÓDULO 6: HERRAMIENTAS DEL SISTEMA

**Bootcamp Bash Scripting - Semana 6**

## 🎯 VISIÓN GENERAL DEL MÓDULO

El Módulo 6 marca una transición fundamental en tu desarrollo como programador de bash. Hasta ahora has aprendido a procesar y analizar datos. Ahora aprenderás a **controlar y monitorear sistemas completos**. Es la diferencia entre ser un analista de datos y ser el arquitecto que diseña y mantiene toda la infraestructura.

### 🎯 Objetivos de Aprendizaje

Al completar este módulo, serás capaz de:

- **Gestionar procesos** de manera avanzada con monitoreo y control automatizado
- **Automatizar tareas** con programación temporal y cron jobs inteligentes
- **Monitorear sistemas** proactivamente con alertas y métricas en tiempo real
- **Controlar servicios** y demonios del sistema de manera profesional
- **Implementar logging** avanzado y sistemas de auditoría
- **Crear herramientas** de administración de sistemas robustas y escalables

### 🌟 ¿Por qué es crucial este módulo?

En el mundo profesional, no basta con saber programar. Los **administradores de sistemas**, **DevOps engineers**, y **SREs** (Site Reliability Engineers) necesitan herramientas que mantengan los sistemas funcionando 24/7. Este módulo te enseña a crear esas herramientas.

### 📚 Estructura del Módulo

#### **Lección 6.1: Gestión Avanzada de Procesos**

- Monitoreo de procesos en tiempo real
- Control avanzado con señales y estados
- Automatización de gestión de recursos
- Creación de supervisores de procesos

#### **Lección 6.2: Automatización Temporal y Cron Jobs**

- Programación avanzada con cron
- Scripts de mantenimiento automatizado
- Gestión de logs rotativos
- Backup y sincronización automática

#### **Lección 6.3: Monitoreo de Sistema y Alertas**

- Métricas de sistema en tiempo real
- Sistemas de alertas inteligentes
- Dashboards de monitoreo
- Integración con herramientas de notificación

#### **Proyecto Práctico 6: Sistema de Monitoreo Empresarial**

- Monitor completo de infraestructura
- Alertas automáticas por email/Slack
- Dashboard web en tiempo real
- Reportes automatizados
  El Módulo 6 marca una transición fundamental en tu desarrollo. Hasta ahora has aprendido a procesar y analizar datos. Ahora aprenderás a controlar y monitorear sistemas completos. Es la diferencia entre ser un analista de datos y ser el arquitecto que diseña y mantiene toda la infraestructura.

Imagina que eres el capitán de un barco. Los módulos anteriores te enseñaron a leer mapas, interpretar instrumentos, y analizar datos meteorológicos. El Módulo 6 te enseñará a controlar todos los sistemas del barco: motores, navegación, comunicaciones, y monitoreo en tiempo real de cada componente crítico.

Lo que vas a dominar:
🔧 Gestión Avanzada de Procesos: Controlar, monitorear y orquestar procesos como un director de orquesta
⏰ Automatización Temporal: Programar tareas para que tu sistema funcione solo, 24/7
📊 Monitoreo Proactivo: Crear sistemas que detecten problemas antes de que ocurran
🚨 Alertas Inteligentes: Configurar notificaciones que te mantengan informado sin abrumarte

La Progresión Lógica
Mira cómo cada módulo ha construido sobre el anterior:

Módulo 3: Variables y control de flujo (fundamentos)
Módulo 4: Funciones y estructuras (organización)
Módulo 5: Manipulación de datos (análisis)
Módulo 6: Herramientas del sistema (control y monitoreo)
Es una progresión natural desde entender datos hasta controlar sistemas completos.

---

## 🚀 LECCIÓN 6.1: GESTIÓN AVANZADA DE PROCESOS

### Introducción Conceptual: Los Procesos como Ciudadanos del Sistema

Un sistema Unix/Linux es como una ciudad vibrante donde los **procesos son los ciudadanos**. Cada proceso tiene:

- Una **identidad** (PID - Process ID)
- Una **familia** (proceso padre e hijos)
- Una **ocupación** (el comando que ejecuta)
- **Recursos** que consume (CPU, memoria, archivos abiertos)

Como administrador de sistemas, eres el **alcalde de esta ciudad digital**. Tu trabajo es:

- Identificar ciudadanos problemáticos (procesos que consumen demasiados recursos)
- Mediar conflictos (procesos que compiten por recursos)
- Mantener el orden general (asegurar que el sistema funcione eficientemente)

### 🔧 Herramientas Fundamentales

#### **ps - El Censo de Procesos**

```bash
# Procesos básicos
ps aux

# Procesos en formato de árbol (familia)
ps auxf

# Procesos específicos por usuario
ps -u username

# Procesos ordenados por uso de CPU
ps aux --sort=-%cpu

# Procesos ordenados por uso de memoria
ps aux --sort=-%mem

# Formato personalizado
ps -eo pid,ppid,cmd,%cpu,%mem,user
```

#### **top/htop - El Monitor en Tiempo Real**

```bash
# Monitor básico
top

# Monitor mejorado (si está instalado)
htop

# Top con filtros específicos
top -p 1234,5678  # Solo PIDs específicos
top -u username   # Solo procesos de un usuario
```

#### **pgrep/pkill - Búsqueda y Control Inteligente**

```bash
# Encontrar procesos por nombre
pgrep firefox
pgrep -f "python script.py"

# Encontrar procesos con información adicional
pgrep -l nginx
pgrep -u username

# Terminar procesos de manera inteligente
pkill firefox
pkill -f "python.*script"
pkill -u username
```

### 📊 Script Práctico: Monitor de Procesos Avanzado

Vamos a crear un script que monitorea procesos de manera inteligente:

```bash
#!/bin/bash
# process_monitor.sh - Monitor avanzado de procesos
set -euo pipefail

# Configuración
readonly SCRIPT_NAME="$(basename "$0")"
readonly LOG_FILE="/var/log/${SCRIPT_NAME}.log"
readonly CONFIG_FILE="/etc/${SCRIPT_NAME}.conf"

# Umbrales por defecto
declare -A THRESHOLDS=(
    ["cpu_warning"]="80"
    ["cpu_critical"]="95"
    ["memory_warning"]="80"
    ["memory_critical"]="95"
    ["max_processes"]="1000"
)

# Colores para output
readonly RED='\033[0;31m'
readonly YELLOW='\033[1;33m'
readonly GREEN='\033[0;32m'
readonly NC='\033[0m'

# Función de logging
log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

# Cargar configuración
load_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        source "$CONFIG_FILE"
        log_message "INFO" "Configuración cargada desde $CONFIG_FILE"
    fi
}

# Obtener información del sistema
get_system_info() {
    local cpu_usage
    local memory_usage
    local total_processes

    # CPU usage (promedio de 1 minuto)
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)

    # Memory usage
    memory_usage=$(free | grep Mem | awk '{printf "%.1f", ($3/$2) * 100.0}')

    # Total de procesos
    total_processes=$(ps aux | wc -l)

    echo "$cpu_usage:$memory_usage:$total_processes"
}

# Función principal
main() {
    echo "🖥️  MONITOR DE PROCESOS AVANZADO"
    echo "================================"
    echo ""

    # Cargar configuración
    load_config

    # Obtener información del sistema
    local system_info
    system_info=$(get_system_info)
    IFS=':' read -r cpu_usage memory_usage total_processes <<< "$system_info"

    echo "📊 ESTADO ACTUAL DEL SISTEMA:"
    echo "  CPU: ${cpu_usage}%"
    echo "  Memoria: ${memory_usage}%"
    echo "  Procesos: $total_processes"
    echo ""
}

# Verificar si se ejecuta como script principal
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
```

### 🎯 Casos de Uso Prácticos

#### **1. Automatizar la gestión de procesos problemáticos**

```bash
#!/bin/bash
# auto_process_manager.sh - Gestión automática de procesos

# Terminar procesos que usan más del 90% de CPU por más de 5 minutos
kill_cpu_hogs() {
    local threshold=90
    local duration=300  # 5 minutos

    ps -eo pid,pcpu,etime,cmd --no-headers | while read -r pid cpu etime cmd; do
        # Convertir etime a segundos (simplificado)
        if [[ $(echo "$cpu > $threshold" | bc) -eq 1 ]] && [[ "$etime" =~ ([0-9]+):([0-9]+) ]]; then
            local minutes=${BASH_REMATCH[1]}
            local seconds=${BASH_REMATCH[2]}
            local total_seconds=$((minutes * 60 + seconds))

            if [[ $total_seconds -gt $duration ]]; then
                echo "Terminando proceso PID $pid (CPU: ${cpu}%, tiempo: $etime)"
                kill -TERM "$pid"
                sleep 10
                kill -KILL "$pid" 2>/dev/null || true
            fi
        fi
    done
}
```

#### **2. Monitor de servicios críticos**

```bash
#!/bin/bash
# service_monitor.sh - Monitor de servicios críticos

monitor_services() {
    local services=("sshd" "nginx" "mysql" "postgresql")
    local alerts=()

    for service in "${services[@]}"; do
        if ! systemctl is-active --quiet "$service"; then
            alerts+=("$service")
            echo "🚨 SERVICIO CAÍDO: $service"

            # Intentar reiniciar
            if systemctl restart "$service"; then
                echo "✅ $service reiniciado exitosamente"
            else
                echo "❌ Error al reiniciar $service"
            fi
        fi
    done

    # Enviar alerta si hay servicios caídos
    if [[ ${#alerts[@]} -gt 0 ]]; then
        local message="Servicios caídos: ${alerts[*]}"
        echo "$message" | mail -s "ALERTA: Servicios críticos" admin@empresa.com
    fi
}
```

---

## 🕐 LECCIÓN 6.2: AUTOMATIZACIÓN TEMPORAL Y CRON JOBS

### Introducción Conceptual: El Tiempo como Aliado

La automatización temporal es como tener un **asistente personal que nunca duerme**. Mientras tú descansas, tu sistema puede estar:

- Realizando backups automáticos
- Limpiando archivos temporales
- Actualizando bases de datos
- Enviando reportes programados
- Monitoreando el estado del sistema

### 🔧 Cron: El Programador Maestro

#### **Sintaxis de Crontab**

```bash
# Formato: minuto hora día mes día_semana comando
# * * * * * comando_a_ejecutar
# | | | | |
# | | | | +--- Día de la semana (0-7, donde 0 y 7 = domingo)
# | | | +----- Mes (1-12)
# | | +------- Día del mes (1-31)
# | +--------- Hora (0-23)
# +----------- Minuto (0-59)

# Ejemplos básicos
0 2 * * * /path/to/backup.sh           # Cada día a las 2:00 AM
30 14 * * 1 /path/to/weekly.sh         # Cada lunes a las 2:30 PM
0 0 1 * * /path/to/monthly.sh          # Primer día de cada mes a medianoche
*/15 * * * * /path/to/check.sh         # Cada 15 minutos
0 9-17 * * 1-5 /path/to/business.sh    # Cada hora de 9 AM a 5 PM, lunes a viernes
```

#### **Gestión de Crontab**

```bash
# Ver crontab actual
crontab -l

# Editar crontab
crontab -e

# Eliminar crontab
crontab -r

# Instalar crontab desde archivo
crontab archivo_cron.txt

# Ver crontab de otro usuario (como root)
crontab -u username -l
```

### 📊 Script Práctico: Sistema de Backup Automatizado

```bash
#!/bin/bash
# automated_backup.sh - Sistema de backup inteligente
set -euo pipefail

# Configuración
readonly BACKUP_DIR="/backups"
readonly SOURCE_DIRS=("/home" "/etc" "/var/www")
readonly RETENTION_DAYS=30
readonly LOG_FILE="/var/log/backup.log"
readonly EMAIL="admin@empresa.com"

# Función de logging
log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

# Crear directorio de backup
create_backup_dir() {
    local date_str=$(date '+%Y-%m-%d_%H-%M-%S')
    local backup_path="${BACKUP_DIR}/${date_str}"

    mkdir -p "$backup_path"
    echo "$backup_path"
}

# Realizar backup
perform_backup() {
    local backup_path="$1"
    local total_size=0
    local success_count=0
    local error_count=0

    log_message "INFO" "Iniciando backup en: $backup_path"

    for source_dir in "${SOURCE_DIRS[@]}"; do
        if [[ -d "$source_dir" ]]; then
            local dir_name=$(basename "$source_dir")
            local backup_file="${backup_path}/${dir_name}.tar.gz"

            log_message "INFO" "Respaldando: $source_dir -> $backup_file"

            if tar -czf "$backup_file" -C "$(dirname "$source_dir")" "$(basename "$source_dir")" 2>/dev/null; then
                local size=$(stat -f%z "$backup_file" 2>/dev/null || stat -c%s "$backup_file" 2>/dev/null)
                total_size=$((total_size + size))
                success_count=$((success_count + 1))
                log_message "INFO" "Backup exitoso: $backup_file ($(numfmt --to=iec "$size"))"
            else
                error_count=$((error_count + 1))
                log_message "ERROR" "Error al respaldar: $source_dir"
            fi
        else
            log_message "WARN" "Directorio no encontrado: $source_dir"
        fi
    done

    # Resumen
    log_message "INFO" "Backup completado - Exitosos: $success_count, Errores: $error_count, Tamaño total: $(numfmt --to=iec "$total_size")"
}

# Limpiar backups antiguos
cleanup_old_backups() {
    log_message "INFO" "Limpiando backups antiguos (> $RETENTION_DAYS días)"

    find "$BACKUP_DIR" -type d -mtime +$RETENTION_DAYS -exec rm -rf {} \; 2>/dev/null || true

    local remaining=$(find "$BACKUP_DIR" -type d -maxdepth 1 | wc -l)
    log_message "INFO" "Backups restantes: $remaining"
}

# Enviar notificación
send_notification() {
    local status="$1"
    local details="$2"

    local subject="Backup $status - $(hostname) - $(date)"
    local body="
Backup Report
=============
Host: $(hostname)
Date: $(date)
Status: $status

Details:
$details

Log file: $LOG_FILE
"

    echo "$body" | mail -s "$subject" "$EMAIL" 2>/dev/null || log_message "WARN" "No se pudo enviar email de notificación"
}

# Función principal
main() {
    log_message "INFO" "=== INICIO DE BACKUP AUTOMATIZADO ==="

    # Verificar dependencias
    if ! command -v tar &> /dev/null; then
        log_message "ERROR" "tar no está instalado"
        exit 1
    fi

    # Crear directorio de backup
    local backup_path
    backup_path=$(create_backup_dir)

    # Realizar backup
    perform_backup "$backup_path"

    # Limpiar backups antiguos
    cleanup_old_backups

    # Enviar notificación
    send_notification "COMPLETED" "Backup realizado exitosamente en: $backup_path"

    log_message "INFO" "=== FIN DE BACKUP AUTOMATIZADO ==="
}

# Ejecutar si es el script principal
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
```

### 🎯 Casos de Uso Avanzados

#### **1. Mantenimiento automático del sistema**

```bash
#!/bin/bash
# system_maintenance.sh - Mantenimiento automático

# Crontab: 0 3 * * 0 /path/to/system_maintenance.sh

system_cleanup() {
    # Limpiar archivos temporales
    find /tmp -type f -mtime +7 -delete
    find /var/tmp -type f -mtime +30 -delete

    # Limpiar logs antiguos
    find /var/log -name "*.log" -mtime +90 -delete

    # Limpiar cache de paquetes
    apt-get clean 2>/dev/null || yum clean all 2>/dev/null || true

    echo "Sistema limpiado: $(date)"
}

update_system() {
    # Actualizar índice de paquetes
    apt-get update 2>/dev/null || yum check-update 2>/dev/null || true

    # Actualizar paquetes de seguridad
    unattended-upgrades 2>/dev/null || yum update -y --security 2>/dev/null || true

    echo "Sistema actualizado: $(date)"
}

main() {
    system_cleanup
    update_system
}

main "$@"
```

Esta es la **Parte 1** del README regenerado del Módulo 6. ¿Te gustaría que continúe con la **Parte 2** que incluirá la **Lección 6.3: Monitoreo de Sistema y Alertas** y el **Proyecto Práctico 6**?
