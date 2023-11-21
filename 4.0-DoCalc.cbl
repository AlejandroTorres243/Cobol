      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DoCalc.
       AUTHOR Manuel Alejandro
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 FirstNum PIC 99 VALUE ZEROS.
       01 SecondNum PIC 99 VALUE ZEROS.
       01 CalcResult PIC 999 VALUE 0.
       01 UserPrompt PIC X(38) VALUE
       "Please enter two single digit numbers".
       PROCEDURE DIVISION.
       CalculateResult.
       DISPLAY UserPrompt.
       ACCEPT FirstNum.
       ACCEPT SecondNum.
       COMPUTE CalcResult = FirstNum + SecondNum.
       DISPLAY "Result is = ", CalcResult
       STOP RUN.
       END PROGRAM DoCalc.
