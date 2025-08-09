#!/bin/bash

echo "=== Ejecutando Compilador Tiny Extendido ==="

# Navegar al directorio correcto
cd src/ve/edu/unet

# Ejecutar el parser
java -cp .:java-cup-11b-runtime.jar parser ../../../ejemplo_fuente/programa_extendido.tiny > salida.txt 2>&1

echo "Salida del compilador:"
cat salida.txt

echo ""
echo "=== Ejecución completada ==="