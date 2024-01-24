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
       PROGRAM-ID.  C0303.
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
           END-EVALUATE

           DISPLAY 'RESULTADO :' RESULT
           .
           GOBACK.
