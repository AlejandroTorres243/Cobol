      *****************************************************************
      * Program name:    MYPROG                               
      * Original author: MYNAME                                
      *
      * Maintenence Log                                              
      * Date      Author        Maintenance Requirement               
      * --------- ------------  --------------------------------------- 
      * 01/01/08 MYNAME  Created for COBOL class         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  MYPROG.
       AUTHOR. MYNAME. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 01/01/08. 
       DATE-COMPILED. 01/01/08. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION. 
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  W-VARIABLES.
           05  ITEM           PIC X9(4)     COMP.
           05  TOTAL          PIC S9(3)V99  COMP-3.
           05  INPUT-DATA     PIC X(30).
      *****************************************************************
       PROCEDURE DIVISION.
           INITIALIZE W-VARIABLES.
           MOVE "A"                 TO ITEM
           IF ITEM = "A"
                DISPLAY "THE VALUE OF ITEM IS " ITEM
                ADD 1 TO TOTAL
                MOVE "C" TO ITEM
                DISPLAY "THE VALUE OF ITEM IS NOW " ITEM.  
          
           IF ITEM = "B"
                ADD 2 TO TOTAL
           1.    

           IF ITEM = "A"
               DISPLAY "THE VALUE OF ITEM IS " ITEM
               ADD 1 TO TOTAL
               MOVE "C" TO ITEM
               DISPLAY "THE VALUE OF ITEM IS NOW " ITEM
           END-IF 
           .
           IF ITEM = "B"
               ADD 2 TO TOTAL
           END-IF
           .
           GOBACK
           .
           