//COMPILEJ JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PATH=ZA0023.COBOL(C0505)
// SET PGM=C0505
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&PATH.,DISP=SHR
//COBOL.SYSLIB DD DSN=&SYSUID..COPY,DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
