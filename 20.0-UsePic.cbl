      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Listing9-2.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CURRENCY SIGN IS "�".
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Edit1 PIC ���,��9.99.
       PROCEDURE DIVISION.
       Begin.
       MOVE 12345.95 TO Edit1
       DISPLAY "Edit1 = " Edit1
       STOP RUN.
