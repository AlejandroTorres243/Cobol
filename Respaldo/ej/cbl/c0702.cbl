      *****************************************************************
      * Program name:    C0303
      * Original author: MYNAME
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 01/01/08 MYNAME  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C0702.
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
       77  OP-1          PIC 9(3).
       77  OP-2          PIC 9(3).
       77  OP            PIC X.
       77  RESULT        PIC 9(6).
       01  W-EDAD        PIC 9(2).
           88 BEBE       VALUE 0 THRU 3.
           88 NINIO      VALUE 4 THRU 10.
           88 ADOLESCENTE VALUE 11 THRU 17.
           88 ADULTO      VALUE 18 THRU 65.
      *****************************************************************
       PROCEDURE DIVISION.
           ACCEPT OP-1
           ACCEPT OP-2
           ACCEPT OP
      *    IF OP = '+'
      *       COMPUTE RESULT = OP-1 + OP-2
      *    ELSE
      *       IF OP = '-'
      *          COMPUTE RESULT = OP-1 - OP-2
      *       ELSE
      *          IF OP = '*'
      *            COMPUTE RESULT = OP-1 * OP-2
      *          ELSE
      *            IF OP = '/'
      *              COMPUTE RESULT = OP-1 / OP-2
      *            END-IF
      *          END-IF
      *       END-IF
      *    END-IF
           EVALUATE OP
              WHEN '+'
                 COMPUTE RESULT = OP-1 + OP-2
              WHEN '-'
                 COMPUTE RESULT = OP-1 - OP-2
              WHEN '*'
                 COMPUTE RESULT = OP-1 * OP-2
              WHEN '/'
                 COMPUTE RESULT = OP-1 / OP-2
              WHEN OTHER
                 DISPLAY 'OPERACION DESCONOCIDA'
           END-EVALUATE

           INITIALIZE W-EDAD
           EVALUATE TRUE
              WHEN BEBE
              WHEN NINIO
              WHEN ADOLESCENTE
                   DISPLAY 'ES UN MENOR: ' W-EDAD
              WHEN ADULTO
                   DISPLAY 'ES UN ADULTO: ' W-EDAD
              WHEN OTHER
                   DISPLAY 'ES UN ANCIANO: ' W-EDAD
           END-EVALUATE

           IF W-EDAD IS POSITIVE OR W-EDAD IS ZERO
              DISPLAY 'AAA'
           ELSE
              DISPLAY 'BBBB'
           END-IF
           DISPLAY 'RESULTADO :' RESULT
           .
           GOBACK.
