//C0501J JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PGM=C0501
//*COBRUN  EXEC IGYWCL
//*COBOL.SYSIN  DD DSN=&SYSUID..COBOL(&PGM.),DISP=SHR
//*LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
//***************************************************/
//* IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=&PGM.
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
//* ELSE
//* ENDIF
