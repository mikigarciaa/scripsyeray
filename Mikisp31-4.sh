# Carpeta donde esta guardado el script

carpeta=$(cd "$(dirname "$0")" && pwd)

# Comprobar que existe programas.txt

if [ -f "$carpeta/programas.txt" ]; then

    # Leer los programas del archivo

    while read programa; do

        # Comprobar si el programa esta instalado

        if dpkg -s "$programa" > /dev/null 2>&1; then

            echo "Desinstalando $programa..."

            sudo apt remove -y "$programa"

        else

            echo "El programa $programa no esta instalado"

        fi

    done < "$carpeta/programas.txt"

else

    echo "No existe el archivo programas.txt"

fi

echo "Proceso terminado"
