       IDENTIFICATION DIVISION.
       PROGRAM-ID. C0301.
       AUTHOR. Antonio Cano.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 W-NUM-P   PIC S9(8)V99  VALUE 00012345.56.
       01 W-NUM-N   PIC S9(8)V99  VALUE -00012345.56.
       01 Edit1     PIC  99,999,999.99.
       01 Edit2     PIC  ZZ,ZZZ,ZZ9.99.
       01 Edit3     PIC  $*,***,**9.99.
       01 Edit4     PIC  ++,+++,++9.99.
       01 Edit5     PIC  $$,$$$,$$9.99.
       01 Edit6     PIC  $$,$$$,$$9.00.
       01 Edit7     PIC  99/999/999.99.
       01 Edit8     PIC  99999000999.99.
       01 Edit9     PIC  99999BBB999.99.
       
       PROCEDURE DIVISION.
       Begin.
           DISPLAY 'POSITIVOS'
           MOVE W-NUM-P TO Edit1
           DISPLAY "Edit1 = " Edit1
           
           MOVE W-NUM-P TO Edit2
           DISPLAY "Edit2 = " Edit2
           
           MOVE W-NUM-P TO Edit3
           DISPLAY "Edit3 = " Edit3
           
           MOVE W-NUM-P TO Edit4
           DISPLAY "Edit4 = " Edit4
           
           MOVE W-NUM-P TO Edit5
           DISPLAY "Edit5 = " Edit5
           
           MOVE W-NUM-P TO Edit6
           DISPLAY "Edit6 = " Edit6
           
           MOVE W-NUM-P TO Edit7
           DISPLAY "Edit7 = " Edit7
           
           MOVE W-NUM-P TO Edit8
           DISPLAY "Edit8 = " Edit8
           
           MOVE W-NUM-P TO Edit9
           DISPLAY "Edit9 = " Edit9

           DISPLAY 'NEGATIVOS'
           MOVE W-NUM-N TO Edit1
           DISPLAY "Edit1 = " Edit1
                      
           MOVE W-NUM-N TO Edit2
           DISPLAY "Edit2 = " Edit2
                      
           MOVE W-NUM-N TO Edit3
           DISPLAY "Edit3 = " Edit3
                      
           MOVE W-NUM-N TO Edit4
           DISPLAY "Edit4 = " Edit4
                      
           MOVE W-NUM-N TO Edit5
           DISPLAY "Edit5 = " Edit5
                      
           MOVE W-NUM-N TO Edit6
           DISPLAY "Edit6 = " Edit6
                      
           MOVE W-NUM-N TO Edit7
           DISPLAY "Edit7 = " Edit7
                      
           MOVE W-NUM-N TO Edit8
           DISPLAY "Edit8 = " Edit8
                      
           MOVE W-NUM-N TO Edit9
           DISPLAY "Edit9 = " Edit9
           
           STOP RUN.       
       END PROGRAM C0301.     

























