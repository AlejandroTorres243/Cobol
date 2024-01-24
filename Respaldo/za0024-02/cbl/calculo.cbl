      *****************************************************************
      * Program name:    X                               
      * Original author: Manuel                                
      *
      * Maintenence Log                                              
      * Date      Author        Maintenance Requirement               
      * --------- ------------  --------------------------------------- 
      * 01/01/08 Manuel  Created for COBOL class         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  X.
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
       01  MI-DINERO   PIC 9(3)V99 USAGE COMP-3 VALUE 600.90.
       01  CUOTA       PIC 9(3)V99 USAGE COMP-3 VALUE 200.30.
       01  TOTAL      PIC 9(3)V99 USAGE COMP-3 VALUE 0.
      *****************************************************************
       PROCEDURE DIVISION.
           COMPUTE TOTAL = CUOTA * 3
           IF (MI-DINERO = TOTAL)
              DISPLAY 'ES IGUAL'
           ELSE
              DISPLAY 'NO ES IGUAL'
           END-IF
           GOBACK.
           
