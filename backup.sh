#!/bin/bash

#Declaramos las variables hostname y fecha para el comando tar
hostname=$(hostname)
date=$(date +%Y%m%d%H%M)


# Comprobamos que se han pasado al menos un parametro
if [[ $# -eq 0 ]]; then
    echo "Debes pasar al menos un directorio valido"
    exit 1
fi

# Creamos la ruta temporal donde se crearan los ficheros temporalmente
mkdir -p /tmp/backup

# Comprobamos si los directorios/ficheros existen
if [[ -e "$1" ]]; then
    nombre1=$(basename $1)
    zstd -o /tmp/backup/"$nombre1".zst $1 
else
    echo "El primer directorio/fichero especificado no existe"
fi

if [[ -e "$2" ]]; then
    nombre2=$(basename $2)
    zstd -o /tmp/backup/"$nombre2".zst $2
fi

if [[ -e "$3" ]]; then
    nombre3=$(basename $3)
    zstd /tmp/backup/"$nombre3".zst $3
fi

# Empaquetamos con tar los ficheros y añadimos una redireccion para que si no le pasamos los 3 parametros y solo 1 o 2 que no salgan errores
tar -cf "/tmp/backup/backup_"$hostname"_"$date".tar" "/tmp/backup/$nombre1.zst" "/tmp/backup/$nombre2.zst" "/tmp/backup/$nombre3.zst" 2>/dev/null

# Enviamos con scp el fichero tar a nuestra maquina 
scp /tmp/backup/*.tar asir@10.255.212.7:/home/asir/backups

# Si hay mas de 10 copias en el directorio remoto, borramos la mas antigua
ssh asir@10.255.212.7 "cd 'backups/' && ls -lt backup_$(hostname)_*.tar 2>/dev/null | tail -n +11 | xargs -r rm -f"

# Borramos el directorio backup creado en tmp
rm -rf /tmp/backup