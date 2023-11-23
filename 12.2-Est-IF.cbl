      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 InputVal PIC 9(2) VALUES ZERO.
       01 Num1 PIC 9(2) VALUES ZERO.
       01 NUM2 PIC 9(2) VALUES ZERO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE "F" TO InputVal
           MOVE 23 TO Num1.
           MOVE 25 TO NUM2.
            IF InputVal IS NUMERIC
               MOVE InputVal to Num1
            IF Num1 > 5 AND < 25
                IF Num1 < Num2
                   MOVE Num2 TO Num1
                ELSE
                   MOVE Num1 TO Num2
                END-IF
                DISPLAY "Num1 & Num2 = " Num1 SPACE Num2
            ELSE
                DISPLAY "Num 1 not in range"
            END-IF
            ELSE
               DISPLAY "Input was not numeric"
            END-IF
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
