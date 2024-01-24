     *****************************************************************
      * Program name:    C0702
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
       01  C-CONSTANTES.
           05 C-PI        PIC 9(2)V9(4) COMP-3 VALUE 3.1416.
       01  W-VARIABLES.
           05 W-NUMREG    PIC 9(4) COMP.
           05 W-CNT       PIC 9(4) COMP.
           05 W-TIMES     PIC 9(4).
       01  SW-FICHERO     PIC X VALUE 'N'.
           88 SW-FICHERO-EOF    VALUE 'S'.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN.
           PERFORM INICIO
      *    MOVE 5 TO W-TIMES
      *    PERFORM PROCESO W-TIMES TIMES
      *    PERFORM PROCESO UNTIL W-NUMREG >= 5
           PERFORM WITH TEST AFTER UNTIL W-NUMREG >= 5
              PERFORM PROCESO
           END-PERFORM

           MOVE 10 TO W-CNT
           PERFORM WITH TEST AFTER UNTIL W-CNT = ZERO
               DISPLAY W-CNT
               SUBTRACT 1 FROM W-CNT
           END-PERFORM.
      *    for (let i=10; i<27; i+=3)
           PERFORM VARYING W-CNT FROM 10 BY 3 UNTIL SW-FICHERO-EOF
              DISPLAY 'VARYING :' W-CNT
           END-PERFORM
      *    DISPLAY 'W-TIMES:' W-TIMES
           GO TO FINALIZAR
           .
       INICIO.
           INITIALIZE W-VARIABLES
      *    ABRO FICHEROS. OPEN FICHERO
           IF SW-FICHERO-EOF
              CONTINUE
              DISPLAY 'CONTINUE'
           ELSE
              NEXT SENTENCE
           END-IF
           DISPLAY 'A'
           .

       PROCESO.
           DISPLAY 'PROCESO: ' W-NUMREG
           ADD 1 TO W-NUMREG
      *    DISPLAY 'TIMES: ' W-TIMES
      *    INITIALIZE  W-TIMES
           .
       FINALIZAR.
      *    CERRAR FICHEROS.
           MOVE 0 TO W-NUMREG
           DISPLAY W-NUMREG
           GOBACK
           .

