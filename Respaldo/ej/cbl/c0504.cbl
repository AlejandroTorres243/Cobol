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
       77  R    PIC 9(13)V99  VALUE ZEROES.
       77  OUT  PIC ---.---.--9,9999  VALUE ZEROES.
       
       PROCEDURE DIVISION.
           MOVE 5    TO A
           MOVE 100  TO B
           DIVIDE A INTO B
           DISPLAY 'FORMATO1'
           DISPLAY "01-A  :" A
           DISPLAY "02-B  :" B
           MOVE 100  TO B
           DIVIDE A INTO B GIVING C
           DISPLAY 'FORMATO2'
           DISPLAY "03-A  :" A
           DISPLAY "04-B  :" B
           DISPLAY "05-C  :" C
           MOVE 100 TO A
           MOVE 5   TO B
           DIVIDE A BY B GIVING C
           DISPLAY 'FORMATO3'
           DISPLAY "06-A  :" A
           DISPLAY "07-B  :" B
           DISPLAY "08-C  :" C
           MOVE 3    TO A
           MOVE 100  TO B
           DIVIDE A INTO B GIVING C REMAINDER R
           DISPLAY 'FORMATO4'
           DISPLAY "09-A  :" A
           DISPLAY "10-B  :" B
           DISPLAY "11-C  :" C
           DISPLAY "12-C  :" R
           MOVE 100 TO A
           MOVE 3   TO B
           DIVIDE A BY B GIVING C REMAINDER R
           DISPLAY 'FORMATO5'
           DISPLAY "13-A  :" A
           DISPLAY "14-B  :" B
           DISPLAY "15-C  :" C
           DISPLAY "16-C  :" R

           GOBACK.
