#!/bin/bash

echo "=== Compilando y Ejecutando Programa Extendido ==="

# Cambiar al directorio del script si no estamos ya ahí
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Crear directorio de salida si no existe
mkdir -p salida

echo "Ejecutando compilador..."
java -cp "src:src/especificacion/java-cup-11b-runtime.jar" ve.edu.unet.parser ejemplo_fuente/programa_extendido.tiny > salida/resultado_compilacion.txt 2>&1

echo "Resultados guardados en: salida/resultado_compilacion.txt"
echo ""
echo "Contenido del archivo de salida:"
echo "================================"
cat salida/resultado_compilacion.txt

echo ""
echo "=== Compilación completada ==="