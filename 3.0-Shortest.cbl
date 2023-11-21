      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CobolGreeting.
       *>Program to display COBOL greetings
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 IterNum PIC 9 VALUE 5.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            PERFORM DisplayGreeting IterNum TIMES.
            STOP RUN.
            DisplayGreeting.
            DISPLAY "Greetings from COBOL".
       END PROGRAM CobolGreeting.
