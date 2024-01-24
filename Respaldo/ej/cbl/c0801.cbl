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
       PROGRAM-ID. C0801.
       AUTHOR. MYNAME. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 01/01/08. 
       DATE-COMPILED. 01/01/08. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  COUNTERS-AND-ACCUMULATORS.
           05  REC-KTR        PIC S9(4)     COMP.
           05  TOTAL-AMOUNT   PIC S9(3)V99  COMP-3.
           05  INPUT-DATA     PIC X(30).
       77  id-1 pic x(6) value '123*45'.
       77  id-2 pic x(4) value 'A*BC'.
       77  id-3 pic x    value '*'.
       77  id-4 pic x(6) value '6789*0'.
       77  id-5 pic x(5) value 'DE*FG'.
       77  id-7 pic x(30).
       77  id-8 pic 9(4).
      *****************************************************************
       PROCEDURE DIVISION.
           inspect id-7 replacing all LOW-VALUES by 'Z'
           move 1 to id-8
           STRING ID-1 ID-2 DELIMITED BY ID-3
                  ID-4 ID-5 DELIMITED BY SIZE
             INTO ID-7 WITH POINTER ID-8
           END-STRING
           DISPLAY id-7 ' : ' id-8
           GOBACK
           .