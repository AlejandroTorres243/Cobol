# STRING

La sentencia STRING une el contenido parcial o total de dos o más datos o literales en un único dato. Se puede escribir una sentencia STRING en lugar de una serie de sentencias MOVE.

La sentencia STRING se utiliza para concatenar elementos no numéricos. Se puede concatenar cualquier número de elementos. Se pueden concatenar cadenas enteras o parciales. Para utilizar toda la cadena, delimítela por tamaño. Para utilizar sólo una parte de una cadena, delimítela por cualquier carácter que indique el final de los datos que desea concatenar.

![string](/images/string.png)

- **identifier-1, literal-1**: Representa los campos de envío.
- **DELIMITED BY**: Establece los límites de la cadena. Un delimitador para cada conjunto de campos de envío que, si se encuentra, hace que esos campos de envío dejen de transferirse (frase DELIMITED BY)
identifier-2 , literal-2 - Se utiliza como delimitadores; es decir, caracteres que delimitan los datos a transferir.
- **SIZE**: Transfiere el área de envío completa.
- **INTO**: Identifica el campo receptor (es decir, identifier-3 - Representa el campo receptor).
- **POINTER**(Opcional): Un dato entero que indica la posición del carácter más a la izquierda dentro del campo receptor al que deben transferirse los datos. identifier-4 es el campo puntero y debe ser lo suficientemente grande como para contener un valor igual a la longitud del campo receptor más 1.
- **ON OVERFLOW (Opcional)**: Acción a tomar si el campo receptor se llena antes de que todos los datos de envío hayan sido procesados.
- **END-STRING**: Este terminador de ámbito explícito sirve para delimitar el ámbito de la sentencia STRING.

**Reglas**
- Los campos receptores no deben ser:
    * Campo editado
    * Con cláusula Justificada
    * Con modificación de referencia
- Variable puntero debe ser:
    * Elemental y numérica
    * Suficientemente grande para contener la longitud máxima del campo receptor
- ON OVERFLOW se ejecuta cuando el valor del puntero <= o supera la longitud máxima del campo receptor

Ejemplo 1:

Cuando ejecutamos la siguiente sentencia STRING, los resultados obtenidos serán como los que se ilustran en la figura a continuación de la sentencia.

```
STRING ID-1 ID-2 DELIMITED BY ID-3
            ID-4 ID-5 DELIMITED BY SIZE
  INTO ID-7 WITH POINTER ID-8
END-STRING
```
![string-ex](/images/string-ex1.jpeg)
```
........
FILE SECTION.
01  RCD-01.
    05  CUST-INFO.
        10  CUST-NAME    PIC X(15).
        10  CUST-ADDR    PIC X(35).
    05  BILL-INFO.
        10  INV-NO       PIC X(6).
        10  INV-AMT      PIC $$,$$$.99.
        10  AMT-PAID     PIC $$,$$$.99.
        10  DATE-PAID    PIC X(8).
        10  BAL-DUE      PIC $$,$$$.99.
        10  DATE-DUE     PIC X(8).
........
WORKING-STORAGE SECTION.
77  RPT-LINE             PIC X(120).
77  LINE-POS             PIC S9(3).
77  LINE-NO              PIC 9(5) VALUE 1.
77  DEC-POINT            PIC X VALUE ".".
-----
PROCEDURE DIVISION.
    .......
    MOVE SPACES TO RPT-LINE.
    MOVE 4      TO LINE-POS.

    STRING
          LINE-NO SPACE CUST-INFO INV-NO SPACE DATE-DUE SPACE
      DELIMITED BY SIZE
          BAL-DUE
      DELIMITED BY DEC-POINT
      INTO RPT-LINE
      WITH POINTER LINE-POS
    END-STRING.
    -------
    STOP RUN.
```
Consideremos que el registro RCD-01 contiene la siguiente información (el símbolo b indica un espacio en blanco):

J.B.bSMITHbbbbb
444bSPRINGbST.,bCHICAGO,bILL.bbbbbb
A14275
$4,736.85
$2,400.00
09/22/76
$2,336.85
10/22/76

Cuando se ejecuta la sentencia STRING, los ítems se mueven a RPT-LINE como se muestra en la siguiente tabla.
| Item | Posiciones | Datos |
| - | - | - |
| LÍNEA-NO | 4 - 8 | 00001 |
| SPACES | 9 | b |
| CUST-INFO | 10 - 59 | J.B.bSMITHbbb444bSPRINGbST.,bCHICAGO,bILL.bbbbbb |
| INV-NO | 60 - 65 | A14275 |
| SPACES | 66 | b |
| DATE-DUE | 67 - 74 | 10/22/76 |
| SPACES | 75 | b @
| Parte de BAL-DUE que precede al punto decimal | 76 - 81 | $2,336 |

Después de ejecutar la sentencia STRING, el valor de LINE-POS es 82, y RPT-LINE tiene los valores:

```
column 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
value     00001 J.B. SMITH     444 SPRING ST., CHICAGO, ILL.      A14275 10/22/76 $2,336

```

# UNSTRING

La sentencia UNSTRING hace que los datos contiguos de un campo de envío se separen y se coloquen en varios campos de recepción.

La sentencia UNSTRING se utiliza para analizar elementos individuales de una misma cadena. Se puede analizar cualquier número de elementos. Se pueden analizar cadenas completas o parciales. Se analizarán tantos elementos como se proporcionen como operandos INTO.

![unstring](/images/unstring.png)

- **identifier-1**: Representa el campo emisor. Los datos se transfieren desde este campo a los campos receptores de datos (identifier-4). identifier-1 debe hacer referencia a una partida de datos de categoría alfabética, alfanumérica, alfanumérica-editada, DBCS, nacional o nacional-editada.
- **identifier-2, literal-1, identifier-3, literal-2**:  Especifica uno o varios delimitadores. identifier-2 e identifier-3 deben hacer referencia a elementos de datos de categoría alfabética, alfanumérica, alfanumérica editada, DBCS, nacional o nacional editada. literal-1 o literal-2 debe ser de categoría alfanumérica, DBCS o nacional y no debe ser una constante figurativa que empiece por la palabra ALL.
- **identifier-4**: Especifica uno o varios campos receptores. identifier-4 debe hacer referencia a un elemento de datos de categoría alfabética, alfanumérica, numérica, DBCS o nacional. Si el elemento de datos al que se hace referencia es de categoría numérica, su cadena de caracteres de imagen no debe contener el símbolo de imagen P, y su uso debe ser DISPLAY o NATIONAL.
- **identifier-5**: Especifica un campo para recibir el delimitador asociado con el identifier-4. El identifier-5 debe hacer referencia a un elemento de datos de categoría alfabética, alfanumérica, DBCS o nacional.
- **identifier-6**: Especifica un campo para recibir el recuento de caracteres que se transfieren al identifier-4.identifier-6 debe ser un elemento de datos entero definido sin el símbolo P en su cadena de caracteres PICTURE.
- **identifier-7**: Especifica un campo para mantener una posición relativa de carácter durante el procesamiento UNSTRING.identifier-7 debe ser un elemento de datos entero definido sin el símbolo P en su cadena de caracteres PICTURE.identifier-7 debe describirse como un elemento de datos de tamaño suficiente para contener un valor igual a 1 más el número de posiciones de caracteres en el elemento de datos referenciado por identifier-1.
- **identifier-8**: Especifica un campo que se incrementa por el número de campos delimitados procesados.identifier-8 debe ser un elemento de datos entero definido sin el símbolo P en su cadena de caracteres PICTURE.

**DELIMITED BY**

Esta frase especifica delimitadores dentro de los datos que controlan la transferencia de datos.

Cada identifier-2, identifier-3, literal-1 o literal-2 representa un delimitador.

Si no se especifica la frase DELIMITED BY, no deben especificarse las frases **DELIMITER IN** y **COUNT IN**.

**ALL**
Varias apariciones contiguas de cualquier delimitador se tratan como si sólo hubiera una; esta única aparición se traslada al campo receptor de delimitadores (identifier-5), si se especifica.

Los caracteres delimitadores del campo emisor se tratan como un elemento elemental del mismo uso y categoría que el identifier-1 y se desplazan al campo receptor de delimitadores actual de acuerdo con las reglas de la sentencia MOVE.

Cuando no se especifica DELIMITED BY ALL y se encuentran dos o más apariciones contiguas de cualquier delimitador, el campo receptor de datos actual (identifier-4) se rellena con espacios o ceros, según la descripción del campo receptor de datos.

**Delimitador con dos o más caracteres**
Un delimitador que contenga dos o más caracteres se reconoce como delimitador sólo si los caracteres delimitadores son a la vez:
- Contiguos
- En la secuencia especificada en el campo de envío

**Dos o más delimitadores**
Cuando se especifican dos o más delimitadores existe una condición OR, y cada aparición no solapada de cualquiera de los delimitadores se reconoce en el campo de envío en la secuencia especificada.

```
DELIMITED BY "AB" or "BC"
```
Una aparición de AB o BC en el campo de envío se considera un delimitador. Una aparición de ABC se considera una aparición de AB.

**INTO**

Esta frase especifica los campos a los que deben desplazarse los datos.

identifier-4 representa los campos de recepción de datos.

**DELIMITADOR IN**

Esta frase especifica los campos donde se van a mover los delimitadores.

identifier-5 representa los campos receptores de delimitadores.

La frase DELIMITER IN no debe especificarse si no se especifica la frase DELIMITED BY.

**COUNT IN**

Esta frase especifica el campo donde se mantiene el recuento de las posiciones de caracteres examinadas.

identifier-6 es el campo de recuento de datos para cada transferencia de datos. Cada campo contiene el recuento de posiciones de caracteres examinadas en el campo de envío, terminado por los delimitadores o el final del campo de envío, para el traslado a este campo de recepción. Los delimitadores no se incluyen en este recuento.

La frase COUNT IN no debe especificarse si no se especifica la frase DELIMITED BY.

**POINTER**

Cuando se especifica la frase POINTER, el valor del campo puntero, identifier-7, se comporta como si se incrementara en 1 por cada posición de carácter examinada en el campo emisor.

Cuando finaliza la ejecución de la sentencia UNSTRING, el campo puntero contiene un valor igual a su valor inicial más el número de posiciones de carácter examinadas en el campo emisor.

Cuando se especifica esta frase, el usuario debe inicializar el campo puntero antes de que comience la ejecución de la      sentencia UNSTRING.

**TALLYING IN**

Cuando se especifica la frase TALLYING, el campo contador de áreas, identifier-8, contiene (al final de la ejecución de la sentencia UNSTRING) un valor igual al valor inicial más el número de áreas receptoras de datos sobre las que se ha actuado.

Cuando se especifica esta frase, el usuario debe inicializar el campo de recuento de áreas antes de que comience la ejecución de la sentencia UNSTRING.

**ON OVERFLOW**

Existe una condición de desbordamiento cuando:
- El valor del puntero (explícito o implícito) es menor que 1.
- El valor del puntero (explícito o implícito) supera un valor igual a la longitud del campo emisor.
- Se ha actuado sobre todos los campos de recepción de datos y el campo de envío aún contiene posiciones de caracteres sin examinar.

**Cuando se produce una condición de desbordamiento**

Una condición de desbordamiento provoca las siguientes acciones:
- No se transfieren más datos.
- Se termina la operación UNSTRING.
- Se ignora la frase NOT ON OVERFLOW, si se ha especificado.
- El control se transfiere al final de la sentencia UNSTRING o, si se especifica la frase ON OVERFLOW, a imperative-statement-1.

**imperative statement-1**

Sentencia o sentencias para tratar una condición de desbordamiento.

Si el control se transfiere a imperative-statement-1, la ejecución continúa según las reglas para cada sentencia especificada en imperative- statement-1.

Si se ejecuta una sentencia condicional o de bifurcación de procedimiento que provoca la transferencia explícita del control, éste se transfiere según las reglas de dicha sentencia.

En caso contrario, al finalizar la ejecución de la imperative statement-1, el control se transfiere al final de la sentencia UNSTRING.

**Cuando no se produce una condición de desbordamiento**

Cuando, durante la ejecución de una sentencia UNSTRING, no se dan las condiciones que provocarían una condición de desbordamiento, entonces:
- Se completa la transferencia de datos.
- La frase ON OVERFLOW, si se especifica, se ignora.
- El control se transfiere al final de la sentencia UNSTRING o, si se especifica la frase NOT ON OVERFLOW, a imperative-statement-2.

**imperative statement-2**

Sentencia o sentencias para tratar una condición de desbordamiento que no se produce.

Si el control se transfiere a imperative-statement-2, la ejecución continúa según las reglas para cada sentencia especificada en imperative- statement-2. Si se ejecuta una sentencia condicional o de bifurcación de procedimiento que provoca la transferencia explícita del control, éste se transfiere de acuerdo con las reglas de dicha sentencia. En caso contrario, al finalizar la ejecución de la imperative statement-2, el control se transfiere al final de la sentencia UNSTRING.

**END-UNSTRING**

Este terminador de ámbito explícito sirve para delimitar el ámbito de la sentencia UNSTRING. END-UNSTRING permite anidar una sentencia UNSTRING condicional en otra sentencia condicional. END-UNSTRING también puede utilizarse con una sentencia UNSTRING imperativa.

Consejos:
- Los operandos deben ser no numéricos.
- Los operandos POINTER y COUNT, si los hay, deben ser enteros positivos es decir sus cuadros deben contener sólo 9's.
- Inicializar los elementos receptores antes del UNSTRING, para eliminar caracteres no deseados que puedan quedar de una operación anterior.
- Utilice la cláusula OVERFLOW para detectar el desbordamiento de campo en el campo o campos receptores.
 
**Ejemplo 1**

```
UNSTRING ID-SEND DELIMITED BY DEL-ID OR ALL "*"
    INTO ID-R1 DELIMITED IN ID-D1 COUNT IN ID-C1
         ID-R2 DELIMITED IN ID-D2
         ID-R3 DELIMITED IN ID-D3 COUNT IN ID-C3
         ID-R4 COUNT IN ID-C1
    WITH POINTER ID-P
    TALLYING IN ID-T
    ON OVERFLOW GO TO OFLOW-EXIT

ID-P(pointer) = 21
ID-T(tallying field) = 05

```

![unstring-ex1](/images/unstring-ex1.jpeg)

**Orden de ejecución**:

1. 3 caracteres se colocan en ID-R1.
2. Como se especifica ALL *, se procesan todos los asteriscos consecutivos, pero en ID-01 se coloca un asterisco.
3. Se colocan 5 caracteres en ID-R2.
4. Se coloca un ? en ID-R2. El campo de recepción actual es ahora ID-R3.
5. Se coloca un ? en ID-D3; ID-R3 se rellena con espacios. no se transfieren caracteres, por lo que se coloca un 0 en ID-C3.
6. No se encuentra ningún delimitador antes de que 5 caracteres llenen ID-R4; se coloca 8 en ID-C4, que representa el número de caracteres examinados desde el último delimitador.
7. ID-P se actualiza a 21, la longitud total del campo de envío +1. ID-T se actualiza a 5, el número de campos sobre los que se ha actuado +1, puesto que no hay caracteres no examinados en el ID-envío, no se toma la SALIDA DE SOBREFLUJO.

**Ejemplo 2**

```
........
FILE SECTION.
*  Record to be acted on by the UNSTRING statement:
 01  INV-RCD.
     05  CONTROL-CHARS               PIC XX.
     05  ITEM-INDENT                 PIC X(20).
     05  FILLER                      PIC X.
     05  INV-CODE                    PIC X(10).
     05  FILLER                      PIC X.
     05  NO-UNITS                    PIC 9(6).
     05  FILLER                      PIC X.
     05  PRICE-PER-M                 PIC 99999.
     05  FILLER                      PIC X.
     05  RTL-AMT                     PIC 9(6).99.
*
*  UNSTRING receiving field for printed output:
 01  DISPLAY-REC.
     05  INV-NO                      PIC X(6).
     05  FILLER                      PIC X VALUE SPACE.
     05  ITEM-NAME                   PIC X(20).
     05  FILLER                      PIC X VALUE SPACE.
     05  DISPLAY-DOLS                PIC 9(6).
*
*  UNSTRING receiving field for further processing:
 01  WORK-REC.
     05  M-UNITS                     PIC 9(6).
     05  FIELD-A                     PIC 9(6).
     05  WK-PRICE REDEFINES FIELD-A  PIC 9999V99.
     05  INV-CLASS                   PIC X(3).
*
*  UNSTRING statement control fields:
 77  DBY-1                           PIC X.
 77  CTR-1                           PIC S9(3).
 77  CTR-2                           PIC S9(3).
 77  CTR-3                           PIC S9(3).
 77  CTR-4                           PIC S9(3).
 77  DLTR-1                          PIC X.
 77  DLTR-2                          PIC X.
 77  CHAR-CT                         PIC S9(3).
 77  FLDS-FILLED                     PIC S9(3).
-----
column 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
DATA   ZYFOUR-PENNY-NAILS     707890/BBA 475120 00122 000379.50

* Move subfields of INV-RCD to the subfields of DISPLAY-REC
* and WORK-REC:
     UNSTRING INV-RCD
       DELIMITED BY ALL SPACES  OR "/"  OR DBY-1
       INTO ITEM-NAME    COUNT IN CTR-1
            INV-NO       DELIMITER IN DLTR-1  COUNT IN CTR-2
            INV-CLASS
            M-UNITS      COUNT IN CTR-3
            FIELD-A
            DISPLAY-DOLS DELIMITER IN DLTR-2  COUNT IN CTR-4
       WITH POINTER CHAR-CT
       TALLYING IN  FLDS-FILLED
       ON OVERFLOW  GO TO UNSTRING-COMPLETE.
```

En la PROCEDURE DIVISION estos ajustes se producen antes de la sentencia UNSTRING:
- Se coloca un punto (.) en DBY-1 para utilizarlo como delimitador.
- CHAR-CT (el campo POINTER) se fija en 3.
- El valor cero (0) se coloca en FLDS-FILLED (el campo TALLYING).
- Los datos se leen en el registro INV-RCD, cuyo formato es el que se muestra a continuación.

Como el campo POINTER CHAR-CT tiene el valor 3 antes de que se ejecute la sentencia UNSTRING, se ignoran las dos posiciones de caracteres del campo CONTROL-CHARS en INV-RCD.

Una vez ejecutada la sentencia UNSTRING, los campos contienen los valores que se muestran a continuación.

| Field | Value |
| - | - |
| DISPLAY-REC | 707890bFOUR-PENNY-NAILSbbbbbbbbbbbb000379 |
| WORK-REC | 475120000122BBA |
| CHAR-CT (campo POINTER) |	55 |
| FLDS-FILLED (campo TALLYING) | 6 |

**Explicación de la ejecución**:

1. Las posiciones 3 a 18 (CUATRO-CARACTERES) de INV-RCD se colocan en ITEM-NAME, justificadas a la izquierda en el área, y las cuatro posiciones de caracteres no utilizadas se rellenan con espacios. El valor 16 se coloca en CTR-1.
2. Dado que ALL SPACES se codifica como un delimitador, los cinco caracteres de espacio contiguos en las posiciones 19 a 23 se consideran como una ocurrencia del delimitador.
3. Las posiciones 24 a 29 (707890) se colocan en INV-NO. El carácter delimitador barra (/) se coloca en DLTR-1, y el valor 6 se coloca en CTR-2.
4. Las posiciones 31 a 33 (BBA) se colocan en INV-CLASS. El delimitador es SPACE, pero como no se ha definido ningún campo como zona receptora de delimitadores, el espacio de la posición 34 se omite.
5. Las posiciones 35 a 40 (475120) se colocan en M-UNITS. El valor 6 se coloca en CTR-3. El delimitador es SPACE, pero como no se ha definido ningún campo como zona receptora de delimitadores, el espacio de la posición 41 se omite.
6. Las posiciones 42 a 46 (00122) se colocan en FIELD-A y se justifican a la derecha en el área. La posición del dígito de orden superior se rellena con un cero (0). El delimitador es ESPACIO, pero como no se ha definido ningún campo como área receptora de delimitadores, el espacio de la posición 47 se omite.
7. Las posiciones 48 a 53 (000379) se colocan en DISPLAY-DOLS. El delimitador punto (.) en DBY-1 se coloca en DLTR-2, y el valor 6 se coloca en CTR-4.
8. Como se ha actuado sobre todos los campos receptores y no se han examinado dos caracteres en INV-RCD, se ejecuta la sentencia ON OVERFLOW. Finaliza la ejecución de la sentencia UNSTRING.

# INSPECT

La sentencia INSPECT se utiliza para realizar diversas operaciones con datos de cadena. Cada uno de los cuatro formatos funciona de forma ligeramente diferente y se describe a continuación,

1. **INSPECT TALLYING**: Este formato se utiliza para contar ocurrencias de caracteres o cadenas dentro de otra cadena.
2. **INSPECT REPLACING**: Este formato se utiliza para reemplazar caracteres o cadenas dentro de otra cadena. Las cadenas sustituidas deben tener la misma longitud que la cadena original.
3. **INSPECT TALLYING REPLACING**: Este formato se utiliza para contar mientras se reemplazan ocurrencias de caracteres o cadenas dentro de otra cadena. Es básicamente una combinación de los dos primeros formatos.
4. **INSPECT CONVERTING**: Este formato se utiliza para reemplazar ocurrencias de caracteres dentro de otra cadena utilizando sólo un INSPECTO. Cualquier ocurrencia en el primer carácter del CONVERTIR en la cadena inspeccionada será reemplazada por el primer carácter en la cadena TO, mientras que las ocurrencias del segundo carácter en la cadena CONVERTIR serán reemplazadas por el segundo carácter en la cadena TO, y así sucesivamente. La cadena CONVERTIR debe tener la misma longitud que la cadena A.


## INSPECT TALLYING

La opción Tallying se utiliza para contar los caracteres de la cadena.

```
INSPECT identifier-1 TALLYING identifier-2 FOR CHARACTERS.
INSPECT identifier-1 TALLYING identifier-2 FOR CHARACTERS [BEFORE/AFTER] [INITIAL] identifier-3 or literal-1.
INSPECT identifier-1 TALLYING identifier-2 FOR ALL [BEFORE/AFTER] [INITIAL] identifier-3 or literal-1.
INSPECT identifier-1 TALLYING identifier-2 FOR LEADINGS [BEFORE/AFTER] [INITIAL] identifier-3 or literal-1.
```

Esta frase cuenta las apariciones de un carácter específico o de un carácter especial en un elemento de datos.
- **identifier-1** es el elemento inspeccionado y puede ser un elemento de grupo alfanumérico o un elemento de grupo nacional.
- **identifier-2** es el campo de recuento y debe ser un elemento entero elemental.
- **identifier-3 o literal-1** es el campo de recuento (el elemento cuyas ocurrencias se contarán).
- **CHARACTERS** Cuando se especifica CHARACTERS y no se especifica la frase BEFORE ni AFTER, el campo de recuento (identifier-2) se incrementa en 1 por cada carácter (incluido el carácter de espacio) en el elemento inspeccionado (identifier-1). Así, la ejecución de una sentencia INSPECT con la frase TALLYING incrementa el valor del campo count en el número de posiciones de caracteres en el elemento inspeccionado.
- **ALL** Cuando se especifica ALL y no se especifica la frase BEFORE ni AFTER, el campo de recuento (identifier-2) se incrementa en 1 por cada aparición no solapada del comparando de recuento (identifier-3 o literal-1) en el elemento inspeccionado (identifier-1), comenzando en la posición de carácter más a la izquierda y continuando hasta la más a la derecha.
- **LEADING** Cuando se especifica LEADING y no se especifica la frase BEFORE ni AFTER, el campo de recuento (identifier-2) se incrementa en 1 por cada aparición contigua no solapada del comparando de recuento en el elemento inspeccionado (identifier-1), siempre que la aparición más a la izquierda se encuentre en el punto donde comenzó la comparación en el primer ciclo de comparación para el que el comparando de recuento es elegible para participar.

```
01 WS-STRING PIC X(15) VALUE 'ABCDACDADEAAAFF'.
...........
      INSPECT WS-STRING TALLYING WS-CNT1 FOR CHARACTER.
      DISPLAY "WS-CNT1 : "WS-CNT1.

      INSPECT WS-STRING TALLYING WS-CNT2 FOR ALL 'A'.
      DISPLAY "WS-CNT2 : "WS-CNT2.

WS-CNT1 : 15
WS-CNT2 : 06
```

## INSPECT REPLACING

Esta frase rellena todos o parte de un elemento de datos con caracteres especificados, como espacios o ceros.

```
INSPECT identifier-1 REPLACING CHARACTERS BY identifier-5 or literal-3.
INSPECT identifier-1 REPLACING CHARACTERS BY identifier-5 or literal-3 [BEFORE/AFTER] [INITIAL] identifier-4 or literal-2.
INSPECT identifier-1 REPLACING ALL identifier-3 or literal-1 BY identifier-5 or literal-3.
INSPECT identifier-1 REPLACING ALL identifier-3 or literal-1 BY identifier-5 or literal-3 [BEFORE/AFTER] [INITIAL] identifier-4 or literal-2.
INSPECT identifier-1 REPLACING LEADING identifier-3 or literal-1 BY identifier-5 or literal-3.
INSPECT identifier-1 REPLACING LEADING identifier-3 or literal-1 BY identifier-5 or literal-3 [BEFORE/AFTER] [INITIAL] identifier-4 or literal-2.
INSPECT identifier-1 REPLACING FIRST identifier-3 or literal-1 BY identifier-5 or literal-3.
INSPECT identifier-1 REPLACING FIRST identifier-3 or literal-1 BY identifier-5 or literal-3 [BEFORE/AFTER] [INITIAL] identifier-4 or literal-2.
```

Esta frase cuenta las apariciones de un carácter específico o de un carácter especial en un elemento de datos.

- **identifier-1**: es el elemento inspeccionado y puede ser un elemento de grupo alfanumérico o un elemento de grupo nacional.
- **identifier-3 o literal-1**: es el campo de asunto, que identifica los caracteres que deben sustituirse.
- **identifier-5 o literal-3**: es el campo de sustitución (el elemento que sustituye al campo de asunto). El campo de asunto y el campo de sustitución deben tener la misma longitud.
- **CHARACTERS BY**: Cuando se utiliza la frase CHARACTERS BY, el campo de sustitución debe tener una posición de carácter de longitud. Cuando se especifica CHARACTERS BY y no se especifica la frase BEFORE ni AFTER, el campo de sustitución reemplaza cada carácter del elemento inspeccionado (identifier-1), comenzando en la posición de carácter más a la izquierda y continuando hasta la más a la derecha.
- **ALL**: Cuando se especifica ALL y no se especifica la frase BEFORE ni AFTER, el campo de sustitución reemplaza cada aparición no superpuesta del campo de asunto en el elemento inspeccionado (identifier-1), comenzando en la posición del carácter más a la izquierda y continuando hasta el más a la derecha.
- **LEADING**: Cuando se especifica LEADING y no se especifica la frase BEFORE ni AFTER, el campo de sustitución sustituye a cada ocurrencia contigua no superpuesta del campo de asunto en el elemento inspeccionado (identifier-1), siempre que la ocurrencia más a la izquierda se encuentre en el punto donde comenzó la comparación en el primer ciclo de comparación para el que este campo de sustitución es elegible para participar.
- **FIRST**: Cuando se especifica PRIMERO y no se especifica la frase ANTES ni DESPUÉS, el campo de sustitución sustituye a la aparición más a la izquierda del campo de asunto en el elemento inspeccionado (identifier-1).

```
  77  COUNTR            PIC 9   VALUE ZERO.
  01  DATA-3            PIC X(8).
  . . .
      INSPECT DATA-3
        REPLACING CHARACTERS BY ZEROS BEFORE INITIAL QUOTE.
```

| DATA-3 antes | COUNTR después | DATA-3 después |
| - | - | - |
| 456"ABEL | 0 | 000"ABEL |
| ANDES"12 | 0 | 00000"12 |
| "TWAS BR | 0 | "TWAS BR |

## INSPECT TALLYING REPLACING

Cuenta las apariciones de caracteres específicos y rellena todos o parte de un elemento de datos con caracteres especificados, como espacios o ceros. Es una combinación de las sintaxis TALLING y REPLACING. La única diferencia es en la frase **FIRST**.

Cuando se especifica FIRST y no se especifica la frase BEFOREni AFTER, el campo de sustitución sustituye a la ocurrencia más a la izquierda del campo de asunto en el elemento inspeccionado (identifier-1).

Cuando se especifican las frases TALLYING y REPLACING, la sentencia INSPECT se ejecuta como si se especificara una sentencia INSPECT TALLYING, seguida inmediatamente por una sentencia INSPECT REPLACING.

Se aplican las siguientes reglas de sustitución:
- Cuando el campo de asunto es una constante figurativa, el campo de sustitución de un carácter sustituye a cada carácter del elemento inspeccionado que sea equivalente a la constante figurativa.
- Cuando el campo de sustitución es una constante figurativa, el campo de sustitución sustituye a cada aparición no solapada del campo de asunto en el elemento inspeccionado.
- Cuando los campos de asunto y sustitución son cadenas de caracteres, la cadena de caracteres especificada en el campo de sustitución sustituye a cada aparición no solapada del campo de asunto en el elemento inspeccionado.
- Una vez que se ha producido la sustitución en una posición de carácter determinada del elemento inspeccionado, no se realiza ninguna otra sustitución para esa posición de carácter en esta ejecución de la sentencia INSPECT.

```
77  COUNTR            PIC 9   VALUE ZERO.
01  DATA-2            PIC X(11).
. . .
    INSPECT DATA-2
      TALLYING COUNTR FOR LEADING "0"
      REPLACING FIRST "A" BY "2" AFTER INITIAL "C".
```

| DATA-2 antes | COUNTR después | DATA-2 después |
| - | - | - | 
| 00ACADEMY00 |	2 |	00AC2DEMY00 |
| 0000ALABAMA |	4 | 0000ALABAMA |
| CHATHAM0000 | 0 |	CH2THAM0000 |

## INSPECT CONVERTING

Convierte todas las apariciones de un carácter específico o cadena de caracteres en un elemento de datos (identifier-1) en caracteres de sustitución proporcionados por el usuario.

```
INSPECT identifier-1 CONVERTING identifier-6 or literal-4 TO identifier-7 or literal-5
INSPECT identifier-1 CONVERTING identifier-6 or literal-4 TO identifier-7 or literal-5 [BEFORE/AFTER] [INITIAL] identifier-4 or literal-2.
```

Esta frase cuenta las apariciones de un carácter específico o de un carácter especial en un elemento de datos.
- **identifier-1**. Es el elemento inspeccionado y puede ser un elemento de grupo alfanumérico o un elemento de grupo nacional.
- **identifier-6 o literal-4**: Especifica la cadena de caracteres que debe sustituirse. El mismo carácter no debe aparecer más de una vez ni en el literal-4 ni en el identifier-6.
- **identifier-7 o literal-5**: Especifica la cadena de caracteres de sustitución. La cadena de caracteres de sustitución (identifier-7 o literal-5) debe tener el mismo tamaño que la cadena de caracteres sustituida (identifier-6 o literal-4).

```
01  DATA-4            PIC X(11).
. . .
    INSPECT DATA-4
      CONVERTING
         "abcdefghijklmnopqrstuvwxyz" TO
         "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      AFTER INITIAL "/"
      BEFORE INITIAL"?"
```

| DATA-4 antes | DATA-4 después |
| - | - | 
| a/five/?six | a/FIVE/?six |
| r/Rexx/RRRr | r/REXX/RRRR |
| zfour?inspe | zfour?inspe |

## Frases BEFORE y AFTER (en todos los casos)

Esta frase reduce el conjunto de elementos que se cuentan o sustituyen.

No se puede especificar más de una frase ANTES y una frase DESPUÉS para cualquier frase ALL, LEADING, CHARACTERS, FIRST o CONVERTING.

- **indentifier-4 o literal-2** es el delimitador. Los delimitadores no se cuentan ni se sustituyen.
- **INITIAL**: La primera aparición de un elemento especificado. Las frases BEFORE y AFTER cambian la forma de contar y reemplazar:
    * Cuando se especifica BEFORE, el recuento o la sustitución del elemento inspeccionado (indentifier-1) comienza en la posición del carácter más a la izquierda y continúa hasta que se encuentra la primera aparición del delimitador. Si no hay ningún delimitador en el elemento inspeccionado, el recuento o la sustitución continúa hacia la posición del carácter situado más a la derecha.
    * Cuando se especifica AFTER, el recuento o la sustitución del elemento inspeccionado (indentifier-1) comienza con la primera posición de carácter a la derecha del delimitador y continúa hacia la posición de carácter más a la derecha del elemento inspeccionado. Si no hay ningún delimitador en el elemento inspeccionado, no se realiza ningún recuento ni sustitución.
- INSPECT REPLACING puede utilizarse para convertir los espacios a la izquierda en ceros, en un elemento numérico: 
```
INSPECT LEADING-SPACE-ITEM REPLACING LEADING SPACES BY ZEROS.
```    
- INSPECT CONVERTING puede utilizarse para convertir minúsculas en mayúsculas:
```
INSPECT MIXED-CASE-ITEM CONVERTING "abcde..." TO "ABCDE...".
```
