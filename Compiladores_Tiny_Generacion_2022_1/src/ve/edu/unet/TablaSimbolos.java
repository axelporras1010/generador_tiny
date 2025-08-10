package ve.edu.unet;

import ve.edu.unet.nodosAST.*;

import java.util.*;




public class TablaSimbolos {
	private HashMap<String, RegistroSimbolo> tabla;
	private int direccion;  //Contador de las localidades de memoria asignadas a la tabla
	
	public TablaSimbolos() {
		super();
		tabla = new HashMap<String, RegistroSimbolo>();
		direccion=0;
	}

	public void cargarTabla(NodoBase raiz){
		while (raiz != null) {
	    if (raiz instanceof NodoIdentificador){
	    	InsertarSimbolo(((NodoIdentificador)raiz).getNombre(),-1);
	    	//TODO: Anadir el numero de linea y localidad de memoria correcta
	    }
	    // Manejo de programa: recorrer bloques
	    else if (raiz instanceof NodoPrograma) {
	    	NodoPrograma p = (NodoPrograma) raiz;
	    	if (p.getGlobal_block() != null) cargarTabla(p.getGlobal_block());
	    	if (p.getFunction_block() != null) cargarTabla(p.getFunction_block());
	    	if (p.getMain() != null) cargarTabla(p.getMain());
	    }
	    // Declaraciones: insertar símbolo
	    else if (raiz instanceof NodoDeclaracion) {
	    	NodoDeclaracion d = (NodoDeclaracion) raiz;
	    	InsertarSimbolo(d.getNombreVariable(), -1);
	    	if (d.getTamaño() != null) cargarTabla(d.getTamaño());
	    }
	    /* Hago el recorrido recursivo */
	    if (raiz instanceof  NodoIf){
	    	cargarTabla(((NodoIf)raiz).getPrueba());
	    	cargarTabla(((NodoIf)raiz).getParteThen());
	    	if(((NodoIf)raiz).getParteElse()!=null){
	    		cargarTabla(((NodoIf)raiz).getParteElse());
	    	}
	    }
	    else if (raiz instanceof  NodoRepeat){
	    	cargarTabla(((NodoRepeat)raiz).getCuerpo());
	    	cargarTabla(((NodoRepeat)raiz).getPrueba());
	    }
	    else if (raiz instanceof  NodoAsignacion) {
	    	NodoAsignacion n = (NodoAsignacion) raiz;
	    	// Asegurar que el identificador exista
	    	InsertarSimbolo(n.getIdentificador(), -1);
	    	cargarTabla(n.getExpresion());
	    	if (n.getIndice() != null) cargarTabla(n.getIndice());
	    }
	    else if (raiz instanceof  NodoEscribir)
	    	cargarTabla(((NodoEscribir)raiz).getExpresion());
	    else if (raiz instanceof NodoOperacion){
	    	cargarTabla(((NodoOperacion)raiz).getOpIzquierdo());
	    	cargarTabla(((NodoOperacion)raiz).getOpDerecho());
	    }
	    else if (raiz instanceof NodoLeer) {
	    	// En caso de lecturas, registrar el identificador si no existe
	    	InsertarSimbolo(((NodoLeer) raiz).getIdentificador(), -1);
	    }
	    else if (raiz instanceof NodoFuncion) {
	    	NodoFuncion f = (NodoFuncion) raiz;
	    	if (f.getParametros() != null) cargarTabla(f.getParametros());
	    	if (f.getCuerpo() != null) cargarTabla(f.getCuerpo());
	    	if (f.getRetorno() != null) cargarTabla(f.getRetorno());
	    }
	    else if (raiz instanceof NodoLlamadaFuncion) {
	    	NodoLlamadaFuncion lf = (NodoLlamadaFuncion) raiz;
	    	if (lf.getArgumentos() != null) cargarTabla(lf.getArgumentos());
	    }
	    else if (raiz instanceof NodoFor) {
	    	NodoFor nf = (NodoFor) raiz;
	    	InsertarSimbolo(nf.getVariable(), -1);
	    	if (nf.getValorInicial() != null) cargarTabla(nf.getValorInicial());
	    	if (nf.getValorFinal() != null) cargarTabla(nf.getValorFinal());
	    	if (nf.getIncremento() != null) cargarTabla(nf.getIncremento());
	    	if (nf.getCuerpo() != null) cargarTabla(nf.getCuerpo());
	    }
	    else if (raiz instanceof NodoReturn) {
	    	NodoReturn r = (NodoReturn) raiz;
	    	if (r.getExpresion() != null) cargarTabla(r.getExpresion());
	    }
	    raiz = raiz.getHermanoDerecha();
	  }
	}
	
	//true es nuevo no existe se insertara, false ya existe NO se vuelve a insertar 
	public boolean InsertarSimbolo(String identificador, int numLinea){
		RegistroSimbolo simbolo;
		if(tabla.containsKey(identificador)){
			return false;
		}else{
			simbolo= new RegistroSimbolo(identificador,numLinea,direccion++);
			tabla.put(identificador,simbolo);
			return true			;
		}
	}
	
	public RegistroSimbolo BuscarSimbolo(String identificador){
		RegistroSimbolo simbolo=(RegistroSimbolo)tabla.get(identificador);
		return simbolo;
	}
	
	public void ImprimirClaves(){
		System.out.println("*** Tabla de Simbolos ***");
		for( Iterator <String>it = tabla.keySet().iterator(); it.hasNext();) { 
            String s = (String)it.next();
	    System.out.println("Consegui Key: "+s+" con direccion: " + BuscarSimbolo(s).getDireccionMemoria());
		}
	}

	public int getDireccion(String Clave){
		return BuscarSimbolo(Clave).getDireccionMemoria();
	}
	
	/*
	 * TODO:
	 * 1. Crear lista con las lineas de codigo donde la variable es usada.
	 * */
}
