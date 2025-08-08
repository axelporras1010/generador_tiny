# Extensiones del Compilador Tiny - Proyecto Final

## Resumen de Extensiones Implementadas

Este proyecto extiende el compilador Tiny original con las siguientes características:

### 1. Soporte para Funciones ✅
- **Palabras reservadas**: `function`, `return`, `call`
- **Sintaxis**:
  ```tiny
  function nombre(param1, param2, ...)
  begin
      // cuerpo de la función
      return valor
  end
  ```
- **Llamada**: `call nombre(arg1, arg2, ...)`

### 2. Manejo de Ámbitos ✅
- **Ámbito Global**: Declaración con `global variable`
- **Ámbito de Función**: Variables locales declaradas con `var`
- **Bloques**: Delimitados por `begin` y `end`

### 3. Vectores Unidimensionales ✅
- **Declaración**: `var arr : array[tamaño]`
- **Acceso**: `arr[índice]` donde índice puede ser:
  - Variable: `arr[i]`
  - Operación: `arr[i + 1]`
  - Constante: `arr[5]`

### 4. Instrucción Especial: Bucle FOR con Control de Flujo ✅
- **Sintaxis**: `for variable := inicio to fin step incremento`
- **Control de flujo**:
  - `break`: Sale del bucle
  - `continue`: Continúa con la siguiente iteración
- **Complejidad**: Media-Alta
- **Utilidad**: Muy útil para iteraciones controladas y manipulación de vectores

### 5. Operadores Adicionales ✅

#### Operadores Relacionales:
- `>` (mayor que)
- `<=` (menor o igual)
- `>=` (mayor o igual)
- `!=` (diferente)

#### Operadores Matemáticos:
- `%` (módulo)
- `**` (potenciación)

#### Operadores Lógicos:
- `&&` (AND lógico)
- `||` (OR lógico)
- `!` (NOT lógico)

### 6. Archivo de Salida ✅ (Pendiente implementación completa)
- El resultado se guardará en un archivo de salida en lugar de solo mostrarse por pantalla
- Implementación pendiente en las fases sintáctica y semántica

## Archivos Creados/Modificados

### Análisis Léxico (JFlex)
- `lexico_extendido.flex`: Especificación léxica extendida
- `simbolos_extendidos.txt`: Documentación de nuevos símbolos

### Ejemplos y Pruebas
- `programa_extendido.tiny`: Programa de ejemplo que demuestra todas las características
- `generar_lexico.sh`: Script para compilar el analizador léxico

### Documentación
- `README_EXTENSIONES.md`: Este archivo

## Tokens Añadidos

### Palabras Reservadas
```
FUNCTION, RETURN, CALL, BEGIN, VAR, GLOBAL, ARRAY,
FOR, TO, STEP, BREAK, CONTINUE
```

### Operadores
```
GT (>), LE (<=), GE (>=), NE (!=), MOD (%), POW (**),
AND (&&), OR (||), NOT (!)
```

### Delimitadores
```
LBRACKET ([), RBRACKET (]), LBRACE ({), RBRACE (}),
COMMA (,), COLON (:)
```

### Tipos de Datos
```
REAL (números decimales), STRING (cadenas de texto)
```

## Cómo Usar

### 1. Generar el Analizador Léxico
```bash
chmod +x generar_lexico.sh
./generar_lexico.sh
```

### 2. Compilar
```bash
cd Compiladores_Tiny_Generacion_2022_1
javac -cp src/especificacion/java-cup-11b-runtime.jar src/ve/edu/unet/LexicoExtendido.java
```

### 3. Probar
```bash
java -cp .:src/especificacion/java-cup-11b-runtime.jar ve.edu.unet.LexicoExtendido < ejemplo_fuente/programa_extendido.tiny
```

## Ejemplo de Código

```tiny
{Programa que calcula factorial usando funciones y vectores}

global resultados : array[10];

function factorial(n)
begin
    var result;
    if n <= 1 then
        result := 1
    else
        result := n * call factorial(n - 1)
    end;
    return result
end

begin
    var i;
    var num;
    
    for i := 0 to 9 step 1
    begin
        resultados[i] := call factorial(i);
        if resultados[i] > 1000 then
            break
        end
    end;
    
    write "Factoriales calculados y almacenados en vector"
end
```

## Próximos Pasos

1. **Análisis Sintáctico**: Crear gramática CUP para las nuevas construcciones
2. **Análisis Semántico**: Implementar tabla de símbolos con ámbitos
3. **Generación de Código**: Adaptar la generación para las nuevas características
4. **Archivo de Salida**: Implementar escritura a archivo en lugar de consola

## Características Destacadas

- **Recursión**: Soporte completo para funciones recursivas
- **Vectores Dinámicos**: Índices pueden ser expresiones complejas
- **Control de Flujo Avanzado**: Break y continue en bucles
- **Expresiones Complejas**: Operadores lógicos y matemáticos adicionales
- **Ámbitos Anidados**: Variables globales y locales bien definidas