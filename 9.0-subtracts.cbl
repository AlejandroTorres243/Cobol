      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. subtracts.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Num1 PIC 9(4) VALUE 364.
       01 Num2 PIC 9(4) VALUE 1000.
       01 Num3 PIC 9(4) VALUE 5555.
       01 Result PIC 9(4) VALUE 1445.
       01 NumResult1 PIC 9(4) VALUE 5555.
       01 NumResult2 PIC 9(4) VALUE 1445.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            SUBTRACT Num1, Num2 FROM Num3 GIVING Result
            DISPLAY Result
            SUBTRACT Num1, Num2 FROM NumResult1, NumResult2
            DISPLAY "/ "NumResult2 "/" NumResult1
            STOP RUN.
       END PROGRAM subtracts.
