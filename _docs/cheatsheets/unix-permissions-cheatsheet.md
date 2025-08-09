# Unix/Linux Permissions Cheatsheet

Una guía completa sobre el manejo de permisos simbólicos y numéricos en sistemas Unix/Linux.

## Tabla de Contenidos

- [Conceptos Básicos](#conceptos-básicos)
- [Notación Simbólica](#notación-simbólica)
- [Notación Numérica (Octal)](#notación-numérica-octal)
- [Comandos Principales](#comandos-principales)
- [Ejemplos Prácticos](#ejemplos-prácticos)
- [Permisos Especiales](#permisos-especiales)
- [Casos de Uso Comunes](#casos-de-uso-comunes)
- [Troubleshooting](#troubleshooting)

## Conceptos Básicos

### Tipos de Archivos

```bash
# Primer carácter en ls -l indica el tipo
-   # Archivo regular
d   # Directorio
l   # Enlace simbólico
c   # Dispositivo de caracteres
b   # Dispositivo de bloques
p   # Pipe (FIFO)
s   # Socket
```

### Estructura de Permisos

```
rwxrwxrwx
||||||||└── Otros: Execute
|||||||└─── Otros: Write
||||||└──── Otros: Read
|||||└───── Grupo: Execute
||||└────── Grupo: Write
|||└─────── Grupo: Read
||└──────── Usuario: Execute
|└───────── Usuario: Write
└────────── User/Owner: Read
```

### Categorías de Usuarios

| Categoría  | Símbolo | Descripción                   |
| ---------- | ------- | ----------------------------- |
| User/Owner | `u`     | Propietario del archivo       |
| Group      | `g`     | Grupo propietario             |
| Others     | `o`     | Todos los demás usuarios      |
| All        | `a`     | Todos (user + group + others) |

## Notación Simbólica

### Permisos Básicos

| Permiso | Símbolo | Archivos            | Directorios             |
| ------- | ------- | ------------------- | ----------------------- |
| Read    | `r`     | Leer contenido      | Listar contenido        |
| Write   | `w`     | Modificar contenido | Crear/eliminar archivos |
| Execute | `x`     | Ejecutar archivo    | Acceder al directorio   |

### Operadores

| Operador | Descripción            | Ejemplo          |
| -------- | ---------------------- | ---------------- |
| `+`      | Añadir permiso         | `chmod u+x file` |
| `-`      | Quitar permiso         | `chmod g-w file` |
| `=`      | Asignar permiso exacto | `chmod o=r file` |

### Sintaxis Completa

```bash
chmod [usuario][operador][permiso] archivo

# Ejemplos
chmod u+x script.sh          # Usuario: añadir execute
chmod g-w documento.txt      # Grupo: quitar write
chmod o=r archivo.txt        # Otros: solo read
chmod a+r archivo.txt        # Todos: añadir read
chmod ug+rw,o-rwx secreto    # Múltiples operaciones
```

## Notación Numérica (Octal)

### Valores de Permisos

| Permiso | Valor | Binario |
| ------- | ----- | ------- |
| `---`   | 0     | 000     |
| `--x`   | 1     | 001     |
| `-w-`   | 2     | 010     |
| `-wx`   | 3     | 011     |
| `r--`   | 4     | 100     |
| `r-x`   | 5     | 101     |
| `rw-`   | 6     | 110     |
| `rwx`   | 7     | 111     |

### Cálculo de Permisos

```bash
# rwxrw-r-- = 764
# rwx = 4+2+1 = 7 (usuario)
# rw- = 4+2+0 = 6 (grupo)
# r-- = 4+0+0 = 4 (otros)

chmod 764 archivo.txt
```

### Tabla de Referencia Rápida

| Octal | Binario | Simbólico | Descripción        |
| ----- | ------- | --------- | ------------------ |
| 0     | 000     | `---`     | Sin permisos       |
| 1     | 001     | `--x`     | Solo execute       |
| 2     | 010     | `-w-`     | Solo write         |
| 3     | 011     | `-wx`     | Write + execute    |
| 4     | 100     | `r--`     | Solo read          |
| 5     | 101     | `r-x`     | Read + execute     |
| 6     | 110     | `rw-`     | Read + write       |
| 7     | 111     | `rwx`     | Todos los permisos |

## Comandos Principales

### chmod - Cambiar Permisos

```bash
# Notación simbólica
chmod u+x archivo              # Añadir execute al usuario
chmod g-w archivo              # Quitar write del grupo
chmod o=r archivo              # Otros solo read
chmod a+r archivo              # Todos pueden leer
chmod u=rwx,g=rx,o=r archivo   # Permisos específicos

# Notación numérica
chmod 755 archivo              # rwxr-xr-x
chmod 644 archivo              # rw-r--r--
chmod 600 archivo              # rw-------
chmod 777 archivo              # rwxrwxrwx (¡PELIGROSO!)

# Recursivo
chmod -R 755 directorio/       # Aplicar a directorio y contenido
```

### chown - Cambiar Propietario

```bash
# Cambiar propietario
chown usuario archivo
chown usuario:grupo archivo
chown :grupo archivo           # Solo cambiar grupo

# Recursivo
chown -R usuario:grupo directorio/

# Ejemplos
chown john document.txt
chown john:developers project/
chown :www-data web/
```

### chgrp - Cambiar Grupo

```bash
# Cambiar grupo
chgrp grupo archivo
chgrp -R grupo directorio/

# Ejemplos
chgrp developers codigo.py
chgrp -R www-data /var/www/
```

### umask - Permisos por Defecto

```bash
# Ver umask actual
umask

# Establecer umask
umask 022                      # Archivos: 644, Directorios: 755
umask 077                      # Archivos: 600, Directorios: 700

# Cálculo de permisos con umask
# Archivos: 666 - umask
# Directorios: 777 - umask
```

## Ejemplos Prácticos

### Permisos Comunes para Archivos

```bash
# Archivo de solo lectura para todos
chmod 644 documento.txt        # rw-r--r--

# Script ejecutable
chmod 755 script.sh           # rwxr-xr-x

# Archivo privado del usuario
chmod 600 secreto.txt         # rw-------

# Archivo de configuración
chmod 640 config.conf         # rw-r-----
```

### Permisos Comunes para Directorios

```bash
# Directorio público
chmod 755 /home/user/public   # rwxr-xr-x

# Directorio privado
chmod 700 /home/user/private  # rwx------

# Directorio compartido (grupo)
chmod 770 /home/shared        # rwxrwx---

# Directorio web
chmod 755 /var/www/html       # rwxr-xr-x
```

### Casos Específicos

```bash
# Hacer ejecutable un script
chmod +x script.sh

# Quitar permisos de escritura a todos
chmod a-w archivo.txt

# Solo el propietario puede leer/escribir
chmod 600 archivo_privado.txt

# Directorio donde solo el propietario puede escribir
chmod 755 directorio_publico/

# Archivo que el grupo puede leer pero no escribir
chmod 640 archivo_grupo.txt
```

## Permisos Especiales

### Sticky Bit

```bash
# Establecer sticky bit (solo propietario puede eliminar)
chmod +t directorio/
chmod 1755 directorio/         # rwxr-xr-t

# Ejemplo: /tmp directory
ls -ld /tmp                    # drwxrwxrwt
```

### SUID (Set User ID)

```bash
# Establecer SUID (ejecutar como propietario)
chmod +s archivo
chmod 4755 archivo             # rwsr-xr-x

# Ejemplo: comando passwd
ls -l /usr/bin/passwd          # -rwsr-xr-x
```

### SGID (Set Group ID)

```bash
# Establecer SGID en archivo
chmod g+s archivo
chmod 2755 archivo             # rwxr-sr-x

# Establecer SGID en directorio (herencia de grupo)
chmod g+s directorio/
chmod 2755 directorio/         # rwxr-sr-x
```

### Combinación de Permisos Especiales

```bash
# SUID + SGID + Sticky
chmod 7755 archivo             # rwsr-sr-t

# Solo SUID
chmod 4755 archivo             # rwsr-xr-x

# Solo SGID
chmod 2755 archivo             # rwxr-sr-x

# Solo Sticky bit
chmod 1755 directorio/         # rwxr-xr-t
```

## Casos de Uso Comunes

### Desarrollo Web

```bash
# Directorios web
chmod 755 /var/www/html/
chmod 644 /var/www/html/*.html
chmod 644 /var/www/html/*.css
chmod 644 /var/www/html/*.js

# Archivos de configuración web
chmod 640 /etc/apache2/apache2.conf
chown root:www-data /etc/apache2/apache2.conf
```

### Scripts y Ejecutables

```bash
# Scripts de usuario
chmod 755 ~/bin/script.sh

# Scripts del sistema
chmod 755 /usr/local/bin/script.sh
chown root:root /usr/local/bin/script.sh

# Scripts solo para el propietario
chmod 700 ~/private/script.sh
```

### Archivos de Configuración

```bash
# Configuración del sistema (solo root)
chmod 600 /etc/shadow
chmod 644 /etc/passwd

# Configuración de aplicación
chmod 640 /etc/myapp/config.ini
chown root:myapp /etc/myapp/config.ini
```

### Directorios Compartidos

```bash
# Directorio compartido por grupo
mkdir /shared
chgrp developers /shared
chmod 770 /shared
chmod g+s /shared              # Herencia de grupo

# Directorio público con sticky bit
chmod 1777 /tmp
```

## Verificación de Permisos

### Comandos de Consulta

```bash
# Ver permisos detallados
ls -l archivo.txt              # -rw-r--r-- 1 user group
ls -ld directorio/             # drwxr-xr-x 2 user group

# Ver permisos numéricos
stat -c '%a %n' archivo.txt    # 644 archivo.txt

# Ver propietario y grupo
ls -l archivo.txt | awk '{print $3, $4}'

# Ver solo permisos
ls -l archivo.txt | awk '{print $1}'
```

### Scripts de Verificación

```bash
#!/bin/bash
# check_permissions.sh - Verificar permisos de archivos

check_file_permissions() {
    local file="$1"
    local expected="$2"

    if [[ -e "$file" ]]; then
        local current
        current=$(stat -c '%a' "$file")
        if [[ "$current" == "$expected" ]]; then
            echo "✅ $file: $current (correcto)"
        else
            echo "❌ $file: $current (esperado: $expected)"
        fi
    else
        echo "❌ $file: no existe"
    fi
}

# Verificar permisos comunes
check_file_permissions "/etc/passwd" "644"
check_file_permissions "/etc/shadow" "640"
check_file_permissions "/tmp" "1777"
```

## Troubleshooting

### Problemas Comunes

#### Archivo no ejecutable

```bash
# Problema: ./script.sh: Permission denied
# Solución:
chmod +x script.sh
# o
chmod 755 script.sh
```

#### Directorio inaccesible

```bash
# Problema: cannot access directory
# Solución:
chmod +x directorio/           # Dar permiso de execute/access
```

#### Archivo no modificable

```bash
# Problema: Permission denied al escribir
# Verificar propietario:
ls -l archivo.txt
# Cambiar propietario si es necesario:
sudo chown $USER archivo.txt
# O dar permisos de escritura:
chmod +w archivo.txt
```

### Comandos de Diagnóstico

```bash
# Ver permisos efectivos del usuario actual
id
groups

# Ver qué permisos tiene un usuario sobre un archivo
sudo -u usuario test -r archivo && echo "Puede leer"
sudo -u usuario test -w archivo && echo "Puede escribir"
sudo -u usuario test -x archivo && echo "Puede ejecutar"

# Encontrar archivos con permisos específicos
find . -type f -perm 777       # Archivos con permisos 777
find . -type f -perm /u+s      # Archivos con SUID
find . -type d -perm /g+w      # Directorios escribibles por grupo
```

### Script de Reparación de Permisos

```bash
#!/bin/bash
# fix_permissions.sh - Reparar permisos comunes

# Directorios: 755, Archivos: 644
find /path/to/website -type d -exec chmod 755 {} \;
find /path/to/website -type f -exec chmod 644 {} \;

# Scripts ejecutables
find /path/to/scripts -name "*.sh" -exec chmod 755 {} \;

# Archivos de configuración sensibles
find /etc -name "*.conf" -exec chmod 640 {} \;

echo "Permisos reparados"
```

## Mejores Prácticas

### Principios de Seguridad

1. **Principio de menor privilegio**: Solo dar los permisos mínimos necesarios
2. **No usar 777**: Evitar permisos totales a menos que sea absolutamente necesario
3. **Proteger archivos sensibles**: Usar 600 o 640 para archivos de configuración
4. **Verificar regularmente**: Auditar permisos periódicamente

### Recomendaciones

```bash
# ✅ BIEN: Permisos específicos
chmod 644 archivo.txt          # Solo propietario escribe
chmod 755 script.sh           # Ejecutable pero protegido

# ❌ MAL: Permisos excesivos
chmod 777 archivo.txt          # Todos pueden hacer todo
chmod 666 script.sh           # Script no ejecutable
```

### Automatización

```bash
# Establecer umask en .bashrc para permisos por defecto seguros
echo "umask 022" >> ~/.bashrc

# Script para establecer permisos estándar
#!/bin/bash
# setup_permissions.sh

# Directorios del usuario
chmod 755 ~/
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub

# Scripts personales
chmod 755 ~/bin/*.sh

echo "Permisos establecidos correctamente"
```

---

## Referencias Útiles

- `man chmod` - Manual completo de chmod
- `man chown` - Manual de chown
- `man umask` - Manual de umask
- [Linux File Permissions](https://linux.die.net/man/1/chmod)
- [Unix Permissions Calculator](https://chmod-calculator.com/)

---

> **💡 Tip**: Usa `ls -la` frecuentemente para verificar permisos y `chmod` con cuidado. Cuando tengas dudas, es mejor ser más restrictivo que demasiado permisivo.
