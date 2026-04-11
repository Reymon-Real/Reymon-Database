      ***********************************
      *** Author:  Reymon Dev         ***
      *** File:    add.cbl            ***
      *** Date:    April 10 from 2026 ***
      *** Update:  April 10 from 2026 ***
      *** License: AGPL-3-or-later    ***
      ***********************************

      ***************************************
      *** Division for set configurations ***
      ***       of the program            ***
      ***************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REYDB_REMOVE IS INITIAL.
       AUTHOR. Reymon Dev.
       DATE-WRITTEN.  April 10 from 2026.
       DATE-COMPILED. April 10 from 2026.
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
           OPEN I-O FC-REYDB. *> Open the file to process using output logic

           MOVE LS-REYDB-KEY    TO FS-REYDB-KEY.    *> Set Primary Key in the database
           MOVE LS-REYDB-BUFFER TO FS-REYDB-BUFFER. *> Set content of the table in the database

           READ FC-REYDB KEY IS FS-REYDB-KEY
           
           INVALID KEY
           MOVE WS-REYDB-REMOVE-FAILURE TO LS-REYDB-RESULT
           
           NOT INVALID KEY

           DELETE FC-REYDB *> Delete Register
           MOVE WS-REYDB-REMOVE-SUCCESS TO LS-REYDB-RESULT
           
           END-READ.

           CLOSE FC-REYDB.

           GOBACK.
      ******************************************************************