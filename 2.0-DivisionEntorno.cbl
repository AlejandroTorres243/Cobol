      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DivisionEntorno.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. Ordenador donde se escribio el codigo.
       OBJECT-COMPUTER. Ordenador donde se ejecutara el codigo.
       SPECIAL-NAMES.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT [OPTIONAL] NombreDelArchivo.
       ASSIGN TO TipoDeDispositivo.
       ORGANIZATION IS TipoDeOrganizacion.
       ACCESS MODE IS ModoDeAccesoAlArchivo.
       RECORD KEY IS ClaveDelRegistro.
       ALTERNATE RECORD KEY IS Claves de alternativas del registro.
       WITH DUPLICATES
       STATUS IS. VaribleDeEstadoDelArchivo


       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM DivisionEntorno.
