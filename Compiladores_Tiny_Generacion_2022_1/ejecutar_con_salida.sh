#!/bin/bash

echo "=== Compilando y Ejecutando Programa Extendido ==="

# Crear directorio de salida si no existe
mkdir -p salida

echo "Ejecutando compilador..."
java -cp src/ve/edu/unet/java-cup-11b-runtime.jar:src ve.edu.unet.parser ejemplo_fuente/programa_extendido.tiny > salida/resultado_compilacion.txt 2>&1

echo "Resultados guardados en: salida/resultado_compilacion.txt"
echo ""
echo "Contenido del archivo de salida:"
echo "================================"
cat salida/resultado_compilacion.txt

echo ""
echo "=== Compilación completada ==="