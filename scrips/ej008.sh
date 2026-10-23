#!/bin/bash

# Escribe tres líneas en un fichero.
echo "Primera nota" > notas.txt
echo "Segunda nota" >> notas.txt
echo "Tercera nota" >> notas.txt
nl notas.txt
