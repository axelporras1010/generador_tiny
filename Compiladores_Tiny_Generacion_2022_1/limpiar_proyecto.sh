#!/bin/bash

# Script para limpiar y organizar el proyecto del compilador extendido

echo "=== LIMPIEZA Y ORGANIZACIÓN DEL PROYECTO ==="

# Limpiar archivos de compilación
echo "Limpiando archivos .class..."
find . -name "*.class" -type f -delete

# Crear directorios de organización si no existen
echo "Creando estructura de directorios..."
mkdir -p resultados_pruebas
mkdir -p documentacion
mkdir -p backup_original

# Mover archivos de documentación
echo "Organizando documentación..."
mv README_EXTENSIONES.md documentacion/ 2>/dev/null || true
mv RESULTADOS_LEXICO.md documentacion/ 2>/dev/null || true
mv src/especificacion/simbolos_extendidos.txt documentacion/ 2>/dev/null || true

# Hacer backup del analizador léxico original
echo "Creando backup del analizador original..."
cp src/especificacion/lexico.flex backup_original/ 2>/dev/null || true
cp src/especificacion/sintactico.cup backup_original/ 2>/dev/null || true

# Mostrar estructura final
echo ""
echo "=== ESTRUCTURA DEL PROYECTO ==="
echo "📁 Compiladores_Tiny_Generacion_2022_1/"
echo "├── 📄 generar_lexico.sh (Script principal)"
echo "├── 📄 limpiar_proyecto.sh (Este script)"
echo "├── 📁 src/"
echo "│   ├── 📁 especificacion/"
echo "│   │   ├── 📄 lexico_extendido.flex (Analizador extendido)"
echo "│   │   ├── 📄 lexico.flex (Original)"
echo "│   │   ├── 📄 sintactico.cup (Original)"
echo "│   │   └── 📄 *.jar (Librerías JFlex y CUP)"
echo "│   └── 📁 ve/edu/unet/"
echo "│       ├── 📄 LexicoExtendido.java (Generado)"
echo "│       ├── 📄 PruebaLexico.java (Pruebas)"
echo "│       ├── 📄 sym.java (Símbolos extendidos)"
echo "│       └── 📄 ... (Otros archivos del proyecto)"
echo "├── 📁 ejemplo_fuente/"
echo "│   ├── 📄 programa_extendido.tiny (Ejemplo completo)"
echo "│   └── 📄 prueba_simple.tiny (Ejemplo simple)"
echo "├── 📁 documentacion/"
echo "│   ├── 📄 README_EXTENSIONES.md"
echo "│   ├── 📄 RESULTADOS_LEXICO.md"
echo "│   └── 📄 simbolos_extendidos.txt"
echo "└── 📁 backup_original/"
echo "    ├── 📄 lexico.flex"
echo "    └── 📄 sintactico.cup"
echo ""

echo "✅ PROYECTO ORGANIZADO CORRECTAMENTE"
echo ""
echo "📋 COMANDOS ÚTILES:"
echo "• Generar analizador: ./generar_lexico.sh"
echo "• Compilar: javac -cp src/especificacion/java-cup-11b-runtime.jar src/ve/edu/unet/*.java"
echo "• Probar: java -cp src:src/especificacion/java-cup-11b-runtime.jar ve.edu.unet.PruebaLexico archivo.tiny"
echo ""