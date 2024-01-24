//C1101J JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PGM=C1102
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(&PGM.),DISP=SHR
//COBOL.SYSLIB DD DSN=&SYSUID..COPY,DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//EJECUTA   EXEC PGM=&PGM.
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//*ACCTREC   DD DSN=&SYSUID..DATA,DISP=SHR
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//SYSIN     DD *
EN
//***************************************************/
// ELSE
// ENDIF
