*****************************************************************
      * Program name:    C1202
      * Original author: MYNAME
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 01/01/08 MYNAME  Created for COBOL class
      *
      *    Enfrentar los ficheros FILE1 y FILE2 por el campo ACCT-NO
      *    de tal modo que se escribirán todos los registros de FILE1
      *    en el fichero de salida, pero si coincide el campo ACCT-NO
      *    en ambos fichero se actualizará el campo RESERVED de FILE1
      *    con el campo RESERVED-NEW.
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C1202.
       AUTHOR. MYNAME.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 01/01/08.
       DATE-COMPILED. 01/01/08.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE1  ASSIGN TO FILE1DD.
           SELECT FILE2  ASSIGN TO FILE2DD.
           SELECT OUTFILE ASSIGN  TO OUTFILE.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  FILE1      RECORD CONTAINS 170 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 0 RECORDS.
       01  FILE1-REG.
           COPY EMPLOYEE.
      *CONTENIDO DEL FICHERO EXTERNO ZA0023.DATAN
      *18011809AA
      *18091817BB
      *18171825CC
      *18251829DD
      *18291837EE
      *18371841FF
      *18411841GG
      *18411845HH
      *18451849II
      *18491850JJ
       FD  FILE2      RECORD CONTAINS 10 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 0 RECORDS.
       COPY EMPACT.
       FD  OUTFILE
            RECORD CONTAINS 43 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 0 RECORDS.
       01  OUTFILE-REG.
           COPY EMPLOYEE.
      *    05 OUTFILE-REG-COD PIC X(8).
      *    05 FILLER          PIC X(35) VALUE SPACES.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  COUNTERS-AND-ACCUMULATORS.
           05  REC-COUNTER    PIC S9(4)     COMP VALUE 0.
      *    05  TOTAL-AMOUNT   PIC S9(3)V99  COMP-3.
      *    05  INPUT-DATA     PIC X(30).
       01  INFILE-EOF         PIC X(1) VALUE 'N'.
           88 INFILE-EOF-SI   VALUE 'S'.
           88 INFILE-EOF-NO   VALUE 'N'.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN.
           PERFORM INICIO.
           PERFORM PROCESO.
           GO TO FINALIZAR.

       INICIO.
           INITIALIZE COUNTERS-AND-ACCUMULATORS
           OPEN INPUT FILE1
           OPEN INPUT FILE1
           OPEN OUTPUT OUTFILE
           .

       PROCESO.
           PERFORM LEER-REGISTRO
           PERFORM UNTIL INFILE-EOF-SI
              PERFORM PROCESAR-REGISTRO
              PERFORM LEER-REGISTRO
           END-PERFORM
      *    Estas dos formas de procesar el fichero son similares
      *    PERFORM LEER-REGISTRO UNTIL INFILE-EOF-SI
           .

       LEER-REGISTRO.
           READ FILE1          AT END
      *    Estas dos sentencias son equivalentes
               SET INFILE-EOF-SI      TO TRUE
      *        MOVE 'S'               TO INFILE-EOF
           NOT AT END
               ADD 1 TO REC-COUNTER
      *    Este procesar registro solo debería estar en el caso del
      *    perform outline
      *         PERFORM PROCESAR-REGISTRO
           END-READ
           .

       PROCESAR-REGISTRO.
           DISPLAY REC-COUNTER ':' EMPLOYEE(1:8)
                                   EMPLOYEE(35:100)
           IF ACCT-NO OF EMPLOYEE (1:1) = '1'
              PERFORM ESCRIBIR-REGISTRO-1
      *    ELSE
      *       PERFORM ESCRIBIR-REGISTRO-2
           END-IF
           .

       ESCRIBIR-REGISTRO-1.
           INSPECT OUTFILE-REG REPLACING ALL LOW-VALUES BY SPACES
           MOVE ACCT-NO OF EMPLOYEE TO OUTFILE-REG-COD
           WRITE OUTFILE-REG
           .

       ESCRIBIR-REGISTRO-2.
           MOVE CORR EMPLOYEE  TO EMPNEW
           WRITE EMPNEW
           .

       FINALIZAR.
           CLOSE FILE1
           CLOSE FILE2
           CLOSE OUTFILE
           DISPLAY 'HE PROCESADO ' REC-COUNTER ' REGISTROS'
           GOBACK
           .
