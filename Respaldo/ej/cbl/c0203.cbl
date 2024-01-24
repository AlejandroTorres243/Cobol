      *****************************************************************
      * Program name:    C0203
      * Original author: ANTONIO CANO
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 01/01/08 ANTONIO CANO  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C0203.
       AUTHOR. ANTONIO CANO.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  COUNTERS-AND-ACCUMULATORS.
           05  REC-KTR        PIC S9(4)     COMP.
           05  TOTAL-AMOUNT   PIC S9(7)V99  COMP-3.
           05  INPUT-DATA     PIC X(30).
           05  RESULT         PIC 9(3)V99.
           05  TOTAL-AMOUNT-ED PIC --,---,--9.99.
           05  TOTAL-AMOUNT-ED1 PIC --,---,---.--.
           05  RESULT-ED      PIC --9.99.
           05  W-COUNT        PIC 9(4) COMP.
           05  STRING-LARGO     PIC X(100) VALUE "abcdefghijklmnñopqrstu
      -    "vwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ1234567890""".
      *****************************************************************
       PROCEDURE DIVISION.
           move 1 to RESULT
           move "literal alfabético" to STRING-LARGO
           MOVE -1000006.5 TO TOTAL-AMOUNT
           MOVE TOTAL-AMOUNT TO TOTAL-AMOUNT-ED
                                TOTAL-AMOUNT-ED1
           DISPLAY 'TOTAL-AMOUNT:' TOTAL-AMOUNT
           DISPLAY 'TOTAL-AMOUNT-ED:' TOTAL-AMOUNT-ED
           DISPLAY 'TOTAL-AMOUNT-ED1:' TOTAL-AMOUNT-ED1

      *     INITIALIZE TOTAL-AMOUNT STRING-LARGO

           MOVE TOTAL-AMOUNT TO TOTAL-AMOUNT-ED
                                TOTAL-AMOUNT-ED1
           DISPLAY 'TOTAL-AMOUNT:' TOTAL-AMOUNT
           DISPLAY 'TOTAL-AMOUNT-ED:' TOTAL-AMOUNT-ED
           DISPLAY 'TOTAL-AMOUNT-ED1:' TOTAL-AMOUNT-ED1
           COMPUTE RESULT ROUNDED = 1 / 3
           DISPLAY 'RESULT: ' RESULT
           MOVE RESULT TO RESULT-ED
           DISPLAY 'RESULT-ED:' RESULT-ED
           DISPLAY 'string-largo:' STRING-LARGO '$$'
           display LENGTH OF STRING-LARGO
           GOBACK
           .
