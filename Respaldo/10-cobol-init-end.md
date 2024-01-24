# INICIALIZACIÓN Y FIN

## INITIALIZE

La sentencia INITIALIZE establece categorías seleccionadas de campos de datos a valores predeterminados. Es funcionalmente equivalente a una o más sentencias MOVE.

INITIALIZE no realiza ninguna acción en las áreas FILLER y tampoco afecta a la cláusula OCCURSING DEPENDING ON.

La sentencia INITIALIZE hace lo siguiente:
- Mueve espacios a posiciones alfabéticas, alfanuméricas, alfanuméricas-editadas.
- Mueve ceros a elementos numéricos.

```
INITIALIZE identifier-1
  [REPLACING {ALPHABETIC/ALPHANUMERIC/NUMERIC/ALPHANUMERIC-EDITED/NUMERIC-EDITED}
  DATA BY {identifier-2/literal}]
```

**INITIALIZE REPLACING**: Para mover datos con unas constantes específicas en lugar de ceros y espacios.

```
01 WS-RECORD.
      05 WS-NUMBER PIC 9(09).
      05 WS-NAME PIC X(10).
      05 WS-LOB PIC X(03).
INITIALIZE WS-RECORD.
INITIALIZE WS-RECORD REPLACING NUMERIC DATA BY 9 ALPHANUMERIC DATA BY 'X'.
```
- El primer INITIALIZE mueve ceros a WS-NUMBER y espacios a WS-NAME y WS-LOB.
- El segundo mueve 9 a WS-NUMBER y X a WS-NAME y WS-LOB.

## CONTINUE

La sentencia CONTINUE permite especificar una sentencia de no operación. CONTINUE indica que no hay ninguna instrucción ejecutable.

Básicamente, la instrucción CONTINUE transfiere el control a la siguiente instrucción COBOL que viene a continuación en el flujo del programa.

La sentencia CONTINUE se puede en cualquier lugar donde se pueda usar una sentencia condicional o imperativa. No tiene ningún efecto sobre la ejecución del programa.

## NEXT SENTENCE

La sentencia NEXT SENTENCE transfiere el control a la siguiente sentencia COBOL, que se encuentra inmediatamente después de la sentencia que termina con punto.

```
IDENTIFICATION DIVISION.
PROGRAM-ID. CBLCONTU.

ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 STD-MARKS                 PIC 9(03).
01 TOTAL-MARKS               PIC 9(03) VALUE ZEROES.
01 STD-PERCENT               PIC 9(03).9(02).
01 I                         PIC 9(01) VALUE ZEROES.
01 J                         PIC 9(01) VALUE ZEROES.

PROCEDURE DIVISION.
  MOVE ZEROES     TO TOTAL-MARKS.

* Logic below to get 5 subject marks from input.
  PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
    SET STD-INDEX TO 1
    ACCEPT STD-MARKS
    IF STD-MARKS < 35
       NEXT SENTENCE
    ELSE
       ADD STD-MARKS  TO TOTAL-MARKS
       COMPUTE J = J + 1
    END-IF
  END-PERFORM.

* Logic below display student result.
  IF J < 5
     DISPLAY 'STUDENT FAILED, NO PERCENTAGE CALCULATED'
  ELSE
     COMPUTE STD-PERCENT = TOTAL-MARKS/5
     DISPLAY 'STUDENT PERCENTAGE : ' STD-PERCENT.
  END-IF.
  STOP RUN.
```

Si el estudiante pasa las 5 materias, entonces el programa muestra 'STUDENT PERCENTAGE : ' STD-PERCENT. Donde STD-PERCENT contiene el valor del porcentaje del estudiante.

Si el estudiante falla en alguna materia, entonces el programa muestra el mensaje "STUDENT FAILED, NO PERCENTAGE CALCULATED".

## INCLUDE

La sentencia INCLUDE inserta código de aplicación, incluyendo declaraciones y sentencias, en un programa fuente.

* INCLUDE debe especificarse en la DATA DIVISION y/o en la PROCEDURE DIVISION.
* INCLUDE debe contener declaraciones del lenguaje fuente o cualquier sentencia SQL.

```
INCLUDE [SQLCA / SQLDA / nombre-miembro]
```
Ejemplo: Incluir un área de comunicaciones SQL

EXEC SQL
  INCLUDE SQLCA
END-EXEC

Durante el proceso de precompilación, la sentencia INCLUDE se sustituyen por las sentencias del miembro.

## STOP RUN

La sentencia STOP detiene la ejecución del programa objeto de forma permanente o temporal.

```
STOP RUN
```

- STOP RUN siempre se codifica en el programa principal.
- STOP RUN es la última sentencia ejecutable en el programa que devolverá el control al sistema operativo.
- Cuando se ejecuta STOP RUN, inmediatamente todas las tareas en ejecución del programa se cierran y el control se transfiere al sistema operativo.
- STOP RUN cierra todos los archivos abiertos en el programa.
- Si se codifica STOP RUN en un subprograma, el control regresará al SO en lugar de regresar al programa principal. En este caso, la tarea restante codificada en el programa principal estará incompleta.

## EXIT

La sentencia EXIT proporciona un punto final común para una serie de procedimientos. La instrucción EXIT de COBOL es un verbo para terminar un flujo de programa

``````
nombre-párrafo. EXIT.
``````

La sentencia EXIT permite asignar un nombre de procedimiento a un punto determinado de un programa.

Si se especifica un párrafo EXIT como el último párrafo de una serie de párrafos ejecutados (es decir, PERFORM THRU), entonces identifica el final de la serie de párrafos ejecutados. Cuando el control alcanza un párrafo EXIT y dicho PERFORM THRU está activo, el control se transfiere de nuevo a la sentencia que sigue al PERFORM THRU. Cuando el control alcanza un párrafo EXIT que no es el final de un rango de párrafos gobernados por un PERFORM THRU activo, el control pasa a través de la sentencia EXIT a la primera sentencia del párrafo siguiente.

La sentencia EXIT también es útil como punto de salida para un único párrafo ejecutado, como se muestra a continuación:

````
    PERFORM 1000-CALCULATE-TOTALS THRU 1000-EXIT.
.......
1000-CALCULATE-TOTALS.
    ADD 1 TO TOTAL-NUMBER-EMPS.
    IF EMP-SALARY LESS THAN 25000
    GO TO 1000-EXIT.

    ADD 1 TO EMPS-MAKING-25K-AND-UP.
    IF EMP-SALARY LESS THAN 50000
    GO TO 1000-EXIT.

    ADD 1 TO EMPS-MAKING-50K-AND-UP.
    IF EMP-SALARY LESS THAN 75000
    GO TO 1000-EXIT.

    ADD 1 TO EMPS-MAKING-75K-AND-UP.
1000-EXIT. EXIT.
````

Despues de que el control alcance 1000-EXIT, el control es transferido de vuelta a la sentencia PERFORM y ejecuta las sentencias despues de la sentencia PERFORM(PERFORM 1000-CALCULATE-TOTALS THRU 1000-EXIT).

## EXIT PROGRAM

La sentencia EXIT PROGRAM especifica el final de un programa llamado y devuelve el control al programa llamante.

```
EXIT PROGRAM
```

La sentencia EXIT PROGRAM debe aparecer como la última sentencia de una serie de sentencias imperativas dentro de una frase.

**Programa principal**

```
IDENTIFICATION DIVISION.
PROGRAM-ID.    MAINPROG.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
 01 INPUT1            PIC 9(02).
 01 INPUT2            PIC 9(02).
 01 OUT-PUT           PIC 9(03).

PROCEDURE DIVISION.
    ACCEPT INPUT1.
    ACCEPT INPUT2.
    CALL 'SUBPROG' USING INPUT1, INPUT2, OUT-PUT.
    DISPLAY OUT-PUT.
    STOP RUN.
```

**Subprograma**

```
IDENTIFICATION DIVISION.
PROGRAM-ID.    SUBPROG.

ENVIRONMENT DIVISION.

DATA DIVISION.
LINKAGE SECTION.
 01 INPUT-1           PIC 9(02).
 01 INPUT-2           PIC 9(02).
 01 OUTPUT            PIC 9(03).

PROCEDURE DIVISION USING INPUT-1,INPUT-2,OUTPUT.
    COMPUTE OUTPUT = INPUT-1 * INPUT-2.
    EXIT PROGRAM.
```

## GOBACK.

La sentencia GOBACK funciona como la sentencia EXIT PROGRAM cuando se codifica como parte de un programa que es un subprograma en una unidad de ejecución COBOL, y como la sentencia STOP RUN cuando se codifica en un programa que es un programa principal en una unidad de ejecución COBOL.

```
GOBACK
```

**Programa principal**

```
IDENTIFICATION DIVISION.
PROGRAM-ID.    MAINPROG.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
 01 INPUT1            PIC 9(02).
 01 INPUT2            PIC 9(02).
 01 OUT-PUT           PIC 9(03).

PROCEDURE DIVISION.
    ACCEPT INPUT1.
    ACCEPT INPUT2.
    CALL 'SUBPROG' USING INPUT1, INPUT2, OUT-PUT.
    DISPLAY OUT-PUT.
    GOBACK.
```

**Subprograma**

```
IDENTIFICATION DIVISION.
PROGRAM-ID.    SUBPROG.

ENVIRONMENT DIVISION.

DATA DIVISION.
LINKAGE SECTION.
 01 INPUT-1           PIC 9(02).
 01 INPUT-2           PIC 9(02).
 01 OUTPUT            PIC 9(03).

PROCEDURE DIVISION USING INPUT-1,INPUT-2,OUTPUT.
    COMPUTE OUTPUT = INPUT-1 * INPUT-2.
    GOBACK.
```

