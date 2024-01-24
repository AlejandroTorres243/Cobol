      *ARRAY1 = [A,B,C,D,E]
      *ARRAY1 [2] -js
      *ARRAY1 (3) = "C"

      *****************************************************************
      * Program name:    C1102
      * 01/01/08 MYNAME  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C1102.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  C-MAX-I        PIC 9 VALUE 2.
       01  C-MAX-J        PIC 9 VALUE 2.
       01  C-MAX-K        PIC 9 VALUE 2.
       77  W-NUM-PROVINCIAS PIC 9(4).
       01  VALUE-LOAD.
           02 FILLER PIC X(9) VALUE 'ABCMXJA18'.
      *     "01ALAVA     02ALBACETE     "
      *     12123456789012
       01  T-PROVINCIAS.
           05 T-PROVINCIA OCCURS 200 TIMES.
      *     05 T-PROVINCIA OCCURS 0 TO 200 TIMES
      *        DEPENDING ON W-NUM-PROVINCIAS.
              10 T-PROVINCIA-CODIGO PIC 9(2).
              10 T-PROVINCIA-NOMBRE PIC X(10).
       01  TABLA REDEFINES VALUE-LOAD.
           05 TABLA-1 OCCURS 2 TIMES INDEXED BY I.
             10 TABLA-2 OCCURS 2 TIMES INDEXED BY J.
                15 TABLA-3 OCCURS 2 TIMES INDEXED BY K.
                   20 ITEM PIC X.
      *    select * from provincias
      *    order by codigo, nombre
      *ARRAY2      1 2 3
      *          1 A B C
      *          2 M X J
      *          3 A 1 8

      *ARRAY2 (2 2) A B C  M X J  A 1 8
      *             1 2 3  1 2 3  1 2 3
      *               1      2      3

      *             A B C M X J A 1
      *    W-K      1 2 1 2 1 2 1 2
      *    W-J       1   2   1   2
      *    W-I         1       2
       77  W-I      PIC 9(4).
       77  W-J      PIC 9(4).
       77  W-K      PIC 9(4).
      *****************************************************************
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > C-MAX-I
              PERFORM VARYING J FROM 1 BY 1 UNTIL J > C-MAX-J
                 PERFORM VARYING K FROM 1 BY 1 UNTIL K > C-MAX-K
                    SET W-I            TO I
                    SET W-J            TO J
                    SET W-K            TO K
                    DISPLAY 'W-I: ' W-I ' W-J: ' W-J ' W-K: ' W-K
                    DISPLAY ITEM (I J K)
                 END-PERFORM
              END-PERFORM
           END-PERFORM.
           GOBACK
           .





