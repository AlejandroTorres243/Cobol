      *****************************************************************
      * Program name:    C1103
      * 01/01/08 MYNAME  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C1103.
      *****************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TABLE.
           05 WS-A PIC 9(1) OCCURS 10 TIMES INDEXED BY I.
       01  WS-SRCH PIC 9(1) VALUE 4.
       01  W-POS PIC S9(9) SIGN LEADING SEPARATE.
       01  W-I PIC 99.
       PROCEDURE DIVISION.
           MOVE '5874962310' TO WS-TABLE.
      *          1234567890
           PERFORM VARYING W-I FROM 0 BY 1 UNTIL W-I > 9
              MOVE W-I              TO WS-SRCH
              PERFORM BUSCAR
           END-PERFORM.
           GOBACK
           .
      *
      *
       BUSCAR.
           SET I TO 1.
           SEARCH WS-A
           AT END DISPLAY 'NUMBER NOT FOUND IN TABLE'
                  SET W-POS  TO I
             WHEN WS-A(I) = WS-SRCH
                  DISPLAY 'NUMBER FOUND IN TABLE'
                  SET W-POS       TO I
           END-SEARCH.
           DISPLAY 'LA POSICION DE ' W-I ' ES W-POS:' W-POS
           .
