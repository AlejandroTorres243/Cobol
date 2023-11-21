      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. subtract2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 GrossPay PIC 9(4)V99 VALUE 6350.75.
       01 Tax PIC 9(4)V99 VALUE 2333.25.
       01 PRSI PIC 9(4)V99 VALUE 1085.45.
       01 Pension PIC 9(4)V99 VALUE 1135.74.
       01 Levy PIC 9(3)V99 VALUE 170.50.
       01 NetPay PIC 9(4)V99 VALUE ZEROS.
       01 Iva PIC 9(4)V99 VALUES ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           SUBTRACT Tax, PRSI, Pension, Levy FROM GrossPay GIVING NetPay
           DISPLAY NetPay
           SUBTRACT Tax, PRSI, Pension FROM GrossPay GIVING Iva
           DISPLAY Iva
            STOP RUN.
       END PROGRAM subtract2.
