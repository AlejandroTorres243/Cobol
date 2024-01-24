# Aspectos básicos de COBOL

En este tema vamos a conocer aspectos clave antes de entrar a programar en COBOL. 

# Caracteres usados en COBOL

```
    Space
+	Plus sign
-	Minus sign or hyphen
*	Asterisk
/	Forward slash or solidus
=	Equal sign
$	Currency sign
,	Comma
;	Semicolon
.	Decimal point or period
"	Quotation mark
'	Apostrophe
(	Left parenthesis
)	Right parenthesis
>	Greater than
<	Less than
:	Colon
_	Underscore
Alphabet (uppercase)
A - Z	Alphabet (uppercase)
a - z	Alphabet (lowercase)
0 - 9	Numeric characters
```

### Cadenas de caracteres
Una cadena de caracteres es un carácter o una secuencia de caracteres contiguos que forma una palabra COBOL, un literal, una cadena de caracteres PICTURE o una entrada de comentario. Una cadena de caracteres está delimitada por separadores.

### Separador
Un separador es un carácter o una cadena de dos o más caracteres contiguos que delimita cadenas de caracteres. Los separadores se muestran en la siguiente tabla. Hay otros  separadores disponibles. Solo se muestran los principales

``````
    Space
,	Comma
.	Period
;	Semicolon
(	Left parenthesis
)	Right parenthesis
:	Colon
``````

# Palabras COBOL

Una palabra COBOL es una cadena de caracteres que forma una palabra definida por el usuario, un nombre de sistema, o una palabra reservada.

1. **Palabra definida por el usuario**: cadena de caracteres que tiene un propósito específico en el programa. Las palabras definidas por el usuario se utilizan para nombrar ficheros, datos, registros, nombres de párrafos y secciones. Alfabéticas, dígitos y guiones se permiten al formar palabras definidas por el usuario. No se pueden utilizar palabras reservadas COBOL. Se usarán las siguientes reglas:
    - Longitud máxima de 30.
    - Letras, dígitos y guiones.
    - No debe ser una palabra reservada.
    - Al menos una letra.
    - Los guiones nunca en los extremos. Siempre embebidos.
    - No pueden contener espacios.
2. **System-name**: cadena de caracteres que tiene un significado específico para el sistema: computer-name, language-name, environment-name, etc.
3. **Palabra reservada**: cadena de caracteres con un significado predefinido en una unidad fuente COBOL.
    - **Palabra clave**: palabras reservadas que se requieren dentro de una cláusula, entrada o sentencia determinada. Dentro de cada formato, dichas palabras aparecen en mayúsculas en la ruta principal. Palabras clave como ADD, ACCEPT, MOVE, etc.
    - **Palabras opcionales**: palabras reservadas que pueden incluirse en el formato de una cláusula, entrada o sentencia para mejorar la legibilidad. No tienen ningún efecto sobre la ejecución del programa.
    - **Palabras de caracteres especiales**: existen dos tipos de palabras de caracteres especiales.
        Operadores aritméticos: + - / * **
        Operadores relacionales: < > = <= >=
    - **Constantes figurativas** nombran y se refieren a valores constantes específicos como ZERO, SPACES, HIGH-VALUE, LOW-VALUE etc.
    - **Identificadores de objetos especiales**: COBOL proporciona dos identificadores de objetos especiales, SELF y SUPER.
    - **Registros especiales**: nombra áreas de almacenamiento generadas por el compilador. Su uso principal es almacenar la información producida a través de características específicas de COBOL. Cada área de almacenamiento de este tipo tiene un nombre fijo, y no debe ser definido dentro del programa. Ejemplo: ADDRESS-OF, RETURN-CODE, SORT-CONTROL, LENGTH OF, WHEN-COMPILED etc.

# Literales

Un literal es una cadena de caracteres cuyo valor se especifica mediante los caracteres que la componen o mediante el uso de una constante figurativa. Son constantes y pueden ser núméricos o no numéricos.

    - Numéricos: 123.789   1234   -1.5   0.5E-12
    - Alfabéticos: "Calle de Atrás, 1"

## Reglas para los literales numéricos
    - Contiene un mínimo de 1 dígito y puede tener un máximo de 18 dígitos.
    - El signo, si se utiliza, debe ser el carácter situado más a la izquierda y no debe ser más de uno.
    - El decimal, si se utiliza, no puede ser el carácter situado más a la derecha y no debe ser más de uno.

## Reglas para los literales no numéricos
    - Se admite cualquier carácter del juego de caracteres.
    - Debe ir entre comillas.
    - 2 comillas continuas para obtener 1 comilla
    - Los literales numéricos entre comillas no son numéricos.
    - Longitud máxima de 160 caracteres.

## Reglas para los numéricos en coma flotante
    - Útil para valores muy altos o muy pequeños.
    - Especificado como Literal Numérico con punto decimal, seguido de Letra E, signo y número de 2 cifras
    - Debe estar comprendido entre 0.54E-78 y 0.72E+76.

# Comentarios

Un comentario es una cadena de caracteres que puede contener cualquier combinación de caracteres del juego de caracteres del sistema. No tiene ningún efecto sobre la ejecución del programa.

Una línea de comentario es cualquier línea con un asterisco (*) o una barra (/) en el área indicadora (columna 7) de la línea. El comentario puede escribirse en cualquier lugar del área A y del área B de esa línea, y puede consistir en cualquier combinación de caracteres del juego de caracteres del sistema.

Importante: se permiten varias líneas de comentario. Cada una de ellas debe comenzar con un asterisco (*) o una barra oblicua (/) en la zona indicadora (columna 7).

Si en la columna 7 se usa la letra D, esa línea se compilará si en el párrafo SOURCE-COMPUTER de la CONFIGURATION SECTION se especifica WITH DEBUGGING MODE. En caso contrario se tomará como un comentario.


# Formato de un programa COBOL

Un programa COBOL se escribe entre las columnas 7 a 72 del archivo con el código fuente.

## Columnas 1 a 6 : Área de número de secuencia
El área de número de secuencia puede utilizarse para etiquetar una línea de sentencia fuente. El contenido de esta área puede consistir en cualquier carácter del juego de caracteres del ordenador.

## Columna 7 : Área de indicadores (comentarios y continuación)
    - Cualquier sentencia, entrada, cláusula o frase que requiera más de una línea puede continuarse en el Área B de la siguiente línea que no sea una línea de comentario o línea en blanco.
    - El área A de una línea de continuación debe estar en blanco.
    - Si no hay guión (-) en el indicador de área.
    - Se supone que el último carácter de la línea precedente va seguido de un espacio.
    - Si hay guión en el área indicadora: el primer carácter no en blanco de esta línea de continuación sigue inmediatamente al último carácter no en blanco de la línea de continuación.
    - Si la línea de continuación contiene un literal no numérico sin comillas de cierre:
        - Todos los espacios al final de la línea de continuación (hasta la columna 72) forman parte del literal.
        - La línea de continuación debe contener un guión en la zona indicadora.
        - El primer carácter no en blanco debe ser una comilla y literal.
        - Continúa con el carácter que sigue a la comilla.

## Columnas 8 a 11 : Área A
    - Encabezamiento de división
    - Encabezamiento de sección
    - Encabezamiento de párrafo o nombre de párrafo
    - Indicador de nivel o número de nivel (01 y 77)
    - DECLARATIVOS y DECLARATIVOS FINALES.
    - Encabezado de fin de programa.

## Área B: Columnas 12 a 72:
    - Entradas, frases, enunciados y cláusulas
    - Líneas de continuación.
    - Identificación del programa: Columnas 73 a 80
    - Esta área se diseñó originalmente para introducir la identificación del programa en cada línea individual de código.
    - Una vez que las tarjetas fueron sustituidas por unidades de disco, esta zona cayó en desuso.

# Estructura de un programa COBOL

DIVISION, SECTION, PARAGRAPH, SENTENCE, STATEMENT.

    - Identification Division
    - Environment Division
    - Data Division
    - Procedure Division

## Cláusulas
Escritas en ENVIRONMENT Y DATA DIVISION, especifica un atributo de una entrada. Una serie de cláusulas, terminadas en punto, se define como una entrada.

## Sentencias
Escritas en la PROCEDURE DIVISION, especifican una acción que debe realizar el programa objeto. Una serie de sentencias, terminada con un punto, se define como una sentencia.

## Identification division

Primera división en cada programa fuente COBOL. Puede haber varios párrafos en esta división de los cuales PROGRAM-ID es esencial.

Excepto PROGRAM-ID todos los demás párrafos son opcionales y son principalmente para fines de documentación.

````
IDENTIFICATION DIVISION.
PROGRAM-ID. MIPROG.
AUTHOR. ANTONIO CANO.
INSTALLATION. CURSO ENTERPRISE COBOL.
DATE-WRITTEN. 01/12/23.
DATE-COMPILED. 01/12/23 12:57:53.
SECURITY. NON-CONFIDENTIAL.
````

**PROGRAM-ID**: Es el primer párrafo. Los demás párrafos son opcionales, pero, cuando se escriban, deben aparecer en el orden indicado en el formato. Este nombre de programa se utiliza para identificar el programa objeto.
El nombre del programa es una palabra definida por el usuario que identifica su programa. El sistema utiliza los 8 primeros caracteres del programa más externo como nombre identificativo del programa.
Los primeros 8 caracteres del nombre del programa externo deben ser únicos dentro del sistema. El primer carácter debe ser alfabético.

Si el primer carácter no es alfabético, se convierte de la siguiente manera: de 1 a 9 se convierten en A a I y cualquier otro carácter se convierte en J.

Si se utiliza un guión en los caracteres 2 a 8 del nombre de programa del programa más externo, se cambia a cero (0).
Aparte de estas declaraciones, puede haber declaraciones de comentario que describan la funcionalidad del programa y un bloque de registro de cambios que proporcione los detalles sobre los programadores que cambiaron el programa como parte de una mejora del mismo.

**AUTHOR**: Este párrafo opcional fue eliminado de la norma en 1985, pero la mayoría de los compiladores COBOL todavía apoyan su uso. No hay reglas de formato para el nombre del programador.

**INSTALlATION**: Este párrafo opcional se eliminó de la norma en 1985, pero la mayoría de los compiladores COBOL todavía apoyan su uso. Normalmente el nombre de la empresa. No hay reglas de formato para el nombre del empleador del programador.Por ejemplo: INSTALACIÓN. TWIN CORPORATION.

**DATE-WRITTEN**: Este párrafo opcional se eliminó de la norma en 1985, pero la mayoría de los compiladores COBOL todavía apoyan su uso. No hay reglas de formato para la fecha.

**DATE-COMPILED**: Este párrafo opcional fue eliminado de la norma en 1985, pero muchos compiladores COBOL todavía apoyan su uso. 

**SECURITY**: Este párrafo opcional se eliminó de la norma en 1985, pero la mayoría de los compiladores COBOL todavía apoyan su uso. Codifique el nivel de seguridad del programa a continuación del nombre del párrafo. No hay reglas de formato para el nivel de seguridad y esta entrada no tendrá ningún efecto real sobre el acceso al programa. El párrafo es sólo para fines de documentación. Por ejemplo: SEGURIDAD. NO CONFIDENCIAL.

# Environment Division

Aquí se definen los detalles dependientes del sistema. Es una división opcional y va a continuación de la IDENTIFICATION DIVISION.
````
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-I.
OBJECT-COMPUTER. IBM-I.
SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
INPUT-OUTPUT SECTION.
FILE CONTROL.
SELECT INPUT-FILE ASSIGN TO INPUT-FL.
````
La INPUT-OUTPUT SECTION nos permite codificar en el párrafo FILE-CONTROL la relación entre ficheros lógicos (programa) y ficheros físicos (sistema). INPUT-FILE es el fichero lógico y INPUT-FL es el nombre con el que referenciamos al fichero en nuestro JCL (depende del SO).

# Data Division

Permite declarar de manera estructurada los datos que deben ser procesados por el programa. También la relación entre los registros físicos y lógicos asociados a los ficheros lógicos declarados en el párrafo FILE-CONTROL.

La División de Datos es opcional en un programa fuente COBOL y tiene cuatro secciones:

- **FILE SECTION**: describe los datos almacenados externamente.
- **WORKING-STORAGE SECTION**: describe los datos internos.
- **LOCAL-STORAGE SECTION**: en entornos multihilo describe los datos propios de cada hilo.
- **LINKAGE SECTION**: es el área de memoria compartida con otros programas. Va asociada a la cláusula using de la PROCEDURE DIVISION.

# Procedure Divison.

Consta de sentencias agrupadas en párrafos, cada uno de los cuales está diseñado para realizar una función específica.

Un párrafo consta de un nombre de párrafo codificado en el Área A y de una serie de sentencias de procedimiento diseñadas para realizar una función deseada codificadas en el Área B.

Los procedimientos ejecutan frecuentemente otros procedimientos como se indica en el siguiente ejemplo:

```
MAIN.
       PERFORM 1000-INITIALIZE-PARA
          THRU 1000-EXIT.
       PERFORM 2000-MAIN-PARA
          THRU 2000-EXIT
         UNTIL END-OF-FILE.
       PERFORM 3000-END-PARA
          THRU 3000-EXIT.
       STOP RUN.
```

Observe el uso de signos de puntuación en el párrafo anterior. Cada declaración(statement) debe ser una frase (sentence), es decir, debe terminar con un punto a menos que forme parte de una frase condicional.

Las frases que se prolongan a lo largo de varias líneas deben ir sangradas en las líneas siguientes. Las frases que modifican el comportamiento de una sentencia como UNTIL en la sentencia PERFORM deben codificarse en una nueva línea para que destaquen.

