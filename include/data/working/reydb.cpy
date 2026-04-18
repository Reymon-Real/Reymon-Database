      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    reydb.cpy       ***
      *** Date:    20/03/2026      ***
      *** Update:  31/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      ******************************************************************
       77 WS-REYDB-EOF PIC X VALUE 'N'.

       77 WS-REYDB-FILE-STATUS PIC X(02) VALUE SPACE.

       77 WS-TEMP-FILE-STATUS PIC X(2) VALUE SPACE.

       77 WS-REYDB-RESULT PIC 9(18) VALUE ZERO.
      ******************************************************************

      ******************************************************************
       01 WS-REYDB-RECORD.
          02 WS-REYDB-KEY    PIC X(18)  VALUE ZERO.
          02 WS-REYDB-BUFFER PIC X(512) VALUE SPACE.
      ******************************************************************

      ******************************************************************
       01 WS-REYDB-RECORD-C.
          02 WS-REYDB-KEY-C    PIC 9(18) COMP-5  VALUE ZEROS.
          02 WS-REYDB-BUFFER-C PIC X(512)        VALUE SPACE.
      ******************************************************************