# Funciones intrínsecas

## CURRENT-DATE

La función intrínseca más útil es CURRENT-DATE, que sustituye a ACCEPT DATE y ACCEPT TIME. CURRENT-DATE tiene el año de 4 dígitos. Esta función devuelve un campo alfanumérico de 20 caracteres con la siguiente disposición.

``````
01 WS-CAMPOS-FECHA-ACTUAL.
    05 WS-FECHA-ACTUAL.
        10 WS-CURRENT-ANIO   PIC 9(4).
        10 WS-CURRENT-MES    PIC 9(2).
        10 WS-CURRENT-DIA    PIC 9(2).
    05 WS-HORA-ACTUAL. 
        10 WS-ACTUAL-HORA    PIC 9(2).
        10 WS-ACTUAL-MINUTO  PIC 9(2).
        10 WS-ACTUAL-SEGUNDO PIC 9(2).
        10 WS-ACTUAL-MS      PIC 9(2).
    05 WS-DIFF-GMT           PIC S9(4).

    MOVE FUNCTION CURRENT-DATE TO WS-CAMPOS-FECHA-ACTUAL

``````

Así que no sólo se obtiene la hora al milisegundo, también se obtiene la diferencia entre tu hora y la hora del meridiano de Greenwich.

La función se utiliza en un MOVE.

FUNCIÓN MOVE CURRENT-DATE A WS-CURRENT-DATE-FIELDS

COBOL Fecha Ejemplo:

¿Necesita saber qué fecha es 150 días a partir de hoy (y este tipo de cosas sucede más a menudo de lo que usted piensa)? Convierta hoy en una fecha entera, súmele 150 y conviértala de nuevo. Ya no tendrás que comprobar qué meses son de 30 o 31 días. Se acabaron los cálculos de años bisiestos.

``````
01 WS-HOY     PIC 9(8).
01 WS-HOY-150 PIC 9(8).

MOVE FUNCTION CURRENT-DATE (1:8) TO WS-HOY.
COMPUTE WS-HOY-150 = FUNCTION INTEGER-OF-DATE (WS-HOY) + 150
``````

**Convertir de fecha gregoriana a entera y viceversa**

`````
COMPUTE WS-INTEGER-DATE = FUNCTION INTEGER-OF-DATE (WS-DATE)
COMPUTE WS-DATE = FUNCTION DATE-OF-INTEGER (WS-INT-DATE)
`````

**Convertir de fecha entera a juliana y viceversa**

````
COMPUTE WS-JULIAN-DATE = FUNCTION DAY-OF-INTEGER (WS-INT-DATE)
COMPUTE WS-INTEGER-DATE = FUNCTION INTEGER-OF-DAY (WS-JUL-DATE)
````

**Calcular días entre fechas**

````
COMPUTE WS-DAYS = FUNCTION INTEGER-OF-DATE (WS-DATE-1) - FUNCTION INTEGER-OF-DATE (WS-DATE-2)
````

**Conversión de juliana a gregoriana**

```
COMPUTE WS-DATE = FUNCTION DATE-OF-INTEGER (FUNCTION INTEGER-OF-DAY (WS-JULIAN))
```

## WHEN-COMPILED

El registro especial WHEN-COMPILED contiene la fecha de inicio de la compilación.

WHEN-COMPILED es un dato alfanumérico que tiene la definición implícita.

```
01  WHEN-COMPILED GLOBAL PICTURE X(16) USAGE DISPLAY.
MM/DD/AAhh.mm.ss (MES/DÍA/AÑOhora.minuto.segundo)

FUNCTION WHEN-COMPILED

```

- WHEN-COMPILED sólo puede utilizarse como campo de envío en una sentencia MOVE.
- Los datos del registro especial WHEN-COMPILED no pueden modificarse por referencia.

También se puede acceder a la fecha y hora de compilación con la función intrínseca WHEN-COMPILED. Dicha función admite valores de año de cuatro dígitos y proporciona información adicional.

La función WHEN-COMPILED devuelve la fecha y hora en que se compiló el programa, tal y como la proporciona el sistema en el que se compiló el programa. El tipo de función es alfanumérico.

- **ABS**: La función ABS devuelve el valor absoluto del argumento.
- ACOS: La función ACOS devuelve un valor numérico en radianes que aproxima el arcocoseno del argumento especificado.
- ANNUITY: La función ANUALIDAD devuelve un valor numérico que aproxima la relación entre una anualidad pagada al final de cada período, durante un número determinado de períodos, a un tipo de interés dado, y un valor inicial de uno.
- ASIN: La función ASIN devuelve un valor numérico en radianes que aproxima el arcoseno del argumento especificado.
- ATAN: La función ATAN devuelve un valor numérico en radianes que aproxima la arctangente del argumento especificado.
- BIT-OF: La función BIT-OF devuelve una cadena de caracteres alfanuméricos formada por los caracteres "1" y "0" que corresponden al valor binario de cada byte del argumento de entrada.
- BIT-TO-CHAR: La función BIT-TO-CHAR devuelve una cadena de caracteres formada por bytes que corresponden al patrón de bits indicado por la secuencia de caracteres "0" y "1" del argumento de entrada.
- BYTE-LENGTH: La función BYTE-LENGTH devuelve un número entero igual a la longitud del argumento en bytes.
- **CHAR**: La función CHAR devuelve un valor alfanumérico de un carácter que es un carácter de la secuencia de cotejo del programa que tiene la posición ordinal igual al valor del argumento especificado.
- COMBINED-DATETIME:La función COMBINED-DATETIME combina una fecha en forma de fecha entera y una hora en forma de hora numérica estándar en un único elemento numérico del que se pueden derivar los componentes de fecha y hora.
- CONTENT-OF: La función intrínseca CONTENT-OF devuelve el contenido del argumento.
- COS: La función COS devuelve un valor numérico que se aproxima al coseno del ángulo o arco especificado por el argumento en radianes.
- **CURRENT-DATE**:La función CURRENT-DATE devuelve un valor alfanumérico de 21 caracteres que representa la fecha del calendario, la hora del día y la diferencia horaria con respecto a la hora media de Greenwich proporcionada por el sistema en el que se evalúa la función.
- **DATE-OF-INTEGER**: La función DATE-OF-INTEGER convierte una fecha del calendario gregoriano de la forma de fecha entera a la forma de fecha estándar (AAAAMMDD).
- DATE-TO-YYYYMMDD: La función DATE-TO-YYYYMMDD convierte el argumento-1 de una fecha con un año de dos dígitos (YYnnnn) a una fecha con un año de cuatro dígitos (YYYYnnnn). El argumento-2, cuando se añade al año en el momento de la ejecución, define el año final de un intervalo de 100 años, o ventana de siglo deslizante, en el que cae el año del argumento-1.
- **DAY-OF-INTEGER**: La función DAY-OF-INTEGER convierte una fecha del calendario gregoriano de la forma de fecha entera a la forma de fecha juliana (AAAADDD).
- DAY-TO-YYYYDDD:La función DAY-TO-YYYYDDD convierte el argumento-1 de una fecha con un año de dos dígitos (YYnnn) a una fecha con un año de cuatro dígitos (YYYYnnn). El argumento-2, cuando se añade al año en el momento de la ejecución, define el año final de un intervalo de 100 años, o ventana de siglo deslizante, en el que cae el año del argumento-1.
- DISPLAY-OF: La función DISPLAY-OF devuelve una cadena de caracteres alfanuméricos formada por el contenido del argumento-1 convertido a una representación de página de códigos específica.
- E: La función E devuelve una aproximación de e, la base de los logaritmos naturales.
- **EXP**: La función EXP devuelve una aproximación del valor de e elevado a la potencia del argumento.
- **EXP10**: La función EXP10 devuelve una aproximación del valor de 10 elevado a la potencia del argumento.
- FACTORIAL: La función FACTORIAL devuelve un número entero que es el factorial del argumento especificado.
- FORMATED-CURRENT-DATE: La función FORMATTED-CURRENT-DATE devuelve una cadena de caracteres que representa la fecha y hora actuales proporcionadas por el sistema en el que se evalúa la función. El contenido del valor devuelto se formatea según el formato del argumento.
- FORMATTED-DATE:La función FORMATTED-DATE convierte una fecha de su forma de fecha entera al formato solicitado.
- FORMATTED-DATETIME: La función FORMATTED-DATETIME utiliza un formato combinado de fecha y hora para convertir y combinar una fecha en forma de fecha entera y una hora numérica expresada como segundos después de medianoche en una representación formateada de fecha y hora según ese formato combinado de fecha y hora.
- FORMATTED-TIME: La función FORMATTED-TIME utiliza un formato para convertir un valor que representa los segundos pasada la medianoche en una hora del día formateada según el formato solicitado.
- HEX-OF: La función HEX-OF devuelve una cadena de caracteres alfanuméricos formada por los bytes del argumento de entrada convertidos a una representación hexadecimal.
- HEX-TO-CHAR: La función HEX-TO-CHAR devuelve una cadena de caracteres formada por bytes que corresponden a los caracteres de dígitos hexadecimales del argumento de entrada.
- INTEGER: La función INTEGER devuelve el mayor valor entero menor o igual que el argumento especificado.
- **INTEGER-OF-DATE**: La función INTEGER-OF-DATE convierte una fecha del calendario gregoriano de la forma de fecha estándar (AAAAMMDD) a la forma de fecha entera.
- **INTEGER-OF-DAY**: La función INTEGER-OF-DAY convierte una fecha del calendario gregoriano de la forma de fecha juliana (AAAADDD) a la forma de fecha entera.
- INTEGER-OF-FORMATTED-DATE:La función INTEGER-OF-FORMATTED-DATE convierte una fecha que está en un formato especificado a una forma de fecha entera.
- INTEGER-PART:La función INTEGER-PART devuelve un número entero que es la parte entera del argumento especificado.
- **LENGTH**: La función LENGTH devuelve un entero igual a la longitud del argumento en posiciones de caracteres nacionales para argumentos de uso NATIONAL y en posiciones de caracteres alfanuméricos o bytes para todos los demás argumentos. Una posición de carácter alfanumérico y un byte son equivalentes.
- **LOG**: La función LOG devuelve un valor numérico que aproxima el logaritmo en base e (logaritmo natural) del argumento especificado.
- **LOG10**: La función LOG10 devuelve un valor numérico que aproxima el logaritmo en base 10 del argumento especificado.
- **LOWERCASE**: La función LOWER-CASE devuelve una cadena de caracteres que contiene los caracteres del argumento con cada letra mayúscula sustituida por la letra minúscula correspondiente.
- **MAX**: La función MAX devuelve el contenido del argumento que contiene el valor máximo.
- **MEAN**: La función MEDIA devuelve un valor numérico que se aproxima a la media aritmética de sus argumentos.
- **MEDIAN**: La función MEDIAN devuelve el contenido del argumento cuyo valor es el valor medio de la lista formada ordenando los argumentos.
- MIDRANGE: La función MIDRANGE devuelve un valor numérico que se aproxima a la media aritmética de los valores del argumento mínimo y del argumento máximo.
- **MIN**: La función MIN devuelve el contenido del argumento que contiene el valor mínimo.
- **MOD**: La función MOD devuelve un valor entero que es el argumento-1 módulo del argumento-2.
- NATIONAL-OF: La función NATIONAL-OF devuelve una cadena de caracteres nacionales formada por la representación en caracteres nacionales de los caracteres del argumento-1.
- **NUMVAL**: La función NUMVAL devuelve el valor numérico representado por la cadena de caracteres alfanuméricos o la cadena de caracteres nacionales especificada como argumento. La función elimina cualquier espacio inicial o final de la cadena para obtener un valor numérico.
- NUMVAL-C: La función NUMVAL-C devuelve el valor numérico representado por la cadena de caracteres alfanuméricos o la cadena de caracteres nacionales especificada como argumento-1. La función elimina la cadena de moneda. La función elimina la cadena de moneda, si existe, y cualquier separador de agrupación (comas o puntos) para producir un valor numérico.
- NUMVAL-F: La función NUMVAL-F devuelve el valor numérico representado por la cadena de caracteres alfanuméricos o la cadena de caracteres nacionales especificada como argumento. La función elimina cualquier espacio inicial o final de la cadena para obtener un valor numérico.
- ORD: La función ORD devuelve un valor entero que es la posición ordinal de su argumento en la secuencia de intercalación del programa. La posición ordinal más baja es 1.
- ORD-MAX: La función ORD-MAX devuelve un valor que es la posición ordinal en la lista de argumentos del argumento que contiene el valor máximo.
- ORD-MIN: La función ORD-MIN devuelve un valor que es la posición ordinal en la lista de argumentos del argumento que contiene el valor mínimo.
- **PI**: La función PI devuelve un valor que es una aproximación de pi, el cociente entre la circunferencia de un círculo y su diámetro.
- PRESENT-VALUE: La función VALOR PRESENTE devuelve un valor que se aproxima al valor actual de una serie de importes de final de período futuros especificados por el argumento-2 a un tipo de descuento especificado por el argumento-1.
- **RANDOM**: La función RANDOM devuelve un valor numérico que es un número pseudoaleatorio de una distribución rectangular.
- RANGE: La función RANGE devuelve un valor igual al valor del argumento máximo menos el valor del argumento mínimo.
- REM: La función REM devuelve un valor numérico que es el resto del argumento-1 dividido por el argumento-2.
- REVERSE: La función REVERSE devuelve un valor de caracteres de la misma longitud que el argumento, cuyos caracteres son los mismos que los especificados en el argumento excepto que están en orden inverso. Para argumentos de tipo national, las posiciones de los caracteres se invierten; los caracteres UTF-16 que son pares sustitutos se tratan como un carácter y los caracteres UTF-16 que no son pares sustitutos se tratan como un carácter.
- SECONDS-FROM-FORMATTED-TIME: La función SECONDS-FROM-FORMATTED-TIME convierte una hora con un formato especificado en un valor numérico que representa el número de segundos transcurridos desde medianoche.
- SECONDS-PAST-MIDNIGHT: La función SECONDS-PAST-MIDNIGHT devuelve un valor en forma de hora numérica estándar que representa la hora local actual del día proporcionada por el sistema en el que se evalúa la función.
- **SIGN**: La función SIGNO devuelve +1, 0 ó -1 dependiendo del signo del argumento.
- SIN: La función SIN devuelve un valor numérico que se aproxima al seno del ángulo o arco especificado por el argumento en radianes.
- **SQRT**: La función SQRT devuelve un valor numérico que aproxima la raíz cuadrada del argumento especificado.
- STANDARD-DEVIATION:La función STANDARD-DEVIATION devuelve un valor numérico que aproxima la desviación estándar de sus argumentos.
- SUM: La función SUM devuelve un valor que es la suma de los argumentos.
- TAN: La función TAN devuelve un valor numérico que aproxima la tangente del ángulo o arco especificado por el argumento en radianes.
- **TEST-DATE-YYYYMMDD**: La función TEST-DATE-YYYYMMDD comprueba si una fecha en forma de fecha estándar (AAAAMMDD) es una fecha válida en el calendario gregoriano. El argumento 1 de la función INTEGER-OF-DATE debe estar en forma de fecha estándar.
- **TEST-DAY-YYYYDDD**: La función TEST-DAY-YYYYDDD comprueba si una fecha en forma de fecha juliana (YYYYDDD) es una fecha válida en el calendario gregoriano. El argumento 1 de la función INTEGER-OF-DAY debe estar en forma de fecha juliana.
- **TEST-FORMATTED-DATETIME**: La función TEST-FORMATTED-DATETIME comprueba si un dato que representa una fecha, una hora o una combinación de fecha y hora es válido según el formato especificado.
- TEST-NUMVAL: La función TEST-NUMVAL comprueba que el contenido del argumento-1 se ajusta a lo especificado para el argumento-1 de la función NUMVAL.
- TEST-NUMVAL-C: La función TEST-NUMVAL-C verifica que el contenido del argumento-1 se ajusta a la especificación para el argumento-1 de la función NUMVAL-C.
- TEST-NUMVAL-F: La función TEST-NUMVAL-F verifica que el contenido del argumento-1 se ajusta a la especificación para el argumento-1 de la función NUMVAL-F.
- **TRIM**: La función TRIM devuelve una cadena de caracteres que contiene los caracteres del argumento eliminando los espacios iniciales, finales o ambos.
- ULENGTH: La función ULENGTH devuelve un valor entero igual al número de caracteres UTF-8 o UTF-16 de un argumento de elemento de datos de caracteres que contiene datos UTF-8 o UTF-16.
- UPOS: La función UPOS devuelve un valor entero igual al índice del enésimo carácter UTF-8 o UTF-16 en un argumento de elemento de datos de caracteres que contiene UTF-8 o UTF-16.
- **UPPERCASE**: La función UPPER-CASE devuelve una cadena de caracteres que contiene los caracteres del argumento con cada letra minúscula sustituida por la letra mayúscula correspondiente.
- USUBSTR: La función USUBSTR devuelve una subcadena de los datos de un argumento de elemento de datos de caracteres que contiene datos UTF-8 o UTF-16.
USUPPLEMENTARY: La función USUPPLEMENTARY devuelve un valor entero igual al índice del primer carácter suplementario Unicode de un argumento de elemento de datos de caracteres codificado en UTF-8 o UTF-16.
- UUID4: La función UUID4 devuelve una cadena alfanumérica de 36 caracteres que es un identificador único universal de la versión 4 (UUID).
- UVALID: Si un elemento de datos de caracteres contiene datos UTF-8 o UTF-16 válidos, la función UVALID devuelve el valor cero. Si un elemento de datos de caracteres contiene datos UTF-8 o UTF-16 no válidos, la función UVALID devuelve el índice del primer elemento no válido.
- UWIDTH: La función UWIDTH devuelve un valor entero igual a la anchura en bytes del enésimo carácter UTF-8 o UTF-16 de un argumento de elemento de datos de caracteres codificado en UTF-8 o UTF-16.
- VARIANCE: La función VARIANCE devuelve un valor numérico que aproxima la varianza de sus argumentos.
- WHEN-COMPILED: La función WHEN-COMPILED devuelve la fecha y la hora en que se compiló el programa, tal y como las proporciona el sistema en el que se compiló el programa.
- YEAR-TO-YYYY: La función YEAR-TO-YYYY convierte el argumento-1, un año de dos dígitos, en un año de cuatro dígitos. El argumento-2, cuando se añade al año en el momento de la ejecución, define el año final de un intervalo de 100 años, o ventana de siglo deslizante, en el que cae el año del argumento-1. 

(Funciones intrínsecas)[https://www.ibm.com/docs/en/cobol-zos/6.4?topic=reference-intrinsic-functions]