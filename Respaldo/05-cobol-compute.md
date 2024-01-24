# Expresiones aritméticas

- Un identificador descrito como un elemento elemental numérico.
- Un literal numérico.
- Identificadores y literales separados por operadores aritméticos.
- Dos expresiones aritméticas separadas por un operador aritmético.
- Una expresión aritmética encerrada entre paréntesis.

**Operadores**
- Binarios: + - * / **
- Unarios: + -

**Precedencia**: cuando no se utilizan paréntesis, o las expresiones entre paréntesis se encuentran en el mismo nivel de inclusividad, está implícito el siguiente orden jerárquico:
- Unario
- Exponenciación
- Multiplicación y división
- Suma y resta

**Sentencias**
- ADD
- SUBTRACT
- MULTIPLY
- DIVIDE
- COMPUTE

## ADD

La sentencia ADD suma dos o más operandos numéricos y almacena el resultado.

La sentencia ADD se utiliza para sumar elementos numéricos. Existen tres formatos que funcionan de forma ligeramente diferente y que se describen a continuación,

Formato 1

![add-1](/images/add-1.png)

- Añade un campo(s) o valor(es) a otro campo. Los campos o valores indicados entre ADD y TO se suman y añaden al valor de los campos que siguen a TO, donde se almacena la respuesta. Identificador-1, identificador-2 deben nombrar un elemento numérico elemental.
- literal-1 debe ser un literal numérico. Los elementos de datos de coma flotante y los literales se pueden utilizar en cualquier lugar en el que se pueda especificar un elemento de datos numérico o un literal.

```
ADD A TO B 
ADD C D TO E F
```
- El valor de A se suma al valor de B y el resultado se almacena en B. El valor de A no se modifica.
- La suma de los valores en C y D se añade al valor en E, almacenando la respuesta en E y la suma de C y D también se añade a F almacenando el valor en F. Los valores en C y D no se modifican.

Formato 2

![add-2](/images/add-2.png)

- Añade campos o valores entre sí, almacenando la respuesta en un campo diferente. El(los) campo(s) o valor(es) indicado(s) entre ADD y GIVING se añade(n) y se almacena(n) en el campo que sigue(n) al(a los) campo(s) que sigue(n) a GIVING.
- identificador-1, identificador-2 deben nombrar un elemento numérico elemental excepto cuando siguen a la palabra ADD. Cada identificador que sigue a la palabra GIVING debe nombrar un elemento numérico elemental o numérico-editado.
- literal-1 debe ser un literal numérico. Los elementos de datos de coma flotante y los literales se pueden utilizar en cualquier lugar en el que se pueda especificar un elemento de datos numérico o un literal.

```
ADD A TO B GIVING C
```
- El valor de A se suma al valor de B y el resultado se almacena en C. Los valores de A y B no se modifican.


Formato 3

![add-3](/images/add-3.png)

- El tercer formato se utiliza para añadir campo(s) subordinado(s) de un grupo a campo(s) subordinado(s) de otro, almacenando la respuesta en dichos campos. Esos campo(s) subordinado(s) del identificador de elemento de grupo-1 se añaden y almacenan en los que tienen exactamente el mismo nombre en el identificador de elemento de grupo-2. Los nombres de los elementos subordinados deben escribirse exactamente igual en ambos grupos para poder participar en la adición.
- identificador-1, identificador-2 deben nombrar un elemento de grupo alfanumérico o un elemento de grupo nacional.
- literal-1 debe ser un literal numérico. Los elementos de datos de coma flotante y los literales se pueden utilizar en cualquier lugar en el que se pueda especificar un elemento de datos numérico o un literal.

``` 
05 ITEM-1 OCCURS 6.
   10 ITEM-A PIC S9(3).
   10 ITEM-B PIC +99.9.
   10 ITEM-C PIC X(4).
   10 ITEM-D PIC REDEFINES ITEM-C PIC 9(4).
   10 ITEM-E USAGE COMP-1.
   10 ITEM-F USAGE INDEX.

05 ITEM-2.
   10 ITEM-A PIC S9(3).
   10 ITEM-B PIC +9V9.
   10 ITEM-C PIC A(4).
   10 ITEM-D PIC 9(4).
   10 ITEM-E PIC 9(9) USAGE COMP.
   10 ITEM-F USAGE INDEX.

ADD CORR ITEM-2 TO ITEM-1(X)
```
- ITEM-A y ITEM-A(X), ITEM-B y ITEM-B(X), y ITEM-E y ITEM-E(X) se consideran correspondientes y se suman.
- ITEM-C y ITEM-C(X) no se incluyen porque no son numéricos.
- ITEM-D y ITEM-D(X) no se incluyen porque ITEM-D(X) incluye una cláusula REDEFINES en su descripción de datos.
- ITEM-F y ITEM-F(X) no están incluidos porque están definidos como USAGE IS INDEX.

Nótese que ITEM-1 es válido como identificador-1 o identificador-2.

Si alguna de las operaciones individuales de la sentencia ADD CORRESPONDING produce una condición de error de tamaño, la sentencia imperativa-1 de la frase ON SIZE ERROR no se ejecuta hasta que se hayan completado todas las adiciones individuales.

**Cuando se ejecuta ON SIZE**:
- Cuando el valor absoluto del resultado de una evaluación aritmética, después de la alineación del punto decimal, excede el valor más grande que puede ser contenido en el campo de resultado.
- Cuando se produce una división por cero.
- Si se especifica la frase ON SIZE ERROR y se produce una condición de error de tamaño, el valor del identificador resultante afectado por el error de tamaño no se altera, es decir, los resultados del error no se colocan en el identificador receptor. Una vez finalizada la ejecución de la operación aritmética, se ejecuta la sentencia imperativa en la frase ON SIZE ERROR, el control se transfiere al final de la sentencia aritmética y la frase NOT ON SIZE ERROR, si se especifica, se ignora.
- Si se ha especificado la frase NOT ON SIZE ERROR y, tras la ejecución de una operación aritmética, no existe una condición de error de tamaño, se ejecuta la frase NOT ON SIZE ERROR.
- Para las sentencias ADD CORRESPONDING y SUBTRACT CORRESPONDING, si una operación aritmética individual provoca una condición de error de tamaño, no se ejecuta la sentencia imperativa ON SIZE ERROR hasta que se hayan completado todas las sumas o restas individuales.
- Si se especifica la frase ROUNDED, el redondeo tiene lugar antes de la comprobación de error de tamaño.

**Frase ROUNDED**
- Después de la alineación del punto decimal, el número de lugares en la fracción del resultado de una operación aritmética se compara con el número de lugares proporcionado para la fracción del identificador resultante.
- Cuando el tamaño del resultado fraccionario excede el número de lugares previstos para su almacenamiento, se produce un truncamiento a menos que se especifique ROUNDED. Cuando se especifica ROUNDED, el dígito menos significativo del identificador resultante se incrementa en 1 siempre que el dígito más significativo del exceso sea mayor o igual que 5.

**Frase END-ADD**:
- Este terminador de ámbito explícito sirve para delimitar el ámbito de la sentencia ADD.
- END-ADD permite anidar una sentencia condicional ADD en otra sentencia condicional. END-ADD también puede utilizarse con una sentencia ADD imperativa.

**Consejos de uso**
- Los campos a añadir deben tener imágenes numéricas, es decir, sólo pueden tener los caracteres 9, S y V en sus cláusulas PIC.
- Los campos receptores pueden ser numéricos o editados numéricamente.
- Utilice la cláusula SIZE ERROR para detectar el desbordamiento de campo en el campo receptor.
- En todos los formatos, se calculan los resultados matemáticamente correctos, pero si el campo receptor es demasiado corto en la parte entera o decimal, el resultado se truncará, el entero a la izquierda y el decimal a la derecha. Si se incluye la frase REDONDEADO, el campo de respuesta se redondeará en lugar de truncarse. El redondeo se realiza siempre en la parte menos significativa de la respuesta.

## Subtract

La sentencia SUBTRACT resta un elemento numérico, o la suma de dos o más elementos numéricos, de uno o más elementos numéricos, y almacena el resultado.

La sentencia SUBTRACT se utiliza para restar elementos numéricos. Existen tres formatos que funcionan de forma ligeramente diferente y que se describen a continuación,

Formato 1

![substract-1](/images/subtract-1.png)

- El primer formato se utiliza para restar campo(s) o valor(es) de otro campo. Los campos o valores que aparecen entre SUBTRACT y FROM se suman y restan del valor de los campos que siguen a FROM. La respuesta se almacena en el campo individual.
- identificador-1 debe nombrar un dato numérico elemental.
-literal-1 bebe ser un literal numérico. Los elementos de datos de coma flotante y los literales se pueden utilizar en cualquier lugar donde se puedan especificar elementos de datos numéricos y literales.

```
SUBTRACT A FROM B
SUBTRACT C D FROM E F
```
- El valor en A se resta del valor en B y el resultado se almacena en B. El valor en A no cambia.
- La suma de los valores en C y D se resta al valor en E, almacenando la respuesta en E y la suma de C y D también se resta de F, almacenando el valor en F. Los valores en C y D no cambian.

Formato 2

![substract-2](/images/subtract-2.png)

-Todos los identificadores o literales que preceden a la palabra clave FROM se suman y su suma se resta del identificador-2 o literal-2. El resultado de la resta se almacena como el nuevo valor de cada elemento de datos referenciado por el identificador-3.
-El identificador debe nombrar un dato numérico elemental, a menos que el identificador siga a la palabra GIVING. Cada identificador que siga a la palabra GIVING debe nombrar un elemento de datos elemental numérico o editado numéricamente.
-literal Debe ser un literal numérico. Los elementos de datos de coma flotante y los literales se pueden utilizar en cualquier lugar donde se puedan especificar elementos de datos numéricos y literales.

```
SUBTRACT A FROM B GIVING C
```
- El valor en A se resta al valor en B y el resultado se almacena en C. Los valores en A y B no cambian.

Formato 3
![substract-3](/images/subtract-3.png)

- El tercer formato se utiliza para restar campo(s) subordinado(s) de un grupo a campo(s) subordinado(s) de otro, almacenando la respuesta en dichos campos.
- Los campo(s) subordinado(s) del identificador de elemento de grupo-1 se restan y almacenan en los que tienen exactamente el mismo nombre en el identificador de elemento de grupo-2. Los nombres de los elementos subordinados deben escribirse exactamente igual en ambos grupos para poder participar en la resta.
- identificador debe nombrar un elemento de grupo alfanumérico o un elemento de grupo nacional.
- literal debe ser un literal numérico. Los elementos de datos de coma flotante y los literales se pueden utilizar en cualquier lugar donde se puedan especificar elementos de datos numéricos y literales.

Las frases opcionales ROUNDED, SIZE ERROR, NOT ON SIZE ERROR y END-SUBTRACT funcionan igual que la sentencia ADD.

**Consejos de uso**:

- Los campos a restar deben tener imágenes numéricas, es decir, sólo pueden tener los caracteres 9, S y V en sus cláusulas PIC.
- Los campos receptores pueden ser numéricos o editados numéricamente.
- Utilice la cláusula SIZE ERROR para detectar el desbordamiento de campo en el campo receptor.
- En todos los formatos, se calculan los resultados matemáticamente correctos, pero si el campo receptor es demasiado corto en la parte entera o decimal, el resultado se truncará, el entero a la izquierda y el decimal a la derecha.
- Si se incluye la frase ROUNDED, el campo de respuesta se redondeará en lugar de truncarse. El redondeo se realiza siempre en la parte menos significativa de la respuesta.

## MULTIPLY

La sentencia MULTIPLY multiplica los elementos numéricos y establece los valores de los elementos de datos iguales a los resultados.

La sentencia MULTIPLY se utiliza para multiplicar elementos numéricos entre sí. Ambos formatos funcionan de forma ligeramente diferente y cada uno de ellos se describe en el área numerada correspondiente.

Formato 1: sentencia MULTIPLY

![multiply-1](/images/multiply-1.png)

- Se utiliza para multiplicar un campo o valor por otro campo o valor. El producto de los campos o valores enumerados entre MULTIPLY y BY se calcula y se multiplica por el valor de los campos que siguen a BY. La respuesta se almacena en el campo individual.
- identificador-1, identificador-2 Debe nombrar un elemento numérico elemental. identificador-1 e identificador-2 no pueden ser campos de fecha.
- literal-1, literal-2 Debe ser un literal numérico.
- El valor del identificador-1 o del literal-1 se multiplica por el valor del identificador-2; a continuación, el producto se coloca en el identificador-2. Para cada aparición sucesiva del identificador-2, la multiplicación tiene lugar en el orden de izquierda a derecha en el que se especifica el identificador-2.

```
MULTIPLY A BY B
MULTIPLY C BY D E
```

- El valor en A se multiplica por el valor en B y el resultado se almacena en B. El valor en A no se modifica.
- El valor en C se multiplica por el valor en D, almacenando la respuesta en D y el valor de C también se multiplica por E, almacenando el valor en E. El valor en C no cambia.


Formato 2

![multiply-2](/images/multiply-2.png)

- El segundo formato se utiliza multiplicando campo(s) o valor(es) por otro(s) campo(s) o valor(es), almacenando la respuesta en un campo diferente. El(los) campo(s) o valor(es) indicado(s) entre MULTIPLY y GIVING se multiplica(n) y se almacena(n) en el(los) campo(s) que sigue(n) a DAR.
- identificador-1, identificador-2 Debe nombrar un elemento numérico elemental. identificador-1 e identificador-2 no pueden ser campos de fecha.
- literal-1, literal-2 Debe ser un literal numérico.
- identificador-3 Debe nombrar un elemento numérico elemental o editado numéricamente. identificador-3, el identificador de frase GIVING, es el único identificador de la sentencia MULTIPLY que puede ser un campo de fecha.
- El valor del identificador-1 o literal-1 se multiplica por el valor del identificador-2 o literal-2. El producto se almacena entonces en los elementos de datos referenciados por el identificador-3.

```
MULTIPLY A BY C GIVING C
```

Las frases opcionales ROUNDED, SIZE ERROR, NOT ON SIZE ERROR y END-SUBTRACT funcionan igual que la sentencia ADD.

**Consejos de uso**:
- Los campos a multiplicar deben tener imágenes numéricas, es decir, sólo pueden tener los caracteres 9, S y V en sus cláusulas PIC.
- Los campos receptores pueden ser numéricos o editados numéricamente.
- Utilice la cláusula SIZE ERROR para detectar el desbordamiento de campo en el campo receptor.
- En ambos formatos, se calculan los resultados matemáticamente correctos, pero si el campo receptor es demasiado corto en la parte entera o decimal, el resultado se truncará, el entero a la izquierda y el decimal a la derecha.
- Si se incluye la frase REDONDEADO, el campo de respuesta se redondeará en lugar de truncarse. El redondeo se realiza siempre en la parte menos significativa de la respuesta. 

## DIVIDE


La sentencia DIVIDE divide un dato numérico entre o por otros y establece los valores de los datos iguales al cociente y al resto.

La sentencia DIVIDE se utiliza para dividir elementos numéricos entre sí. Ambos formatos funcionan de forma ligeramente diferente y se describen a continuación,

Formato 1

![divide1-1](/images/divide-1.png)

- El primer formato se utiliza para dividir un campo o valor entre otro campo o valor. El campo o valor indicado entre DIVIDE e INTO se divide en el valor del campo o campos que siguen a INTO. La respuesta se almacena si el campo individual.
- El valor del identificador-1 o literal-1 se divide entre el valor del identificador-2, y el cociente se almacena en el identificador-2. Para cada aparición sucesiva del identificador-2, la división tiene lugar en el orden de izquierda a derecha en el que se especifica el identificador-2.

```
DIVIDE A INTO B
DIVIDE C INTO D E
```
- El valor de A se divide entre el valor de B y el resultado se almacena en B. El valor de A no cambia.
- El valor de C se divide entre el valor de D, almacenándose el resultado en D; el valor de C también se divide entre E, almacenándose el resultado en E. El valor de C no se modifica.


Formato 2

![divide1-2](/images/divide-2.png)

- El segundo formato se utiliza para dividir campo(s) o valor(es) entre sí, almacenando la respuesta en un campo diferente. El(los) campo(s) o valor(es) indicado(s) entre DIVIDE y GIVING se divide(n) y se almacena(n) en el campo que sigue(n) al(los) campo(s) que sigue(n) a GIVING.
- El valor del identificador-1 o literal-1 se divide entre el valor del identificador-2 o literal-2. El valor del cociente se almacena en cada elemento de datos referenciado por el identificador-3.

```
DIVIDE A INTO B GIVING C
```
- El valor de A se divide entre el valor de B y el resultado se almacena en C. Los valores de A y B no se modifican.

Formato 3

![divide1-3](/images/divide-3.png)

- El tercer formato también se utiliza para dividir campo(s) o valor(es) entre sí, almacenando la respuesta en un campo diferente. El(los) campo(s) o valor(es) que aparece(n) entre DIVIDE y GIVING se divide(n) y se almacena(n) en el campo que sigue(n) al(los) campo(s) que sigue(n) a GIVING.
- El valor del identificador-1 o literal-1 se divide por el valor del identificador-2 o literal-2. El valor del cociente se almacena en cada elemento de datos referenciado por el identificador-3.

```
DIVIDE A BY B GIVING C 
```

- El valor de A se divide por el valor de B y el resultado se almacena en C. Los valores de A y B no se modifican.


Formato 4

![divide1-4](/images/divide-4.png)

- El cuarto formato se utiliza para dividir campo(s) o valor(es) entre sí, almacenando la respuesta en un campo diferente. El(los) campo(s) o valor(es) indicado(s) entre DIVIDE y GIVING se divide(n) y se almacena(n) en el campo que sigue(n) al(los) campo(s) que sigue(n) a GIVING.
-El valor del identificador-1 o literal-1 se divide entre el identificador-2 o literal-2. El valor del cociente se almacena en el identificador-3, y el valor del resto se almacena en el identificador-4.

```
DIVIDE A INTO BY GIVING C REMAINDER D
```

- El valor de A se divide entre el valor de B y los resultados se almacenan en C, mientras que el resto se almacena en D. Los valores de A y B no se modifican.

Formato 5

![divide1-5](/images/divide-5.png)

- El quinto formato también se utiliza dividiendo campo(s) o valor(es) entre sí, almacenando la respuesta en un campo diferente. El(los) campo(s) o valor(es) indicado(s) entre DIVIDE y GIVING se divide(n) y se almacena(n) en el campo siguiente al(a los) campo(s) siguiente(s) a GIVING.
- El valor del identificador-1 o literal-1 se divide por el identificador-2 o literal-2. El valor del cociente se almacena en el identificador-3, y el valor del resto se almacena en el identificador-4.

````
DIVIDE A BY B GIVING C REMAINDER D
````

- El valor de A se divide por el valor de B y el resultado se almacena en C, mientras que el resto se almacena en D. Los valores de A y B no se modifican.

**Reglas para todos los formatos**

- identificador-1, identificador-2 Debe nombrar un dato numérico elemental. identificador-1 e identificador-2 no pueden ser campos de fecha.
- identificador-3, identificador-4 Debe nombrar un elemento numérico elemental o editado numéricamente.
- literal-1, literal-2 debe ser un literal numérico.
- En los formatos 1, 2 y 3, los elementos de datos y literales de coma flotante se pueden utilizar en cualquier lugar en el que se pueda especificar un elemento de datos o literal numérico.
- En los formatos 4 y 5, no se pueden utilizar elementos de datos de coma flotante ni literales.

Las frases opcionales ROUNDED, SIZE ERROR, NOT ON SIZE ERROR y END-SUBTRACT funcionan igual que la sentencia ADD.

# COMPUTE

![compute](/images/compute.png)

La sentencia COMPUTE asigna el valor de una expresión aritmética a uno o más elementos de datos.

Las operaciones aritméticas pueden combinarse con la sentencia COMPUTE sin las restricciones de recepción de datos impuestas por las reglas de las sentencias ADD, SUBTRACT, MULTIPLY y DIVIDE.

Cuando se combinan operaciones aritméticas, la sentencia COMPUTE puede ser más eficaz que las sentencias aritméticas separadas escritas en serie.

- identificador-1 debe nombrar un elemento numérico elemental o un elemento numérico elemental editado.Puede nombrar un dato elemental de coma flotante.
- Expresión aritmética puede ser cualquier expresión aritmética.
- Cuando se ejecuta la sentencia COMPUTE, el valor de la expresión aritmética se calcula y se almacena como el nuevo valor de cada elemento de datos referenciado por identificador-1.

Las frases opcionales ROUNDED, SIZE ERROR, NOT ON SIZE ERROR y END-SUBTRACT funcionan igual que la sentencia ADD.

**Consejos de uso**:

- Si sólo se va a realizar una operación matemática, utilice la sentencia que realiza dicha operación (SUMAR, RESTAR, MULTIPLICAR o DIVIDIR). Reserve la sentencia COMPUTE para fórmulas o exponenciación, ya que no tiene asociada ninguna sentencia independiente.
- Los campos receptores pueden ser numéricos o editados numéricamente.
- Utilice la cláusula SIZE ERROR para detectar el desbordamiento de campo en el campo receptor.
- En todos los formatos, se calculan los resultados matemáticamente correctos, pero si el campo receptor es demasiado corto en la parte entera o decimal, el resultado se truncará, el entero a la izquierda y el decimal a la derecha.
- Si se incluye la frase ROUNDED, el campo de respuesta se redondeará en lugar de truncarse. El redondeo se realiza siempre por la parte menos significativa de la respuesta.
