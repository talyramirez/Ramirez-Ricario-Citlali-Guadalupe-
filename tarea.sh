#!/bin/bash

# Definir la carpeta y el archivo
CARPETA="mi_carpeta"
ARCHIVO="archivo.txt"
FECHA=$(date +%Y-%m-%d)

# Verificar si la carpeta existe, si no, crearla
if [ ! -d "$CARPETA" ]; then
    echo "La carpeta no existe. Creándola..."
    mkdir "$CARPETA"
fi

# Ruta completa del archivo
RUTA_ARCHIVO="$CARPETA/$ARCHIVO"

# Si el archivo ya existe, hacer un backup con la fecha de hoy
if [ -f "$RUTA_ARCHIVO" ]; then
    echo "El archivo ya existe. Creando backup..."
    mv "$RUTA_ARCHIVO" "$CARPETA/${ARCHIVO%.*}_backup_$FECHA.${ARCHIVO##*.}"
fi

# Crear un nuevo archivo dentro de la carpeta
echo "Creando nuevo archivo..."
echo "Contenido de ejemplo" > "$RUTA_ARCHIVO"

echo "Proceso finalizado."
