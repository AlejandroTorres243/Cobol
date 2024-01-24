      *****************************************************************
      * Program name:    C1201
      * Original author: MYNAME
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 01/01/08 MYNAME  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C1201.
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
           SELECT MIFILE ASSIGN  TO INFILEDD.
           SELECT OUTFILE ASSIGN  TO OUTFILE.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  MIFILE
            RECORD CONTAINS 170 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 0 RECORDS.
       COPY EMPLOYEE.
       FD  OUTFILE
            RECORD CONTAINS 43 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 0 RECORDS.
       01  OUTFILE-REG.
           05 OUTFILE-REG-COD PIC X(8).
           05 FILLER          PIC X(35) VALUE SPACES.
       COPY EMPNEW.
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
           OPEN INPUT MIFILE
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
           READ MIFILE
               AT END
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
           CLOSE MIFILE
           DISPLAY 'HE PROCESADO ' REC-COUNTER ' REGISTROS'
           GOBACK
           .
