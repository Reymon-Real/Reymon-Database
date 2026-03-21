      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    db.cbl          ***
      *** Date:    18/03/2026      ***
      *** Update:  20/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      *************************************
      *** Settings of the physical file ***
      *************************************

           SELECT OPTIONAL FC-REYMON-DATABASE
           ASSIGN DYNAMIC LS-REYMON-DATABASE-NAME
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS FS-PRIMARY-KEY
           FILE STATUS IS LS-REYMON-DATABASE-FILE-STATUS.
