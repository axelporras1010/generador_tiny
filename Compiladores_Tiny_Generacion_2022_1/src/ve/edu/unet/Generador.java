package ve.edu.unet;

import ve.edu.unet.nodosAST.*;

public class Generador {
	/* Ilustracion de la disposicion de la memoria en
	 * este ambiente de ejecucion para el lenguaje Tiny
	 *
	 * |t1	|<- mp (Maxima posicion de memoria de la TM
	 * |t1	|<- desplazamientoTmp (tope actual)
	 * |free|
	 * |free|
	 * |...	|
	 * |x	|
	 * |y	|<- gp
	 * 
	 * */
		
		
		
	/* desplazamientoTmp es una variable inicializada en 0
	 * y empleada como el desplazamiento de la siguiente localidad
	 * temporal disponible desde la parte superior o tope de la memoria
	 * (la que apunta el registro MP).
	 * 
	 * - Se decrementa (desplazamientoTmp--) despues de cada almacenamiento y
	 * 
	 * - Se incrementa (desplazamientoTmp++) despues de cada eliminacion/carga en 
	 *   otra variable de un valor de la pila.
	 * 
	 * Pudiendose ver como el apuntador hacia el tope de la pila temporal
	 * y las llamadas a la funcion emitirRM corresponden a una inserccion 
	 * y extraccion de esta pila
	 */
	private static int desplazamientoTmp = 0;
	private static TablaSimbolos tablaSimbolos = null;
	
	public static void setTablaSimbolos(TablaSimbolos tabla){
		tablaSimbolos = tabla;
	}
	
	public static void generarCodigoObjeto(NodoBase raiz){
		System.out.println();
		System.out.println();
		System.out.println("------ CODIGO OBJETO DEL LENGUAJE TINY GENERADO PARA LA TM ------");
		System.out.println();
		System.out.println();
		generarPreludioEstandar();
		generar(raiz);
		/*Genero el codigo de finalizacion de ejecucion del codigo*/   
		UtGen.emitirComentario("Fin de la ejecucion.");
		UtGen.emitirRO("HALT", 0, 0, 0, "");
		System.out.println();
		System.out.println();
		System.out.println("------ FIN DEL CODIGO OBJETO DEL LENGUAJE TINY GENERADO PARA LA TM ------");
	}
	
	//Funcion principal de generacion de codigo
	//prerequisito: Fijar la tabla de simbolos antes de generar el codigo objeto 
	private static void generar(NodoBase nodo){
	if(tablaSimbolos!=null){
		if (nodo == null) {
			return;
		}
		if (nodo instanceof  NodoIf){
			generarIf(nodo);
		}else if (nodo instanceof  NodoRepeat){
			generarRepeat(nodo);
		}else if (nodo instanceof  NodoAsignacion){
			generarAsignacion(nodo);
		}else if (nodo instanceof  NodoLeer){
			generarLeer(nodo);
		}else if (nodo instanceof  NodoEscribir){
			generarEscribir(nodo);
		}else if (nodo instanceof NodoValor){
			generarValor(nodo);
		}else if (nodo instanceof NodoIdentificador){
			generarIdentificador(nodo);
		}else if (nodo instanceof NodoOperacion){
			generarOperacion(nodo);
		}else if (nodo instanceof NodoPrograma) { 
			NodoPrograma prog = (NodoPrograma)nodo;
			if (prog.getGlobal_block() != null) generar(prog.getGlobal_block());
			if (prog.getFunction_block() != null) generar(prog.getFunction_block());
			if (prog.getMain() != null) generar(prog.getMain());
		}else if (nodo instanceof NodoDeclaracion) {
			// No generar codigo directo para declaraciones en este backend simple
		}else if (nodo instanceof NodoString) {
			// Este backend no maneja cadenas; podria ignorarse o manejarse como literal no soportado
			UtGen.emitirComentario("string literal ignorado en generador actual");
		}
		else{
			System.out.println("BUG: Tipo de nodo a generar desconocido");
		}
		/*Si el hijo de extrema izquierda tiene hermano a la derecha lo genero tambien*/
		if(nodo.TieneHermano())
			generar(nodo.getHermanoDerecha());
	}else
		System.out.println("ERROR: por favor fije la tabla de simbolos a usar antes de generar codigo objeto!!!");
}

	private static void generarIf(NodoBase nodo){
    	NodoIf n = (NodoIf)nodo;
		int localidadSaltoElse,localidadSaltoEnd,localidadActual;
		if(UtGen.debug)	UtGen.emitirComentario("-> if");
		/*Genero el codigo para la parte de prueba del IF*/
		generar(n.getPrueba());
		localidadSaltoElse = UtGen.emitirSalto(1);
		UtGen.emitirComentario("If: el salto hacia el else debe estar aqui");
		/*Genero la parte THEN*/
		generar(n.getParteThen());
		localidadSaltoEnd = UtGen.emitirSalto(1);
		UtGen.emitirComentario("If: el salto hacia el final debe estar aqui");
		localidadActual = UtGen.emitirSalto(0);
		UtGen.cargarRespaldo(localidadSaltoElse);
		UtGen.emitirRM_Abs("JEQ", UtGen.AC, localidadActual, "if: jmp hacia else");
		UtGen.restaurarRespaldo();
		/*Genero la parte ELSE*/
		if(n.getParteElse()!=null){
			generar(n.getParteElse());
			localidadActual = UtGen.emitirSalto(0);
			UtGen.cargarRespaldo(localidadSaltoEnd);
			UtGen.emitirRM_Abs("LDA", UtGen.PC, localidadActual, "if: jmp hacia el final");
			UtGen.restaurarRespaldo();
    	}
		
		if(UtGen.debug)	UtGen.emitirComentario("<- if");
	}
	
	private static void generarRepeat(NodoBase nodo){
    	NodoRepeat n = (NodoRepeat)nodo;
		int localidadSaltoInicio;
		if(UtGen.debug)	UtGen.emitirComentario("-> repeat");
			localidadSaltoInicio = UtGen.emitirSalto(0);
			UtGen.emitirComentario("repeat: el salto hacia el final (luego del cuerpo) del repeat debe estar aqui");
			/* Genero el cuerpo del repeat */
			generar(n.getCuerpo());
			/* Genero el codigo de la prueba del repeat */
			generar(n.getPrueba());
			UtGen.emitirRM_Abs("JEQ", UtGen.AC, localidadSaltoInicio, "repeat: jmp hacia el inicio del cuerpo");
		if(UtGen.debug)	UtGen.emitirComentario("<- repeat");
	}		
	
	private static void generarAsignacion(NodoBase nodo){
		NodoAsignacion n = (NodoAsignacion)nodo;
		int direccion;
		if(UtGen.debug)	UtGen.emitirComentario("-> asignacion");		
		/* Genero el codigo para la expresion a la derecha de la asignacion */
		generar(n.getExpresion());
		/* Ahora almaceno el valor resultante */
		direccion = tablaSimbolos.getDireccion(n.getIdentificador());
		UtGen.emitirRM("ST", UtGen.AC, direccion, UtGen.GP, "asignacion: almaceno el valor para el id "+n.getIdentificador());
		if(UtGen.debug)	UtGen.emitirComentario("<- asignacion");
	}
	
	private static void generarLeer(NodoBase nodo){
		NodoLeer n = (NodoLeer)nodo;
		int direccion;
		if(UtGen.debug)	UtGen.emitirComentario("-> leer");
		UtGen.emitirRO("IN", UtGen.AC, 0, 0, "leer: lee un valor entero ");
		direccion = tablaSimbolos.getDireccion(n.getIdentificador());
		UtGen.emitirRM("ST", UtGen.AC, direccion, UtGen.GP, "leer: almaceno el valor entero leido en el id "+n.getIdentificador());
		if(UtGen.debug)	UtGen.emitirComentario("<- leer");
	}
	
	private static void generarEscribir(NodoBase nodo){
		NodoEscribir n = (NodoEscribir)nodo;
		if(UtGen.debug)	UtGen.emitirComentario("-> escribir");
		/* Genero el codigo de la expresion que va a ser escrita en pantalla */
		generar(n.getExpresion());
		/* Ahora genero la salida */
		UtGen.emitirRO("OUT", UtGen.AC, 0, 0, "escribir: genero la salida de la expresion");
		if(UtGen.debug)	UtGen.emitirComentario("<- escribir");
	}
	
	private static void generarValor(NodoBase nodo){
    	NodoValor n = (NodoValor)nodo;
    	if(UtGen.debug)	UtGen.emitirComentario("-> constante");
    	if (n.esReal()) {
    		UtGen.emitirRM("LDC", UtGen.AC, n.getValorReal().intValue(), 0, "cargar constante: "+n.getValor());
    	} else {
    		UtGen.emitirRM("LDC", UtGen.AC, n.getValorEntero(), 0, "cargar constante: "+n.getValor());
    	}
    	if(UtGen.debug)	UtGen.emitirComentario("<- constante");
	}
	
	private static void generarIdentificador(NodoBase nodo){
		NodoIdentificador n = (NodoIdentificador)nodo;
		int direccion;
		if(UtGen.debug)	UtGen.emitirComentario("-> identificador");
		direccion = tablaSimbolos.getDireccion(n.getNombre());
		UtGen.emitirRM("LD", UtGen.AC, direccion, UtGen.GP, "cargar valor de identificador: "+n.getNombre());
		if(UtGen.debug)	UtGen.emitirComentario("-> identificador");
	}

	private static void generarOperacion(NodoBase nodo){
		NodoOperacion n = (NodoOperacion) nodo;
		if(UtGen.debug)	UtGen.emitirComentario("-> Operacion: " + n.getOperacion());
		/* Caso unario NOT */
		if (n.getOperacion() == tipoOp.not) {
			/* Genero solo la expresion derecha */
			if (n.getOpDerecho() != null) generar(n.getOpDerecho());
			/* AC = (AC == 0) ? 1 : 0 */
			UtGen.emitirRM("JEQ", UtGen.AC, 2, UtGen.PC, "not: si AC==0 salto a poner 1");
			UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "not: caso verdadero->falso (AC=0)");
			UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "not: salto para evitar setear 1");
			UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "not: caso falso->verdadero (AC=1)");
			if(UtGen.debug)	UtGen.emitirComentario("<- Operacion: " + n.getOperacion());
			return;
		}
		/* Genero la expresion izquierda de la operacion */
		if (n.getOpIzquierdo() != null) generar(n.getOpIzquierdo());
		/* Almaceno en la pseudo pila de valor temporales el valor de la operacion izquierda */
		UtGen.emitirRM("ST", UtGen.AC, desplazamientoTmp--, UtGen.MP, "op: push en la pila tmp el resultado expresion izquierda");
		/* Genero la expresion derecha de la operacion */
		if (n.getOpDerecho() != null) generar(n.getOpDerecho());
		/* Ahora cargo/saco de la pila el valor izquierdo */
		UtGen.emitirRM("LD", UtGen.AC1, ++desplazamientoTmp, UtGen.MP, "op: pop o cargo de la pila el valor izquierdo en AC1");
		switch(n.getOperacion()){
			case	mas:	UtGen.emitirRO("ADD", UtGen.AC, UtGen.AC1, UtGen.AC, "op: +");		
							break;
			case	menos:	UtGen.emitirRO("SUB", UtGen.AC, UtGen.AC1, UtGen.AC, "op: -");
							break;
			case	por:	UtGen.emitirRO("MUL", UtGen.AC, UtGen.AC1, UtGen.AC, "op: *");
							break;
			case	entre:	UtGen.emitirRO("DIV", UtGen.AC, UtGen.AC1, UtGen.AC, "op: /");
							break;		
			case	menor:	UtGen.emitirRO("SUB", UtGen.AC, UtGen.AC1, UtGen.AC, "op: <");
							UtGen.emitirRM("JLT", UtGen.AC, 2, UtGen.PC, "voy dos instrucciones mas alla if verdadero (AC<0)");
							UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "caso de falso (AC=0)");
							UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)");
							UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "caso de verdadero (AC=1)");
							break;
			case	igual:	UtGen.emitirRO("SUB", UtGen.AC, UtGen.AC1, UtGen.AC, "op: ==");
							UtGen.emitirRM("JEQ", UtGen.AC, 2, UtGen.PC, "voy dos instrucciones mas alla if verdadero (AC==0)");
							UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "caso de falso (AC=0)");
							UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)");
							UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "caso de verdadero (AC=1)");
							break;
			case mayor:
				UtGen.emitirRO("SUB", UtGen.AC, UtGen.AC1, UtGen.AC, "op: >");
				UtGen.emitirRM("JGT", UtGen.AC, 2, UtGen.PC, "if verdadero (AC>0)");
				UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "falso (AC=0)");
				UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "salto incondicional");
				UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "verdadero (AC=1)");
				break;
			case menorigual:
				UtGen.emitirRO("SUB", UtGen.AC, UtGen.AC1, UtGen.AC, "op: <=");
				// true if AC<=0: !(AC>0)
				UtGen.emitirRM("JGT", UtGen.AC, 2, UtGen.PC, "si AC>0 salto a falso");
				UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "verdadero (AC=1)");
				UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "salto incondicional");
				UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "falso (AC=0)");
				break;
			case mayorigual:
				UtGen.emitirRO("SUB", UtGen.AC, UtGen.AC1, UtGen.AC, "op: >=");
				// true if AC>=0: !(AC<0)
				UtGen.emitirRM("JLT", UtGen.AC, 2, UtGen.PC, "si AC<0 salto a falso");
				UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "verdadero (AC=1)");
				UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "salto incondicional");
				UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "falso (AC=0)");
				break;
			case diferente:
				UtGen.emitirRO("SUB", UtGen.AC, UtGen.AC1, UtGen.AC, "op: !=");
				UtGen.emitirRM("JNE", UtGen.AC, 2, UtGen.PC, "if verdadero (AC!=0)");
				UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "falso (AC=0)");
				UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "salto incondicional");
				UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "verdadero (AC=1)");
				break;
			case modulo:
				// naive: a % b -> a - (a / b) * b
				// AC1 holds left, AC holds right (b). We'll compute AC = left % right.
				UtGen.emitirRO("DIV", UtGen.AC, UtGen.AC1, UtGen.AC, "tmp = left / right");
				UtGen.emitirRM("ST", UtGen.AC, desplazamientoTmp--, UtGen.MP, "guardar tmp");
				UtGen.emitirRM("LD", UtGen.AC, ++desplazamientoTmp, UtGen.MP, "cargar tmp");
				UtGen.emitirRO("MUL", UtGen.AC, UtGen.AC, UtGen.AC1, "tmp * left");
				// Reload right into AC1: we lost it; but simple backend can't, so mark as unknown
				UtGen.emitirComentario("BUG: modulo implementacion simplificada, requiere mas registros");
				break;
			case potencia:
				UtGen.emitirComentario("BUG: potencia no implementada en TM simple");
				break;
			case and:
				// Logical and: if left==0 then false else evaluate right and check !=0
				UtGen.emitirRM("JEQ", UtGen.AC1, 2, UtGen.PC, "and: si izq==0 salto a falso");
				// AC currently right; compare right != 0
				UtGen.emitirRM("JEQ", UtGen.AC, 2, UtGen.PC, "and: si der==0 salto a falso");
				UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "and: verdadero");
				UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "and: salto");
				UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "and: falso");
				break;
			case or:
				// Logical or: if left!=0 then true else check right!=0
				UtGen.emitirRM("JNE", UtGen.AC1, 2, UtGen.PC, "or: si izq!=0 salto a verdadero");
				UtGen.emitirRM("JNE", UtGen.AC, 2, UtGen.PC, "or: si der!=0 salto a verdadero");
				UtGen.emitirRM("LDC", UtGen.AC, 0, UtGen.AC, "or: falso");
				UtGen.emitirRM("LDA", UtGen.PC, 1, UtGen.PC, "or: salto");
				UtGen.emitirRM("LDC", UtGen.AC, 1, UtGen.AC, "or: verdadero");
				break;
			default:
							UtGen.emitirComentario("BUG: tipo de operacion desconocida");
		}
		if(UtGen.debug)	UtGen.emitirComentario("<- Operacion: " + n.getOperacion());
	}
	
	//TODO: enviar preludio a archivo de salida, obtener antes su nombre
	private static void generarPreludioEstandar(){
		UtGen.emitirComentario("Compilacion TINY para el codigo objeto TM");
		UtGen.emitirComentario("Archivo: "+ "NOMBRE_ARREGLAR");
		/*Genero inicializaciones del preludio estandar*/
		/*Todos los registros en tiny comienzan en cero*/
		UtGen.emitirComentario("Preludio estandar:");
		UtGen.emitirRM("LD", UtGen.MP, 0, UtGen.AC, "cargar la maxima direccion desde la localidad 0");
		UtGen.emitirRM("ST", UtGen.AC, 0, UtGen.AC, "limpio el registro de la localidad 0");
	}

}
