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
           05 WS-RECORD OCCURS 10 TIMES ASCENDING KEY IS WS-EMP-ID
              INDEXED BY I.
              10 WS-EMP-ID PIC 9(2).
              10 WS-NAME PIC A(3).
       77  WS-POS PIC 9.
       PROCEDURE DIVISION.
           MOVE '00ABC11DEF22GHI33JKL44MNO55PQR' TO WS-TABLE.
           SEARCH ALL WS-RECORD
           AT END DISPLAY 'INVALID EMP ID(RECORD NOT FOUND IN TABLE)'
             WHEN WS-EMP-ID (I) = 33
                  DISPLAY 'RECORD FOUND '
                  DISPLAY WS-EMP-ID(I)
                  DISPLAY WS-NAME(I)
           END-SEARCH.
           SET WS-POS TO I
           DISPLAY 'WS-POS: ' WS-POS
           SET I TO 1
           SEARCH WS-RECORD
           AT END DISPLAY 'NOMBRE NOT FOUND'
             WHEN WS-NAME (I) = 'ABC'
                  DISPLAY 'RECORD FOUND '
                  DISPLAY WS-EMP-ID(I)
                  DISPLAY WS-NAME(I)
           END-SEARCH.
           SET WS-POS TO I
           DISPLAY 'WS-POS: ' WS-POS

           GOBACK
           .
