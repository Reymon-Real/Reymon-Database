      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    add.cbl         ***
      *** Date:    18/03/2026      ***
      *** Update:  18/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      ***************************************
      *** Division for set configurations ***
      ***       of the program            ***
      ***************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. rdb_create_database.

       ENVIRONMENT DIVISION. 

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       COPY "file/control/rdb.cpy".

       DATA DIVISION.

       FILE SECTION.
       COPY "file/section/rdb.cpy".

       WORKING-STORAGE SECTION.
       COPY "data/working/rdb.cpy".

       LINKAGE SECTION.
       COPY "data/linkage/file-control.cpy".

       PROCEDURE DIVISION USING LS-REYMON-DATABASE-NAME
                                LS-REYMON-DATABASE-FILE-STATUS.

           OPEN OUTPUT FC-REYMON-DATABASE.
           CLOSE FC-REYMON-DATABASE.
