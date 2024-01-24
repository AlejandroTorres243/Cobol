       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C0601.
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
       77  FECHA          PIC X(60).
       01 WS-HOY     PIC 9(8).
       01 WS-HOY-2   PIC 9(8).
       01 WS-NEW-FECHA PIC 9(8).
      *****************************************************************
       PROCEDURE DIVISION.
           MOVE FUNCTION CURRENT-DATE  TO FECHA
      *    YYYYMMDDHHMMSSCC+9999
      *    123456789012345678901
           DISPLAY FECHA
           DISPLAY '123456789012345678901'
           DISPLAY 'HHMM:' FECHA(9:4)
           MOVE FUNCTION CURRENT-DATE (1:8) TO WS-HOY.
           COMPUTE WS-HOY-2 = FUNCTION INTEGER-OF-DATE (WS-HOY) + 2
           DISPLAY 'WS-HOY:' WS-HOY
           DISPLAY 'WS-HOY-2:' WS-HOY-2
           COMPUTE WS-NEW-FECHA = FUNCTION DATE-OF-INTEGER(WS-HOY-2)
           DISPLAY 'WS-HOY-2-OK:' WS-NEW-FECHA
           MOVE FUNCTION WHEN-COMPILED TO FECHA
           DISPLAY 'WHEN COMPILED:' FECHA
           .
      *    COMPUTE WS-INTEGER-DATE = FUNCTION INTEGER-OF-DATE (WS-DATE)
      *    COMPUTE WS-DATE = FUNCTION DATE-OF-INTEGER (WS-INT-DATE)
           GOBACK.




