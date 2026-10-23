#!/bin/bash

# Pide dos números y calcula operaciones enteras.
read -p "Primer número: " a
read -p "Segundo número: " b
echo "Suma: $((a + b))"
echo "Resta: $((a - b))"
echo "Multiplicación: $((a * b))"
# Evita dividir entre cero.
if [ "$b" -ne 0 ]; then
    echo "División: $((a / b))"
else
    echo "No se puede dividir entre cero"
fi
