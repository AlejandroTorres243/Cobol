PROCESS OFFSET         
       IDENTIFICATION DIVISION. 
       PROGRAM-ID.  C0502. 
       AUTHOR.  Antonio Cano.
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION.
       SPECIAL-NAMES. 
           DECIMAL-POINT IS COMMA.
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       77  A    PIC S9(5)V9(2) USAGE BINARY VALUE 100,5.
       77  B    PIC S9(8)V9(2) USAGE COMP-3 VALUE 0,5.
       77  B1   PIC S9(8)V9(2) USAGE COMP-3 VALUE 0,25.
       77  B2   PIC S9(8)V9(2) USAGE COMP-3 VALUE 0,25.      
       77  C    PIC ---.---.--9,9999  VALUE ZEROES.
       77  D    PIC ---.---.--9,9999  VALUE ZEROES.
       PROCEDURE DIVISION.
           DISPLAY "01-A  :" A
           DISPLAY "02-B  :" B
           SUBTRACT B FROM A
           DISPLAY '03-DESPUES DE RESTAR:'
           DISPLAY "04-A  :" A
           DISPLAY "05-B  :" B
           MOVE A TO C
           DISPLAY "06-A  :" C
           MOVE B TO C
           DISPLAY "07-B  :" C
           DISPLAY '08-RESTA B1+B2 DE A Y B'
           SUBTRACT B1 B2 FROM A B
           MOVE A TO C
           DISPLAY "09-A  :" C
           MOVE B TO C
           DISPLAY "10-B  :" C
           SUBTRACT A FROM B GIVING D 
           MOVE A TO C
           DISPLAY "11-A  :" C
           MOVE B TO C
           DISPLAY "12-B  :" C
           DISPLAY "13-D  :" D
       
           GOBACK.
