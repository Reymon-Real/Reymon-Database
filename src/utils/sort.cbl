      ***********************************
      *** Author:  Reymon Dev         ***
      *** File:    sort.cbl           ***
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
       PROGRAM-ID. REYDB_SORT IS INITIAL.
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

       77 WS-SYSTEM  PIC X(06) VALUE "system".
       77 WS-SYSCALL PIC X(64).

       COPY "data/working/reydb.cpy".
       COPY "data/working/state.cpy".
      ******************************************************************

      ******************************************************************
       LINKAGE SECTION.

       COPY "data/linkage/reydb.cpy".
      ******************************************************************

      ******************************************************************
       PROCEDURE DIVISION RETURNING LS-REYDB-RESULT.

           SORT FC-WORK
           ON ASCENDING KEY FS-WORK-KEY
           USING  FC-REYDB
           GIVING FC-TEMP.

           OPEN INPUT  FC-TEMP.
           OPEN OUTPUT FC-REYDB. *> Open file if exist

           PERFORM UNTIL WS-REYDB-EOF = 'S'

               READ FC-TEMP
               AT END MOVE 'S' TO WS-REYDB-EOF
               NOT AT END
               WRITE FS-REYDB-RECORD FROM FS-TEMP-RECORD
               END-READ

           END-PERFORM.

           CLOSE FC-TEMP.
           CLOSE FC-REYDB. *> Not problem with file status

           GOBACK.
      ******************************************************************