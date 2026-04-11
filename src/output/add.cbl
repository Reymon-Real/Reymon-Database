      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    add.cbl         ***
      *** Date:    18/03/2026      ***
      *** Update:  31/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      ***************************************
      *** Division for set configurations ***
      ***       of the program            ***
      ***************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REYDB_ADD IS INITIAL.
       AUTHOR. Reymon Dev.
       DATE-WRITTEN.  March 18 from 2026.
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
           OPEN EXTEND FC-REYDB. *> Open the file to process using output logic

           MOVE LS-REYDB-KEY    TO FS-REYDB-KEY.    *> Set Primary Key in the database
           MOVE LS-REYDB-BUFFER TO FS-REYDB-BUFFER. *> Set content of the table in the database

           WRITE FS-REYDB-RECORD                          *> Write table
           
           INVALID KEY *> Verify if the key exist
               
               MOVE WS-REYDB-FAILURE TO LS-REYDB-RESULT
           
           NOT INVALID KEY *> Verify if the key not exist
               
               MOVE WS-REYDB-SUCCESS TO LS-REYDB-RESULT *> The operation is successful.
           
           END-WRITE.

           CLOSE FC-REYDB.

           GOBACK.
      ******************************************************************