PROCESS OFFSET         
       IDENTIFICATION DIVISION. 
       PROGRAM-ID.  C0503. 
       AUTHOR.  Antonio Cano.
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION.
       SPECIAL-NAMES. 
           DECIMAL-POINT IS COMMA.
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       77  A    PIC 9(13)V99  VALUE ZEROES.
       77  B    PIC 9(13)V99  VALUE ZEROES.
       77  C    PIC 9(13)V99  VALUE ZEROES.
       77  OUT  PIC ---.---.--9,9999  VALUE ZEROES.
       
       PROCEDURE DIVISION.
           MOVE 100 TO A
           MULTIPLY 5 BY A
           DISPLAY "01-A  :" A
           MOVE 100 TO B
           MOVE 200 TO C
           MULTIPLY 5 BY B C   
           DISPLAY "02-B  :" B
           DISPLAY "03-C  :" B

           GOBACK.
