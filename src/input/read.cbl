      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    add.cbl         ***
      *** Date:    31/03/2026      ***
      *** Update:  31/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      ***************************************
      *** Division for set configurations ***
      ***       of the program            ***
      ***************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REYDB_READ IS INITIAL.
       AUTHOR. Reymon Dev.
       DATE-WRITTEN.  March 31 from 2026.
       DATE-COMPILED. March 31 from 2026.
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
       PROCEDURE DIVISION USING     LS-REYDB-RECORD
                          RETURNING LS-REYDB-RESULT.
      ******************************************************************

      ******************************************************************
       START-PROGRAM SECTION. *> This section is included if the procedure
                              *> contains a line break to set the function parameters

           OPEN INPUT FC-REYDB. *> Open the file to process using output logic

           MOVE LS-REYDB-KEY    TO FS-REYDB-KEY.    *> Set Primary Key in the database
           MOVE LS-REYDB-BUFFER TO FS-REYDB-BUFFER. *> Set content of the table in the database

           READ FC-REYDB KEY IS FS-REYDB-KEY
           
           INVALID KEY

               MOVE WS-REYDB-FAILURE TO LS-REYDB-RESULT
           
           NOT INVALID KEY
           
               MOVE WS-REYDB-SUCCESS TO LS-REYDB-RESULT
           
           END-READ.

           CLOSE FC-REYDB.

           GOBACK.
      ******************************************************************