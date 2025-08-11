* Compilacion TINY EXTENDIDO para el codigo objeto TM
* Archivo: programa_extendido.tiny
* Preludio estandar:
0:      LD        6,0(0)        cargar la maxima direccion desde la localidad 0
1:      ST        0,0(0)        limpio el registro de la localidad 0
2:      LDC       5,0(0)        GP apunta al inicio de variables globales (direccion 0)
* Total de memoria reservada para variables: 18 posiciones
* -> programa
* -> declaracion: x
* Declaracion de variable: x (global)
3:      LDC       0,0(0)        global: inicializar variable x a cero
4:      ST        0,0(5)        global: almacenar en direccion 0
* <- declaracion
* -> declaracion: arr
* Declaracion de array: arr tama▒o definido
* -> constante
5:      LDC       0,10(0)       cargar constante: 10
* <- constante
6:      LDC       0,0(0)        array: inicializar elemento 0 a cero
7:      ST        0,1(5)        array: almacenar en posicion 1
8:      LDC       0,0(0)        array: inicializar elemento 1 a cero
9:      ST        0,2(5)        array: almacenar en posicion 2
10:     LDC       0,0(0)        array: inicializar elemento 2 a cero
11:     ST        0,3(5)        array: almacenar en posicion 3
12:     LDC       0,0(0)        array: inicializar elemento 3 a cero
13:     ST        0,4(5)        array: almacenar en posicion 4
14:     LDC       0,0(0)        array: inicializar elemento 4 a cero
15:     ST        0,5(5)        array: almacenar en posicion 5
16:     LDC       0,0(0)        array: inicializar elemento 5 a cero
17:     ST        0,6(5)        array: almacenar en posicion 6
18:     LDC       0,0(0)        array: inicializar elemento 6 a cero
19:     ST        0,7(5)        array: almacenar en posicion 7
20:     LDC       0,0(0)        array: inicializar elemento 7 a cero
21:     ST        0,8(5)        array: almacenar en posicion 8
22:     LDC       0,0(0)        array: inicializar elemento 8 a cero
23:     ST        0,9(5)        array: almacenar en posicion 9
24:     LDC       0,0(0)        array: inicializar elemento 9 a cero
25:     ST        0,10(5)       array: almacenar en posicion 10
* <- declaracion
* -> funcion: suma_vector
* === INICIO FUNCION suma_vector ===
26:     ST        0,0(6)        funci▒n: guardar frame anterior
* Procesamiento de parametros
* -> declaracion: i
* Declaracion de variable: i (local)
27:     LDC       0,0(0)        local: inicializar variable i a cero
28:     ST        0,14(5)       local: almacenar en direccion 14
* <- declaracion
* -> declaracion: total
* Declaracion de variable: total (local)
29:     LDC       0,0(0)        local: inicializar variable total a cero
30:     ST        0,15(5)       local: almacenar en direccion 15
* <- declaracion
* -> asignacion
* -> constante
31:     LDC       0,0(0)        cargar constante: 0
* <- constante
32:     ST        0,15(5)       asignacion: almaceno el valor para el id total
* <- asignacion
* -> for
* -> constante
33:     LDC       0,0(0)        cargar constante: 0
* <- constante
34:     ST        0,14(5)       for: inicializar variable i
* for: inicio del bucle
35:     LD        0,14(5)       for: cargar variable de control
36:     ST        0,-1(6)       for: guardar variable en pila temp
* -> Operacion: menos
* -> identificador
37:     LD        0,13(5)       cargar valor de identificador: size
* <- identificador
38:     ST        0,-2(6)       op: push en la pila tmp el resultado expresion izquierda
* -> constante
39:     LDC       0,1(0)        cargar constante: 1
* <- constante
40:     LD        1,-2(6)       op: pop o cargo de la pila el valor izquierdo en AC1
41:     SUB       0,1,0         op: -
* <- Operacion: menos
42:     LD        1,-1(6)       for: cargar variable de pila temp
43:     SUB       0,1,0         for: variable - valor_final
* for: salto condicional al final
* -> asignacion
* -> Operacion: mas
* -> identificador
45:     LD        0,15(5)       cargar valor de identificador: total
* <- identificador
46:     ST        0,-1(6)       op: push en la pila tmp el resultado expresion izquierda
* -> identificador
* -> identificador
47:     LD        0,14(5)       cargar valor de identificador: i
* <- identificador
48:     LDC       1,12(0)       identificador array: cargar direccion base
49:     ADD       0,0,1         identificador array: calcular direccion
* <- identificador
50:     LD        1,-1(6)       op: pop o cargo de la pila el valor izquierdo en AC1
51:     ADD       0,1,0         op: +
* <- Operacion: mas
52:     ST        0,15(5)       asignacion: almaceno el valor para el id total
* <- asignacion
* -> if
* -> Operacion: menor
* -> identificador
* -> identificador
53:     LD        0,14(5)       cargar valor de identificador: i
* <- identificador
54:     LDC       1,12(0)       identificador array: cargar direccion base
55:     ADD       0,0,1         identificador array: calcular direccion
* <- identificador
56:     ST        0,-1(6)       op: push en la pila tmp el resultado expresion izquierda
* -> constante
57:     LDC       0,0(0)        cargar constante: 0
* <- constante
58:     LD        1,-1(6)       op: pop o cargo de la pila el valor izquierdo en AC1
59:     SUB       0,1,0         op: <
60:     JLT       0,2(7)        voy dos instrucciones mas alla if verdadero (AC<0)
61:     LDC       0,0(0)        caso de falso (AC=0)
62:     LDA       7,1(7)        Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
63:     LDC       0,1(0)        caso de verdadero (AC=1)
* <- Operacion: menor
* If: el salto hacia el else debe estar aqui
* -> continue
* continue: salto al incremento del bucle
* <- continue
* If: el salto hacia el final debe estar aqui
64:     JEQ       0,1(7)        if: jmp hacia else
* <- if
* -> if
* -> Operacion: mayor
* -> identificador
66:     LD        0,15(5)       cargar valor de identificador: total
* <- identificador
67:     ST        0,-1(6)       op: push en la pila tmp el resultado expresion izquierda
* -> constante
68:     LDC       0,1000(0)      cargar constante: 1000
* <- constante
69:     LD        1,-1(6)       op: pop o cargo de la pila el valor izquierdo en AC1
70:     SUB       0,1,0         op: >
71:     JGT       0,2(7)        saltar si AC>0
72:     LDC       0,0(0)        caso falso
73:     LDA       7,1(7)        saltar caso verdadero
74:     LDC       0,1(0)        caso verdadero
* <- Operacion: mayor
* If: el salto hacia el else debe estar aqui
* -> break
* break: salto al final del bucle
* <- break
* If: el salto hacia el final debe estar aqui
75:     JEQ       0,1(7)        if: jmp hacia else
* <- if
* for: punto de continue
77:     LD        0,14(5)       for: cargar variable para incremento
78:     ST        0,-1(6)       for: guardar variable en pila temp
* -> constante
79:     LDC       0,1(0)        cargar constante: 1
* <- constante
80:     LD        1,-1(6)       for: cargar variable de pila temp
81:     ADD       0,1,0         for: incrementar variable
82:     ST        0,14(5)       for: guardar variable incrementada
83:     LDA       7,-49(7)      for: salto al inicio
* for: fin del bucle
44:     JGT       0,39(7)       for: saltar si variable > final
* <- for
* -> return
* -> identificador
84:     LD        0,15(5)       cargar valor de identificador: total
* <- identificador
85:     LD        1,0(6)        return: restaurar frame
86:     LD        7,0(1)        return: salto a direccion de retorno
* <- return
* Return implicito de funcion
87:     LD        0,1(6)        funci▒n: restaurar frame anterior
88:     LD        7,0(0)        funci▒n: retorno
* === FIN FUNCION suma_vector ===
* <- funcion
* -> declaracion: i
* Declaracion de variable: i (local)
89:     LDC       0,0(0)        local: inicializar variable i a cero
90:     ST        0,14(5)       local: almacenar en direccion 14
* <- declaracion
* -> declaracion: num
* Declaracion de variable: num (local)
91:     LDC       0,0(0)        local: inicializar variable num a cero
92:     ST        0,16(5)       local: almacenar en direccion 16
* <- declaracion
* -> declaracion: resultado
* Declaracion de variable: resultado (local)
93:     LDC       0,0(0)        local: inicializar variable resultado a cero
94:     ST        0,17(5)       local: almacenar en direccion 17
* <- declaracion
* -> escribir
* -> string
* String: "Ingrese un n▒mero: "
95:     LDC       0,73(0)       string: cargar caracter 'I'
96:     OUT       0,0,0         string: escribir caracter
97:     LDC       0,110(0)      string: cargar caracter 'n'
98:     OUT       0,0,0         string: escribir caracter
99:     LDC       0,103(0)      string: cargar caracter 'g'
100:    OUT       0,0,0         string: escribir caracter
101:    LDC       0,114(0)      string: cargar caracter 'r'
102:    OUT       0,0,0         string: escribir caracter
103:    LDC       0,101(0)      string: cargar caracter 'e'
104:    OUT       0,0,0         string: escribir caracter
105:    LDC       0,115(0)      string: cargar caracter 's'
106:    OUT       0,0,0         string: escribir caracter
107:    LDC       0,101(0)      string: cargar caracter 'e'
108:    OUT       0,0,0         string: escribir caracter
109:    LDC       0,32(0)       string: cargar caracter ' '
110:    OUT       0,0,0         string: escribir caracter
111:    LDC       0,117(0)      string: cargar caracter 'u'
112:    OUT       0,0,0         string: escribir caracter
113:    LDC       0,110(0)      string: cargar caracter 'n'
114:    OUT       0,0,0         string: escribir caracter
115:    LDC       0,32(0)       string: cargar caracter ' '
116:    OUT       0,0,0         string: escribir caracter
117:    LDC       0,110(0)      string: cargar caracter 'n'
118:    OUT       0,0,0         string: escribir caracter
119:    LDC       0,250(0)      string: cargar caracter '▒'
120:    OUT       0,0,0         string: escribir caracter
121:    LDC       0,109(0)      string: cargar caracter 'm'
122:    OUT       0,0,0         string: escribir caracter
123:    LDC       0,101(0)      string: cargar caracter 'e'
124:    OUT       0,0,0         string: escribir caracter
125:    LDC       0,114(0)      string: cargar caracter 'r'
126:    OUT       0,0,0         string: escribir caracter
127:    LDC       0,111(0)      string: cargar caracter 'o'
128:    OUT       0,0,0         string: escribir caracter
129:    LDC       0,58(0)       string: cargar caracter ':'
130:    OUT       0,0,0         string: escribir caracter
131:    LDC       0,32(0)       string: cargar caracter ' '
132:    OUT       0,0,0         string: escribir caracter
* <- string
133:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* -> leer
134:    IN        0,0,0         leer: lee un valor entero
135:    ST        0,16(5)       leer: almaceno el valor entero leido en el id num
* <- leer
* -> for
* -> constante
136:    LDC       0,0(0)        cargar constante: 0
* <- constante
137:    ST        0,14(5)       for: inicializar variable i
* for: inicio del bucle
138:    LD        0,14(5)       for: cargar variable de control
139:    ST        0,1(6)        for: guardar variable en pila temp
* -> constante
140:    LDC       0,9(0)        cargar constante: 9
* <- constante
141:    LD        1,1(6)        for: cargar variable de pila temp
142:    SUB       0,1,0         for: variable - valor_final
* for: salto condicional al final
* -> asignacion
* -> Operacion: mas
* -> Operacion: por
* -> identificador
144:    LD        0,14(5)       cargar valor de identificador: i
* <- identificador
145:    ST        0,1(6)        op: push en la pila tmp el resultado expresion izquierda
* -> constante
146:    LDC       0,2(0)        cargar constante: 2
* <- constante
147:    LD        1,1(6)        op: pop o cargo de la pila el valor izquierdo en AC1
148:    MUL       0,1,0         op: *
* <- Operacion: por
149:    ST        0,1(6)        op: push en la pila tmp el resultado expresion izquierda
* -> constante
150:    LDC       0,1(0)        cargar constante: 1
* <- constante
151:    LD        1,1(6)        op: pop o cargo de la pila el valor izquierdo en AC1
152:    ADD       0,1,0         op: +
* <- Operacion: mas
153:    ST        0,1(6)        asignacion array: guardar valor
* -> identificador
154:    LD        0,14(5)       cargar valor de identificador: i
* <- identificador
155:    LDC       1,1(0)        asignacion array: cargar direccion base
156:    ADD       0,0,1         asignacion array: calcular direccion
157:    LD        1,1(6)        asignacion array: recuperar valor
158:    ST        1,0(0)        asignacion array: almacenar en posicion calculada
* <- asignacion
* for: punto de continue
159:    LD        0,14(5)       for: cargar variable para incremento
160:    ST        0,1(6)        for: guardar variable en pila temp
* -> constante
161:    LDC       0,1(0)        cargar constante: 1
* <- constante
162:    LD        1,1(6)        for: cargar variable de pila temp
163:    ADD       0,1,0         for: incrementar variable
164:    ST        0,14(5)       for: guardar variable incrementada
165:    LDA       7,-28(7)      for: salto al inicio
* for: fin del bucle
143:    JGT       0,22(7)       for: saltar si variable > final
* <- for
* -> if
* -> Operacion: and
* -> Operacion: mayorigual
* -> identificador
166:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
167:    ST        0,1(6)        op: push en la pila tmp el resultado expresion izquierda
* -> constante
168:    LDC       0,0(0)        cargar constante: 0
* <- constante
169:    LD        1,1(6)        op: pop o cargo de la pila el valor izquierdo en AC1
170:    SUB       0,1,0         op: >=
171:    JGE       0,2(7)        saltar si AC>=0
172:    LDC       0,0(0)        caso falso
173:    LDA       7,1(7)        saltar caso verdadero
174:    LDC       0,1(0)        caso verdadero
* <- Operacion: mayorigual
175:    ST        0,1(6)        op: push en la pila tmp el resultado expresion izquierda
* -> Operacion: menorigual
* -> identificador
176:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
177:    ST        0,0(6)        op: push en la pila tmp el resultado expresion izquierda
* -> constante
178:    LDC       0,10(0)       cargar constante: 10
* <- constante
179:    LD        1,0(6)        op: pop o cargo de la pila el valor izquierdo en AC1
180:    SUB       0,1,0         op: <=
181:    JLE       0,2(7)        saltar si AC<=0
182:    LDC       0,0(0)        caso falso
183:    LDA       7,1(7)        saltar caso verdadero
184:    LDC       0,1(0)        caso verdadero
* <- Operacion: menorigual
185:    LD        1,1(6)        op: pop o cargo de la pila el valor izquierdo en AC1
186:    JEQ       1,3(7)        and: si izquierdo es falso, resultado es falso
187:    JEQ       0,2(7)        and: si derecho es falso, resultado es falso
188:    LDC       0,1(0)        and: ambos verdaderos
189:    LDA       7,1(7)        and: saltar caso falso
190:    LDC       0,0(0)        and: resultado falso
* <- Operacion: and
* If: el salto hacia el else debe estar aqui
* -> escribir
* -> string
* String: "El n▒mero est▒ en rango"
192:    LDC       0,69(0)       string: cargar caracter 'E'
193:    OUT       0,0,0         string: escribir caracter
194:    LDC       0,108(0)      string: cargar caracter 'l'
195:    OUT       0,0,0         string: escribir caracter
196:    LDC       0,32(0)       string: cargar caracter ' '
197:    OUT       0,0,0         string: escribir caracter
198:    LDC       0,110(0)      string: cargar caracter 'n'
199:    OUT       0,0,0         string: escribir caracter
200:    LDC       0,250(0)      string: cargar caracter '▒'
201:    OUT       0,0,0         string: escribir caracter
202:    LDC       0,109(0)      string: cargar caracter 'm'
203:    OUT       0,0,0         string: escribir caracter
204:    LDC       0,101(0)      string: cargar caracter 'e'
205:    OUT       0,0,0         string: escribir caracter
206:    LDC       0,114(0)      string: cargar caracter 'r'
207:    OUT       0,0,0         string: escribir caracter
208:    LDC       0,111(0)      string: cargar caracter 'o'
209:    OUT       0,0,0         string: escribir caracter
210:    LDC       0,32(0)       string: cargar caracter ' '
211:    OUT       0,0,0         string: escribir caracter
212:    LDC       0,101(0)      string: cargar caracter 'e'
213:    OUT       0,0,0         string: escribir caracter
214:    LDC       0,115(0)      string: cargar caracter 's'
215:    OUT       0,0,0         string: escribir caracter
216:    LDC       0,116(0)      string: cargar caracter 't'
217:    OUT       0,0,0         string: escribir caracter
218:    LDC       0,225(0)      string: cargar caracter '▒'
219:    OUT       0,0,0         string: escribir caracter
220:    LDC       0,32(0)       string: cargar caracter ' '
221:    OUT       0,0,0         string: escribir caracter
222:    LDC       0,101(0)      string: cargar caracter 'e'
223:    OUT       0,0,0         string: escribir caracter
224:    LDC       0,110(0)      string: cargar caracter 'n'
225:    OUT       0,0,0         string: escribir caracter
226:    LDC       0,32(0)       string: cargar caracter ' '
227:    OUT       0,0,0         string: escribir caracter
228:    LDC       0,114(0)      string: cargar caracter 'r'
229:    OUT       0,0,0         string: escribir caracter
230:    LDC       0,97(0)       string: cargar caracter 'a'
231:    OUT       0,0,0         string: escribir caracter
232:    LDC       0,110(0)      string: cargar caracter 'n'
233:    OUT       0,0,0         string: escribir caracter
234:    LDC       0,103(0)      string: cargar caracter 'g'
235:    OUT       0,0,0         string: escribir caracter
236:    LDC       0,111(0)      string: cargar caracter 'o'
237:    OUT       0,0,0         string: escribir caracter
* <- string
238:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* -> escribir
* -> identificador
239:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
240:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* -> if
* -> Operacion: igual
* -> Operacion: modulo
* -> identificador
241:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
242:    ST        0,1(6)        op: push en la pila tmp el resultado expresion izquierda
* -> constante
243:    LDC       0,2(0)        cargar constante: 2
* <- constante
244:    LD        1,1(6)        op: pop o cargo de la pila el valor izquierdo en AC1
245:    ST        0,1(6)        mod: guardar b
246:    ST        1,0(6)        mod: guardar a
247:    DIV       0,1,0         mod: a/b
248:    LD        1,0(6)        mod: recuperar a
249:    LD        2,1(6)        mod: recuperar b en r2
250:    MUL       0,0,2         mod: (a/b)*b
251:    SUB       0,1,0         mod: a - (a/b)*b
* <- Operacion: modulo
252:    ST        0,1(6)        op: push en la pila tmp el resultado expresion izquierda
* -> constante
253:    LDC       0,0(0)        cargar constante: 0
* <- constante
254:    LD        1,1(6)        op: pop o cargo de la pila el valor izquierdo en AC1
255:    SUB       0,1,0         op: ==
256:    JEQ       0,2(7)        voy dos instrucciones mas alla if verdadero (AC==0)
257:    LDC       0,0(0)        caso de falso (AC=0)
258:    LDA       7,1(7)        Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
259:    LDC       0,1(0)        caso de verdadero (AC=1)
* <- Operacion: igual
* If: el salto hacia el else debe estar aqui
* -> escribir
* -> string
* String: "El n▒mero es par"
261:    LDC       0,69(0)       string: cargar caracter 'E'
262:    OUT       0,0,0         string: escribir caracter
263:    LDC       0,108(0)      string: cargar caracter 'l'
264:    OUT       0,0,0         string: escribir caracter
265:    LDC       0,32(0)       string: cargar caracter ' '
266:    OUT       0,0,0         string: escribir caracter
267:    LDC       0,110(0)      string: cargar caracter 'n'
268:    OUT       0,0,0         string: escribir caracter
269:    LDC       0,250(0)      string: cargar caracter '▒'
270:    OUT       0,0,0         string: escribir caracter
271:    LDC       0,109(0)      string: cargar caracter 'm'
272:    OUT       0,0,0         string: escribir caracter
273:    LDC       0,101(0)      string: cargar caracter 'e'
274:    OUT       0,0,0         string: escribir caracter
275:    LDC       0,114(0)      string: cargar caracter 'r'
276:    OUT       0,0,0         string: escribir caracter
277:    LDC       0,111(0)      string: cargar caracter 'o'
278:    OUT       0,0,0         string: escribir caracter
279:    LDC       0,32(0)       string: cargar caracter ' '
280:    OUT       0,0,0         string: escribir caracter
281:    LDC       0,101(0)      string: cargar caracter 'e'
282:    OUT       0,0,0         string: escribir caracter
283:    LDC       0,115(0)      string: cargar caracter 's'
284:    OUT       0,0,0         string: escribir caracter
285:    LDC       0,32(0)       string: cargar caracter ' '
286:    OUT       0,0,0         string: escribir caracter
287:    LDC       0,112(0)      string: cargar caracter 'p'
288:    OUT       0,0,0         string: escribir caracter
289:    LDC       0,97(0)       string: cargar caracter 'a'
290:    OUT       0,0,0         string: escribir caracter
291:    LDC       0,114(0)      string: cargar caracter 'r'
292:    OUT       0,0,0         string: escribir caracter
* <- string
293:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* If: el salto hacia el final debe estar aqui
260:    JEQ       0,34(7)       if: jmp hacia else
* -> escribir
* -> string
* String: "El n▒mero es impar"
295:    LDC       0,69(0)       string: cargar caracter 'E'
296:    OUT       0,0,0         string: escribir caracter
297:    LDC       0,108(0)      string: cargar caracter 'l'
298:    OUT       0,0,0         string: escribir caracter
299:    LDC       0,32(0)       string: cargar caracter ' '
300:    OUT       0,0,0         string: escribir caracter
301:    LDC       0,110(0)      string: cargar caracter 'n'
302:    OUT       0,0,0         string: escribir caracter
303:    LDC       0,250(0)      string: cargar caracter '▒'
304:    OUT       0,0,0         string: escribir caracter
305:    LDC       0,109(0)      string: cargar caracter 'm'
306:    OUT       0,0,0         string: escribir caracter
307:    LDC       0,101(0)      string: cargar caracter 'e'
308:    OUT       0,0,0         string: escribir caracter
309:    LDC       0,114(0)      string: cargar caracter 'r'
310:    OUT       0,0,0         string: escribir caracter
311:    LDC       0,111(0)      string: cargar caracter 'o'
312:    OUT       0,0,0         string: escribir caracter
313:    LDC       0,32(0)       string: cargar caracter ' '
314:    OUT       0,0,0         string: escribir caracter
315:    LDC       0,101(0)      string: cargar caracter 'e'
316:    OUT       0,0,0         string: escribir caracter
317:    LDC       0,115(0)      string: cargar caracter 's'
318:    OUT       0,0,0         string: escribir caracter
319:    LDC       0,32(0)       string: cargar caracter ' '
320:    OUT       0,0,0         string: escribir caracter
321:    LDC       0,105(0)      string: cargar caracter 'i'
322:    OUT       0,0,0         string: escribir caracter
323:    LDC       0,109(0)      string: cargar caracter 'm'
324:    OUT       0,0,0         string: escribir caracter
325:    LDC       0,112(0)      string: cargar caracter 'p'
326:    OUT       0,0,0         string: escribir caracter
327:    LDC       0,97(0)       string: cargar caracter 'a'
328:    OUT       0,0,0         string: escribir caracter
329:    LDC       0,114(0)      string: cargar caracter 'r'
330:    OUT       0,0,0         string: escribir caracter
* <- string
331:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
294:    LDA       7,37(7)       if: jmp hacia el final
* <- if
* -> asignacion
* -> Operacion: potencia
* -> identificador
332:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
333:    ST        0,1(6)        op: push en la pila tmp el resultado expresion izquierda
* -> constante
334:    LDC       0,2(0)        cargar constante: 2
* <- constante
335:    LD        1,1(6)        op: pop o cargo de la pila el valor izquierdo en AC1
* potencia: implementaci▒n simplificada
336:    MUL       0,1,0         potencia: multiplicaci▒n simple
* <- Operacion: potencia
337:    ST        0,0(5)        asignacion: almaceno el valor para el id x
* <- asignacion
* -> escribir
* -> string
* String: "El cuadrado es: "
338:    LDC       0,69(0)       string: cargar caracter 'E'
339:    OUT       0,0,0         string: escribir caracter
340:    LDC       0,108(0)      string: cargar caracter 'l'
341:    OUT       0,0,0         string: escribir caracter
342:    LDC       0,32(0)       string: cargar caracter ' '
343:    OUT       0,0,0         string: escribir caracter
344:    LDC       0,99(0)       string: cargar caracter 'c'
345:    OUT       0,0,0         string: escribir caracter
346:    LDC       0,117(0)      string: cargar caracter 'u'
347:    OUT       0,0,0         string: escribir caracter
348:    LDC       0,97(0)       string: cargar caracter 'a'
349:    OUT       0,0,0         string: escribir caracter
350:    LDC       0,100(0)      string: cargar caracter 'd'
351:    OUT       0,0,0         string: escribir caracter
352:    LDC       0,114(0)      string: cargar caracter 'r'
353:    OUT       0,0,0         string: escribir caracter
354:    LDC       0,97(0)       string: cargar caracter 'a'
355:    OUT       0,0,0         string: escribir caracter
356:    LDC       0,100(0)      string: cargar caracter 'd'
357:    OUT       0,0,0         string: escribir caracter
358:    LDC       0,111(0)      string: cargar caracter 'o'
359:    OUT       0,0,0         string: escribir caracter
360:    LDC       0,32(0)       string: cargar caracter ' '
361:    OUT       0,0,0         string: escribir caracter
362:    LDC       0,101(0)      string: cargar caracter 'e'
363:    OUT       0,0,0         string: escribir caracter
364:    LDC       0,115(0)      string: cargar caracter 's'
365:    OUT       0,0,0         string: escribir caracter
366:    LDC       0,58(0)       string: cargar caracter ':'
367:    OUT       0,0,0         string: escribir caracter
368:    LDC       0,32(0)       string: cargar caracter ' '
369:    OUT       0,0,0         string: escribir caracter
* <- string
370:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* -> escribir
* -> identificador
371:    LD        0,0(5)        cargar valor de identificador: x
* <- identificador
372:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* If: el salto hacia el final debe estar aqui
191:    JEQ       0,182(7)      if: jmp hacia else
* -> escribir
* -> string
* String: "N▒mero fuera de rango"
374:    LDC       0,78(0)       string: cargar caracter 'N'
375:    OUT       0,0,0         string: escribir caracter
376:    LDC       0,250(0)      string: cargar caracter '▒'
377:    OUT       0,0,0         string: escribir caracter
378:    LDC       0,109(0)      string: cargar caracter 'm'
379:    OUT       0,0,0         string: escribir caracter
380:    LDC       0,101(0)      string: cargar caracter 'e'
381:    OUT       0,0,0         string: escribir caracter
382:    LDC       0,114(0)      string: cargar caracter 'r'
383:    OUT       0,0,0         string: escribir caracter
384:    LDC       0,111(0)      string: cargar caracter 'o'
385:    OUT       0,0,0         string: escribir caracter
386:    LDC       0,32(0)       string: cargar caracter ' '
387:    OUT       0,0,0         string: escribir caracter
388:    LDC       0,102(0)      string: cargar caracter 'f'
389:    OUT       0,0,0         string: escribir caracter
390:    LDC       0,117(0)      string: cargar caracter 'u'
391:    OUT       0,0,0         string: escribir caracter
392:    LDC       0,101(0)      string: cargar caracter 'e'
393:    OUT       0,0,0         string: escribir caracter
394:    LDC       0,114(0)      string: cargar caracter 'r'
395:    OUT       0,0,0         string: escribir caracter
396:    LDC       0,97(0)       string: cargar caracter 'a'
397:    OUT       0,0,0         string: escribir caracter
398:    LDC       0,32(0)       string: cargar caracter ' '
399:    OUT       0,0,0         string: escribir caracter
400:    LDC       0,100(0)      string: cargar caracter 'd'
401:    OUT       0,0,0         string: escribir caracter
402:    LDC       0,101(0)      string: cargar caracter 'e'
403:    OUT       0,0,0         string: escribir caracter
404:    LDC       0,32(0)       string: cargar caracter ' '
405:    OUT       0,0,0         string: escribir caracter
406:    LDC       0,114(0)      string: cargar caracter 'r'
407:    OUT       0,0,0         string: escribir caracter
408:    LDC       0,97(0)       string: cargar caracter 'a'
409:    OUT       0,0,0         string: escribir caracter
410:    LDC       0,110(0)      string: cargar caracter 'n'
411:    OUT       0,0,0         string: escribir caracter
412:    LDC       0,103(0)      string: cargar caracter 'g'
413:    OUT       0,0,0         string: escribir caracter
414:    LDC       0,111(0)      string: cargar caracter 'o'
415:    OUT       0,0,0         string: escribir caracter
* <- string
416:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
373:    LDA       7,43(7)       if: jmp hacia el final
* <- if
* -> asignacion
* -> llamada funcion: suma_vector
417:    ST        7,1(6)        call: guardar direccion de retorno
* Procesando argumentos de la llamada
* -> identificador
418:    LD        0,1(5)        cargar valor de identificador: arr
* <- identificador
* -> constante
419:    LDC       0,10(0)       cargar constante: 10
* <- constante
420:    ST        0,0(6)        call: guardar argumento
* -> constante
421:    LDC       0,10(0)       cargar constante: 10
* <- constante
422:    ST        0,-1(6)       call: guardar argumento
* Llamada a funcion suma_vector (implementaci▒n simplificada)
* <- llamada funcion
423:    ST        0,17(5)       asignacion: almaceno el valor para el id resultado
* <- asignacion
* -> escribir
* -> string
* String: "La suma del vector es: "
424:    LDC       0,76(0)       string: cargar caracter 'L'
425:    OUT       0,0,0         string: escribir caracter
426:    LDC       0,97(0)       string: cargar caracter 'a'
427:    OUT       0,0,0         string: escribir caracter
428:    LDC       0,32(0)       string: cargar caracter ' '
429:    OUT       0,0,0         string: escribir caracter
430:    LDC       0,115(0)      string: cargar caracter 's'
431:    OUT       0,0,0         string: escribir caracter
432:    LDC       0,117(0)      string: cargar caracter 'u'
433:    OUT       0,0,0         string: escribir caracter
434:    LDC       0,109(0)      string: cargar caracter 'm'
435:    OUT       0,0,0         string: escribir caracter
436:    LDC       0,97(0)       string: cargar caracter 'a'
437:    OUT       0,0,0         string: escribir caracter
438:    LDC       0,32(0)       string: cargar caracter ' '
439:    OUT       0,0,0         string: escribir caracter
440:    LDC       0,100(0)      string: cargar caracter 'd'
441:    OUT       0,0,0         string: escribir caracter
442:    LDC       0,101(0)      string: cargar caracter 'e'
443:    OUT       0,0,0         string: escribir caracter
444:    LDC       0,108(0)      string: cargar caracter 'l'
445:    OUT       0,0,0         string: escribir caracter
446:    LDC       0,32(0)       string: cargar caracter ' '
447:    OUT       0,0,0         string: escribir caracter
448:    LDC       0,118(0)      string: cargar caracter 'v'
449:    OUT       0,0,0         string: escribir caracter
450:    LDC       0,101(0)      string: cargar caracter 'e'
451:    OUT       0,0,0         string: escribir caracter
452:    LDC       0,99(0)       string: cargar caracter 'c'
453:    OUT       0,0,0         string: escribir caracter
454:    LDC       0,116(0)      string: cargar caracter 't'
455:    OUT       0,0,0         string: escribir caracter
456:    LDC       0,111(0)      string: cargar caracter 'o'
457:    OUT       0,0,0         string: escribir caracter
458:    LDC       0,114(0)      string: cargar caracter 'r'
459:    OUT       0,0,0         string: escribir caracter
460:    LDC       0,32(0)       string: cargar caracter ' '
461:    OUT       0,0,0         string: escribir caracter
462:    LDC       0,101(0)      string: cargar caracter 'e'
463:    OUT       0,0,0         string: escribir caracter
464:    LDC       0,115(0)      string: cargar caracter 's'
465:    OUT       0,0,0         string: escribir caracter
466:    LDC       0,58(0)       string: cargar caracter ':'
467:    OUT       0,0,0         string: escribir caracter
468:    LDC       0,32(0)       string: cargar caracter ' '
469:    OUT       0,0,0         string: escribir caracter
* <- string
470:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* -> escribir
* -> identificador
471:    LD        0,17(5)       cargar valor de identificador: resultado
* <- identificador
472:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* -> if
* -> Operacion: or
* -> Operacion: mayor
* -> identificador
473:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
474:    ST        0,-2(6)       op: push en la pila tmp el resultado expresion izquierda
* -> constante
475:    LDC       0,5(0)        cargar constante: 5
* <- constante
476:    LD        1,-2(6)       op: pop o cargo de la pila el valor izquierdo en AC1
477:    SUB       0,1,0         op: >
478:    JGT       0,2(7)        saltar si AC>0
479:    LDC       0,0(0)        caso falso
480:    LDA       7,1(7)        saltar caso verdadero
481:    LDC       0,1(0)        caso verdadero
* <- Operacion: mayor
482:    ST        0,-2(6)       op: push en la pila tmp el resultado expresion izquierda
* -> Operacion: menor
* -> identificador
483:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
484:    ST        0,-3(6)       op: push en la pila tmp el resultado expresion izquierda
* -> constante
485:    LDC       0,0(0)        cargar constante: 0
* <- constante
486:    LD        1,-3(6)       op: pop o cargo de la pila el valor izquierdo en AC1
487:    SUB       0,1,0         op: <
488:    JLT       0,2(7)        voy dos instrucciones mas alla if verdadero (AC<0)
489:    LDC       0,0(0)        caso de falso (AC=0)
490:    LDA       7,1(7)        Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
491:    LDC       0,1(0)        caso de verdadero (AC=1)
* <- Operacion: menor
492:    LD        1,-2(6)       op: pop o cargo de la pila el valor izquierdo en AC1
493:    JNE       1,3(7)        or: si izquierdo es verdadero, resultado es verdadero
494:    JNE       0,2(7)        or: si derecho es verdadero, resultado es verdadero
495:    LDC       0,0(0)        or: ambos falsos
496:    LDA       7,1(7)        or: saltar caso verdadero
497:    LDC       0,1(0)        or: resultado verdadero
* <- Operacion: or
* If: el salto hacia el else debe estar aqui
* -> escribir
* -> string
* String: "Condici▒n compleja verdadera"
499:    LDC       0,67(0)       string: cargar caracter 'C'
500:    OUT       0,0,0         string: escribir caracter
501:    LDC       0,111(0)      string: cargar caracter 'o'
502:    OUT       0,0,0         string: escribir caracter
503:    LDC       0,110(0)      string: cargar caracter 'n'
504:    OUT       0,0,0         string: escribir caracter
505:    LDC       0,100(0)      string: cargar caracter 'd'
506:    OUT       0,0,0         string: escribir caracter
507:    LDC       0,105(0)      string: cargar caracter 'i'
508:    OUT       0,0,0         string: escribir caracter
509:    LDC       0,99(0)       string: cargar caracter 'c'
510:    OUT       0,0,0         string: escribir caracter
511:    LDC       0,105(0)      string: cargar caracter 'i'
512:    OUT       0,0,0         string: escribir caracter
513:    LDC       0,243(0)      string: cargar caracter '▒'
514:    OUT       0,0,0         string: escribir caracter
515:    LDC       0,110(0)      string: cargar caracter 'n'
516:    OUT       0,0,0         string: escribir caracter
517:    LDC       0,32(0)       string: cargar caracter ' '
518:    OUT       0,0,0         string: escribir caracter
519:    LDC       0,99(0)       string: cargar caracter 'c'
520:    OUT       0,0,0         string: escribir caracter
521:    LDC       0,111(0)      string: cargar caracter 'o'
522:    OUT       0,0,0         string: escribir caracter
523:    LDC       0,109(0)      string: cargar caracter 'm'
524:    OUT       0,0,0         string: escribir caracter
525:    LDC       0,112(0)      string: cargar caracter 'p'
526:    OUT       0,0,0         string: escribir caracter
527:    LDC       0,108(0)      string: cargar caracter 'l'
528:    OUT       0,0,0         string: escribir caracter
529:    LDC       0,101(0)      string: cargar caracter 'e'
530:    OUT       0,0,0         string: escribir caracter
531:    LDC       0,106(0)      string: cargar caracter 'j'
532:    OUT       0,0,0         string: escribir caracter
533:    LDC       0,97(0)       string: cargar caracter 'a'
534:    OUT       0,0,0         string: escribir caracter
535:    LDC       0,32(0)       string: cargar caracter ' '
536:    OUT       0,0,0         string: escribir caracter
537:    LDC       0,118(0)      string: cargar caracter 'v'
538:    OUT       0,0,0         string: escribir caracter
539:    LDC       0,101(0)      string: cargar caracter 'e'
540:    OUT       0,0,0         string: escribir caracter
541:    LDC       0,114(0)      string: cargar caracter 'r'
542:    OUT       0,0,0         string: escribir caracter
543:    LDC       0,100(0)      string: cargar caracter 'd'
544:    OUT       0,0,0         string: escribir caracter
545:    LDC       0,97(0)       string: cargar caracter 'a'
546:    OUT       0,0,0         string: escribir caracter
547:    LDC       0,100(0)      string: cargar caracter 'd'
548:    OUT       0,0,0         string: escribir caracter
549:    LDC       0,101(0)      string: cargar caracter 'e'
550:    OUT       0,0,0         string: escribir caracter
551:    LDC       0,114(0)      string: cargar caracter 'r'
552:    OUT       0,0,0         string: escribir caracter
553:    LDC       0,97(0)       string: cargar caracter 'a'
554:    OUT       0,0,0         string: escribir caracter
* <- string
555:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* If: el salto hacia el final debe estar aqui
498:    JEQ       0,58(7)       if: jmp hacia else
* <- if
* -> if
* -> Operacion: not
* -> Operacion: diferente
* -> identificador
557:    LD        0,16(5)       cargar valor de identificador: num
* <- identificador
558:    ST        0,-2(6)       op: push en la pila tmp el resultado expresion izquierda
* -> constante
559:    LDC       0,5(0)        cargar constante: 5
* <- constante
560:    LD        1,-2(6)       op: pop o cargo de la pila el valor izquierdo en AC1
561:    SUB       0,1,0         op: !=
562:    JNE       0,2(7)        saltar si AC!=0
563:    LDC       0,0(0)        caso falso
564:    LDA       7,1(7)        saltar caso verdadero
565:    LDC       0,1(0)        caso verdadero
* <- Operacion: diferente
566:    JEQ       0,2(7)        not: saltar si es cero (falso)
567:    LDC       0,0(0)        not: resultado falso
568:    LDA       7,1(7)        not: saltar carga de verdadero
569:    LDC       0,1(0)        not: resultado verdadero
* <- Operacion: not
* If: el salto hacia el else debe estar aqui
* -> escribir
* -> string
* String: "El n▒mero es 5"
571:    LDC       0,69(0)       string: cargar caracter 'E'
572:    OUT       0,0,0         string: escribir caracter
573:    LDC       0,108(0)      string: cargar caracter 'l'
574:    OUT       0,0,0         string: escribir caracter
575:    LDC       0,32(0)       string: cargar caracter ' '
576:    OUT       0,0,0         string: escribir caracter
577:    LDC       0,110(0)      string: cargar caracter 'n'
578:    OUT       0,0,0         string: escribir caracter
579:    LDC       0,250(0)      string: cargar caracter '▒'
580:    OUT       0,0,0         string: escribir caracter
581:    LDC       0,109(0)      string: cargar caracter 'm'
582:    OUT       0,0,0         string: escribir caracter
583:    LDC       0,101(0)      string: cargar caracter 'e'
584:    OUT       0,0,0         string: escribir caracter
585:    LDC       0,114(0)      string: cargar caracter 'r'
586:    OUT       0,0,0         string: escribir caracter
587:    LDC       0,111(0)      string: cargar caracter 'o'
588:    OUT       0,0,0         string: escribir caracter
589:    LDC       0,32(0)       string: cargar caracter ' '
590:    OUT       0,0,0         string: escribir caracter
591:    LDC       0,101(0)      string: cargar caracter 'e'
592:    OUT       0,0,0         string: escribir caracter
593:    LDC       0,115(0)      string: cargar caracter 's'
594:    OUT       0,0,0         string: escribir caracter
595:    LDC       0,32(0)       string: cargar caracter ' '
596:    OUT       0,0,0         string: escribir caracter
597:    LDC       0,53(0)       string: cargar caracter '5'
598:    OUT       0,0,0         string: escribir caracter
* <- string
599:    OUT       0,0,0         escribir: genero la salida de la expresion
* <- escribir
* If: el salto hacia el final debe estar aqui
570:    JEQ       0,30(7)       if: jmp hacia else
* <- if
* <- programa
* Fin de la ejecucion.
601:    HALT      0,0,0
