      ***********************************
      *** Author:  Reymon Dev         ***
      *** File:    rewrite.cbl        ***
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
       PROGRAM-ID. REYDB_REWRITE IS INITIAL.
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
           
           MOVE LS-REYDB-KEY TO FS-REYDB-KEY.

           READ FC-REYDB KEY IS FS-REYDB-KEY

           INVALID KEY *> Verify if the key exist

               MOVE WS-REYDB-WRITE-FAILURE TO LS-REYDB-RESULT
           
           NOT INVALID KEY *> Verify if the key not exist
               
               MOVE LS-REYDB-BUFFER TO FS-REYDB-BUFFER.
               
               REWRITE FS-REYDB-RECORD *> Update Register
               
               INVALID KEY

               MOVE WS-REYDB-WRITE-FAILURE TO LS-REYDB-RESULT *> The operation is successful.

               NOT INVALID KEY

               MOVE WS-REYDB-WRITE-SUCCESS TO LS-REYDB-RESULT *> The operation is successful.

               END-REWRITE

            END-READ

           CLOSE FC-REYDB.

       END-PROGRAM.
           GOBACK.
      ******************************************************************