      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EstructuraIfResumida.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Num PIC 99 VALUES ZERO.
       01 Aux PIC 99 VALUES ZERO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> NOTA: SI SE RESUME QUITANDO LOS END-IF
           *> PUEDE LLEGAR E ANULAR LOS PASOS

            MOVE 95 TO Num
            IF Num < 5 THEN
                DISPLAY "ESTE ES UN NUMERO ES MENOR"
                MOVE Num to Aux
            END-IF
            IF Num > 25 THEN
                   DISPLAY "TU NUMERO ES MAYOR"
            END-IF
                IF Num > 20
                   DISPLAY "HOLA"
                END-IF
           DISPLAY "FINAL DEL PROGRAMA"
            STOP RUN.
       END PROGRAM EstructuraIfResumida.
