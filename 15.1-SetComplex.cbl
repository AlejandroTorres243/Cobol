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
       01 DeptCode PIC 9 VALUE ZERO.
       *>    88 InvalidCode VALUE "ERRROR - This number is incorret".
             88 InvalidCode VALUE 0, 2 THRU 5,7,9.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           ACCEPT DeptCode
            IF NOT (DeptCode = 1 OR DeptCode = 6 OR DeptCode = 8) THEN
            *> Esta sentencia es lo mismo pero resumiendo
            *> IF NOT (DeptCode = 1 OR 6 OR 8) THEN
               DISPLAY "SET InvalidCode TO TRUE"
               SET InvalidCode TO TRUE
            END-IF
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
