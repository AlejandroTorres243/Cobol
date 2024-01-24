       IDENTIFICATION DIVISION. 
       PROGRAM-ID.  C0401. 
       AUTHOR.  Antonio Cano.
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       COPY "EMPLEADO"
           REPLACING ==:TAG:== BY ==SRC==.
       COPY "EMPLEADO"
           REPLACING ==:TAG:== BY ==DES==.
       01  REGISTRO.
           10 SRC-CODIGO PIC 9(5).
           10 SRC-ANIO   PIC X(4).    
       01  W-VALOR PIC X(1000) VALUE 
           '001ANTONIO   CANO           GALINDO        15/05/20180234567
      -    ''.
      *     12345678901234567890123456789012345678901234567890123

       PROCEDURE DIVISION.
           DISPLAY 'VALOR INICIAL'
           DISPLAY 'SRC-EMPLEADO  :' SRC-EMPLEADO
           INITIALIZE SRC-EMPLEADO 
           DISPLAY 'Despues de inicializar'
           DISPLAY 'SRC-EMPLEADO  :' SRC-EMPLEADO
           MOVE W-VALOR               TO SRC-EMPLEADO
           DISPLAY 'W-VALOR       :' W-VALOR
           DISPLAY 'SRC-EMPLEADO  :' SRC-EMPLEADO
           DISPLAY 'DES-EMPLEADO  :' DES-EMPLEADO
           DISPLAY 'SRC-CODIGO    :' SRC-CODIGO OF SRC-EMPLEADO
           DISPLAY 'SRC-NOMBRE    :' SRC-NOMBRE-COMPLETO OF SRC-EMPLEADO 
           DISPLAY 'SRC-INGRESO   :' SRC-FECHA-INGRESO OF SRC-EMPLEADO
           MOVE SRC-EMPLEADO          TO DES-EMPLEADO
           DISPLAY 'Despues de mover src a des'
           DISPLAY 'SRC-EMPLEADO  :' SRC-EMPLEADO
           DISPLAY 'DES-EMPLEADO  :' DES-EMPLEADO
           INITIALIZE REGISTRO
           DISPLAY 'REGISTRO      :' REGISTRO
           MOVE CORRESPONDING SRC-EMPLEADO TO REGISTRO
           DISPLAY 'Despues de move corresponding'
           INITIALIZE SRC-EMPLEADO DES-EMPLEADO
           DISPLAY 'Despues de inicializar'
           DISPLAY 'SRC-EMPLEADO  :' SRC-EMPLEADO
           DISPLAY 'DES-EMPLEADO  :' DES-EMPLEADO
           MOVE 1200.00              TO SRC-SALARIO 
                                        DES-SALARIO
           DISPLAY 'Despues de move doble 1200.00'
           DISPLAY 'SRC-EMPLEADO  :' SRC-EMPLEADO
           DISPLAY 'DES-EMPLEADO  :' DES-EMPLEADO
           MOVE 123456.789           TO SRC-SALARIO 
                                        DES-SALARIO
           DISPLAY 'Despues de move exagerado 123456.789'
           DISPLAY 'SRC-EMPLEADO  :' SRC-EMPLEADO
           DISPLAY 'DES-EMPLEADO  :' DES-EMPLEADO
           STOP RUN. 