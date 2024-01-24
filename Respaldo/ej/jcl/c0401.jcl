//C0401J JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PGM=C0401
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(&PGM.),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//EJECUTA   EXEC PGM=C0401
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//*ACCTREC   DD DSN=&SYSUID..DATA,DISP=SHR
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//SYSIN     DD *
ANTONIO   CANO
12345678901234567890
//***************************************************/
// ELSE
// ENDIF
