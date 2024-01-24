//C1201J JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PGM=C1201
//* PASO DE BORRADO
//DELETE    EXEC PGM=IEFBR14
//DD1  DD   DSN=&SYSUID..DATA8,DISP=(MOD,DELETE),
//          SPACE=(TRK,(1,0),RLSE)
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(&PGM.),DISP=SHR
//COBOL.SYSLIB DD DSN=&SYSUID..COPY,DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//EJECUTA   EXEC PGM=&PGM.
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//INFILEDD  DD DSN=&SYSUID..DATA,DISP=SHR
//OUTFILE   DD DSN=&SYSUID..DATA8,DISP=(,CATLG,DELETE),
//             SPACE=(TRK,(5,5)),
//             DCB=(LRECL=43,RECFM=FB)
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
