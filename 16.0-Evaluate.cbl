      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UseToEVALUATE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Age PIC 9(2) VALUE ZERO.
       01 Height PIC 9(2) VALUE ZERO.
       01 Admision PIC 9(2) VALUE ZERO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           DISPLAY "Age :- "
           ACCEPT Age
           DISPLAY "Height :- "
           ACCEPT Height

           EVALUATE TRUE ALSO TRUE
                 WHEN Age < 4 ALSO Height = 0
                   DISPLAY "IS FREE"
                 WHEN Age >= 4 AND Age <=7 ALSO Height = 0
                   MOVE 10 TO Admision
                 WHEN Age >= 8 AND AGE <= 12 ALSO Height >= 48
                   MOVE 15 TO Admision
                 WHEN Age >= 8 AND AGE <= 12 ALSO Height < 48
                   MOVE 10 TO Admision
                 WHEN Age > 13 AND AGE <= 64 ALSO Height >= 48
                   MOVE 25 TO Admision
                 WHEN Age > 13 AND AGE <= 64 ALSO Height < 48
                   MOVE 18 TO Admision
                 WHEN Age >= 65 ALSO Height = 0
                   MOVE 13 TO Admision
                 WHEN OTHER
                   DISPLAY "Again other number"
           END-EVALUATE.

           DISPLAY "YOU AGE IS " Age " AND HEIGHT IS " Height
           DISPLAY "YOU PAY FOR ADMISION IS " Admision

           STOP RUN.
       END PROGRAM UseToEVALUATE.
