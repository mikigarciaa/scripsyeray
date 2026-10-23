#!/bin/bash

# Calcula la edad aproximada con el año actual.
read -p "Año de nacimiento: " nacimiento
actual=$(date +%Y)
edad=$((actual - nacimiento))
echo "Tu edad aproximada es $edad años"
