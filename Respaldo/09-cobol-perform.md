# PERFORM

Esta sentencia permite ejecutar un conjunto de sentencias COBOL como una sola. Las sentencias invocadas se ejecutan en secuencia hasta que encontrar una sentencia que altere el flujo de ejecución. PERFORM tiene frases que permite ejecutar sentencias en bucle.

Hay dos tipo de sentencias PERFORM:

| Inline | Outline |
| - | - |
| Ejecuta una serie de sentencias o un bloque de sentencias entre PERFORM y END-PERFORM. | También ejecuta una serie de sentencias o bloques de sentencias codificadas en una sección o párrafo separado que no se codifican junto con la sentencia PERFORM. |
| Esto no requiere un PÁRRAFO o SECCIÓN separados que necesiten ser codificados, los cuales van a ser ejecutados. | Requiere un PÁRRAFO o SECCIÓN separado que necesita ser codificado para las sentencias que van a ser ejecutadas. |
| El terminador de ámbito (END-PERFORM) es obligatorio.	| El terminador de ámbito (END-PERFORM) no es obligatorio. |

**Inline**:

```
PERFORM
  DISPLAY 'HELLO WORLD'
END-PERFORM.
```

**Outline**:

```
PERFORM MAIN-PROCESS
   THRU PROCESS-EXIT.
```

```
IDENTIFICATION DIVISION.
PROGRAM-ID. TSTPERFM.
PROCEDURE DIVISION.
A-PARA.
   PERFORM DISPLAY 'A-PARA'
   END-PERFORM.
   PERFORM C-PARA THRU E-PARA.

B-PARA.
   DISPLAY 'B-PARA'.
   STOP RUN.

C-PARA.
    DISPLAY 'C-PARA'.

D-PARA.
    DISPLAY 'D-PARA'.

E-PARA.
    DISPLAY 'E-PARA'.


A-PARA
C-PARA
D-PARA
E-PARA
B-PARA
```
Estos son los tipos de PERFORM en función de su uso:
1. Inline PERFORM
2. Simple PERFORM
3. PERFORM TIMES
4. PERFORM UNTIL
5. PERFORM VARYING… UNTIL…
6. PERFORM THRU
7. PERFORM WITH TEST BEFORE/TEST AFTER

## PERFORM INLINE

Ejecuta un conjunto de sentencias Cobol entre PERFORM y END-PERFORM. Básicamente esto es para mantener una lógica particular en un límite y ejecutarla en un bucle o número de veces o ejecutarla dependiendo de una condición.

Esto es útil si ese conjunto de código sólo se utiliza una vez en el programa. Si se utiliza varias veces es mejor usar la opción OUTLINE.

```
PERFORM
    COMPUTE TOT = MARK1+MARK2
    DISPLAY 'TOTAL MARKS' TOT
    ......
END-PERFORM
```

## PERFORM SIMPLE

Se utiliza para ejecutar un párrafo o sección.

```
MAIN-PARA.
   PERFORM PARA-1
   ...............
   STOP-RUN.
PARA-1.
  .........
  EXIT.
```

## PERFORM TIMES

PERFORM TIMES se utiliza principalmente para ejecutar el bloque de sentencias o párrafos/secciones de forma repetitiva con el número de veces especificado.
```
MOVE 5 TO W-COUNT
PERFORM A-PARA W-COUNT TIMES.
```

## PERFORM UNTIL

En la sentencia PERFORM UNTIL se ejecutará un bloque de sentencias o un párrafo/sección hasta que se cumpla la condición especificada.
- En el formato de frase UNTIL, el procedimiento o procedimientos a los que se hace referencia se ejecutan hasta que se cumpla la condición especificada por la frase UNTIL. El control se pasa entonces a la siguiente sentencia ejecutable que sigue a la sentencia PERFORM.
- Aquí la condición se comprueba antes sólo al principio de cada ejecución, por defecto.
- Pero este valor por defecto se anula con la frase TEST AFTER. Si se especifica la frase TEST AFTER, las sentencias a realizar se ejecutan al menos una vez antes de que se compruebe la condición (se corresponde a un DO UNTIL).
- En cualquier caso, si la condición es verdadera, el control se transfiere a la siguiente sentencia ejecutable tras el final de la sentencia PERFORM. Si no se especifica ni la frase TEST BEFORE ni la frase TEST AFTER, se asume la frase TEST BEFORE.

La condición por defecto es WITH TEST BEFORE y especifica que la condición se prueba antes de la ejecución de las sentencias de un párrafo.

```
PERFORM A-PARA UNTIL COUNT=5
PERFORM A-PARA WITH TEST BEFORE UNTIL COUNT=5
PERFORM A-PARA WITH TEST AFTER UNTIL COUNT=5
```

```
MOVE 10 TO WS-CNT
PERFORM UNTIL WS-CNT = ZERO
    DISPLAY WS-CNT
    SUBTRACT 1 FROM WS-CNT
END-PERFORM.
```

```
IDENTIFICATION DIVISION.
PROGRAM-ID. TSTPRM02.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-CNT PIC 9(1) VALUE 0.
PROCEDURE DIVISION.
A-PARA.
    PERFORM B-PARA WITH TEST AFTER UNTIL WS-CNT>3.
    STOP RUN.
B-PARA.
    DISPLAY 'WS-CNT : 'WS-CNT.
    ADD 1 TO WS-CNT.
END-PERFORM.
```

## PERFORM VARYING... UNTIL...

Un bloque de una sentencia o un párrafo/sección se ejecutará en PERFORM VARYING hasta que la condición se haga cierta en la frase UNTIL.

- La frase posterior permite variar más de un identificador.
- Si alguno de los operandos especificados en cond-1 o cond-2 tiene subíndice o modificador de referencia, el subíndice o modificador de referencia se evalúa cada vez que se prueba la condición.
- Cuando se indica TEST BEFORE, todas las condiciones especificadas se comprueban antes de la primera ejecución, y las sentencias a realizar se ejecutan, si es que se ejecutan, sólo cuando fallan todas las pruebas especificadas. Cuando se indica TEST AFTER, las sentencias a ejecutar se ejecutan al menos una vez, antes de que se compruebe cualquier condición.
- El cambio de los valores de los identificadores y/o nombres de índice en las frases VARYING, FROM y BY durante la ejecución cambia el número de veces que se ejecutan los procedimientos.

```
PERFORM A-PARA VARYING A FROM 1 BY 1 UNTIL A = 5.

PERFORM 1000-MAIN-PARA
   THRU 1000-MAIN-PARA-X
VARYING  WS-I FROM 1 BY 1 UNTIL WS-I > 50
  AFTER WS-J FROM 1 BY 1 UNTIL WS-J > 10.

```

* En el ejemplo anterior, la 1000-MAIN-PARA a 1000-MAIN-PARA-X se ejecutará 500 veces.
* Primero con WS-I como 1 y WS-J variando de 1 a 10 en pasos de 1, luego WS-I como 2 y de nuevo WS-J variando de 1 a 10 y así sucesivamente. Cada vez que WS-I cambia de valor, WS-J debe variar de 1 a 10.
* Cada vez que el bucle que varía WS-J se completa, WS-J se inicializa antes de cambiar el valor de WS-I.
* Así, después de ejecutar esta sentencia perform, el valor de WS-I será 51 y el de WS-J será 1 y no 11.

## PERFORM THRU

Es útil para ejecutar un conjunto continuo de párrafos/secciones.

```
    PERFORM A THRU M
    GOBACK.

A.
    DISPLAY 'a'.
D.
    DISPLAY 'd'.
    PERFORM F THRU J.
F.  DISPLAY 'f'.
J.  DISPLAY 'j'.
M.  DISPLAY 'm'.

a, d, f, j, f, j, m
```

## PERFORM WITH TEST BEFORE/TEST AFTER

Con la opción TEST BEFORE, el programa verifica la condición primero, si la condición es falsa ejecuta el código. Así que con TEST BEFORE existe la posibilidad de no ejecutar el código al menos una vez, mientras que con TEST AFTER (que es la opción por defecto) el código se ejecuta al menos una vez.

```
PERFORM WITH TEST BEFORE VARYING WW-CNT1 FROM 1
          BY 1 UNTIL WW-CNT1 > WW-TRGT-CNT
....
END-PERFORM.

PERFORM PARA-1 WITH TEST BEFORE VARYING WW-CNT1
              FROM 1 BY 1 UNTIL WF-END-OF-DATA OR
                    WW-CNT1 > WW-MAX-CNT
END-PERFORM.
```
**Consejos**:

- Utilice la sentencia PERFORM para acceder a código que deba ejecutarse desde más de una ubicación.
- Utilice la sentencia PERFORM para estructurar su código. Haga una rutina principal que EJECUTE otras rutinas que a su vez EJECUTAN otras rutinas que a su vez EJECUTAN otras rutinas hasta que el nivel de complejidad de las rutinas sea fácilmente comprensible.
- Utilice la opción WITH TEST AFTER para forzar a que el código se EJECUTE al menos una vez.
- Utilice la opción VARYING... AFTER para pasar a través de todas las entradas en múltiples tablas dimensionales.
- Si el número de líneas en la rutina es relativamente pequeño, utilice un PERFORM en línea en lugar de desarrollar un párrafo separado. 

