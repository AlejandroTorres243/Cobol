      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. multiplys.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Fees PIC 9(3)V99 VALUE 052.24.
       01 Members PIC 9(4) VALUE 1024.
       01 TotalFees PIC 9(5)V99 VALUE ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY TotalFees
            MULTIPLY Fees BY Members GIVING TotalFees
            DISPLAY TotalFees
            STOP RUN.
       END PROGRAM multiplys.
