PROCESS OFFSET         
       IDENTIFICATION DIVISION. 
       PROGRAM-ID.  C0501. 
       AUTHOR.  Antonio Cano.
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION.
       SPECIAL-NAMES. 
           DECIMAL-POINT IS COMMA.
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       77  A    PIC S9(5)V9(2) USAGE BINARY VALUE 100,05.
       77  B    PIC S9(8)V9(2) USAGE COMP-3 VALUE 2,8.
       77  C    PIC ---.---.--9,9999  VALUE ZEROES.
       01  ITEMS.
           05 ITEM-1 OCCURS 6 TIMES.
              10 ITEM-A PIC S9(3).
              10 ITEM-B PIC +99.9.
              10 ITEM-C PIC X(4).
              10 ITEM-D REDEFINES ITEM-C PIC 9(4).
              10 ITEM-E USAGE COMP-1.
              10 ITEM-F USAGE INDEX.
           05 ITEM-2.
              10 ITEM-A PIC S9(3).
              10 ITEM-B PIC +9V9.
              10 ITEM-C PIC A(4).
              10 ITEM-D PIC 9(4). 
              10 ITEM-E PIC 9(9) USAGE COMP.
              10 ITEM-F USAGE INDEX.
       PROCEDURE DIVISION.
           DISPLAY "01-A  :" A
           DISPLAY "02-B  :" B
           ADD A TO B
           DISPLAY '03-DESPUES DE SUMAR:'
           DISPLAY "04-A  :" A
           DISPLAY "05-B  :" B
           MOVE A TO C
           DISPLAY "06-A  :" C
           MOVE B TO C
           DISPLAY "07-B  :" C
           ADD A TO B GIVING C 
           DISPLAY "08-C  :" C
           ADD 1000000000 TO A 
           MOVE A         TO C
           DISPLAY '09-A DESPUES DE SUMAR 1000000000:' C
           ADD 1000000000 TO A
               ON SIZE ERROR DISPLAY "10-ERROR AL SUMAR A"
           END-ADD
           MOVE 0,01 TO A
           ADD 0,006 TO A
           DISPLAY '11-A 0,01+0,006:' A
           MOVE A TO C 
           DISPLAY '12-A 0,01+0,006:' C
           MOVE 0,01 TO A
           ADD 0,006 TO A ROUNDED 
           DISPLAY '13-A 0,01+0,006:' A
           MOVE A TO C 
           DISPLAY '14-A 0,01+0,006:' C
           INITIALIZE ITEMS.
           MOVE 100   TO ITEM-A OF ITEM-2
                         ITEM-A OF ITEM-1(1)
           MOVE 1,1   TO ITEM-B OF ITEM-2
                         ITEM-B OF ITEM-1(1)
           MOVE 1234  TO ITEM-D OF ITEM-2
                         ITEM-D OF ITEM-1(1)
           MOVE 1000  TO ITEM-E OF ITEM-2      
                         ITEM-E OF ITEM-1(1).
           DISPLAY '15-ITEM1: ITEM-A(1)=' ITEM-A OF ITEM-1(1)
           DISPLAY '16-ITEM1: ITEM-B(1)=' ITEM-B OF ITEM-1(1)
           DISPLAY '17-ITEM1: ITEM-C(1)=' ITEM-C OF ITEM-1(1)
           DISPLAY '18-ITEM1: ITEM-D(1)=' ITEM-D OF ITEM-1(1)
           DISPLAY '19-ITEM1: ITEM-E(1)=' ITEM-E OF ITEM-1(1)
           DISPLAY '21-ITEM2: ITEM-A(1)=' ITEM-A OF ITEM-2
           DISPLAY '22-ITEM2: ITEM-B(1)=' ITEM-B OF ITEM-2
           DISPLAY '23-ITEM2: ITEM-C(1)=' ITEM-C OF ITEM-2
           DISPLAY '24-ITEM2: ITEM-D(1)=' ITEM-D OF ITEM-2
           DISPLAY '25-ITEM2: ITEM-E(1)=' ITEM-E OF ITEM-2
           ADD CORRESPONDING ITEM-2 TO ITEM-1(1)
           DISPLAY '26-ITEM1: ITEM-A(1)=' ITEM-A OF ITEM-1(1)
           DISPLAY '27-ITEM1: ITEM-B(1)=' ITEM-B OF ITEM-1(1)
           DISPLAY '28-ITEM1: ITEM-C(1)=' ITEM-C OF ITEM-1(1)
           DISPLAY '29-ITEM1: ITEM-D(1)=' ITEM-D OF ITEM-1(1)
           DISPLAY '30-ITEM1: ITEM-E(1)=' ITEM-E OF ITEM-1(1)
           GOBACK.
