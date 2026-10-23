#!/bin/bash

# Pide un fichero y muestra su tamaño y tipo.
read -p "Nombre del fichero: " fichero
ls -lh "$fichero"
file "$fichero"
