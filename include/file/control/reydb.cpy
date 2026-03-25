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

           SELECT OPTIONAL FC-REYMON-DATABASE
           ASSIGN TO "reymon.rdb"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS FS-PRIMARY-KEY.