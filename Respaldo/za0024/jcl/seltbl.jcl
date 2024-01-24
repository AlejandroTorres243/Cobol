//SELTBL  JOB 1,NOTIFY=&SYSUID                                          00000104
//***************************************************/                  00000204
//* Copyright Contributors to the COBOL Programming Course              00000304
//* SPDX-License-Identifier: CC-BY-4.0                                  00000404
//***************************************************/                  00000504
//SQLEXEC EXEC DB2JCL                                                   00000604
//SYSIN   DD *,SYMBOLS=CNVTSYS                                          00000704
--******* SQL FOLLOWS                                                   00000804
  SELECT * FROM &SYSUID.T;                                              00000904
/*                                                                      00001007
