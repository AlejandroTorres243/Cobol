# Trabajando con ficheros

## Conceptos básicos
- Campo
- Registro
- Registro físico
- Registro lógico
- Fichero

``````
01 EMPLOYEE-DETAILS
   05 EMPLOYEE-ID   PIC 9(05).
   05 EMPLOYEE-NAME PIC X(20).
   05 EMPLOYEE-GRADE PIC X(01).
   05 EMPLOYEE-SALARY PIC 9(10).
``````

![file](/images/file.jpg)

### Campo

Campo se utiliza para indicar los datos almacenados sobre un elemento. Representa un único elemento, como se muestra en el ejemplo anterior, como el ID del empleado, el nombre del empleado, el grado del empleado y el salario del empleado. El número de caracteres de cualquier campo se conoce como tamaño de campo.

Por ejemplo, el nombre del empleado puede tener 20 caracteres. Los campos pueden tener los siguientes atributos:

- Las claves primarias son aquellos campos que son únicos para cada registro y se utilizan para identificar un registro en particular. Por ejemplo, en el archivo de empleados, cada empleado tendrá un ID de empleado único que constituye la clave primaria.
- Las claves secundarias son campos únicos o no únicos que se utilizan para buscar datos relacionados. Por ejemplo, en el fichero de empleados, el nombre completo del empleado puede utilizarse como clave secundaria cuando no se conoce el ID del empleado.
- Los campos descriptores se utilizan para describir una entidad. Por ejemplo, en el fichero de empleados, el grado y el salario del empleado, que añaden significado al registro, son descriptores conocidos.

### Registro

Un registro es un conjunto de campos que se utilizan para describir una entidad. Uno o varios campos juntos forman un registro. Por ejemplo, en un fichero de empleados, el ID del empleado, el nombre del empleado, el grado del empleado y el salario del empleado forman un registro. El tamaño acumulado de todos los campos de un registro se conoce como tamaño del registro. Los registros de un fichero pueden ser de longitud fija o variable.

### Registro físico 

El registro físico es la información que existe en el dispositivo externo. También se conoce como bloque.

### Registro lógico 

Registro lógico es la información utilizada por el programa. En los programas COBOL, sólo un registro puede ser manejado en cualquier punto del tiempo y se llama como registro lógico.

### Fichero

Archivo es una colección de registros relacionados. Por ejemplo, el archivo de los empleados se compone de registros de todos los empleados.

## Pasos para procesar un fichero 


1. Declaración de las especificaciones del archivo en la ENVIRONMENT DIVISION.
2. Definición de las especificaciones del registro en la DATA DIVISION.
3. Abrir el fichero en la PROCEDURE DIVISION.
4. Procesar el fichero en lal PROCEDURE DIVISION: READ / WRITE / REWRITE / DELETE.
5. Cerrar el fichero en la PROCEDURE DIVISION.

```
IDENTIFICATION DIVISION.
. . .
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT <filename> ASSIGN TO <assignment-name>   (1) (2)
    ORGANIZATION IS <org>  ACCESS MODE IS <access>   (3) (4)
    FILE STATUS IS <file-status>   (5)
    . . .
DATA DIVISION.
FILE SECTION.
FD  <filename>
01  <recordname>   (6)
    nn . . . <fieldlength & type>   (7) (8)
    nn . . . <fieldlength & type>
    . . .
WORKING-STORAGE SECTION.
01  <file-status>     PIC 99.
    . . .
PROCEDURE DIVISION.
    OPEN <iomode> <filename>    (9)
    . . .
    READ <filename>
    . . .
    WRITE <recordname>
    . . .
    CLOSE <filename>
  STOP RUN.
```

### filename

Cualquier nombre COBOL válido. Debe utilizar el mismo nombre de archivo en la cláusula SELECT y en la entrada FD, así como en las sentencias OPEN, READ, START, DELETE y CLOSE.

Este nombre no es necesariamente el nombre de archivo del sistema. Cada fichero requiere su propia cláusula SELECT, entrada FD y sentencias de entrada/salida. Para WRITE y REWRITE, se especifica un registro definido para el fichero.

### assignment-name

Puede codificar ASSIGN TO nombre-asignación para especificar directamente el ID del sistema de archivos de destino y el nombre de archivo del sistema, o puede establecer el valor indirectamente utilizando una variable de entorno. Este nombre se utiliza en el nombre DD de JCL para acceder al archivo.

Si desea que el nombre de archivo del sistema se identifique en el momento de OPEN, especifique ASSIGN USING nombre-datos. Se utiliza el valor de data-name en el momento de la ejecución de la sentencia OPEN para ese fichero. Opcionalmente, puede preceder el nombre de archivo del sistema por el identificador del sistema de archivos, utilizando un guión como separador.

### org

Indica la organización: LINE SEQUENTIAL, SEQUENTIAL, INDEXED, or RELATIVE. Si omite esta cláusula, el valor por defecto es ORGANIZATION SEQUENTIAL.

### access

Indica el modo de acceso: SECUENCIAL, RANDOM o DYNAMIC. Si se omite esta cláusula, el valor por defecto es ACCESS SEQUENTIAL.

### file-status

Contiene un código de estado del fichero. Puede especificar la clave de estado del archivo como un elemento de datos alfanumérico o nacional de dos caracteres, o como un elemento display o nacional de dos dígitos.

### recordname

El nombre del registro utilizado en las sentencias WRITE y REWRITE. Se puede especificar más de un registro para un fichero.

### fieldlength

La longitud lógica del campo.

### type 

Debe coincidir con el formato de registro del fichero. Si rompe la entrada de descripción del registro más allá de la descripción de nivel-01, asigne cada elemento con precisión a los campos del registro.

### iomode

Especifica el modo de apertura. Si sólo lee de un archivo, introduzca el código INPUT. Si sólo está escribiendo en un archivo, codifique OUTPUT (para abrir un nuevo archivo o escribir sobre uno existente) o EXTEND (para añadir registros al final del archivo). Si haces ambas cosas, codifica I-O.

### Indicador de posición del fichero

El indicador de posición del fichero marca el siguiente registro al que se debe acceder para las peticiones COBOL secuenciales.

Usted no establece explícitamente el indicador de posición de archivo en cualquier parte de su programa. Se establece por el éxito de OPEN, START, READ, READ NEXT, y READ PREVIOUS. Peticiones subsecuentes de READ, READ NEXT, o READ PREVIOUS usan la posición del indicador de posición de archivo establecido y lo actualizan.

El indicador de posición de fichero no se utiliza ni se ve afectado por las sentencias de salida WRITE, REWRITE o DELETE. El indicador de posición de fichero no tiene ningún significado para el procesamiento aleatorio.

## Organización de un fichero

La organización del fichero indica cómo se organizan los registros en un fichero. Dependiendo de los dispositivos de entrada-salida, la organización del fichero puede ser secuencial, secuencial por líneas, indexada o relativa. 

1. Organización SEQUENTIAL.
   - El orden cronológico en el que se introducen los registros cuando se crea un fichero establece la disposición de los registros.
   - Cada registro, excepto el primero, tiene un único registro predecesor, y cada registro, excepto el último, tiene un único registro sucesor. Una vez establecidas, estas relaciones no cambian.
   - El modo de acceso (transmisión de registros) permitido para los archivos secuenciales es sólo secuencial.
2. Organización LINE-SEQUENTIAL.
   - Los archivos secuenciales de línea son archivos secuenciales que residen en el sistema jerárquico de archivos (HFS) y que sólo contienen caracteres como datos.
   - Cada registro termina con un carácter de nueva línea.
   - El único modo de acceso (transmisión de registros) permitido para los archivos secuenciales de línea es el secuencial.
3. Organización INDEXED.
   - Cada registro del fichero contiene un campo especial cuyo contenido constituye la clave del registro. La posición de la clave es la misma en cada registro.
   - El componente de índice del fichero establece la disposición lógica del fichero, una ordenación por clave de registro.
   - La disposición física real de los registros en el archivo no es importante para su programa COBOL.
   - Un archivo indexado también puede utilizar índices alternativos, además de la clave de registro. Estas claves le permiten acceder al archivo utilizando un orden lógico diferente de los registros.
   - Los modos de acceso (transmisión de registros) permitidos para los archivos indexados son secuenciales, aleatorios o dinámicos.
   - Cuando se leen o escriben ficheros indexados secuencialmente, la secuencia es la de los valores clave.
4. Organización RELATIVE.
   - Los registros del archivo se identifican por su ubicación relativa al principio del archivo.
   - El primer registro del archivo tiene un número de registro relativo de 1, el décimo registro tiene un número de registro relativo de 10, y así sucesivamente.
   - Los modos de acceso (transmisión de registros) permitidos para los ficheros relativos son secuencial, aleatorio o dinámico. Cuando los ficheros relativos se leen o escriben secuencialmente, la secuencia es la del número de registro relativo.

### Elegir la organización del fichero y el modo de acceso:

Hay varias directrices que puede utilizar para determinar qué organización de archivos y modo de acceso utilizar en una aplicación.

Tenga en cuenta las siguientes directrices a la hora de elegir la organización de archivos:

   - Si una aplicación accede a registros (ya sean de longitud fija o variable) sólo secuencialmente y no inserta registros entre registros existentes, un archivo secuencial QSAM o VSAM es el tipo más sencillo.
   - Si está desarrollando una aplicación para UNIX que accede secuencialmente a registros que sólo contienen caracteres imprimibles y determinados caracteres de control, los archivos LINE-SEQUENTIAL son los más adecuados.
   - Si una aplicación requiere tanto acceso secuencial como aleatorio (tanto si los registros son de longitud fija como variable), un archivo INDEXED VSAM es el tipo más flexible.
   - Si una aplicación inserta y borra registros aleatoriamente, un archivo RELATIVE funciona bien.

Tenga en cuenta las siguientes directrices a la hora de elegir el modo de acceso:

   - Si en una aplicación se hace referencia o se actualiza un gran porcentaje de un archivo, el acceso secuencial es más rápido que el acceso aleatorio o dinámico.
   - Si se procesa un pequeño porcentaje de registros durante cada ejecución de una aplicación, utilice el acceso aleatorio o dinámico.

Resumen de las organizaciones de archivos, modos de acceso y formatos de registro de archivos COBOL

| Organización | SEQUENTIAL | RANDOM | DYNAMIC | Long.fija | Long.variable |
| - | - | - | - | - | - |
| QSAM (secuencial físico) | X| | | X | X |
| Secuencial de línea | X | | | X | X |
| VSAM secuencial (ESDS) | X | | | X | X |
| VSAM indexado (KSDS) | X | X | X | X | X |
| VSAM relativa (RRDS) | X | X | X | X | X |

## Modo de acceso

El modo de acceso se utiliza para definir la forma de acceder al fichero en función de los requisitos del programa. En pocas palabras, podemos decir que el modo de acceso define cómo se requiere leer y escribir datos del archivo.

Existen 3 modos de acceso: 
1. Acceso Secuencial
2. Acceso Aleatorio
3. Acceso Dinámico

Ahora, vamos a ver cómo definir un archivo en COBOL con el modo de acceso correcto,

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT [OPTIONAL] filename ASSIGN TO ddname.
    ORGANIZATION IS {SEQUENTIAL/INDEXED/RELATIVE}.
    [ACCESS IS {SEQUENTIAL/RANDOM/DYNAMIC}].
    [RECORD KEY IS ws-key].
    [RELATIVE KEY IS ws-rel-rrn].
    [ALTERNATE RECORD KEY IS ws-key {WITH/WITHOUT} DUPLICATES].
    [FILE STATUS IS ws-status].
```
### ACCESS IS SEQUENTIAL

Como su nombre indica, los registros del fichero pueden leerse secuencialmente para el acceso secuencial, es decir, uno tras otro desde el principio.

El método para recuperar el registro varía en función de la organización del fichero elegida.

En los ficheros secuenciales, los registros se recuperan del mismo modo en que se insertaron.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT file-name ASSIGN TO dd-name
    ORGANIZATION IS SEQUENTIAL
    ACCESS MODE IS SEQUENTIAL.
```

Para los ficheros indexados, se accede a los registros en el orden del fichero clave seleccionado, comenzando en la posición actual del indicador de posición del fichero.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT file-name ASSIGN TO dd-name
    ORGANIZATION IS INDEXED
    ACCESS MODE IS SEQUENTIAL
    RECORD KEY IS rec-key1
    ALTERNATE RECORD KEY IS rec-key2.
```

Para los ficheros relativos, se accede a los registros en el orden del número de registro relativo.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT file-name ASSIGN TO dd-name
    ORGANIZATION IS RELATIVE
    ACCESS MODE IS SEQUENTIAL
    RELATIVE KEY IS rec-key1.
```
### ACCESS RANDOM

En el modo de acceso aleatorio, podemos acceder a los registros de forma aleatoria, es decir, directamente proporcionando la clave.

Este modo de acceso suele utilizarse sólo para ficheros indexados y relativos.

En el caso de los ficheros indexados, los registros se recuperan en función del valor introducido en un campo clave. El valor puede ser primario, alternativo o relativo. Puede haber uno o varios índices alternativos.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
SELECT file-name ASSIGN TO dd-name
    ORGANIZATION IS INDEXED
    ACCESS MODE IS RANDOM
    RECORD KEY IS rec-key1
    ALTERNATE RECORD KEY IS rec-key2.
```

Los registros de los ficheros relativos se recuperan en función del valor que se introduzca en la clave relativa.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT file-name ASSIGN TO dd-name
    ORGANIZATION IS RELATIVE
    ACCESS MODE IS RANDOM
    RELATIVE KEY IS rec-key1.
```

### ACCESS DYNAMIC

En el mismo programa, el acceso dinámico permite tanto el acceso secuencial como el aleatorio. En el modo de acceso dinámico, podemos utilizar una descripción de archivo para ambos tipos de procesamiento, es decir, procesamiento aleatorio y secuencial, como recuperar algunos registros con la ayuda de claves y algunos registros en orden secuencial.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT file-name ASSIGN TO dd-name
    ORGANIZATION IS SEQUENTIAL
    ACCESS MODE IS DYNAMIC
    RECORD KEY IS rec-key1
    ALTERNATE RECORD KEY IS rec-key2.
```

Con archivos relativos e indexados, el modo de acceso dinámico permite pasar del modo de acceso aleatorio al modo de acceso secuencial al leer un archivo utilizando la frase NEXT en la sentencia READ.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT file-name ASSIGN TO dd-name
    ORGANIZATION IS RELATIVE
    ACCESS MODE IS DYNAMIC
    RELATIVE KEY IS rec-key1.
```

## Definicion del fichero

La FILE SECTION debe contener un indicador de nivel para cada fichero de entrada y salida. Para todos los ficheros, excepto los de sort/merge, la FILE SECTION debe contener una entrada FD. Para cada fichero de sort/merge, la FILE SECTION debe contener una entrada SD.

```
DATA DIVISION.
FILE SECTION.
FD FILENAME.
   RECORD CONTAINS N CHARACTERS.
   BLOCK CONTAINS N CHARACTERS/RECORDS.
   RECORDING MODE IS F/FB/V/VB/S/U.
   DATA RECORD IS FILE-REC.
01 FILE-REC PIC X(N).
```
- RECORD CONTAINS [opcional] - Sirve para especificar la longitud de registro de los archivos en bytes.
- BLOCK CONTAINS Cláusula[opcional] - La cláusula BLOCK CONTAINS especifica el tamaño de los registros físicos.
- RECORDING MODE [Opcional] - La cláusula RECORDING MODE especifica el formato de los registros físicos en un archivo QSAM. La cláusula se ignora para un archivo VSAM.
- DATA RECORD [Opcional] - La cláusula DATA RECORDS se comprueba sintácticamente, pero sólo sirve para documentar los nombres de los registros de datos asociados al archivo.

No es necesario que el nombre de los datos tenga asociada una descripción de registro numérico de nivel 01 con el mismo nombre.

## Sentencias para ficheros

Las sentencias de manejo de archivos se utilizan para realizar múltiples operaciones con archivos en la PROCEDURE DIVISION. Los términos de manejo de archivos son los siguientes. Procesar un archivo significa realizar todas las operaciones de archivo como leer, escribir, abrir, cerrar, etc.

1. OPEN - Inicia el procesamiento de archivos.
2. READ - Lee un registro del archivo.
3. WRITE - Crea un registro en el fichero.
4. REWRITE - Actualiza un registro del fichero.
5. DELETE - Borra un registro del fichero.
6. START - Posicionamiento dentro de un fichero indexado o relativo.
7. CLOSE - Libera la conexión entre el fichero y su programa.
8. READ NEXT - Leer el siguiente registro del fichero.
9. READ PREV - Leer el registro anterior del fichero.


### OPEN

Antes de empezar a trabajar con archivos, primero necesita abrir el archivo. Abrir es la primera operación que se debe realizar antes de realizar otras tareas. Si la apertura es exitosa, entonces podemos realizar otras operaciones como leer, escribir, cerrar, etc. Sólo después de abrir un archivo, las variables en la estructura del archivo están disponibles para su procesamiento.

Al abrir un archivo no se transfieren datos al búfer de registro; simplemente se proporciona acceso.

El fichero puede abrirse en 4 modos:

- INPUT - Este modo sólo se utiliza para ficheros existentes. Para leer del fichero, necesitamos utilizar este modo. No podemos realizar otras operaciones en el fichero a través de este modo. Cuando se abre un fichero para INPUT, el puntero del siguiente registro apunta al fichero al principio del mismo.
- OUTPUT - El modo de salida se utiliza para escribir los registros en ficheros. En un archivo secuencial del registro ya existe, entonces el archivo se sobrescribirá. Pero en el caso de ficheros indexados y relativos, esto no ocurrirá.
- EXTEND - Este modo añade los registros en un fichero secuencial. En este modo, el registro se insertará al final. Cuando se abre el fichero en modo EXTEND, el puntero del siguiente registro se sitúa en el último registro del fichero. No podemos utilizar el modo extender en el caso de ficheros Aleatorios y Dinámicos.
- I-O - Este modo es el modo de entrada y salida. Este modo lee y reescribe (actualiza) los registros de un fichero.

```
OPEN INPUT | OUTPUT | I-O | EXTEND filename.
```

### READ

Una vez abierto el fichero en modo INPUT o I-O, se puede leer un registro cada vez utilizando el verbo READ. Este verbo copia una ocurrencia o instancia de registro del fichero y la coloca en el buffer de registros definido mediante FD, y entonces podemos acceder a ella.

```
READ FILE-NAME [NEXT/PREVIOUS] RECORD [INTO identifier1]
    [AT END {imperative statement}]
    [NOT AT END {imperative statement}]
[END-READ]
```

- NEXT RECORD: Es opcional y se utiliza para la lectura secuencial de un archivo secuencial indexado.
- INTO: Esta cláusula también es opcional.
- AT END: Esta condición se hace verdadera cuando se alcanza el final del fichero.

A continuación se muestra la sintaxis del verbo read cuando el modo de acceso al fichero es aleatorio:

```
READ FILE-NAME RECORD [INTO identifier1][KEY IS key-1]
    [INVALID KEY {imperative statement}]
    [NOT INVALID KEY {imperative statement}]
    [AT END {imperative statement}]
    [NOT AT END {imperative statement}]
    [END-READ]
```

### WRITE

Este verbo se utiliza para escribir el contenido en un fichero. Para insertar datos en un archivo, debemos mover los datos al búfer de registros (declarado en la entrada FD) y luego escribir el contenido del búfer de registros en el archivo.

La sentencia Write se utiliza para escribir registros directamente desde las variables de almacenamiento de trabajo mediante FROM (una cláusula opcional).

La operación de escritura en el archivo se puede realizar de dos maneras basadas en el modo de apertura del archivo:
   - El modo de acceso será secuencial si el fichero se abre en modo OUTPUT. A partir del primer registro, se irán escribiendo los registros. Si, antes de abrir en modo OUTPUT, el fichero tiene algunos datos que se pueden refrescar y empezar a escribir desde el principio.
   - Si el fichero se abre en modo EXTEND, a partir del último registro, los registros se irán añadiendo al fichero.

En resumen, podemos decir que si el fichero se abre en modo OUTPUT, la operación de escritura sobrescribe el fichero existente. Si el fichero se abre en modo EXTEND, entonces el verbo escribir añade el registro al fichero existente.

A continuación se muestra la sintaxis para escribir un registro cuando la organización del fichero es secuencial:

```
WRITE record-buffer [FROM ws-file-structure]
END-WRITE.
```

Y la siguiente es la sintaxis para escribir un registro cuando la organización del archivo es indexada o relativa:

```
WRITE record-buffer [FROM ws-file-structure]
    INVALID KEY DISPLAY 'Invalid Key'
    NOT INVALID KEY DISPLAY 'Record Inserted'
END-WRITE.
```

### REWRITE

El verbo REWRITE actualiza los registros, pero el fichero debe estar abierto en modo I-O para realizar la operación de reescritura. Podemos realizar la operación de reescritura sólo después de una operación de lectura exitosa.

El verbo REWRITE sobrescribe el último registro leído. Para esto, necesitamos leer el registro usando el verbo READ, luego cambiar el contenido del registro y luego realizar la operación REWRITE para actualizar el registro.

La siguiente es la sintaxis para escribir un registro cuando la organización del archivo es secuencial:

```
REWRITE record-buffer [FROM ws-file-structure]
END-REWRITE.
```

A continuación se muestra la sintaxis para escribir un registro cuando la organización del archivo es indexada o relativa:

```
REWRITE record-buffer [FROM ws-file-structure]
   INVALID KEY DISPLAY 'Invalid Key'
   NOT INVALID KEY DISPLAY 'Record Updated'
END-REWRITE.
```

### DELETE

El verbo DELETE se utiliza para eliminar el registro leído en la última lectura del fichero. Podemos utilizar el verbo DELETE sólo en ficheros indexados y relativos. El fichero debe estar abierto en modo I-O.

El borrado específico de registros en ficheros secuenciales no es posible.

En caso de modo de acceso secuencial, se borrará el último registro leído por la sentencia Read. Y es necesario definir la clave del registro en modo de acceso aleatorio para realizar el proceso de borrado.

```
DELETE file-name RECORD
   INVALID KEY DISPLAY 'Invalid Key'
   NOT INVALID KEY DISPLAY 'Record Deleted'
END-DELETE.
```

### START

Sólo podemos realizar la operación START en ficheros indexados y relativos. El verbo START se utiliza para situar el puntero del fichero en un registro concreto. Este modo de acceso debe ser secuencial o dinámico. El fichero debe estar abierto en el modo de acceso I-O. El inicio no se utiliza para recuperar ningún registro, y sólo establece el puntero a la siguiente lectura para leer el registro.

```
START file-name KEY IS [=, >, <, NOT, <= or >=] rec-key
   INVALID KEY DISPLAY 'Invalid Key'
   NOT INVALID KEY DISPLAY 'File Pointer Updated'
END-START.
```

### CLOSE

Este verbo se utiliza para cerrar un archivo explícitamente. Al cerrar un archivo, las variables de la estructura del archivo no estarán disponibles para su procesamiento. Y la conexión entre el programa y el archivo se pierde.

```
CLOSE file-name.
```