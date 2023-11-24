      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Listing6-5.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LoopCount PIC 9 VALUE 1.
       01 LoopCount2 PIC 9 VALUE 1.
       PROCEDURE DIVISION.
       P1.
           DISPLAY "S-P1"
           PERFORM P2
           PERFORM P3
               MOVE 7 TO LoopCount
               PERFORM VARYING LoopCount
               FROM 1 BY 1 UNTIL LoopCount = 2
                   DISPLAY "InLine - " LoopCount
               END-PERFORM
           DISPLAY "E-P1".
           DISPLAY "STOP RUN should be here".
       P2.
           DISPLAY "S-P2"
           PERFORM P5 WITH TEST BEFORE VARYING LoopCount
           FROM 1 BY 1 UNTIL LoopCount > 2
               DISPLAY "E-P2".
       P3.
           DISPLAY "S-P3"
           PERFORM P5
           PERFORM P6 3 TIMES
           DISPLAY "E-P3".
       P4.
           DISPLAY "P4-" LoopCount2
           ADD 1 TO LoopCount2.
       P5.
           DISPLAY "S-P5"
           DISPLAY LoopCount "-P5-" LoopCount2
           PERFORM P4 WITH TEST AFTER UNTIL LoopCount2 > 2
               DISPLAY "E-P5".
       P6.
       DISPLAY "P6".
