#!/bin/bash

# Script para generar el analizador léxico extendido
echo "Generando analizador léxico extendido..."

# Cambiar al directorio de especificaciones
cd src/especificacion

# Generar el analizador léxico con JFlex
java -jar jflex-full-1.8.2.jar lexico_extendido.flex

echo "Analizador léxico generado exitosamente!"
echo "El archivo LexicoExtendido.java ha sido creado."

# Volver al directorio raíz
cd ../..

echo "Para probar el analizador léxico:"
echo "1. Compilar: javac -cp src/especificacion/java-cup-11b-runtime.jar src/ve/edu/unet/LexicoExtendido.java"
echo "2. Ejecutar: java -cp .:src/especificacion/java-cup-11b-runtime.jar ve.edu.unet.LexicoExtendido < ejemplo_fuente/programa_extendido.tiny"