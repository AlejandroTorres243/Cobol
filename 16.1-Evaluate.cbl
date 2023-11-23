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
       01 ByVisa PIC 9(6)V99 VALUES ZERO.
    *>   01 ByMasterCard PIC 9(6)V99 VALUES ZERO.
    *>   01 ByAmericanExpress PIC 9(6)V99 VALUES ZERO.
    *>   01 ByCheck PIC 9(6)V99 VALUES ZERO.
    *>   01 ByCash PIC 9(6)V99 VALUES ZERO.
       01 SaleValue PIC 9(6)V99 VALUE 5243.92.
       01 VisaTotal PIC 9(6)V99 VALUE ZERO.
       01 MasterCardTotal PIC 9(6)V99 VALUE ZERO.
       01 OptionCash PIC X VALUE ZERO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "OPTION CASH - " WITH NO ADVANCING
           ACCEPT OptionCash
           EVALUATE TRUE
               WHEN ByVisa = 0 AND OptionCash = 1
                   ADD SaleValue TO VisaTotal
                   DISPLAY "VISA " VisaTotal " Euros."
              WHEN ByMasterCard = 0 AND OptionCash = 2
                   ADD SaleValue TO MasterCardTotal
                   DISPLAY "MASTER CARD " MasterCardTotal "Euros."

           *>   WHEN ByAmericanExpress ADD SaleValue TO AmericanExpressTotal
           *>   WHEN ByCheck ADD SaleValue TO CheckTotal
           *>   WHEN ByCash ADD SaleValue TO CashTotal
            END-EVALUATE
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
