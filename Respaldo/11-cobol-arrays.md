# Trabajando con Arrays - Tablas internas

A veces es necesario manejar grupos de datos formados por elementos similares. Un grupo de este tipo se denomina tabla, matriz, arreglo o array. Un array se utiliza para almacenar elementos similares. 

Un array es una lista de campos almacenados que son consultados o referenciados por el programa. También elimina la necesidad de entradas separadas para elementos de datos repetidos. El uso de tablas puede ilustrarse con el siguiente ejemplo:

```
01 MES-TABLA.
    02 MES-1 PIC X(9) VALOR 'ENERO '.
    02 MES-2 PIC X(9) VALOR 'FEBRERO '.
    02 MES-3 PIC X(9) VALOR 'MARZO '.
    02 MES-4 PIC X(9) VALOR 'ABRIL '.
    02 MES-5 PIC X(9) VALOR 'MAYO'.
    02 MES-6 PIC X(9) VALOR 'JUNIO'.
    02 MES-7 PIC X(9) VALOR 'JULIO'.
    02 MES-8 PIC X(9) VALOR 'AGOSTO '.
    02 MES-9 PIC X(9) VALOR 'SEPTIEMBRE'.
    02 MES-10 PIC X(9) VALOR 'OCTUBRE'.
    02 MES-11 PIC X(9) VALOR 'NOVIEMBRE'.
    02 MES-12 PIC X(9) VALOR 'DICIEMBRE'.

01 MES-TABLA.
    02 MES-NOMBRE PIC X(9) OCCURS 12 TIMES.
```

Los arrays pueden ser de longitud fija o de longitud variable. Se definine mediante la palabra reservada **OCCURS**.

## OCCURS

- La cláusula OCCURS se utiliza para definir una tabla.
- La cláusula OCCURS indica la repetición de la definición de un dato.
- La cláusula OCCURS especifica tablas a cuyos elementos se puede referenciar mediante un índice.
- La cláusula OCCURS puede especificarse para elementos elementales o de grupo. Sólo puede utilizarse con números de nivel que empiecen en 02 hasta 49.
- OCCURS no puede definirse para un elemento de datos que:
    * Tenga un número de nivel 01, 66, 77 u 88.
    * Describe un elemento de datos redefinido.
- Las cláusulas REDEFINES y OCCURS no pueden aparecer para el mismo elemento de datos. Sin embargo, la cláusula REDEFINES puede aparecer para un elemento de grupo cuyo subelemento contenga la cláusula OCCURS.
- Las tablas pueden ser de longitud fija o variable.
- Se pueden definir tablas de más de una dimensión.

## DEPENDING ON

Si no se sabe antes de la ejecución cuántas elementos tendrá una tabla se puede definir una tabla de longitud variable. Para ello se usará la cláusula OCCURS DEPENDING ON (ODO).

``````
X OCCURS 1 TO 10 TIMES DEPENDING ON Y
``````

Hay dos factores que influyen en el éxito de la manipulación de registros de longitud variable:

- **Cálculo correcto de las longitudes de los registros**: La longitud de las partes variables de un elemento de grupo es el producto del objeto de la frase DEPENDING ON y la longitud del sujeto de la cláusula OCCURS.
- **Conformidad de los datos del objeto de la cláusula OCCURS DEPENDING ON y su cláusula PICTURE**: Si el contenido del objeto ODO no coincide con su cláusula PICTURE, el programa podría terminar de forma anormal. Debe asegurarse de que el objeto ODO especifica correctamente el número actual de ocurrencias de los elementos de la tabla.

```
05  LINE-ITEM-COUNT   PIC 99.
05  LINE-ITEMS OCCURS 0 TO 25 TIMES DEPENDING ON LINE-ITEM-COUNT.
    10  QUANTITY      PIC 9999.
    10  DESCRIPTION   PIC X(30).
    10  UNIT-PRICE    PIC S9(5)V99.
```

La tabla LINE-ITEMS contiene tres campos (QUANTITY, DESCRIPTION, UNIT-PRICE) que componen una línea de una factura. Cada factura puede tener de 0 a 25 elementos. El número real de elementos de una factura concreta, y por lo tanto del registro, viene dado por el campo LINE-ITEM-COUNT.

Una instancia de la tabla ocupa 41 bytes, y la tabla puede aparecer de 0 a 25 veces, por lo que el espacio total ocupado por la tabla LINE-ITEMS en el registro varía de 0 a 1025 bytes. Si hay algún campo después de esta tabla, su posición en el registro cambiará en función del número de apariciones de la tabla.

## ACCESO A ELEMENTOS DE UN ARRAY. SUBÍNDICE.

Utilice el nombre de datos del elemento de la tabla, junto con su número de aparición (llamado subíndice) entre paréntesis. Esta técnica se denomina subíndice.

Se puede acceder a los elementos individuales de la tabla utilizando el subíndice.

Los valores de los subíndices pueden variar entre 1 y el número de veces que aparece la tabla. Un subíndice puede ser cualquier número positivo.

```
01 WS-TABLE.
   05 WS-A OCCURS 3 TIMES.
      10 WS-B PIC A(2).
      10 WS-C OCCURS 2 TIMES.
         15 WS-D PIC X(3).
MOVE '12ABCDEF34GHIJKL56MNOPQR' TO WS-TABLE.
DISPLAY 'WS-TABLE  : ' WS-TABLE.
DISPLAY 'WS-A(1)   : ' WS-A(1).
DISPLAY 'WS-C(1,1) : ' WS-C(1,1).
DISPLAY 'WS-C(1,2) : ' WS-C(1,2).
DISPLAY 'WS-A(2)   : ' WS-A(2).
DISPLAY 'WS-C(2,1) : ' WS-C(2,1).
DISPLAY 'WS-C(2,2) : ' WS-C(2,2).
DISPLAY 'WS-A(3)   : ' WS-A(3).
DISPLAY 'WS-C(3,1) : ' WS-C(3,1).
DISPLAY 'WS-C(3,2) : ' WS-C(3,2).


WS-TABLE  : 12ABCDEF34GHIJKL56MNOPQR
WS-A(1)   : 12ABCDEF
WS-C(1,1) : ABC
WS-C(1,2) : DEF
WS-A(2)   : 34GHIJKL
WS-C(2,1) : GHI
WS-C(2,2) : JKL
WS-A(3)   : 56MNOPQR
WS-C(3,1) : MNO
WS-C(3,2) : PQR
```

## INDEXED BY

Se añade una variable a la definición de la tabla, la cual llamaremos índice y que nos permitirá localizar un elemento como desplazamiento desde el principio de la tabla. Esta técnica se denomina indexación.

Para crear un índice, utilice la frase INDEXED BY de la cláusula OCCURS para identificar un nombre de índice.

Por ejemplo, INX-A en el siguiente código es un nombre índice:

```
05 TABLE-ITEM PIC X(8) OCCURS 10 INDEXED BY INX-A.
```

Puede utilizar un nombre-índice para hacer referencia a otra tabla sólo si ambas descripciones de tabla tienen el mismo número de elementos de tabla, y los elementos de tabla tienen la misma longitud.

Puede utilizar la cláusula USAGE IS INDEX para crear un elemento de datos de índice, y puede utilizar un elemento de datos de índice con cualquier tabla. Por ejemplo, INX-B en el siguiente código es un elemento de datos índice:

``````
77 INX-B USAGE IS INDEX.

SET INX-A TO 10.
SET INX-B TO INX-A.
PERFORM VARYING INX-A FROM 1 BY 1 UNTIL INX-A > INX-B
      DISPLAY TABLE-ITEM (INX-A)
END-PERFORM.
``````

El nombre-índice INX-A se utiliza para recorrer la tabla TABLE-ITEM anterior. El dato-índice INX-B se utiliza para mantener el índice del último elemento de la tabla. La ventaja de este tipo de codificación es que se minimiza el cálculo de los desplazamientos de los elementos de la tabla y no es necesaria ninguna conversión para la condición UNTIL.

## SET

Puede utilizar la sentencia SET para asignar a un elemento de datos de índice el valor que almacenó en un nombre de índice, como en la sentencia SET INX-B TO INX-A anterior.

Por ejemplo, al cargar registros en una tabla de longitud variable, puede almacenar el valor del índice del último registro en un elemento de datos definido como USAGE IS INDEX. A continuación, puede comprobar el final de la tabla comparando el valor del índice actual con el valor del índice del último registro. Esta técnica resulta útil cuando se recorre o procesa una tabla.

Puede incrementar o decrementar un nombre-índice mediante un dato entero elemental o un literal entero distinto de cero, por ejemplo

```
SET INX-A      TO 1
SET INX-A DOWN BY 3
SET INX-A   UP BY 2
```

El entero representa un número de ocurrencias. Se convierte en un valor de índice antes de ser sumado o restado del índice.

Inicialice el índice mediante una sentencia SET, PERFORM VARYING o SEARCH ALL. A continuación, puede utilizar el índice en sentencias SEARCH o en una condición relacional. Para cambiar el valor, utilice una sentencia PERFORM, SEARCH o SET.

Dado que está comparando un desplazamiento físico, sólo puede utilizar directamente elementos de datos de índice en sentencias SEARCH y SET o en comparaciones con índices u otros elementos de datos de índice. No puede utilizar elementos de datos de índice como subíndices o índices.

```
IDENTIFICATION DIVISION.
PROGRAM-ID. CBLHELLO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TABLE.
  05 WS-A OCCURS 3 TIMES INDEXED BY I.
    10 WS-B PIC A(2).
    10 WS-C OCCURS 2 TIMES INDEXED BY J.
      15 WS-D PIC X(3).

PROCEDURE DIVISION.
    MOVE '12ABCDEF34GHIJKL56MNOPQR' TO WS-TABLE.
    PERFORM A-PARA VARYING I FROM 1 BY 1 UNTIL I >3
    STOP RUN.

A-PARA.
    PERFORM C-PARA VARYING J FROM 1 BY 1 UNTIL J>2.

C-PARA.
    DISPLAY WS-C(I,J).


ABC
DEF
GHI
JKL
MNO
PQR
```

## SEARCH

La sentencia SEARCH busca en una tabla un elemento que satisfaga la condición especificada y ajusta el índice asociado para indicar dicho elemento. Existen dos formatos:

1. SEARCH. Busqueda secuencial.
2. SEARCH ALL: Búsqueda binaria.

**Cuándo utilizar SEARCH y SEARCH ALL**

* Utilice la búsqueda secuencial cuando la tabla en la que desea buscar no esté ordenada. Utilice el formato 1 para buscar en una tabla ordenada cuando desee buscar en serie a través de la tabla o desee controlar subíndices o índices. Además, para una tabla con menos de 50 entradas debería usar la búsqueda secuencial.
* Utilice el formato 2 (búsqueda binaria) cuando desee buscar de forma eficaz en todas las apariciones de una tabla. La tabla debe estar previamente ordenada y debería tener más de 50 elementos.

Para utilizar SEARCH la tabla debe tener un índice. 

Para utilizar SEARCH ALL la tabla debe estar ordenada.

## Búsqueda secuencial (SEARCH)

SEARCH es una búsqueda en serie que se utiliza para encontrar elementos dentro de la tabla.

Se puede utilizar tanto para datos ordenados como no ordenados dentro de la tabla.

La tabla debe estár indexada mediante una frase INDEXED BY.

Cuando utilizamos la función de búsqueda, la función comienza con el valor actual del índice y sigue hasta el final de la tabla. El valor inicial del índice se deja a elección del programador. Podemos establecer el valor del índice justo antes de que comience la búsqueda utilizando la palabra clave SET.

Si no se encuentra el elemento buscado, el índice se incrementa automáticamente en 1 y continúa hasta el final de la tabla.

```
SEARCH identifier [VARYING {identifier-2/index-name}]
 [AT END statement]
 [WHEN condition statements]
[END-SEARCH]
```

```
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TABLE.
   05 WS-A PIC 9(1) OCCURS 10 TIMES INDEXED BY I.
01 WS-SRCH PIC 9(1) VALUE '0'.

PROCEDURE DIVISION.
   MOVE '1234567890' TO WS-TABLE.
   SET I TO 1.
   SEARCH WS-A
      AT END DISPLAY 'ZERO NOT FOUND IN TABLE'
      WHEN WS-A(I) = WS-SRCH
      DISPLAY 'NUMBER ZERO FOUND IN TABLE'
   END-SEARCH.
   STOP RUN.
```

## Búsqueda binaria (SEARCH ALL)

La tabla debe estar ordenada e indexada mediante INDEXED BY.

El índice no requiere inicialización.

El resultado de SEARCH ALL es cierto o falso. Por lo tanto, no podemos codificar múltiples condiciones de búsqueda.

En la búsqueda binaria, la tabla se divide en dos mitades y se determina en qué mitad está presente el elemento buscado. Este proceso se repite hasta que se encuentra el elemento o se llega al final.

```
SEARCH ALL identifier-1
 AT END imperative statement-1
 WHEN equal-condition-1 and equal-condition-2
     {imperative statement-2}
     {NEXT SENTENCE}
END-SEARCH
```

```
IDENTIFICATION DIVISION.
PROGRAM-ID. CBLHELLO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TABLE.
   05 WS-RECORD OCCURS 10 TIMES ASCENDING KEY IS WS-EMP-ID INDEXED BY I.
      10 WS-EMP-ID PIC 9(2).
      10 WS-NAME PIC A(3).

PROCEDURE DIVISION.
   MOVE '00ABC11DEF22GHI33JKL44MNO55PQR' TO WS-TABLE.
   SEARCH ALL WS-RECORD
     AT END DISPLAY 'INVALID EMP ID(RECORD NOT FOUND IN TABLE)'
     WHEN WS-EMP-ID(I) = 33
     DISPLAY 'RECORD FOUND '
     DISPLAY WS-EMP-ID(I)
     DISPLAY WS-NAME(I)
   END-SEARCH.
   STOP RUN.
```