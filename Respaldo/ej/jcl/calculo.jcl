//CALCULOJ JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PGM=CALCULO
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(&PGM.),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
//EJECUTA   EXEC PGM=&PGM.
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY



