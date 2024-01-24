# Sentencias y expresiones condicionales

## IF

![if](/images/if.png)

Se utiliza para comprobar si una condición es verdadera o falsa. Si es verdadera se ejecuta el bloque de sentencias dentro del IF, en caso contrario, se ejecuta el bloque ELSE, si existe.

**IF Sencillo**

Si la condición es verdadera, entonces se ejecutará el conjunto de declaraciones escritas en el bloque IF.

Si la condición no se cumple, el control se transferirá a las siguientes declaraciones después de la sentencia del punto final o END-IF.

```
IF Condition
    {Statement Block}
[END-IF].
```
Aquí, END-IF es el terminador de ámbito, que es opcional en el programa. El punto (.) puede definirse en la última sentencia del bloque IF.

Si no especificamos el punto, entonces el terminador de ámbito END-IF es obligatorio.

**IF ELSE**

Si la condicion es cierta se ejecutará el conjunto de declaraciones escritas en el bloque IF, en caso contrario, se ejecutará el conjunto de declaraciones escritas en el bloque ELSE.

La sentencia IF ELSE se utiliza cuando un determinado conjunto de sentencias necesita ser ejecutado por dos condiciones. Esta sentencia se utiliza principalmente para ejecutar el cód

```
IF Condition-1
    {Statement-Block-1/NEXT SENTENCE}
[ELSE]
    {Statement-Block-2/NEXT SENTENCE}
[END-IF].
```

**IF anidado**

Al igual que otros lenguajes de programación COBOL, COBOL también permite anidar IF. Básicamente un IF como parte de cualquiera de los dos bloques del IF/ELSE. No hay límite a la profundidad de las sentencias IF anidadas.

```
IF Condition-1 THEN
    IF Condition-2 THEN
        Statements-block-1
    [ELSE
        Statements-block-2
    END-IF]
[ELSE
    IF Condition-3 THEN
        Statements-block-3
    [ELSE
        Statements-block-4
    END-IF]
END-IF.]
```

## EVALUATE

![evaluate](/images/evaluate.png)

Es una facilidad del lenguaje para evitar múltiples IF anidados.  Se puede utilizar para evaluar más de una condición.

Es similiar al CASE o SWITCH de otros lenguajes.

EVALUATE permite comporbar múltiples condiciones con la palabra reservada WHEN. Si cualquiera de los WHEN se cumple, se ejecuta el bloque de código asociado a ese WHEN. Al terminar de ejecutarse dicho bloque, el control se transfiere a la sentencia siguiente a END-EVALUATE. 

Si no se cumple ninguna de las condiciones de WHEN y existe la condición WHEN OTHER, entonces se ejecuta el bloque de WHEN OTHER. 

```
EVALUATE menu-input
  WHEN "0"
    CALL init-proc
  WHEN "1" THRU "9"
    CALL process-proc
  WHEN "R"
    CALL read-parms
  WHEN "X"
    CALL cleanup-proc
  WHEN OTHER
    CALL error-proc
END-EVALUATE.

EVALUATE TRUE
   WHEN WS-A > 2
      DISPLAY 'WS-A GREATER THAN 2'
   WHEN WS-A < 0
      DISPLAY 'WS-A LESS THAN 0'
   WHEN OTHER
      DISPLAY 'INVALID VALUE OF WS-A'
END-EVALUATE.
```

## Niveles 88

Una condición de nivel 88 comprueba una variable de dicho nivel para determinar si su valor es igual a cualquiera de los valores asociados.

Formato

```
IF nombre-variable-88
```

Si la condición-nombre se ha asociado con un rango de valores (o con varios rangos de valores), se comprueba la variable condicional para determinar si su valor se encuentra dentro de los rangos, incluidos los valores finales.

El resultado de la prueba es verdadero si uno de los valores que corresponden a la condición-nombre es igual al valor de su variable condicional asociada.

Se permiten nombres de condición para elementos de datos alfanuméricos, DBCS, nacionales y de coma flotante, así como para otros, tal como se define para el formato de nombre de condición de la cláusula VALUE.

El siguiente ejemplo ilustra el uso de variables condicionales y nombres de condición:

``````
01 EDAD PIC 99.
    88 BEBE VALOR 0 THRU 2.
    88 NIÑO VALOR 3 A 12.
    88 ADOLESCENTE VALOR 13 A 19.
    88 ADULTO VALOR 20 THRU 65.
    88 JUBILADO VALOR 66 THRU 99.

MOVE 25 TO EDAD

IF ADULTO 
    DISPLAY "ADULTO"
END-IF
``````

## Expresiones condicionales

![condition](/images/condition.png)

operando-1 y operando-2 pueden ser un identificador, literal, identificador de función, expresión aritmética o nombre de índice.
```
Operdor Condicional	            Equivale	    Significa
IS GREATER THAN	                IS >	        Mayor que
IS NOT GREATER THAN	            IS NOT >	    No mayor que
IS LESS THAN	                IS <	        Menor que
IS NOT LESS THAN	            IS NOT <	    No menor que
IS EQUAL TO	                    IS =	        Igual a
IS NOT EQUAL TO	                IS NOT =	    Distinto de
IS GREATER THAN OR EQUAL TO	    IS >=	        Es mayor o igual que
IS LESS THAN OR EQUAL TO	    IS <	        Es menor o igual que
```

## Condiciones de signo

La condición de signo determina si el valor de un operando numérico es mayor, menor o igual que cero.

```
operando-1 IS [NOT] {POSITIVE/NEGATIVE/ZERO} 
```

- operando-1 Debe definirse como un identificador numérico o como una expresión aritmética que contenga al menos una referencia a una variable. También puede definirse como un identificador de coma flotante.

El resultado es:

- POSITIVE si su valor es mayor que cero
- NEGATIVE si su valor es menor que cero
- ZERO si su valor es igual a cero

Un operando sin signo es POSITIVO o CERO.

**NOT**

Se usa para comprobar la negación de las condiciones anteriores.

## Expresiones booleanas complejas

Una condición compleja se forma combinando condiciones simples, condiciones combinadas o condiciones complejas con operadores lógicos, o negando esas condiciones con la negación lógica.

Cada operador lógico debe ir precedido y seguido de un espacio. La siguiente tabla muestra los operadores lógicos y sus significados.
```
Operador lógico     Nombre              Significado
AND                 Conjunción lógica   El valor de verdad es verdadero cuando ambas condiciones son verdaderas.
OR                  Inclusión lógica OR El valor verdadero es verdadero cuando una o ambas condiciones son verdaderas.
NOT                 Negación lógica     Inversión del valor verdadero (el valor verdadero es verdadero si la condición es falsa).
```

A menos que se modifique mediante paréntesis, el siguiente es el orden de precedencia (de mayor a menor):
1. Operaciones aritméticas
2. Condiciones simples
3. NOT
4. AND
5. OR

## Condiciones de negación 

Una condición simple se niega mediante el uso del operador lógico NOT.

``````
IF NOT [CONDICIÓN]
   BLOQUE DE SENTENCIAS
END-IF.
``````

La condición simple negada da el valor de verdad opuesto de la condición simple.

Es decir, si el valor verdadero de la condición simple es verdadera, entonces el valor verdadero de esa misma condición simple negada es falsa, y viceversa.

Colocar una condición simple negada entre paréntesis no cambia su valor verdadero. Es decir, las dos afirmaciones siguientes son equivalentes:
````
NOT A IS EQUAL TO B.
NOT (A IS EQUAL TO B). 
````

## Combinación de condiciones

Dos o más condiciones pueden conectarse lógicamente para formar una condición combinada.
```
IF [CONDITION] AND/OR [CONDITION]
   COBOL Statements
END-IF.
```

La condición que se combina puede ser cualquiera de los siguientes:
- Una condición simple
- Una condición simple negada
- Una condición combinada

````
NOT A IS GREATER THAN B OR A + B IS EQUAL TO C AND D IS POSITIVE
(NOT (A IS GREATER THAN B)) OR (((A + B) IS EQUAL TO C) AND (D IS POSITIVE))
````

Es importante comprender el orden de evaluación:

- (NOT (A ES MAYOR QUE B)) se evalúa, dando un valor de verdad intermedio, t1. Si t1 es verdadero, la condición combinada es verdadera y no se realiza ninguna otra evaluación. Si t1 es falso, la evaluación continúa como sigue.
- Se evalúa (A + B) y se obtiene un resultado intermedio, x.
- (x ES IGUAL A C) se evalúa, dando un valor de verdad intermedio, t2. Si t2 es falso, la condición combinada es falsa y no se realiza ninguna otra evaluación. Si t2 es verdadero, la evaluación continúa como sigue.
- Se evalúa (D ES POSITIVO) y se obtiene un valor de verdad intermedio, t3. Si t3 es falso, la condición combinada es falsa. Si t3 es verdadero, la condición combinada es verdadera.

## Delimitadores de ámbito

Un terminador de ámbito finaliza un verbo o una expresión. Pueden ser explícitos o implícitos.

**Terminación explícita**:

Los terminadores explícitos terminan un verbo sin terminar una frase. Consisten en END seguido de un guión y el nombre del verbo que termina, como END-IF. A continuación se enumeran algunos de los terminadores de ámbito explícito más importantes:
`````
END-ADD
END-PERFORM
END-ACCEPT
END-CALL
END-COMPUTE
END-DELETE
END-DISPLAY
END-DIVIDE
END-EVALUATE
END-IF
END-MULTIPLY
END-READ
END-RETURN
END-REWRITE
END-SEARCH
END-START
END-STRING
END-SUBTRACT
END-UNSTRING
END-WRITE
`````

Terminador de ámbito implícito:

Un terminador de ámbito implícito es un punto (.) que termina el ámbito de todas las sentencias anteriores aún no terminadas.

Ejemplo:

Veamos el siguiente ejemplo con terminadores de ámbito implícitos y explícitos.

````
IF ITEM = "A"
    DISPLAY "THE VALUE OF ITEM IS " ITEM
    ADD 1 TO TOTAL
    MOVE "C" TO ITEM
    DISPLAY "THE VALUE OF ITEM IS NOW " ITEM.   ---> IF statement end here

IF ITEM = "B"
    ADD 2 TO TOTAL.    ---> IF statement end here

IF ITEM = "A"
    DISPLAY "THE VALUE OF ITEM IS " ITEM
    ADD 1 TO TOTAL
    MOVE "C" TO ITEM
    DISPLAY "THE VALUE OF ITEM IS NOW " ITEM
END-IF    ---> IF statement end here

IF ITEM = "B"
    ADD 2 TO TOTAL
END-IF    ---> IF statement end here

````

- Para mejorar la claridad del programa y evitar el final involuntario de las sentencias, utilice terminadores de ámbito explícitos, especialmente dentro de los párrafos. Utilice terminadores implícitos.
- Utilice terminadores de ámbito implícitos sólo al final de un párrafo o al final de un programa.
- Se tendrá cuidado al codificar un terminador de ámbito explícito para una sentencia imperativa que esté anidada dentro de una sentencia condicional. El terminador de ámbito está emparejado con la sentencia para la que estaba previsto. En el siguiente ejemplo, el terminador de ámbito se emparejará con la segunda sentencia READ, aunque el programador pretendía que se emparejara con la primera.

```
READ FILE1
  AT END
    MOVE A TO B
    READ FILE2
END-READ

Y corregido sería así:
READ FILE1
  AT END
    MOVE A TO B
    READ FILE2
    END-READ
END-READ
```