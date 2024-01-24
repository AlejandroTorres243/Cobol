# Trabajando con datos

Declaración de una variable:
``````
05 W01-STRING PIC X(20) VALUE 'ABC'.
``````
- Número de nivel: 05
- Nombre de variable: W01-STRING
- Tipo de dato: PIC X(20)
- Valor inicial: 'ABC'

## Número de nivel (LEVEL NUMBER)

- **Niveles 01-49**: los niveles 01-49 se utilizan para crear elementos de datos jerárquicos. El elemento de nivel más alto de la jerarquía será siempre el elemento 01 y cada elemento contiene los elementos situados debajo de él con números de nivel superior (hasta el siguiente elemento con un número de nivel inferior o el final de la sección o división). Los elementos que contienen otros datos se denominan elementos de grupo y los que no contienen otros datos se denominan elementos elementales. Aunque están disponibles todos los números del 01 al 49, por convención se utilizan los niveles 01, 05, 10, 15, 20, 25, etc.

- **Nivel 66**: sirve para renombrar variables. A veces es conveniente agrupar elementos de dos grupos distintos en un grupo propio. Digamos que queremos crear un nuevo grupo de elementos formado por los elementos D y F, pero no queremos interferir con estos elementos de datos que también pertenecen a los grupos B y E. 
Debe ser la última línea de un nivel 01.
```
01 A.
   05 B.
      10 C PIC X(20).
      10 D PIC X(10).
   05 E.
      10 F PIC X(05).
      10 G PIC 9(10).
66 H RENAMES D THRU F.
```
- **Nivel 77**: variables individuales (sin agrupación o desglose). Se ha propuesto su eliminación pero siguen vigentes por compatibilidad. No deben ser codificados en los nuevos programas.
Un elemento de nivel 77 se utiliza para definir un elemento que no se subdividirá más. Puede conseguir lo mismo con un elemento de nivel 01, pero no lo subdivide.

- **Nivel 88**: nombres de condición. El uso de un nombre de condición tiene dos ventajas principales: 
    - Permite asignar un nombre descriptivo a lo que de otro modo podría no ser una razón obvia para una prueba.
    - Si una condición está sujeta a cambios debido a condiciones que escapan al control del programador y dicha condición se comprueba en varios lugares, utilizar el nombre de la condición en lugar de la condición real permite al programador que mantiene el programa cambiar los valores que definen la condición en un solo lugar en vez de tener que buscar todas las ocurrencias individuales en la PROCEDURE.
````
    05 W-LETRA PIC X(1).
        88 IS-VOCAL VALUE 'A' 'E' 'I' 'O' 'U'.

    MOVE 'N' TO W-LETRA
    IF IS-VOCAL 
    IF W-LETRA = 'A' OR W-LETRA = 'E' ...

````

## Nombre de la variable

Los nombres de datos deben definirse en la DATA DIVISION antes de utilizarlos en la PROCEDURE. Deben tener un nombre definido por el usuario y no se pueden utilizar palabras reservadas. Los nombres de datos hacen referencia a las posiciones de memoria donde se almacenan los datos reales. Pueden ser de tipo elemental o de grupo.


Nombres válido: WS-FIRST-NAME, CONTAR, B1000, 1000B
Nombre no válido: MOVE (Palabra reservada), ADD (Palabra reservada), 100 (Sin alfabeto), 100+B (+ no está permitido).

## Uso de FILLER

La palabra reservada FILLER se usa para especificar un espacio en la memoria sin nombre. Siguen las mismas reglas que cualquier otra variable en cuanto al uso de PICTURE y demás.

## Tipo de dato (PICTURE)

* La cláusula Picture se utiliza para especificar el tipo y el tamaño de un elemento de datos elemental.
* Consta de la palabra PIC o PICTURE seguida de la cláusula picture propiamente dicha, en la que se especifican el tipo y el tamaño.
* El tipo se especifica mediante un carácter específico seleccionado de la tabla siguiente. Cada carácter de imagen representa una posición en el elemento de datos. En una misma cláusula Picture pueden combinarse caracteres diferentes. 
* Las apariciones múltiples del mismo tipo de carácter se indican repitiendo el carácter o incluyendo un factor de repetición después del carácter.

````
01 V1 PIC AAAAA.
01 V2 PIC A(5).
````
| Carácter | Propósito | Descripción |
| -------- | --------- | ----------- |
| X | Cualquier carácter | Puede contener cualquier carácter, incluidos los caracteres especiales o no imprimibles|
| 9 | Carácter numérico | Puede contener sólo los caracteres del 0 al 9 |
| A | Carácter alfabético | Puede contener sólo los caracteres A - Z, a - z, y espacio |
| S | Signo numérico | No utiliza espacio de almacenamiento real, sin este carácter un elemento numérico se trataría como sin signo |
| V | Punto decimal implícito | No utiliza espacio de almacenamiento real, separa la parte entera de un elemento numérico de su parte decimal; se utiliza para controlar el punto decimal en los cálculos aritméticos; este carácter no se imprimirá ni mostrará; utilice el carácter de punto decimal real, ".", para imprimir|
| P | Posicionador numérico | No utiliza ningún espacio de almacenamiento real; se utiliza para cambiar la precisión, por ejemplo, 99PPP mantendrá valores en cantidades de hasta 1.000 de cero a 99.000 sin almacenar nada para las tres posiciones de orden inferior; también se puede utilizar para representar posiciones después del decimal, por ejemplo, PP9 mantendrá valores en cantidades de milésimas pares, de 0 a 0,009 sin almacenar nada para las dos posiciones de orden superior|
| - | Signo menos | Se utiliza para mostrar un signo en un elemento impreso, el carácter "-" sólo se mostrará si el valor numérico es negativo, la posición se dejará en blanco para valores positivos|
| + | Signo más | Se utiliza para mostrar un signo en un elemento impreso, "-" se mostrará para valores negativos, "+" se mostrará para valores positivos|
| .	| Punto decimal real | Separa la parte entera de un elemento numérico de su parte decimal; este carácter no puede utilizarse en un elemento implicado en un cálculo; utilice el carácter de punto decimal implícito, "V", para los cálculos|
| Z | Suprimir ceros | Sustituye los ceros a la izquierda por espacios en blanco; no tiene efecto en las posiciones distintas de cero ni en los ceros que no están a la izquierda|
| , | Coma | Inserta una coma en el elemento de datos en esta posición; se utiliza normalmente como separador en elementos de datos numéricos |
| $ | Signo de dólar | Inserta un signo de dólar en la primera posición del elemento de datos; se suele utilizar para la moneda |
| * | Asterisco | Sustituye los ceros a la izquierda por asteriscos; no afecta a las posiciones distintas de cero ni a los ceros que no están a la izquierda; se utiliza normalmente en la emisión de cheques |
| CR | Crédito | Se utiliza al final de una cláusula PICTURE, el CR aparecerá en la posición indicada si el elemento es negativo; estará en blanco para un número positivo |
| DB | Débito | Se utiliza al final de una cláusula PICTURE, la DB aparecerá en la posición indicada si el elemento es negativo; b aparecerá en blanco para un número positivo |
| / | Slash | Inserta una barra oblicua en el elemento de datos en esta posición; se utiliza habitualmente como separador en campos de fecha |
| 0 | Cero | Inserta un cero en el dato en esta posición; no se utiliza habitualmente

## Valor inicial (VALUE)

La cláusula VALUE se utiliza para establecer un valor inicial a la variable de almacenamiento de trabajo.Sólo se puede especificar en la variable de almacenamiento de trabajo.La cláusula VALUE no puede formar parte de la entrada RECORD DESCRIPTION en la FILE SECTION.

```
 01 W04-X-PGM-NAME PIC X(08) VALUE 'PXXBB290'.
 01 W04-NOMBRE PIC X(08) VALUE SPACES.
 01 W04-APELLIDO PIC A(08) VALUE SPACES.
 01 W04-MOBILE PIC 9(08) VALUE ZEORES.
 ```

## Tipo de almacenamiento (USAGE)

La cláusula USAGE se utiliza para especificar cómo un elemento de datos se almacenan en la memoria del ordenador. Cada variable declarada en un programa COBOL tiene una cláusula USAGE - incluso cuando no se especifica ninguna cláusula explícita. Cuando no hay ninguna cláusula explícita USAGE, el valor predeterminado ``USAGE IS DISPLAY`` se aplica.
- La cláusula USAGE se puede especificar en elementos de datos definidos con cualquier número de nivel.
- El USAGE de un elemento de grupo es válido para todos sus subelementos.

Un ordenador puede almacenar datos en más de una forma. En COBOL, se especifica la forma interna del elemento de datos a fin de facilitar un uso eficiente. Sólo hay dos formas generales de representación interna en COBOL,
- COMPUTATIONAL: solo para datos numéricos. Permite operar de forma eficiente en operaciones aritméticas.
- DISPLAY: aplicable a cualquier tipo.

Con `` USAGE COMP `` los datos se almacenan internamente en formato binario puro. Dependiendo del tamaño del elemento de datos, se puede almacenarse en media palabra (2 bytes con un rango de -32,768 a +32767) o palabra completa (4 bytes con un rango de -2,147,483,648 a 2,147,483,647). La cláusula PICTURE solo puede contener 9 o S. La palabra reservada USAGE puede omitirse.

``````
01 W-V1 PIC S9(2) COMP.
``````
Hasta 9(4) ocupa 2 bytes, de 9(5) a 9(9) ocupa 4 bytes y de S9(10) A S9(18) ocupa 8 bytes.

**BINARY**: es un alias a los usage COMP y COMP-4. Se para variables numéricas almacenadas en binarios. Estos elementos tienen un equivalente decimal formado por los dígitos decimales del 0 al 9, más un signo. Los números negativos se representan como el complemento a dos del número positivo con el mismo valor absoluto.
La cantidad de memoria ocupada por un elemento binario depende del número de cifras decimales definidas en su cláusula PICTURE: 

**COMP**: 

**COMP-1**: se representa en una palabra en forma de coma flotante y en formato hexadecimal. Es adecuado para operaciones aritméticas. La cláusula PICTURE no puede especificarse para los elementos COMP-1. Ocupa 4 bytes de almacenamiento.

**COMP-2**: es igual que COMP-1, salvo que los datos se representan internamente en dos palabras. La ventaja es que esto aumenta la precisión de los datos, lo que significa que se dispone de más dígitos significativos. Al igual que COMP-1, la cláusula PICTURE tampoco puede especificarse para los elementos COMP-2. COMP-1 ocupa 8 bytes de almacenamiento.COMP-2 es más preciso que COMP-1.

**COMP-3**: en este caso los datos se representan en forma decimal, pero un dígito ocupa medio byte. El signo se almacena por separado como el carácter más a la derecha de medio byte.
Hallar el almacenamiento de Comp-3 en bytes: Longitud de la variable/2, si no es un número puro, ocupa el siguiente número de bytes.

* +87634 se mostrará como 86473C         tiene 5 digitos: 5/2=2+1 = 3 bytes de tamaño
*  -4567 se visualizará como 05746D      tiene 4 digitos: 4/2=2+1 = 3 bytes de tamaño

Los últimos caracteres representan el signo. Si el último carácter es C o F, significa un signo positivo. Si el último carácter es D , eso denota un signo negativo.

Antes de visualizar COMP-3, mueva los datos a una variable USAGE DISPLAY y luego visualícelos. Si contiene un signo, utilice SIGN LEADING SEPARATE, que utiliza un byte adicional para el signo y el signo se mostrará por separado.
```
01 WS-NUMBER PIC S9(03) COMP-3.
01 WS-NUMBER1 PIC S9(03) SIGN LEADING SEPARATE.
.........
MOVE WS-NUMERO TO WS-NUMERO1.
DISPLAY WS-NUMERO1.
```
**COMP-5**: se usa para almacenar binarios de hasta 8 bytes.

**POINTER**: se usa para almacenar direcciones de memoria.

## Cláusula REDEFINES

Se utiliza para definir un almacenamiento con una descripción de datos diferente. Si uno o más elementos de datos no se utilizan simultáneamente, el mismo almacenamiento puede utilizarse para otro elemento de datos. Por lo tanto, se puede hacer referencia al mismo almacenamiento con diferentes elementos de datos.

``````
01 WS-NAME.
   05 WS-FIRST-NAME PIC X(07) VALUE 'ANTONIO'.
   05 FILLER PIC X(01) VALUE SPACES.
   05 WS-LAST-NAME PIC X(04) VALUE 'CANO'.

01 WS-FULL-NAME REDEFINE WS-NAME PIC X(12).
``````
- El número de nivel del elemento redefinido y del elemento de redefinición debe ser el mismo.
- La definición de Redefine debe ser la siguiente descripción de datos que desee redefinir.
- Un elemento redefinido siempre tendrá el mismo valor que un elemento redefinido.
- La cláusula REDEFINES no puede utilizarse para los números de nivel 66 y 88.
- La cláusula REDEFINES no puede utilizarse en una entrada de nivel 01 en FILE-SECTION.
- No es necesario que el número de caracteres sea el mismo para el elemento redefinido y el elemento redefinidor. El compilador genera una advertencia si el número de caracteres del elemento Redefinido es mayor que el del elemento Redefinido.
- Varios elementos de datos pueden redefinir el mismo elemento de datos.

## CLáusula RENAMES

La cláusula RENAMES se utiliza para dar nombres diferentes a los elementos de datos existentes. Se utiliza para reagrupar los nombres de datos y darles un nuevo nombre. Los nuevos nombres de datos pueden renombrarse a través de grupos o elementos elementales. El nivel 66 está reservado para renombrar.

``````
01 WS-OLD.
   10 WS-A PIC 9(12).
   10 WS-B PIC X(20).
   10 WS-C PIC A(25).
   10 WS-D PIC X(12).
   66 WS-NUEVO RENOMBRA WS-A HASTA WS-C.
``````
- El cambio de nombre sólo es posible en el mismo nivel. En el ejemplo anterior, WS-A, WS-B y WS-C están en el mismo nivel.
- La definición de renombrar debe ser la siguiente descripción de datos que desee renombrar.
- No utilice RENAMES con los números de nivel 01 o 77.
- Los nombres de datos utilizados para renombrar deben venir en secuencia.
- Elementos de datos con OCCURS no pueden renombrarse.

## Pictures de edición

Permiten formatear datos para mostrarse en pantalla o impresora. COBOL proporciona símbolos de imagen adicionales para complementar el básico 9, X, A, V y S.

Los datos "editados" no se pueden utilizar como operandos en un cálculo, pero se pueden utilizar como resultado o destino de un cálculo.

- Valor original: 00023456.78
- Con separadores decimales y de miles: 00,023,456.78
- Con supresión de ceros:  23.456,78
- Con símbolo de moneda: $23,456.78
- Con impresión antifraude: $***23.456,78

## Edición por inserción simple

Este tipo de edición es válido para los elementos editados alfanuméricos y numéricos. Cada símbolo de inserción se cuenta en el tamaño del elemento y representa la posición dentro del elemento en la que debe insertarse el carácter equivalente.
``````
PICTURE	    Valor       	Valor editado
X(10)/XX	ALPHANUMER01	ALPHANUMER/01
X(5)BX(7)	ALPHANUMERIC	ALPHA NUMERIC
99,999	    12345	        12,345
``````

## Edición por inserción especial

Este tipo de edición es válido tanto para elementos editados numéricamente como para elementos externos de coma flotante. 
- El punto (.) es el símbolo especial de inserción; también representa el punto decimal real a efectos de alineación. El símbolo de inserción del punto se cuenta en el tamaño del elemento y representa la posición dentro del elemento en la que se inserta el punto decimal real.
- En una cadena de caracteres PICTURE debe especificarse el punto decimal real o el símbolo V como punto decimal supuesto, pero no ambos.
````
PICTURE	    Valor	  Valor editado
999.99	    1.234	  001.23
999.99	    12.34	  012.34
999.99	    123.45	  123.45
999.99	    1234.5	  234.50
+999.99E+99	12345	 +123.45E+02
````

## Edición por inserción fija

- Este tipo de edición sólo es válido para los elementos editados numéricamente. Se utilizan los siguientes símbolos de inserción: cs, +,  -,  CR,  DB
- En la edición de inserción fija, sólo se puede especificar un símbolo monetario y un símbolo de control de signo de edición en una cadena de caracteres PICTURE.
- A menos que vaya precedido de un símbolo + o -, el símbolo monetario debe ser el primer carácter de la cadena de caracteres.
- Cuando se utiliza + o - como símbolo, debe ser el primero o el último carácter de la cadena de caracteres.
- Cuando se utiliza CR o DB como símbolo, debe ocupar las dos posiciones más a la derecha de la cadena de caracteres. Si estas dos posiciones contienen los símbolos CR o DB, las letras mayúsculas son los caracteres de inserción.

````
PICTURE	    Valor       Valor editado
999.99+	    +6555.556	  555.55+
+9999.99	-6555.555	-6555.55
9999.99	    +1234.56	 1234.56
$999.99	    -123.45	     $123.45
-$999.99	-123.456	-$123.45
-$999.99	+123.456	 $123.45
$9999.99CR	+123.45	    $0123.45
$9999.99CR	-123.45	    $0123.45CR
````

## Edición flotante

- Este tipo de edición sólo es válido para los elementos editados numéricamente.Se utilizan los siguientes símbolos: cs + -
- Dentro de una cadena de caracteres PICTURE, estos símbolos se excluyen mutuamente como caracteres de inserción flotante.
- La edición de inserción flotante se especifica utilizando una cadena de al menos dos de los símbolos de inserción flotante permitidos para representar las posiciones de carácter más a la izquierda en las que se pueden insertar los caracteres reales.
- El símbolo de inserción flotante situado más a la izquierda en la cadena de caracteres representa el límite más a la izquierda en el que puede aparecer el carácter real en el elemento de datos. El símbolo de inserción flotante situado más a la derecha representa el límite más a la derecha en el que puede aparecer el carácter real.
- El segundo símbolo de inserción flotante más a la izquierda en la cadena de caracteres representa el límite más a la izquierda en el que pueden aparecer datos numéricos en el elemento de datos. Los datos numéricos no nulos pueden sustituir a todos los caracteres situados a la derecha de este límite.
- Cualquier símbolo de inserción simple (B 0 / ,) situado dentro o a la derecha inmediata de la cadena de símbolos de inserción flotantes se considera parte de la cadena de caracteres flotantes. Si el símbolo de inserción especial punto (.) está incluido dentro de la cadena flotante, se considera parte de la cadena de caracteres.

Para evitar el truncamiento, el tamaño mínimo de la cadena de caracteres PICTURE debe ser:
    - El número de posiciones de caracteres del elemento de envío, más
    - El número de símbolos de inserción no flotantes del elemento receptor, más
    - Una posición de carácter para el símbolo de inserción flotante

En una cadena de caracteres PICTURE, hay dos formas de representar la edición de inserción flotante y, por tanto, dos formas de realizar la edición:
1. El símbolo de inserción flotante representa todas las posiciones de los caracteres numéricos a la izquierda del punto decimal. Cuando se realiza la edición, se coloca un único carácter de inserción flotante inmediatamente a la izquierda del primer dígito distinto de cero en los datos, o del punto decimal, lo que esté más a la izquierda. Las posiciones de caracteres a la izquierda del carácter insertado se rellenan con espacios.

Si todas las posiciones de caracteres numéricos de la cadena de caracteres PICTURE están representadas por el carácter de inserción, al menos uno de los caracteres de inserción debe estar a la izquierda del punto decimal.

2. Todas las posiciones de caracteres numéricos están representadas por el símbolo de inserción flotante. Cuando se realiza la edición, entonces:
    - Si el valor del dato es cero, todo el dato contendrá espacios.
    - Si el valor del dato es distinto de cero, el resultado es el mismo que en la regla 1. 

```
PICTURE	         Valor   	    Valor editado    
      $$$$.99           .123	       $.12
      $$$9.99           .12	          $0.12
 $,$$$,999.99	   -1234.56	      $1,234.56
 +,+++,999.99	 -123456.789	-123,456.78
$$,$$$,$$$.99CR	-1234567      $1,234,567.00CR
++,+++,+++.+++	    0000.00	
```

## Edición con supresión y reemplazo de ceros

- Este tipo de edición sólo es válido para los elementos editados numéricamente.En la edición con supresión cero, se utilizan los símbolos Z y *. Estos símbolos se excluyen mutuamente en una cadena de caracteres PICTURE.
- Los siguientes símbolos se excluyen mutuamente como símbolos de sustitución flotante en una cadena de caracteres PICTURE: Z * + - cs
- Especifique la supresión de cero y la edición de sustitución con una cadena de uno o varios de los símbolos permitidos para representar las posiciones de carácter más a la izquierda en las que se puede realizar la supresión de cero y la edición de sustitución.
- Cualquier símbolo de inserción simple (B 0 / ,) dentro o a la derecha inmediata de la cadena de símbolos de edición flotante se considera parte de la cadena.
- Si el símbolo de inserción especial punto (.) se incluye dentro de la cadena de edición flotante, se considera parte de la cadena de caracteres.

Representación de la supresión del cero:
    1. Cualquiera o todas las posiciones del carácter numérico inicial a la izquierda del punto decimal se representan mediante símbolos de supresión. Cuando se realiza la edición, el carácter de sustitución reemplaza cualquier cero inicial de los datos que aparezca en la misma posición de carácter que un símbolo de supresión. La supresión se detiene en el carácter situado más a la izquierda:
        - Que no corresponde a un símbolo de supresión
        - Que contenga datos distintos de cero
        - Que sea el punto decimal
    2. Todas las posiciones de caracteres numéricos de la cadena de caracteres PICTURE están representadas por los símbolos de supresión. Cuando se realiza una edición y el valor de los datos es distinto de cero, el resultado es el mismo que en la regla anterior. Si el valor de los datos es cero, entonces:
        - Si se ha especificado Z, todo el dato contendrá espacios.
        - Si se ha especificado *, todo el elemento de datos, excepto el punto decimal real, contendrá asteriscos.
```
PICTURE	                   Valor	Valor editado
       ****.**	         0000.00	      ****.**
       ZZZZ.ZZ	         0000.00	
       ZZZZ.99	         0000.00	          .00
       ****.99	         0000.00	      ****.00
       ZZ99.99	         0000.00	        00.00
      Z,ZZZ.ZZ+	         +123.456	       123.45+
      *,***.**+	         -123.45         **123.45-  
 **,***,***.**+	    +12345678.9	    12,345,678.90+
 $Z,ZZZ,ZZZ.ZZCR       +12345.67    $   12,345.67
$B*,***,***.**BBDB	   -12345.67   $ ***12,345.67  DB
```
    
# Uso de copybook (COPY)

La sentencia COPY es una sentencia de biblioteca que coloca texto pre-escrito en una unidad de compilación COBOL.

En otras palabras, COPY proporciona la facilidad para incluir los diseños (copybooks) al programa de una manera muy sencilla mediante el uso del comando COPY.

Sintaxis:
``````
COPY <nombre> [REPLACING <cadena-a-ser-reemplazada> BY <cadena-de-reemplazo>].
``````
El efecto de procesar una sentencia COPY es que el texto de biblioteca asociado a ``<nombre>`` se copia en la unidad de compilación, sustituyendo lógicamente a toda la sentencia COPY, empezando por la palabra COPY y terminando por el punto, ambos inclusive. Si no se especifica la frase REPLACING, el texto de biblioteca se copia sin cambios.

Para cambiar algunos o todos los nombres dentro del texto de la biblioteca, puede utilizar la frase REPLACING:
```
COPY NOMBRE.
01  A.
  02  B    PIC S99.
  02  C    PIC S9(5)V99.
  02  D    PIC S9999 OCCURS 1 TO 52 TIMES
      DEPENDING ON B OF A.

COPY NOMBRE REPLACING A BY VAR1 B BY VAR2 C BY VAR3 D BY VAR4

01  VAR1.
  02  VAR2    PIC S99.
  02  VAR3    PIC S9(5)V99.
  02  VAR4    PIC S9999 OCCURS 1 TO 52 TIMES
      DEPENDING ON VAR2 OF VAR1.

COPY PAYLIB.
01  :TAG:.
  02  :TAG:-WEEK          PIC S99.
  02  :TAG:-GROSS-PAY     PIC S9(5)V99.
  02  :TAG:-HOURS         PIC S999  OCCURS 1 TO 52 TIMES
      DEPENDING ON :TAG:-WEEK OF :TAG:.
COPY PAYLIB REPLACING ==:TAG:== BY ==PAYROLL==.
COPY PAYLIB REPLACING ==(01)== BY ==(01)==
                      == 01 == BY == 05 ==.
```
                   