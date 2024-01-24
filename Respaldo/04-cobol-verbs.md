# Sentencias básicas

- ACCEPT
- DISPLAY
- INITIALIZE
- MOVE
- STOP RUN / GOBACK.

## ACCEPT
La sentencia ACCEPT se utiliza para adquirir datos del dispositivo de entrada primario o de varios campos del sistema. Cada uno de los dos formatos funciona de forma ligeramente diferente y se describe en el área numerada correspondiente.

Formato 1:

![accept-sysin](/images/accept-sysin.png)

Este formato se utiliza para aceptar datos de la entrada primaria o de otro dispositivo especificado. Se cargan los campos enumerados después de ACCEPT.

Formato 2:

![accept-dates](/images/accept-dates.png)

- Este formato se utiliza para aceptar uno o varios valores del sistema. Cada uno de los elementos a aceptar tiene un formato diferente.
- Utilice la sentencia ACCEPT para adquirir pequeñas cantidades de datos, como por ejemplo parámetros a introducir en tiempo de ejecución.
- La principal ventaja de adquirir datos con la sentencia ACCEPT es que no es necesario establecer ningún fichero para utilizarla.
- La principal desventaja de la adquisición de datos con la sentencia ACCEPT es que no hay ningún mecanismo para reconocer el final del archivo.

## DISPLAY

La sentencia DISPLAY se utiliza para mostrar datos en el dispositivo de salida primario. 

![accept-sysin](/images/display.png)

- Utilice la sentencia DISPLAY para mostrar pequeñas cantidades de datos, como mensajes de error.
- La principal ventaja de mostrar datos con la sentencia DISPLAY es que no es necesario crear ningún archivo para utilizarla.
- La principal desventaja de mostrar datos con la sentencia DISPLAY es que no existe ningún mecanismo para proporcionar control de carro.
- Si es necesario, el identificador-1 se convierte automáticamente a formato externo.
- Los punteros se convierten a un PIC externo 9(10)
- No se pueden especificar variables de tipo INDEX

## INITIALIZE

La sentencia INITIALIZE se utiliza para inicializar elementos de datos. Los datos se inicializan según su tipo.

![initialize](/images/initialize.png)

- Los elementos alfabéticos y alfanuméricos se inicializan con espacios.
- Los elementos numéricos se inicializan con ceros.
- Para los elementos de grupo, los elementos elementales subordinados se inicializan en función de sus tipos de datos individuales. Sólo se inicializan los elementos con nombre.
- La frase REEMPLAZAR puede utilizarse para inicializar los elementos de datos con valores diferentes a los predeterminados SPACES o ZEROES.
- Utilice la sentencia INITIALIZE en lugar de mover CEROS o ESPACIOS a un grupo. De esta forma, cada elemento subordinado se establecerá con un valor apropiado.
- Observe que los FILLER no se inicializan. Esto permite inicializar la parte variable de una línea de detalle, por ejemplo, sin que se vean afectados los valores constantes insertados en los campos FILLER.


## MOVE

La sentencia MOVE se utiliza para copiar ítems de datos a otros ítems de datos. Los dos formatos siguientes funcionan de forma ligeramente diferente y también se describen a continuación.

Formato 1

![move-normal](/images/move-normal.png)

MOVE {Identificador-1/Litera-1} A {Identificador-2....} 

Este formato se utiliza para copiar un campo o valor a otro(s) campo(s). El campo o valor indicado entre MOVE y TO se copia en el valor del campo o campos que siguen a TO.

Por ejemplo, en MOVE A TO B, el valor de A se copia en B. El valor de A no cambia. Además, en MOVE C TO E F, el valor de C se traslada al valor de E, almacenando la respuesta en E, y el valor de C también se traslada a F, almacenando la respuesta en F. El valor de C no se modifica.

Formato 2

![move-corresponding](/images/move-corresponding.png)

El formato se utiliza para copiar campo(s) subordinado(s) de un grupo a campo(s) subordinado(s) de otro. Se copian aquellos campo(s) subordinado(s) del elemento de grupo identificador-1 y aquellos con exactamente el mismo nombre en el elemento de grupo identificador-2. Los nombres de los elementos subordinados deben escribirse exactamente igual en ambos para participar en el movimiento.

**Comportamiento normal**

- Si el campo receptor está editado, cualquier edición necesaria se realizará en el momento del MOVE.
- Si el campo receptor está sin editar y el campo emisor está editado, el campo se deseditará en el momento del MOVE.
- Si el campo de envío es más corto que el campo de recepción:
    - Los campos numéricos se rellenan a la izquierda con ceros.
    - Los campos no numéricos se rellenan a la derecha con espacios.
- Si el campo emisor es más largo que el campo receptor:
    - Los campos numéricos se truncan por la izquierda.
    - Los campos no numéricos se truncan por la derecha.

**Comportamiento CORRESPONDING**
- Ambos identificadores deben ser elementos de grupo.
- Los dos identificadores que siguen a la palabra clave CORRESPONDING deben nombrar elementos de grupo. 
- Un par de elementos de datos (elementos subordinados), uno del identificador-1 y otro del identificador-2, se corresponden si se cumplen las siguientes condiciones:
    - En una sentencia MOVE, al menos uno de los ítems de datos es un ítem elemental, y el movimiento está permitido por las reglas de movimiento.
    - Los elementos subordinados no están identificados por la palabra clave FILLER.
    - Ni el identificador-1 ni el identificador-2 se describen como elementos de nivel 66, 77 u 88, ni como elementos USAGE IS INDEX. Ni el identificador-1 ni el identificador-2 pueden ser modificados por referencia.
    - Los elementos subordinados no incluyen cláusulas REDEFINES, RENAMES, OCCURS o USAGE IS INDEX en sus descripciones.
    - Sin embargo, identificador-1 e identificador-2, pueden contener o estar subordinados a elementos que contengan una cláusula REDEFINES u OCCURS en sus descripciones.
    - Ni el identificador-1 ni el identificador-2 ni los dos elementos subordinados se describen como elementos USAGE IS POINTER.
    - El identificador-1 y/o el identificador-2 pueden estar subordinados a un elemento FILLER.

(Move's válidos / inválidos)[https://www.ibm.com/docs/en/cobol-zos/6.4?topic=moves-valid-invalid-elementary]

## STOP RUN

- STOP RUN es la última sentencia ejecutable en el programa que devolverá el control al sistema operativo.
- STOP RUN siempre se codifica en el programa principal.
- Si STOP RUN se codifica en el subprograma, el control regresará al sistema operativo en lugar de regresar al programa principal. En este caso, la tarea restante codificada en el programa principal quedará incompleta. En su lugar, para terminar la ejecución de un subprograma, utilice la sentencia EXIT PROGRAM / GOBACK.
- STOP RUN cierra todos los archivos abiertos en el programa.

Cuando se ejecuta STOP RUN, inmediatamente se cierran todas las tareas en ejecución del programa y el control se transfiere al sistema operativo.

![stop-run](/images/stop-run.png)

- STOP RUN termina el programa. 
- STOP literal muestra el literal y espera una respuesta antes de continuar con la siguiente sentencia ejecutable.

