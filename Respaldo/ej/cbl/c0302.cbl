       IDENTIFICATION DIVISION.
       PROGRAM-ID. C0302.
       AUTHOR. Antonio Cano.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
      *     CURRENCY SIGN IS X'9F' with Picture Symbol "$".
           CURRENCY SIGN IS 'Eur' with Picture Symbol "$".
           
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  W-NUM     PIC  $$$,$$9.99.
       
       PROCEDURE DIVISION.
       Begin.
           MOVE 12345.95 TO W-NUM
           DISPLAY "NUMERO = " W-NUM
           STOP RUN.