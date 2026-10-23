#!/bin/bash

# Crea, renombra y mueve un fichero.
touch borrador.txt
mv borrador.txt definitivo.txt
mkdir -p entregado
mv definitivo.txt entregado/
