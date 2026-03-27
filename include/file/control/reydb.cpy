      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    reydb.cpy       ***
      *** Date:    18/03/2026      ***
      *** Update:  20/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      *************************************
      *** Settings of the physical file ***
      *************************************

           SELECT OPTIONAL FS-REYDB
           ASSIGN TO "reymon.rdb"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS FS-REYDB-PRIMARY-KEY.