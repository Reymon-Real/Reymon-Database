      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    exist.cbl       ***
      *** Date:    18/03/2026      ***
      *** Update:  30/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      ***************************************
      *** Division for set configurations ***
      ***       of the program            ***
      ***************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REYDB_EXIST IS INITIAL.
       AUTHOR. Reymon Dev.
       DATE-WRITTEN.  March 26 from 2026.
       DATE-COMPILED. March 30 from 2026.
      ******************************************************************

      ******************************************************************
       ENVIRONMENT DIVISION.
      ******************************************************************

      ******************************************************************
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       COPY "file/control/reydb.cpy".
      ******************************************************************

      ******************************************************************
       DATA DIVISION.
      ******************************************************************

      ******************************************************************
       FILE SECTION.

       COPY "file/section/reydb.cpy".
      ******************************************************************

      ******************************************************************
       WORKING-STORAGE SECTION.

       COPY "data/working/reydb.cpy".
       COPY "data/working/state.cpy".
      ******************************************************************

      ******************************************************************
       LINKAGE SECTION.

       COPY "data/linkage/reydb.cpy".
      ******************************************************************

      ******************************************************************
       PROCEDURE DIVISION RETURNING LS-REYDB-RESULT.

           OPEN I-O FC-REYDB. *> Open file if exist

           IF WS-REYDB-FILE-STATUS EQUAL "00" *> Verify if the file exist
              
              MOVE WS-REYDB-SUCCESS TO LS-REYDB-RESULT
           
           ELSE
              
              MOVE WS-REYDB-FAILURE TO LS-REYDB-RESULT
           
           END-IF.

           CLOSE FC-REYDB. *> Not problem with file status

           GOBACK.
      ******************************************************************