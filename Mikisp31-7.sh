# Archivo donde se guardan los avisos

registro="$HOME/espacio_disco.log"

# Porcentaje maximo permitido

limite=80

# Obtener las particiones y sus porcentajes

df -P | tail -n +2 | while read disco bloques usados libres porcentaje particion

do

    # Quitar el simbolo %

    uso=$(echo "$porcentaje" | cut -d'%' -f1)

    # Comprobar si supera el limite

    if [ "$uso" -gt "$limite" ]; then

        echo "$(date '+%d/%m/%Y %H:%M:%S') - Particion: $particion - Uso: $porcentaje" >> "$registro"

    fi

done
