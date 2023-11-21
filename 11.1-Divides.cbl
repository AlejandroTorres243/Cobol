      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Divides2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Qty PIC 9(5) VALUE 31255.
       01 Units PIC 9(3) VALUE 115.
       01 Average PIC 9(4) VALUE ZEROS.
       01 Avg PIC 9(4) VALUE ZERO.
       01 Quotient PIC 999 VALUE ZEROS.
       01 Rem PIC 9 VALUE ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DIVIDE Qty By Units GIVING Average ROUNDED.
           DIVIDE Qty BY Units GIVING Avg
           DIVIDE 215 BY 10 GIVING Quotient REMAINDER Rem.
            DISPLAY Average "/" Avg
            DISPLAY Quotient "/" Rem
            STOP RUN.
       END PROGRAM Divides2.
