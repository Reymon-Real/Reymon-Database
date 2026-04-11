      ********************************
      *** Author:  Reymon Dev      ***
      *** File:    reydb.cpy       ***
      *** Date:    18/03/2026      ***
      *** Update:  27/03/2026      ***
      *** License: AGPL-3-or-later ***
      ********************************

      *************************************
      *** Settings of the database file ***
      *************************************

           SELECT FC-REYDB
           ASSIGN TO "reymon.db"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS FS-REYDB-KEY
           FILE STATUS WS-REYDB-FILE-STATUS.
      
      **********************************
      *** Settings for the Work File ***
      **********************************

           SELECT FC-WORK
           ASSIGN TO "work.dat".

      **************************************
      *** Settings for the Temporal File ***
      **************************************

           SELECT FC-TEMP
           ASSIGN TO "temporal.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS FS-TEMP-KEY
           FILE STATUS WS-TEMP-FILE-STATUS.