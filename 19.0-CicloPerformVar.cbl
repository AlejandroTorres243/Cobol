      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Listing6-4.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Counters.
           02 HundredsCount PIC 99 VALUE ZEROS.
           02 TensCount PIC 99 VALUE ZEROS.
           02 UnitsCount PIC 99 VALUE ZEROS.
       01 Odometer.
           02 PrnHundreds PIC 9.
           02 FILLER PIC X VALUE "-".
           02 PrnTens PIC 9.
           02 FILLER PIC X VALUE "-".
           02 PrnUnits PIC 9.
       PROCEDURE DIVISION.
       Begin.
       DISPLAY "Using an out-of-line Perform".
       *> CICLO CON ADJETIVO
       PERFORM CountMileage
       *> CONDICION VARIABLE - INICIO DE X A Y MIENTRAS (LA CONDICION)
           VARYING HundredsCount FROM 0 BY 1 UNTIL HundredsCount > 9
           AFTER TensCount FROM 0 BY 1 UNTIL TensCount > 9
           AFTER UnitsCount FROM 0 BY 1 UNTIL UnitsCount > 9
       *>----------------------------------------------
       *>RECORDATORIO SIEMPRE COMENZAR LA OPCION FINAL
       *> PARA QUE LO DEMAS SEA LA SENTENCIA REPETITIVA
       *>----------------------------------------------
       *> SENTENCIA FINAL
       DISPLAY "End of odometer simulation."
       STOP RUN.
       *> SENTENCIA REPETITIVA
       CountMileage.
       MOVE HundredsCount TO PrnHundreds
       MOVE TensCount TO PrnTens
       MOVE UnitsCount TO PrnUnits
       DISPLAY "Out - " Odometer.
