#!/bin/bash

echo "=== Compilando Compilador Tiny Extendido ==="

# Navegar al directorio de especificación
cd src/especificacion

echo "1. Generando analizador léxico con JFlex..."
java -jar jflex-full-1.8.2.jar lexico_extendido.flex

echo "2. Generando analizador sintáctico con CUP..."
java -jar java-cup-11b.jar -parser parser -symbols sym sintactico.cup

echo "3. Moviendo archivos generados..."
mv *.java ../ve/edu/unet/

# Navegar al directorio fuente
cd ../ve/edu/unet

echo "4. Compilando clases Java..."
javac -cp ./java-cup-11b-runtime.jar *.java nodosAST/*.java

echo "5. Copiando archivos de runtime..."
cp ../../especificacion/java-cup-11b-runtime.jar .

echo "=== Compilación completada ==="

echo "Para probar, ejecuta:"
echo "java -cp .:java-cup-11b-runtime.jar parser ../../../ejemplo_fuente/programa_extendido.tiny"