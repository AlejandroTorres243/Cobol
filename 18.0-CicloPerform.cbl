      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Listing6-1.
       PROCEDURE DIVISION.
       LevelOne.
           DISPLAY "> Starting to run program"
           PERFORM LevelTwo
           DISPLAY "> Back in LevelOne"
           DISPLAY "Finish".
           STOP RUN.
       LevelFour.
           DISPLAY "> > > > Now in LevelFour".
       LevelThree.
           DISPLAY "> > > Now in LevelThree"
           PERFORM LevelFour
           DISPLAY "> > > Back in LevelThree".
       LevelTwo.
           DISPLAY "> > Now in LevelTwo"
           PERFORM LevelThree
           DISPLAY "> > Back in LevelTwo".
