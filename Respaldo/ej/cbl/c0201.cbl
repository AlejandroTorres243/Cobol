      *****************************************************************
      * Program name:    C0201.                               
      * Original author: ANTONIO CANO                                
      *
      * Maintenence Log                                              
      * Date      Author        Maintenance Requirement               
      * --------- ------------  --------------------------------------- 
      * 01/01/08 ANTONIO CANO   Created for COBOL class         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C0201.
       AUTHOR. ANTONIO CANO. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 01/01/08. 
       DATE-COMPILED. 01/01/08. 
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. IBM-3081. 
       OBJECT-COMPUTER. IBM-3081. 
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  COUNTERS-AND-ACCUMULATORS.
           05  W-NUM-X        PIC X(4) VALUE '1234'.
           05  W-NUM-9 REDEFINES  W-NUM-X PIC 9(4).
       77  A PIC 9(5)V9(8)    USAGE COMP.
       77  B PIC 9(13)V9(2)   USAGE COMP-3.
       77  C PIC S9(2).
      *****************************************************************
       PROCEDURE DIVISION.
           DISPLAY '1-W-NUM-X:' W-NUM-X ' A: ' A ' B' A A B 
           DISPLAY '2-W-NUM-9:' W-NUM-9
           COMPUTE W-NUM-9 = W-NUM-9 + 1
           DISPLAY '3-W-NUM-X:' W-NUM-X
           DISPLAY '4-W-NUM-9:' W-NUM-9
           MOVE 'ABCD'     TO W-NUM-X 
           DISPLAY '5-W-NUM-X:' W-NUM-X
           DISPLAY '6-W-NUM-9:' W-NUM-9
           GOBACK.
   
