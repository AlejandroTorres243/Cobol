       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CALCULO.
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
       01  MI-DINERO      PIC 9(3)V99 USAGE COMP-3 VALUE 600.90.
       01  CUOTA          PIC 9(3)V99 USAGE COMP-3 VALUE 200.30.
       01  TOTAL          PIC 9(3)V99 USAGE COMP-3 VALUE 0.
       77  FECHA          PIC X(60).
      *****************************************************************
       PROCEDURE DIVISION.
           COMPUTE TOTAL = CUOTA * 3
           IF (MI-DINERO = TOTAL)
              DISPLAY 'ES IGUAL'
           ELSE
              DISPLAY 'NO ES IGUAL'
           END-IF
           MOVE FUNCTION CURRENT-DATE  TO FECHA
      *    YYYYMMDDHHMMSSCC+9999
      *    123456789012345678901
           DISPLAY FECHA
           DISPLAY '123456789012345678901'
           DISPLAY 'HHMM:' FECHA(9:4)
           .
           GOBACK.




