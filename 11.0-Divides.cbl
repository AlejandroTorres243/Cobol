      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Divides.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Amount1 PIC 9(4) VALUE 2444.
       01 Amount2 PIC 9(3) VALUE 354.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DIVIDE 15 INTO Amount1, Amount2.
            DISPLAY Amount1 "/" Amount2
            STOP RUN.
       END PROGRAM Divides.
