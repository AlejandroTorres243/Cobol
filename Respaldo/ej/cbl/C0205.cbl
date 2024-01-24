      *****************************************************************
      * Program name:    MYPROG
      * Original author: MYNAME
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 01/01/08 MYNAME  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  MYPROG.
       AUTHOR. MYNAME.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 01/01/08.
       DATE-COMPILED. 01/01/08.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       SOURCE-COMPUTER. IBM-3081 WITH DEBUGGING MODE.
       OBJECT-COMPUTER. IBM-3081.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUTFILE ASSIGN  TO OUTDD.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  OUTFILE
      *      LABEL RECORDS ARE STANDARD
      *      DATA RECORD IS RECORD1
      *      RECORD CONTAINS 120 CHARACTERS
            RECORDING MODE IS F
      *     Se deja que el sistema quien determine el tamaño del bloque
            BLOCK CONTAINS 0 RECORDS.
       01  RECORD1.
           10 RECORD1-1 PIC 9.
           10 RECORD1-2 PIC X.
      *****************************************************************
       WORKING-STORAGE SECTION.
       COPY COPY01.
       01  W-ACUMULATORS.
           05 W-COUNT      PIC 9(2) COMP VALUE 0.
           05 W-ITEMS      PIC 9(2).
           05 W-RANDOM-NUMBER PIC 9(2) COMP VALUE 0.
       01  W-CHAR          PIC 9(2).
       01  T-TABLES.
           05 T-VALUES     PIC X(52) VALUE
              'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.
           05 T-TABLE REDEFINES T-VALUES.
              10 T-TABLE-ITEM OCCURS 52 TIMES INDEXED BY I.
                 15 T-TABLE-VALUE PIC X.
       01  W-NUM-X    PIC X(4) VALUE '1234'.
       01  W-NUM-9    REDEFINES W-NUM-X PIC 9(4).
      *****************************************************************
      * LINKAGE SECTION.
      * 01  LINKAGE-AREA.
      *      05  LINKAGE-REC1  PIC X(512).
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN.
           PERFORM INIT-PROCESS
           PERFORM MAIN-PROCESS
           GO TO EXIT-PROGRAM
           .

       INIT-PROCESS.
           INITIALIZE W-ACUMULATORS
           OPEN OUTPUT OUTFILE
           ACCEPT W-ITEMS FROM SYSIN
           DISPLAY 'ITEMS: ' W-ITEMS
           IF W-ITEMS < 1 OR W-ITEMS > 52
              DISPLAY 'ERROR: ITEMS DEBE SER MENOR O IGUAL A 52'
              GO TO EXIT-PROGRAM
           END-IF
           .

       MAIN-PROCESS.
           PERFORM PROC-FILE
              UNTIL W-COUNT = W-ITEMS
           .

       PROC-FILE.
           MOVE W-COUNT                    TO RECORD1-1
           COMPUTE W-RANDOM-NUMBER = FUNCTION RANDOM * 52 + 1
           SET I                           TO W-RANDOM-NUMBER
           MOVE T-TABLE-VALUE(I)           TO RECORD1-2
           DISPLAY 'RECORD1:' RECORD1
           WRITE RECORD1
           ADD 1                           TO W-COUNT
           .

       EXIT-PROGRAM.
           CLOSE OUTFILE
           GOBACK
           .


