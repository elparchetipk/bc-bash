# GUIÓN PARA VIDEO DE YOUTUBE - MÓDULO 6

## BOOTCAMP BASH SCRIPTING: HERRAMIENTAS DEL SISTEMA

---

### 📋 INFORMACIÓN DEL VIDEO

**Título:** "Bash Scripting Profesional: Herramientas del Sistema, Monitoreo y Automatización | Módulo 6"

**Duración estimada:** 90-120 minutos

**Audiencia:** Programadores avanzados que han completado los módulos 1-5

**Objetivos del módulo:**

- Dominar la gestión avanzada de procesos del sistema
- Implementar automatización temporal con cron jobs inteligentes
- Crear sistemas de monitoreo y alertas profesionales
- Desarrollar un sistema de monitoreo empresarial completo

---

## 🎬 ESTRUCTURA DEL VIDEO

### PARTE 1: INTRODUCCIÓN Y GESTIÓN DE PROCESOS (0:00 - 25:00)

- Bienvenida e introducción al módulo
- Gestión avanzada de procesos: monitoreo y control
- Supervisores de procesos y automatización de recursos
- Control con señales y estados de procesos

### PARTE 2: AUTOMATIZACIÓN TEMPORAL (25:00 - 50:00)

- Programación avanzada con cron jobs
- Scripts de mantenimiento automatizado
- Gestión de logs rotativos y backups
- Sincronización automática de sistemas

### PARTE 3: MONITOREO Y ALERTAS (50:00 - 75:00)

- Métricas de sistema en tiempo real
- Sistemas de alertas multi-canal
- Dashboards web y visualización de datos
- Integración con herramientas de notificación

### PARTE 4: PROYECTO EMPRESARIAL (75:00 - 120:00)

- Diseño del sistema de monitoreo empresarial
- Implementación modular y escalable
- Testing y demostración en vivo
- Deployment y mejores prácticas

---

## 🎯 PARTE 1: INTRODUCCIÓN Y GESTIÓN DE PROCESOS

### Tiempo: 0:00 - 25:00

#### [0:00 - 2:00] BIENVENIDA E INTRODUCCIÓN

**[PANTALLA: Logo del Bootcamp + Título del Módulo]**

¡Bienvenidos de nuevo al Bootcamp de Bash Scripting! Hoy llegamos a un momento muy especial: el **Módulo 6 - Herramientas del Sistema**. Si los módulos anteriores te convirtieron en un programador competente de bash, este módulo te transformará en un **arquitecto de sistemas**.

**[PANTALLA: Transición mostrando la evolución profesional]**

Hasta ahora has aprendido a procesar datos, automatizar tareas y crear scripts robustos. Pero hoy vamos más allá: aprenderás a **controlar y monitorear sistemas completos**. Es la diferencia entre ser un analista de datos y ser el ingeniero que diseña y mantiene toda la infraestructura crítica de una empresa.

**[PANTALLA: Diagrama de sistemas empresariales complejos]**

En el mundo profesional, los sistemas nunca duermen. Servidores web atendiendo millones de peticiones, bases de datos procesando transacciones críticas, servicios de backup ejecutándose automáticamente, sistemas de monitoreo vigilando cada métrica. Todo esto necesita **herramientas inteligentes** que los mantengan funcionando 24/7.

**[PANTALLA: Preview del proyecto final - sistema de monitoreo funcionando]**

Y ese es exactamente el tipo de herramientas que vamos a crear hoy. Al final de este módulo, habrás construido un sistema de monitoreo empresarial que rivaliza con soluciones comerciales: alertas inteligentes, dashboards en tiempo real, reportes automatizados, y capacidades de respuesta proactiva.

#### [2:00 - 3:30] ESTRUCTURA DEL MÓDULO

**[PANTALLA: Roadmap visual del módulo con iconos profesionales]**

Nuestro viaje hacia la maestría en administración de sistemas se divide en tres lecciones fundamentales:

1. **Lección 6.1: Gestión Avanzada de Procesos** - Controlaremos el ciclo de vida completo de procesos
2. **Lección 6.2: Automatización Temporal** - Dominaremos la programación de tareas y mantenimiento automático
3. **Lección 6.3: Monitoreo y Alertas** - Implementaremos vigilancia proactiva y sistemas de respuesta

**[PANTALLA: Diagrama de arquitectura mostrando cómo cada componente se integra]**

Y culminaremos con el **Proyecto Práctico 6: Sistema de Monitoreo Empresarial** - una solución completa que integra todo lo aprendido en una herramienta que podrías implementar mañana mismo en tu empresa.

#### [3:30 - 5:00] ¿POR QUÉ ESTE MÓDULO ES TRANSFORMACIONAL?

**[PANTALLA: Estadísticas sobre downtime y costos empresariales]**

Los números son impactantes: cada minuto de downtime puede costar a una empresa entre $5,000 y $300,000 dólares. Los sistemas fallan, los servicios se saturan, los discos se llenan. Pero las empresas exitosas tienen una cosa en común: **detectan y resuelven problemas antes de que impacten a los usuarios**.

**[PANTALLA: Comparación entre gestión reactiva vs proactiva]**

La diferencia entre un administrador junior y un Site Reliability Engineer senior no está solo en el conocimiento técnico, sino en la **mentalidad proactiva**. Los juniors apagan fuegos; los seniors previenen que se enciendan.

**[PANTALLA: Ejemplos de herramientas que crearemos]**

Las habilidades que desarrollarás hoy te preparan para roles como:

- **Site Reliability Engineer (SRE)** - $120,000-$200,000 USD anuales
- **DevOps Engineer** - $100,000-$180,000 USD anuales
- **Platform Engineer** - $110,000-$190,000 USD anuales
- **Infrastructure Architect** - $130,000-$220,000 USD anuales

#### [5:00 - 8:00] LECCIÓN 6.1: GESTIÓN AVANZADA DE PROCESOS

**[PANTALLA: Terminal en vivo + código del monitor de procesos]**

Empezamos con la base de todo sistema: los **procesos**. Un proceso no es solo un programa ejecutándose; es una entidad con ciclo de vida, recursos, dependencias y estado. Gestionar procesos profesionalmente significa entender y controlar cada aspecto de su existencia.

```bash
#!/bin/bash
# Monitor de procesos avanzado
# Demostración en vivo

monitor_process() {
    local process_name="$1"
    local max_memory="$2"
    local max_cpu="$3"

    # Obtener información del proceso
    local pid=$(pgrep "$process_name" | head -1)

    if [[ -z "$pid" ]]; then
        echo "⚠️  Proceso $process_name no encontrado"
        return 1
    fi

    # Monitorear recursos
    local memory_mb=$(ps -p "$pid" -o rss= | awk '{print $1/1024}')
    local cpu_percent=$(ps -p "$pid" -o pcpu= | tr -d ' ')

    printf "🔍 Proceso: %s (PID: %s)\n" "$process_name" "$pid"
    printf "💾 Memoria: %.1f MB (límite: %s MB)\n" "$memory_mb" "$max_memory"
    printf "🔥 CPU: %s%% (límite: %s%%)\n" "$cpu_percent" "$max_cpu"

    # Verificar límites
    if (( $(echo "$memory_mb > $max_memory" | bc -l) )); then
        echo "🚨 ALERTA: Uso de memoria excesivo"
        # Aquí iría la lógica de respuesta
    fi
}
```

**[DEMOSTRACIÓN EN VIVO]**

Vamos a ejecutar esto y ver cómo funciona...

```bash
# Ejecutar el monitor
./process_monitor.sh nginx 500 80
```

**[PANTALLA: Salida del comando mostrando métricas reales]**

¿Ven cómo obtenemos información detallada en tiempo real? Pero esto es solo el principio. En un entorno profesional, necesitamos **supervisores inteligentes** que no solo monitoreen, sino que actúen automáticamente.

#### [8:00 - 12:00] SUPERVISOR DE PROCESOS INTELIGENTE

**[PANTALLA: Código del supervisor avanzado]**

Ahora vamos a crear un supervisor que puede reiniciar procesos automáticamente, gestionar dependencias, y mantener logs detallados:

```bash
#!/bin/bash
# Supervisor de procesos inteligente

supervise_service() {
    local service_name="$1"
    local restart_limit="$2"
    local health_check_url="$3"

    local restart_count=0
    local log_file="/var/log/supervisor_${service_name}.log"

    while true; do
        # Verificar si el servicio está corriendo
        if ! systemctl is-active --quiet "$service_name"; then
            log_event "WARN" "Servicio $service_name no está activo"

            # Verificar límite de reinicios
            if [[ "$restart_count" -lt "$restart_limit" ]]; then
                log_event "INFO" "Reiniciando servicio (intento $((restart_count + 1)))"

                systemctl restart "$service_name"
                ((restart_count++))

                # Esperar y verificar
                sleep 10
                if systemctl is-active --quiet "$service_name"; then
                    log_event "SUCCESS" "Servicio reiniciado exitosamente"
                    restart_count=0  # Reset counter on success
                else
                    log_event "ERROR" "Fallo al reiniciar servicio"
                fi
            else
                log_event "CRITICAL" "Límite de reinicios alcanzado - requiere intervención manual"
                send_alert "CRITICAL" "Servicio $service_name falló definitivamente"
                break
            fi
        else
            # Verificar salud del servicio
            if [[ -n "$health_check_url" ]]; then
                if ! curl -s "$health_check_url" >/dev/null; then
                    log_event "WARN" "Health check falló para $service_name"
                fi
            fi
        fi

        sleep 30  # Verificar cada 30 segundos
    done
}

log_event() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    echo "[$timestamp] [$level] $message" | tee -a "$log_file"
}
```

**[DEMOSTRACIÓN EN VIVO]**

Vamos a simular un fallo de servicio y ver cómo nuestro supervisor responde automáticamente...

#### [12:00 - 18:00] GESTIÓN DE RECURSOS AUTOMATIZADA

**[PANTALLA: Gráficos de uso de recursos en tiempo real]**

La gestión de procesos no se trata solo de mantenerlos corriendo, sino de **optimizar su rendimiento**. Vamos a crear herramientas que ajusten automáticamente los recursos según la demanda:

```bash
#!/bin/bash
# Gestor automático de recursos

optimize_resources() {
    local service_name="$1"
    local target_cpu=70    # CPU objetivo
    local target_memory=80 # Memoria objetivo

    # Obtener métricas actuales
    local current_cpu=$(get_service_cpu "$service_name")
    local current_memory=$(get_service_memory "$service_name")
    local current_instances=$(get_service_instances "$service_name")

    echo "📊 Métricas actuales:"
    echo "   CPU: ${current_cpu}% (objetivo: ${target_cpu}%)"
    echo "   Memoria: ${current_memory}% (objetivo: ${target_memory}%)"
    echo "   Instancias: $current_instances"

    # Lógica de escalamiento
    if [[ "$current_cpu" -gt "$target_cpu" ]] || [[ "$current_memory" -gt "$target_memory" ]]; then
        # Escalar hacia arriba
        local new_instances=$((current_instances + 1))
        echo "📈 Escalando hacia arriba: $current_instances → $new_instances instancias"
        scale_service "$service_name" "$new_instances"

    elif [[ "$current_cpu" -lt $((target_cpu - 20)) ]] && [[ "$current_instances" -gt 1 ]]; then
        # Escalar hacia abajo
        local new_instances=$((current_instances - 1))
        echo "📉 Escalando hacia abajo: $current_instances → $new_instances instancias"
        scale_service "$service_name" "$new_instances"
    else
        echo "✅ Recursos optimizados - no se requiere acción"
    fi
}

get_service_cpu() {
    # Implementación para obtener CPU del servicio
    systemctl show "$1" --property=CPUUsageNSec 2>/dev/null | cut -d= -f2
}

scale_service() {
    local service="$1"
    local instances="$2"

    # Aquí iría la lógica específica del orquestador
    # (Docker Swarm, Kubernetes, systemd, etc.)
    echo "🔄 Ajustando $service a $instances instancias..."
}
```

**[DEMOSTRACIÓN PRÁCTICA]**

Vamos a simular carga alta y ver cómo el sistema se adapta automáticamente...

#### [18:00 - 25:00] INTEGRACIÓN CON SYSTEMD

**[PANTALLA: Configuración de servicios systemd]**

En entornos empresariales modernos, systemd es el estándar para gestión de servicios. Vamos a crear herramientas que se integren perfectamente:

```bash
#!/bin/bash
# Gestor de servicios systemd avanzado

create_monitored_service() {
    local service_name="$1"
    local executable_path="$2"
    local user="$3"

    # Crear archivo de servicio
    cat > "/etc/systemd/system/${service_name}.service" << EOF
[Unit]
Description=${service_name} monitored service
After=network.target
Wants=network.target

[Service]
Type=simple
User=${user}
ExecStart=${executable_path}
ExecReload=/bin/kill -HUP \$MAINPID
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal

# Límites de recursos
MemoryLimit=512M
CPUQuota=50%

# Monitoreo
WatchdogSec=30

[Install]
WantedBy=multi-user.target
EOF

    # Recargar systemd y habilitar servicio
    systemctl daemon-reload
    systemctl enable "$service_name"

    echo "✅ Servicio $service_name creado y configurado"
}

monitor_service_health() {
    local service="$1"

    # Información básica
    echo "🔍 Estado del servicio: $service"
    systemctl status "$service" --no-pager -l

    # Métricas de recursos
    echo -e "\n📊 Uso de recursos:"
    systemctl show "$service" --property=MemoryCurrent,CPUUsageNSec

    # Logs recientes
    echo -e "\n📋 Logs recientes:"
    journalctl -u "$service" --since "1 hour ago" --no-pager | tail -10
}
```

**[DEMOSTRACIÓN: Creación de servicio en vivo]**

Vamos a crear un servicio real y ver cómo systemd lo gestiona...

---

## 🕒 PARTE 2: AUTOMATIZACIÓN TEMPORAL

### Tiempo: 25:00 - 50:00

#### [25:00 - 28:00] INTRODUCCIÓN A LA AUTOMATIZACIÓN TEMPORAL

**[PANTALLA: Calendario empresarial mostrando tareas automatizadas]**

Los sistemas empresariales nunca descansan, pero los humanos sí. La automatización temporal es lo que permite que las tareas críticas se ejecuten sin intervención humana: backups nocturnos, limpieza de logs, actualizaciones de seguridad, reportes semanales.

**[PANTALLA: Gráfico mostrando ventajas de automatización]**

La diferencia entre un script que se ejecuta manualmente y uno que forma parte de un ecosistema automatizado es enorme:

- **Consistencia**: Se ejecuta exactamente cuando debe
- **Confiabilidad**: No depende de que alguien recuerde ejecutarlo
- **Eficiencia**: Aprovecha horas de baja actividad
- **Auditoría**: Registra cada ejecución automáticamente

#### [28:00 - 35:00] CRON JOBS INTELIGENTES

**[PANTALLA: Terminal mostrando configuración de cron avanzada]**

Cron es poderoso, pero la mayoría de las personas solo usan el 10% de sus capacidades. Vamos a crear cron jobs que son verdaderamente inteligentes:

```bash
#!/bin/bash
# Script de backup inteligente
# Se ejecuta vía cron pero con lógica avanzada

BACKUP_DIR="/backup/$(date +%Y/%m)"
LOG_FILE="/var/log/intelligent_backup.log"
MAX_BACKUP_AGE=30  # días
MIN_FREE_SPACE=10  # GB

intelligent_backup() {
    log "INFO" "Iniciando backup inteligente"

    # Verificar espacio disponible
    local free_space=$(df /backup | tail -1 | awk '{print $4/1024/1024}')
    if (( $(echo "$free_space < $MIN_FREE_SPACE" | bc -l) )); then
        log "WARN" "Espacio insuficiente (${free_space}GB < ${MIN_FREE_SPACE}GB)"
        cleanup_old_backups
    fi

    # Crear directorio con estructura de fechas
    mkdir -p "$BACKUP_DIR"

    # Backup diferencial inteligente
    local last_backup=$(find /backup -name "*.tar.gz" -mtime -1 | head -1)
    local backup_type="full"

    if [[ -n "$last_backup" ]]; then
        backup_type="differential"
        log "INFO" "Backup diferencial basado en: $last_backup"
    fi

    # Ejecutar backup con compresión adaptativa
    local backup_file="${BACKUP_DIR}/backup_${backup_type}_$(date +%Y%m%d_%H%M%S).tar.gz"

    # Ajustar compresión según hora del día
    local compression_level=6
    local current_hour=$(date +%H)
    if [[ "$current_hour" -ge 02 && "$current_hour" -le 06 ]]; then
        compression_level=9  # Máxima compresión en horas de baja actividad
    fi

    log "INFO" "Creando backup: $backup_file (compresión nivel $compression_level)"

    if create_backup "$backup_file" "$compression_level"; then
        log "SUCCESS" "Backup completado exitosamente"
        notify_success "$backup_file"
    else
        log "ERROR" "Fallo en el backup"
        notify_failure "Error durante el proceso de backup"
    fi
}

create_backup() {
    local output_file="$1"
    local compression="$2"

    # Directorios críticos para backup
    local dirs_to_backup=(
        "/etc"
        "/home"
        "/var/www"
        "/opt/applications"
    )

    # Exclusiones inteligentes
    local exclude_patterns=(
        "*.tmp"
        "*.cache"
        "*.log"
        "node_modules"
        ".git"
    )

    # Construir comando tar con exclusiones
    local exclude_args=""
    for pattern in "${exclude_patterns[@]}"; do
        exclude_args+=" --exclude=$pattern"
    done

    # Ejecutar backup con monitoreo de progreso
    tar czf "$output_file" $exclude_args "${dirs_to_backup[@]}" 2>&1 | \
        while read line; do
            log "DEBUG" "tar: $line"
        done

    return ${PIPESTATUS[0]}
}

cleanup_old_backups() {
    log "INFO" "Limpiando backups antiguos (>$MAX_BACKUP_AGE días)"

    find /backup -name "*.tar.gz" -mtime +$MAX_BACKUP_AGE -exec rm {} \; \
        -exec echo "Eliminado: {}" \; | while read line; do
        log "INFO" "$line"
    done
}
```

**[PANTALLA: Configuración de crontab]**

Y aquí está cómo programarlo en cron:

```bash
# Crontab para automatización inteligente

# Backup completo los domingos a las 2 AM
0 2 * * 0 /opt/scripts/intelligent_backup.sh full

# Backup incremental diario a las 3 AM (excepto domingos)
0 3 * * 1-6 /opt/scripts/intelligent_backup.sh differential

# Limpieza de sistema cada noche a las 1 AM
0 1 * * * /opt/scripts/system_cleanup.sh

# Reporte semanal los lunes a las 6 AM
0 6 * * 1 /opt/scripts/weekly_report.sh

# Verificación de salud del sistema cada 15 minutos
*/15 * * * * /opt/scripts/health_check.sh

# Rotación de logs a medianoche
0 0 * * * /opt/scripts/log_rotation.sh
```

#### [35:00 - 42:00] GESTIÓN AVANZADA DE LOGS

**[PANTALLA: Código del sistema de rotación de logs]**

Los logs son la memoria de tu sistema, pero pueden crecer descontroladamente. Vamos a crear un sistema inteligente de gestión:

```bash
#!/bin/bash
# Sistema avanzado de rotación de logs

LOG_CONFIGS_DIR="/etc/log-rotation"
DEFAULT_KEEP_DAYS=30
DEFAULT_MAX_SIZE="100M"

rotate_logs() {
    local config_file="$1"

    # Leer configuración
    source "$config_file"

    local log_path="${LOG_PATH:-}"
    local keep_days="${KEEP_DAYS:-$DEFAULT_KEEP_DAYS}"
    local max_size="${MAX_SIZE:-$DEFAULT_MAX_SIZE}"
    local compress="${COMPRESS:-true}"
    local service_reload="${SERVICE_RELOAD:-}"

    if [[ ! -f "$log_path" ]]; then
        echo "Log file not found: $log_path"
        return 1
    fi

    local current_size=$(stat -f%z "$log_path" 2>/dev/null || stat -c%s "$log_path")
    local max_bytes=$(parse_size "$max_size")

    echo "📊 Analizando: $log_path"
    echo "   Tamaño actual: $(format_bytes $current_size)"
    echo "   Límite: $max_size"
    echo "   Retención: $keep_days días"

    # Verificar si necesita rotación
    if [[ "$current_size" -gt "$max_bytes" ]]; then
        echo "🔄 Rotando log (tamaño excedido)"
        perform_rotation "$log_path" "$compress" "$service_reload"
    fi

    # Limpiar archivos antiguos
    cleanup_old_logs "$log_path" "$keep_days"
}

perform_rotation() {
    local log_file="$1"
    local compress="$2"
    local service_reload="$3"

    local timestamp=$(date +%Y%m%d_%H%M%S)
    local rotated_file="${log_file}.${timestamp}"

    # Mover archivo actual
    mv "$log_file" "$rotated_file"

    # Crear nuevo archivo vacío
    touch "$log_file"
    chmod --reference="$rotated_file" "$log_file"
    chown --reference="$rotated_file" "$log_file"

    # Comprimir si está habilitado
    if [[ "$compress" == "true" ]]; then
        echo "🗜️  Comprimiendo log rotado..."
        gzip "$rotated_file"
    fi

    # Recargar servicio si es necesario
    if [[ -n "$service_reload" ]]; then
        echo "🔄 Recargando servicio: $service_reload"
        systemctl reload "$service_reload" 2>/dev/null || \
        service "$service_reload" reload 2>/dev/null || \
        echo "⚠️  No se pudo recargar el servicio"
    fi

    echo "✅ Rotación completada"
}

# Configuración de ejemplo
cat > "$LOG_CONFIGS_DIR/nginx.conf" << 'EOF'
LOG_PATH="/var/log/nginx/access.log"
KEEP_DAYS=14
MAX_SIZE="50M"
COMPRESS=true
SERVICE_RELOAD="nginx"
EOF
```

#### [42:00 - 50:00] SINCRONIZACIÓN Y REPLICACIÓN

**[PANTALLA: Diagrama de arquitectura de sincronización]**

En entornos empresariales, raramente trabajamos con un solo servidor. La sincronización automática es crucial:

```bash
#!/bin/bash
# Sistema de sincronización inteligente

SYNC_CONFIG="/etc/sync/config.yaml"
SYNC_LOG="/var/log/sync.log"

intelligent_sync() {
    local source_path="$1"
    local dest_path="$2"
    local sync_mode="${3:-mirror}"  # mirror, backup, or bidirectional

    log_sync "INFO" "Iniciando sincronización: $source_path → $dest_path"

    # Verificar conectividad antes de sincronizar
    if ! check_connectivity "$dest_path"; then
        log_sync "ERROR" "No se puede conectar al destino"
        return 1
    fi

    # Calcular diferencias antes de sincronizar
    local changes=$(rsync --dry-run --stats -av "$source_path/" "$dest_path/" 2>/dev/null | \
                   grep "Number of files transferred" | awk '{print $5}')

    if [[ "$changes" == "0" ]]; then
        log_sync "INFO" "No hay cambios para sincronizar"
        return 0
    fi

    log_sync "INFO" "Se sincronizarán $changes archivos"

    # Ejecutar sincronización con monitoreo de progreso
    case "$sync_mode" in
        "mirror")
            rsync -av --delete --progress "$source_path/" "$dest_path/" | \
                while read line; do log_sync "DEBUG" "rsync: $line"; done
            ;;
        "backup")
            rsync -av --backup --backup-dir="backups/$(date +%Y%m%d)" \
                  --progress "$source_path/" "$dest_path/" | \
                while read line; do log_sync "DEBUG" "rsync: $line"; done
            ;;
        "bidirectional")
            # Sincronización bidireccional más compleja
            bidirectional_sync "$source_path" "$dest_path"
            ;;
    esac

    local sync_result=${PIPESTATUS[0]}
    if [[ "$sync_result" -eq 0 ]]; then
        log_sync "SUCCESS" "Sincronización completada exitosamente"
    else
        log_sync "ERROR" "Error en sincronización (código: $sync_result)"
    fi

    return $sync_result
}

check_connectivity() {
    local dest="$1"

    # Extraer host del path de destino
    if [[ "$dest" =~ ^([^:]+): ]]; then
        local host="${BASH_REMATCH[1]}"

        # Verificar conectividad SSH
        ssh -o ConnectTimeout=10 -o BatchMode=yes "$host" exit 2>/dev/null
        return $?
    fi

    # Si es local, verificar que el directorio sea accesible
    [[ -d "$dest" ]] || mkdir -p "$dest"
}
```

---

## 📊 PARTE 3: MONITOREO Y ALERTAS

### Tiempo: 50:00 - 75:00

#### [50:00 - 53:00] INTRODUCCIÓN AL MONITOREO PROACTIVO

**[PANTALLA: Dashboard empresarial con métricas en tiempo real]**

El monitoreo reactivo es como ir al médico solo cuando ya estás enfermo. El monitoreo proactivo es como hacer chequeos regulares para detectar problemas antes de que se conviertan en emergencias.

**[PANTALLA: Gráfico comparativo de costos reactivo vs proactivo]**

Las empresas que implementan monitoreo proactivo reportan:

- 90% menos tiempo de downtime
- 70% reducción en costos de soporte
- 85% mejora en satisfacción del usuario
- 60% menos escalamientos críticos

#### [53:00 - 62:00] MÉTRICAS DE SISTEMA EN TIEMPO REAL

**[PANTALLA: Código del monitor de recursos]**

Vamos a crear un sistema que capture y analice métricas en tiempo real:

```bash
#!/bin/bash
# Monitor de sistema en tiempo real

METRICS_DIR="/var/metrics"
ALERT_THRESHOLDS="/etc/monitoring/thresholds.conf"
RETENTION_DAYS=30

# Configuración de métricas
declare -A METRIC_SOURCES=(
    ["cpu"]="get_cpu_metrics"
    ["memory"]="get_memory_metrics"
    ["disk"]="get_disk_metrics"
    ["network"]="get_network_metrics"
    ["processes"]="get_process_metrics"
    ["services"]="get_service_metrics"
)

collect_metrics() {
    local timestamp=$(date +%s)
    local date_path=$(date +%Y/%m/%d)

    # Crear estructura de directorios
    mkdir -p "$METRICS_DIR/$date_path"

    echo "📊 Recolectando métricas del sistema..."

    for metric_type in "${!METRIC_SOURCES[@]}"; do
        local output_file="$METRICS_DIR/$date_path/${metric_type}.json"
        local collector="${METRIC_SOURCES[$metric_type]}"

        echo "   📈 Recolectando: $metric_type"

        # Ejecutar collector y formatear como JSON
        {
            echo "{"
            echo "  \"timestamp\": $timestamp,"
            echo "  \"hostname\": \"$(hostname)\","
            echo "  \"metric_type\": \"$metric_type\","
            echo "  \"data\": {"
            $collector | sed 's/^/    /'
            echo "  }"
            echo "}"
        } >> "$output_file"
    done

    # Verificar alertas
    check_alerts "$timestamp"
}

get_cpu_metrics() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    local load_avg=$(uptime | awk -F'load average:' '{print $2}' | tr -d ' ')
    local cpu_cores=$(nproc)

    cat << EOF
"usage_percent": $cpu_usage,
"load_average": "$load_avg",
"cores": $cpu_cores,
"processes_running": $(ps aux | wc -l),
"processes_blocked": $(vmstat 1 1 | tail -1 | awk '{print $8}')
EOF
}

get_memory_metrics() {
    local mem_info=$(free -b | grep Mem)
    local total=$(echo $mem_info | awk '{print $2}')
    local used=$(echo $mem_info | awk '{print $3}')
    local available=$(echo $mem_info | awk '{print $7}')
    local usage_percent=$(echo "scale=2; $used * 100 / $total" | bc)

    cat << EOF
"total_bytes": $total,
"used_bytes": $used,
"available_bytes": $available,
"usage_percent": $usage_percent,
"swap_usage": $(free | grep Swap | awk '{printf "%.2f", $3/$2 * 100}')
EOF
}

get_disk_metrics() {
    echo '"filesystems": ['

    local first=true
    while read filesystem size used avail use_percent mount; do
        [[ "$filesystem" == "Filesystem" ]] && continue
        [[ "$first" == "false" ]] && echo ","
        first=false

        cat << EOF
    {
      "filesystem": "$filesystem",
      "mount_point": "$mount",
      "size_bytes": $(echo "$size" | numfmt --from=auto),
      "used_bytes": $(echo "$used" | numfmt --from=auto),
      "available_bytes": $(echo "$avail" | numfmt --from=auto),
      "usage_percent": ${use_percent%?}
    }
EOF
    done < <(df -h)

    echo "]"
}

get_network_metrics() {
    local interface=$(ip route | grep default | awk '{print $5}' | head -1)
    local rx_bytes=$(cat "/sys/class/net/$interface/statistics/rx_bytes" 2>/dev/null || echo 0)
    local tx_bytes=$(cat "/sys/class/net/$interface/statistics/tx_bytes" 2>/dev/null || echo 0)
    local connections=$(netstat -an | grep ESTABLISHED | wc -l)

    cat << EOF
"primary_interface": "$interface",
"rx_bytes": $rx_bytes,
"tx_bytes": $tx_bytes,
"established_connections": $connections,
"listening_ports": $(netstat -tln | grep LISTEN | wc -l)
EOF
}
```

**[DEMOSTRACIÓN EN VIVO]**

Vamos a ejecutar el monitor y ver las métricas en tiempo real...

#### [62:00 - 70:00] SISTEMA DE ALERTAS MULTI-CANAL

**[PANTALLA: Configuración de alertas]**

Un sistema de alertas efectivo no solo detecta problemas, sino que los comunica a las personas correctas por los canales apropiados:

```bash
#!/bin/bash
# Sistema de alertas inteligente multi-canal

ALERT_CONFIG="/etc/monitoring/alerts.conf"
ALERT_STATE="/var/lib/monitoring/alert_state.json"
NOTIFICATION_LOG="/var/log/notifications.log"

# Configuración de canales
declare -A NOTIFICATION_CHANNELS=(
    ["email"]="send_email_alert"
    ["slack"]="send_slack_alert"
    ["telegram"]="send_telegram_alert"
    ["sms"]="send_sms_alert"
    ["webhook"]="send_webhook_alert"
)

process_alert() {
    local severity="$1"      # INFO, WARNING, CRITICAL
    local metric="$2"        # cpu, memory, disk, etc.
    local current_value="$3"
    local threshold="$4"
    local message="$5"

    # Generar ID único para la alerta
    local alert_id=$(echo "${metric}_${threshold}" | md5sum | cut -d' ' -f1)

    # Verificar si ya hemos alertado sobre esto recientemente
    if is_duplicate_alert "$alert_id" "$severity"; then
        log_notification "DEBUG" "Alerta duplicada suprimida: $alert_id"
        return 0
    fi

    # Registrar alerta
    register_alert "$alert_id" "$severity" "$metric" "$current_value" "$threshold"

    # Formatear mensaje de alerta
    local formatted_message=$(format_alert_message "$severity" "$metric" "$current_value" "$threshold" "$message")

    # Determinar canales según severidad
    local channels=$(get_channels_for_severity "$severity")

    log_notification "INFO" "Procesando alerta $severity: $metric = $current_value (límite: $threshold)"

    # Enviar por cada canal configurado
    IFS=',' read -ra CHANNEL_LIST <<< "$channels"
    for channel in "${CHANNEL_LIST[@]}"; do
        channel=$(echo "$channel" | tr -d ' ')
        if [[ -n "${NOTIFICATION_CHANNELS[$channel]}" ]]; then
            log_notification "INFO" "Enviando alerta por $channel"
            ${NOTIFICATION_CHANNELS[$channel]} "$severity" "$formatted_message"
        else
            log_notification "WARN" "Canal desconocido: $channel"
        fi
    done
}

send_slack_alert() {
    local severity="$1"
    local message="$2"

    # Configuración desde archivo
    local webhook_url=$(get_config "slack.webhook_url")
    local channel=$(get_config "slack.channel")

    [[ -z "$webhook_url" ]] && return 1

    # Determinar color según severidad
    local color="good"
    local emoji="✅"
    case "$severity" in
        "WARNING") color="warning"; emoji="⚠️" ;;
        "CRITICAL") color="danger"; emoji="🚨" ;;
    esac

    # Construir payload JSON
    local payload=$(cat << EOF
{
    "channel": "$channel",
    "username": "Sistema de Monitoreo",
    "icon_emoji": ":computer:",
    "attachments": [
        {
            "color": "$color",
            "title": "$emoji Alerta del Sistema",
            "text": "$message",
            "footer": "Sistema de Monitoreo",
            "ts": $(date +%s)
        }
    ]
}
EOF
)

    # Enviar webhook
    curl -s -X POST -H 'Content-type: application/json' \
         --data "$payload" "$webhook_url" >/dev/null

    return $?
}

send_email_alert() {
    local severity="$1"
    local message="$2"

    local email_to=$(get_config "email.recipients.$severity")
    local email_from=$(get_config "email.from")
    local smtp_server=$(get_config "email.smtp_server")

    [[ -z "$email_to" ]] && return 1

    # Crear email HTML
    local html_content=$(cat << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .alert { padding: 20px; border-radius: 5px; margin: 10px 0; }
        .critical { background-color: #ffebee; border-left: 5px solid #f44336; }
        .warning { background-color: #fff3e0; border-left: 5px solid #ff9800; }
        .info { background-color: #e3f2fd; border-left: 5px solid #2196f3; }
    </style>
</head>
<body>
    <div class="alert ${severity,,}">
        <h2>🖥️ Alerta del Sistema - $severity</h2>
        <p><strong>Servidor:</strong> $(hostname)</p>
        <p><strong>Timestamp:</strong> $(date)</p>
        <p><strong>Mensaje:</strong></p>
        <pre>$message</pre>
    </div>
</body>
</html>
EOF
)

    # Enviar email usando sendmail o mailx
    echo "$html_content" | mail -s "🚨 Alerta $severity - $(hostname)" \
                               -a "Content-Type: text/html" \
                               "$email_to"
}

escalate_alert() {
    local alert_id="$1"
    local current_severity="$2"

    # Determinar siguiente nivel de escalamiento
    local escalated_severity=""
    case "$current_severity" in
        "INFO") escalated_severity="WARNING" ;;
        "WARNING") escalated_severity="CRITICAL" ;;
        "CRITICAL")
            # Escalamiento crítico - notificar gestión
            escalated_severity="EMERGENCY"
            notify_management "$alert_id"
            ;;
    esac

    if [[ -n "$escalated_severity" ]]; then
        log_notification "WARN" "Escalando alerta $alert_id: $current_severity → $escalated_severity"
        # Re-procesar con nueva severidad
        # (implementación específica según necesidades)
    fi
}
```

#### [70:00 - 75:00] DASHBOARD WEB INTERACTIVO

**[PANTALLA: Dashboard web funcionando en vivo]**

Finalmente, vamos a crear un dashboard web que visualice todas nuestras métricas:

```bash
#!/bin/bash
# Generador de dashboard web

DASHBOARD_DIR="/var/www/monitoring"
TEMPLATE_DIR="/opt/monitoring/templates"
METRICS_API_PORT=8080

generate_dashboard() {
    local template_file="$TEMPLATE_DIR/dashboard.html"
    local output_file="$DASHBOARD_DIR/index.html"

    # Obtener métricas actuales
    local cpu_usage=$(get_current_cpu)
    local memory_usage=$(get_current_memory)
    local disk_usage=$(get_current_disk)
    local system_load=$(get_current_load)
    local uptime=$(uptime -p)

    # Generar JavaScript con datos en tiempo real
    local metrics_js=$(cat << EOF
const systemMetrics = {
    cpu: { value: $cpu_usage, threshold: 80, status: 'normal' },
    memory: { value: $memory_usage, threshold: 85, status: 'normal' },
    disk: { value: $disk_usage, threshold: 90, status: 'warning' },
    load: { value: $system_load, threshold: 5.0, status: 'normal' },
    uptime: '$uptime',
    lastUpdate: new Date().toLocaleString()
};

// Actualizar dashboard
function updateDashboard() {
    Object.keys(systemMetrics).forEach(metric => {
        const element = document.getElementById(metric + '-value');
        if (element && systemMetrics[metric].value !== undefined) {
            element.textContent = systemMetrics[metric].value + '%';
        }
    });

    document.getElementById('last-update').textContent =
        'Última actualización: ' + systemMetrics.lastUpdate;
}

// Auto-refresh cada 30 segundos
setInterval(() => {
    fetch('/api/metrics')
        .then(response => response.json())
        .then(data => {
            Object.assign(systemMetrics, data);
            updateDashboard();
        });
}, 30000);
EOF
)

    # Generar HTML final
    sed -e "s|{{CPU_USAGE}}|$cpu_usage|g" \
        -e "s|{{MEMORY_USAGE}}|$memory_usage|g" \
        -e "s|{{DISK_USAGE}}|$disk_usage|g" \
        -e "s|{{SYSTEM_LOAD}}|$system_load|g" \
        -e "s|{{UPTIME}}|$uptime|g" \
        -e "s|{{METRICS_JS}}|$metrics_js|g" \
        "$template_file" > "$output_file"

    echo "✅ Dashboard generado: $output_file"
}

start_metrics_api() {
    local port="$1"

    echo "🚀 Iniciando API de métricas en puerto $port"

    # Servidor API simple usando netcat
    while true; do
        {
            echo "HTTP/1.1 200 OK"
            echo "Content-Type: application/json"
            echo "Access-Control-Allow-Origin: *"
            echo ""
            generate_metrics_json
        } | nc -l "$port"
    done &

    echo $! > "/var/run/metrics-api.pid"
}
```

---

## 🚀 PARTE 4: PROYECTO EMPRESARIAL

### Tiempo: 75:00 - 120:00

#### [75:00 - 80:00] DISEÑO DEL SISTEMA EMPRESARIAL

**[PANTALLA: Arquitectura completa del sistema]**

Ahora vamos a integrar todo lo que hemos aprendido en un proyecto real: un **Sistema de Monitoreo Empresarial** que podrías implementar mañana mismo en tu empresa.

**[PANTALLA: Diagrama de componentes del sistema]**

Nuestro sistema tendrá:

1. **Collector Engine** - Recolecta métricas de múltiples servidores
2. **Alert Manager** - Procesa y distribuye alertas inteligentemente
3. **Dashboard Web** - Visualización en tiempo real
4. **Report Generator** - Reportes automatizados
5. **Configuration Manager** - Gestión centralizada de configuración

#### [80:00 - 95:00] IMPLEMENTACIÓN EN VIVO

**[PANTALLA: Desarrollo en vivo del sistema]**

Vamos a construir este sistema paso a paso, empezando por el script principal:

```bash
#!/bin/bash
# Sistema de Monitoreo Empresarial - Script Principal
# Autor: Bootcamp Bash
# Versión: 1.0

set -euo pipefail

# Configuración global
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly CONFIG_DIR="$SCRIPT_DIR/config"
readonly LOGS_DIR="$SCRIPT_DIR/logs"
readonly WEB_DIR="$SCRIPT_DIR/web"
readonly MODULES_DIR="$SCRIPT_DIR/modules"

# Cargar módulos
source "$MODULES_DIR/logger.sh"
source "$MODULES_DIR/config.sh"
source "$MODULES_DIR/metrics.sh"
source "$MODULES_DIR/alerts.sh"
source "$MODULES_DIR/dashboard.sh"

main() {
    local command="${1:-help}"

    case "$command" in
        "start")
            start_monitoring_system
            ;;
        "stop")
            stop_monitoring_system
            ;;
        "status")
            show_system_status
            ;;
        "dashboard")
            launch_dashboard
            ;;
        "test")
            run_system_tests
            ;;
        "install")
            install_system
            ;;
        *)
            show_help
            ;;
    esac
}

start_monitoring_system() {
    log "INFO" "🚀 Iniciando Sistema de Monitoreo Empresarial"

    # Verificar prerrequisitos
    check_prerequisites

    # Cargar configuración
    load_system_config

    # Iniciar componentes
    start_metrics_collector &
    start_alert_manager &
    start_dashboard_server &
    start_report_scheduler &

    log "SUCCESS" "✅ Sistema iniciado exitosamente"
    log "INFO" "📊 Dashboard: http://localhost:8080"
    log "INFO" "📈 API: http://localhost:8081/api"
    log "INFO" "📋 Logs: $LOGS_DIR/system.log"

    # Mantener el proceso principal activo
    wait
}
```

**[DEMOSTRACIÓN: Ejecutando el sistema completo]**

```bash
# Instalar el sistema
./enterprise_monitor.sh install

# Configurar servidores a monitorear
./enterprise_monitor.sh config add-server web01 192.168.1.10
./enterprise_monitor.sh config add-server db01 192.168.1.20

# Iniciar monitoreo
./enterprise_monitor.sh start
```

#### [95:00 - 110:00] CONFIGURACIÓN Y PERSONALIZACIÓN

**[PANTALLA: Archivos de configuración del sistema]**

Un sistema empresarial debe ser altamente configurable. Vamos a crear una configuración robusta:

```yaml
# config/system.yaml
system:
  name: 'Production Monitoring System'
  version: '1.0.0'
  environment: 'production'

metrics:
  collection_interval: 30 # segundos
  retention_days: 90
  storage_path: '/var/metrics'

  thresholds:
    cpu:
      warning: 70
      critical: 85
    memory:
      warning: 80
      critical: 90
    disk:
      warning: 85
      critical: 95
    load:
      warning: 3.0
      critical: 5.0

alerts:
  escalation_time: 300 # 5 minutos
  suppression_time: 900 # 15 minutos

  channels:
    email:
      enabled: true
      smtp_server: 'smtp.empresa.com'
      from: 'monitoring@empresa.com'
      recipients:
        warning: ['devops@empresa.com']
        critical: ['devops@empresa.com', 'oncall@empresa.com']

    slack:
      enabled: true
      webhook_url: 'https://hooks.slack.com/services/YOUR/WEBHOOK/URL'
      channel: '#alerts'

    telegram:
      enabled: false
      bot_token: ''
      chat_id: ''

servers:
  - name: 'web01'
    host: '192.168.1.10'
    type: 'web'
    ssh_user: 'monitor'
    services: ['nginx', 'php-fpm']

  - name: 'db01'
    host: '192.168.1.20'
    type: 'database'
    ssh_user: 'monitor'
    services: ['mysql', 'redis']

dashboard:
  port: 8080
  refresh_interval: 30
  theme: 'dark'

reports:
  enabled: true
  schedule: '0 6 * * 1' # Lunes a las 6 AM
  recipients: ['management@empresa.com']
  include_trends: true
```

#### [110:00 - 120:00] TESTING Y DEMOSTRACIÓN FINAL

**[PANTALLA: Sistema completo funcionando]**

Vamos a hacer una demostración completa del sistema:

1. **Monitoreo en Tiempo Real** - Viendo métricas actualizándose
2. **Simulación de Alertas** - Provocando condiciones de alerta
3. **Dashboard Interactivo** - Navegando por la interfaz web
4. **Reportes Automatizados** - Generando reportes ejecutivos

**[DEMOSTRACIÓN EN VIVO]**

```bash
# Simular alta carga de CPU
stress-ng --cpu 4 --timeout 60s &

# Ver como el sistema detecta y alerta
tail -f /var/log/monitoring/alerts.log

# Revisar dashboard web
firefox http://localhost:8080
```

**[PANTALLA: Métricas y alertas en acción]**

¡Perfecto! Como pueden ver, nuestro sistema:

- ✅ Detectó automáticamente el aumento de CPU
- ✅ Generó una alerta de WARNING
- ✅ Notificó por Slack en tiempo real
- ✅ Actualizó el dashboard instantáneamente
- ✅ Registró todo en los logs para auditoría

---

## 🎓 CONCLUSIONES Y PRÓXIMOS PASOS

### [120:00 - 125:00] RESUMEN DEL MÓDULO

**[PANTALLA: Recap visual de todo lo aprendido]**

¡Felicitaciones! Has completado uno de los módulos más transformadores del bootcamp. Hoy no solo aprendiste técnicas avanzadas de bash, sino que desarrollaste la **mentalidad de un Site Reliability Engineer**.

**Lo que has dominado:**

✅ **Gestión Avanzada de Procesos** - Control total del ciclo de vida de servicios
✅ **Automatización Temporal** - Programación inteligente de tareas críticas  
✅ **Monitoreo Proactivo** - Detección temprana de problemas
✅ **Sistemas de Alertas** - Comunicación efectiva de incidentes
✅ **Dashboards Empresariales** - Visualización profesional de métricas

### [125:00 - 130:00] APLICACIONES PROFESIONALES

**[PANTALLA: Casos de uso en empresas reales]**

Estas habilidades te preparan para roles de alta demanda:

- **Site Reliability Engineer** - $120,000-$200,000 USD
- **DevOps Engineer** - $100,000-$180,000 USD
- **Platform Engineer** - $110,000-$190,000 USD
- **Infrastructure Architect** - $130,000-$220,000 USD

### [130:00 - 135:00] PRÓXIMOS PASOS

**[PANTALLA: Roadmap hacia módulos avanzados]**

Con estas bases sólidas, estás listo para:

- **Módulo 7: Optimización y Debugging** - Performance tuning y troubleshooting avanzado
- **Módulo 8: Proyectos Avanzados** - Automatización empresarial y DevOps

### [135:00 - 140:00] DESPEDIDA Y MOTIVACIÓN

**[PANTALLA: Logo del bootcamp + mensaje motivacional]**

Recuerda: no eres solo un programador de bash. Eres un **arquitecto de sistemas confiables**. Las herramientas que has creado hoy pueden prevenir downtime, reducir costos y mantener servicios críticos funcionando.

¡Nos vemos en el siguiente módulo donde llevaremos tu expertise al siguiente nivel!

### 🚀 ¡Sigue construyendo, sigue aprendiendo, sigue siendo increíble

---

## 📋 RECURSOS ADICIONALES

### Scripts de Ejemplo

- [Monitor de procesos completo](./scripts/process_monitor.sh)
- [Sistema de alertas multi-canal](./scripts/alert_system.sh)
- [Dashboard web interactivo](./scripts/dashboard.sh)

### Documentación

- [Guía de instalación](./docs/installation.md)
- [Configuración avanzada](./docs/configuration.md)
- [Troubleshooting](./docs/troubleshooting.md)

### Próximo Video

#### Módulo 7: Optimización y Debugging Avanzado

- Profiling de scripts
- Debugging técnicas avanzadas
- Performance optimization
- Memory management

---

### 🎯 ¡Gracias por acompañarme en este viaje hacia la maestría en Bash

---

### 🕒 TIEMPO ESTIMADO DEL PROYECTO

**Para implementar completamente el Sistema de Monitoreo Empresarial:**

- **Tiempo de desarrollo:** 4-6 horas
- **Configuración inicial:** 1-2 horas
- **Testing y ajustes:** 1-2 horas
- **Documentación:** 1 hora
- **Total estimado:** 7-11 horas

**Distribución recomendada:**

- **Día 1:** Módulos básicos (collector, alertas) - 3 horas
- **Día 2:** Dashboard y configuración - 2-3 horas
- **Día 3:** Testing, deployment y documentación - 2-3 horas

**Prerrequisitos técnicos:**

- Acceso SSH a servidores objetivo
- Permisos de administración del sistema
- Conocimiento de los módulos 1-5 del bootcamp
