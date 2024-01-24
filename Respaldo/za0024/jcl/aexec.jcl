//AEXECJ JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
// SET PGM=C0402
//DELETE  EXEC PGM=IEFBR14
//DD1     DD  DSN=&SYSUID..PRUEBA,DISP=(MOD,DELETE),
//            SPACE=(TRK,(1,1))
//* BORRAR EL DATASET DE SALIDA
//***************************************************/
//*DELETE   EXEC PGM=IDCAMS
//*SYSPRINT DD SYSOUT=*
//*SYSIN    DD *
//*    DELETE &SYSUID..PRUEBA
//*    SET MAXCC=0
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..COBOL(&PGM.),DISP=SHR
//COBOL.SYSLIB  DD DSN=&SYSUID..COPY,DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&PGM.),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=&PGM.
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//OUTDD     DD DSN=&SYSUID..PRUEBA,DISP=(,CATLG,DELETE),
//             SPACE=(TRK,(1,1),RLSE),RECFM=FB
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//SYSIN     DD *
Antonio
//***************************************************/
// ELSE
// ENDIF
