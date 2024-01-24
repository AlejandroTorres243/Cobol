       IDENTIFICATION DIVISION.
       PROGRAM-ID.  C0204.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CadenaOriginal    PIC X(50) VALUE '   Hola, mundo!   '.
       01 CadenaSinEspacios PIC X(50).
       01 Longitud          PIC 9(4) VALUE 0.
       01 Trailing-Space    PIC 9(3).
       01 i                 PIC 9(3).
       PROCEDURE DIVISION.
       Inicio.
           MOVE FUNCTION TRIM(CadenaOriginal) TO CadenaSinEspacios.
           MOVE LENGTH OF CadenaSinEspacios TO Longitud.

           DISPLAY 'Cadena original: ' CadenaOriginal.
           DISPLAY 'Cadena sin espacios: ' CadenaSinEspacios.
           DISPLAY 'Longitud después de quitar espacios: ' Longitud.
           INSPECT FUNCTION REVERSE(CadenaSinEspacios)
                   TALLYING Trailing-Space FOR LEADING SPACES.
           COMPUTE Longitud = Longitud - Trailing-Space
           DISPLAY 'Longitud sin los espacios en blanco: ' Longitud
           STOP RUN
           .
          