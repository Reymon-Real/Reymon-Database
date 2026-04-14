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
       PROGRAM-ID. REYDB_SEARCH IS INITIAL.
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
       
       77 LS-REYDB-KEY PIC 9(18) COMP-5.
       77 LS-REYDB-POINTER USAGE IS POINTER.
       
      ******************************************************************

      ******************************************************************
       PROCEDURE DIVISION USING BY VALUE LS-REYDB-KEY
                          RETURNING LS-REYDB-POINTER.
      ******************************************************************

      ******************************************************************
           OPEN I-O FC-REYDB. *> Open the file to process using output logic

           MOVE LS-REYDB-KEY TO FS-REYDB-KEY.    *> Set Primary Key in the Database

           READ FC-REYDB KEY IS FS-REYDB-KEY
           
           INVALID KEY

           SET LS-REYDB-POINTER TO NULL
           
           NOT INVALID KEY

           MOVE FS-REYDB-KEY    TO WS-REYDB-KEY-C
           MOVE FS-REYDB-BUFFER TO WS-REYDB-BUFFER-C
           SET LS-REYDB-POINTER TO ADDRESS OF WS-REYDB-RECORD-C

           END-READ.

           CLOSE FC-REYDB.

           GOBACK.
      ******************************************************************