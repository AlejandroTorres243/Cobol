//C1002J JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PGM=C1002
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(&PGM.),DISP=SHR
//COBOL.SYSLIB DD DSN=&SYSUID..COPY,DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
