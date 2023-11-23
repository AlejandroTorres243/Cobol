      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Listing5-9.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Member PIC X VALUE SPACE.
       01 QP PIC 9(5) VALUE ZEROS.
       *> QuarterlyPurchases
       01 Qty PIC 99 VALUE ZEROS.
       01 Discount PIC 99 VALUE ZEROS.
       PROCEDURE DIVISION.
       Begin.
       DISPLAY "Enter value of QuarterlyPurchases - " WITH NO ADVANCING
       ACCEPT QP
       DISPLAY "Enter qty of books purchased - " WITH NO ADVANCING
       ACCEPT Qty
       DISPLAY "club member enter Y or N - " WITH NO ADVANCING
       ACCEPT Member

       *>QtyOfBooks QuarterlyPurchases (QP) ClubMember % Discount
       *> 1–5 < 500 ANY 0
       *>1–5 < 2000 Y 7
       *>1–5 < 2000 N 5
       *>1–5 >= 2000 Y 10
       *>1–5 >= 2000 N 8
       *>6–20 < 500 Y 3
       *>6–20 < 500 N 2
       *>6–20 < 2000 Y 12
       *>6–20 < 2000 N 10
       *>6–20 >= 2000 Y 25
       *>6–20 >= 2000 N 15
       *>21–99 < 500 Y 5
       *>21–99 < 500 N 3
       *>21–99 < 2000 Y 16
       *>21–99 < 2000 N 15
       *>21–99 >= 2000 Y 30
       *>21–99 >= 2000 N 20

       EVALUATE Qty ALSO TRUE ALSO Member
           WHEN 1 THRU 5 ALSO QP < 500 ALSO ANY MOVE 0 TO Discount
           WHEN 1 THRU 5 ALSO QP < 2000 ALSO "Y" MOVE 7 TO Discount
           WHEN 1 THRU 5 ALSO QP < 2000 ALSO "N" MOVE 5 TO Discount
           WHEN 1 THRU 5 ALSO QP >= 2000 ALSO "Y" MOVE 10 TO Discount
           WHEN 1 THRU 5 ALSO QP >= 2000 ALSO "N" MOVE 8 TO Discount
           WHEN 6 THRU 20 ALSO QP < 500 ALSO "Y" MOVE 3 TO Discount
           WHEN 6 THRU 20 ALSO QP < 500 ALSO "N" MOVE 2 TO Discount
           WHEN 6 THRU 20 ALSO QP < 2000 ALSO "Y" MOVE 12 TO Discount
           WHEN 6 THRU 20 ALSO QP < 2000 ALSO "N" MOVE 10 TO Discount
           WHEN 6 THRU 20 ALSO QP >= 2000 ALSO "Y" MOVE 25 TO Discount
           WHEN 6 THRU 20 ALSO QP >= 2000 ALSO "N" MOVE 15 TO Discount
           WHEN 21 THRU 99 ALSO QP < 500 ALSO "Y" MOVE 5 TO Discount
           WHEN 21 THRU 99 ALSO QP < 500 ALSO "N" MOVE 3 TO Discount
           WHEN 21 THRU 99 ALSO QP < 2000 ALSO "Y" MOVE 16 TO Discount
           WHEN 21 THRU 99 ALSO QP < 2000 ALSO "N" MOVE 15 TO Discount
           WHEN 21 THRU 99 ALSO QP >= 2000 ALSO "Y" MOVE 30 TO Discount
           WHEN 21 THRU 99 ALSO QP >= 2000 ALSO "N" MOVE 20 TO Discount
           END-EVALUATE
           DISPLAY "Discount = " Discount "%"
       STOP RUN.
