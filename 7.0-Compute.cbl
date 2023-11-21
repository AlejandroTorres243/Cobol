      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Computes.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Euro PIC 9(5)V99 VALUES 3425.15.
       01 Dollar PIC 9(5)V99 VALUES 1234.75.
       01 ExchangeRate PIC 9(5)V99 VALUES 1.3017.
       01 Num1 PIC 9(5) VALUE ZERO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            COMPUTE EURO ROUNDED = Dollar / ExchangeRate
            DISPLAY "Result is " Euro
            COMPUTE Num1 = 5 + 10 * 30 / 2
            DISPLAY Num1
            STOP RUN.
       END PROGRAM Computes.
