      *****************************************************************
      * Program name:    C1101
      * 01/01/08 MYNAME  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C1101.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01 MES-VALUE.
           02 FILLER PIC X(12) VALUE 'ENERO'.
           02 FILLER PIC X(12) VALUE 'JANUARY'.
           02 FILLER PIC X(12) VALUE 'FEBRERO'.
           02 FILLER PIC X(12) VALUE 'FEBRUARY'.
           02 FILLER PIC X(12) VALUE 'MARZO'.
           02 FILLER PIC X(12) VALUE 'MARCH'.
           02 FILLER PIC X(12) VALUE 'ABRIL'.
           02 FILLER PIC X(12) VALUE 'APRIL'.
           02 FILLER PIC X(12) VALUE 'MAYO'.
           02 FILLER PIC X(12) VALUE 'MAY'.
           02 FILLER PIC X(12) VALUE 'JUNIO'.
           02 FILLER PIC X(12) VALUE 'JUNE'.
           02 FILLER PIC X(12) VALUE 'JULIO'.
           02 FILLER PIC X(12) VALUE 'JULY'.
           02 FILLER PIC X(12) VALUE 'AGOSTO'.
           02 FILLER PIC X(12) VALUE 'AUGUST'.
           02 FILLER PIC X(12) VALUE 'SEPTIEMBRE'.
           02 FILLER PIC X(12) VALUE 'SEPTEMBER'.
           02 FILLER PIC X(12) VALUE 'OCTUBRE'.
           02 FILLER PIC X(12) VALUE 'OCTOBER'.
           02 FILLER PIC X(12) VALUE 'NOVIEMBRE'.
           02 FILLER PIC X(12) VALUE 'NOVEMBER'.
           02 FILLER PIC X(12) VALUE 'DICIEMBRE'.
           02 FILLER PIC X(12) VALUE 'DECEMBER'.
       01 MES-TABLA REDEFINES MES-VALUE.
          05 MES-TABLA-OC OCCURS 12 TIMES.
             10 MES-ES    PIC X(12).
             10 MES-EN    PIC X(12).
       77  W-I            PIC 9(2).
       77  W-IDIOMA       PIC X(2).
      * 01 MES-TABLA .
      *     02 MES PIC X(12) OCCURS 12 TIMES.
      *    ENERO       FEBRERO     MARZO
      *    123456789012345678901234567890
      *****************************************************************
       PROCEDURE DIVISION.
      *    MOVE MES-VALUE               TO MES-TABLA
           ACCEPT W-IDIOMA
           PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > 12
              IF W-IDIOMA = 'ES'
                 DISPLAY MES-ES(W-I)
              ELSE
                 DISPLAY MES-EN(W-I)
              END-IF
           END-PERFORM.
           GOBACK
           .

