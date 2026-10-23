#!/bin/bash

# Guarda el listado y los errores en ficheros.
ls -l /etc > listado.txt
ls /root 2> errores.txt
echo "Líneas del listado:"
wc -l listado.txt
echo "Líneas de errores:"
wc -l errores.txt
