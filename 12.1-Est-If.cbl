      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EstructuraIf.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Num2 PIC 99 VALUES ZERO.
       01 Num1 PIC 9(2) VALUES ZERO.
       01 Num3 PIC 9(2) VALUES ZERO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           ACCEPT Num1
           ACCEPT Num2
           ACCEPT Num3
           IF (Num2 * 10 / 50) - 10 IS NEGATIVE
               DISPLAY "Calculation result is negative"
           END-IF
           IF NOT Num1 < 25 OR Num2 = 80 AND Num3 > 264 THEN
               DISPLAY "Done"
           END-IF
           IF Num2 <= 80 THEN
               DISPLAY "Is minor or equal"
            STOP RUN.
       END PROGRAM EstructuraIf.
