      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Adds.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Cash PIC 9(3) VALUE 364.
       01 Total PIC 9(4) VALUE 1000.
       01 Checks PIC 9(4) VALUE 1445.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            ADD Cash TO Total.
            DISPLAY Total
            ADD Cash, 20 TO Total.
            DISPLAY Total
            ADD Cash, Checks TO Total.
            DISPLAY Total
            STOP RUN.
       END PROGRAM Adds.
