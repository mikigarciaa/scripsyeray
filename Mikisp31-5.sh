

# Archivo donde se guardara el informe

informe="$HOME/informe_errores.txt"

# Crear un informe nuevo

echo "INFORME DE ERRORES DEL SISTEMA" > "$informe"

echo "Fecha: $(date)" >> "$informe"

# Buscar archivos de registro en /var/log

for archivo in $(find /var/log -type f); do

    # Comprobar si contiene error o fail

    if grep -i -e "error" -e "fail" "$archivo" > /dev/null 2>&1; then

        echo "====================================" >> "$informe"

        echo "Archivo: $archivo" >> "$informe"

        echo "====================================" >> "$informe"

        # Guardar las lineas encontradas

        grep -i -e "error" -e "fail" "$archivo" >> "$informe" 2>/dev/null

        echo "" >> "$informe"

    fi

done

echo "Informe generado en $informe"
