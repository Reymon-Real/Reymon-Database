// ********************************
// *** Author:  Reymon Dev      ***
// *** File:    reydb.h         ***
// *** License: AGPL-3-or-later ***
// *** Date:    18/03/2026      ***
// *** Update:  31/03/2026      ***
// ********************************

#ifndef REYDB_H
#define REYDB_H

#ifdef _cpluplus
extern "C" {
#endif

// *************************
// *** Standar Libraries ***
// *************************

#include <stdint.h>
#include <stdbool.h>

// ********************************
// *** Define Reymon Data Types ***
// *******************************

typedef void* reydb_table;

// *********************************
// *** Define General Data Types ***
// *********************************

typedef size_t reydb_key;

// ***************************
// *** Define Basic Macros ***
// ***************************

#define ZERO   0
#define ZEROS  0
#define ZEROES 0

#define SPACE  " "
#define SPACES " "

// **************************
// *** Database Structure ***
// **************************

typedef struct _REYMON_DATABASE {
	reydb_key key;
	char raw[512];

} reydb_t;

// ****************************
// *** State from Operation ***
// ****************************

typedef enum _REYDB_STATE {

	REYDB_SUCCESS = ZERO,
	REYDB_FAILURE = 1,

	REYDB_CREATE_SUCCESS = 2,
	REYDB_CREATE_FAILURE = 3,

	REYDB_REMOVE_SUCCESS = 4,
	REYDB_REMOVE_FAILURE = 5,

	REYDB_WRITE_SUCCESS = 6,
	REYDB_WRITE_FAILURE = 7,

	REYDB_CONTINUE = 8,
	REYDB_BREAK    = 9,

	REYDB_CRITICAL_ERROR = 0b1000000000000000,

} reydb_state;

// ******************
// *** Operations ***
// ******************

typedef enum _REYDB_OPERATION {

	REYDB_OPERATION_ADD     = 10,
	REYDB_OPERATION_REMOVE  = 11,
	REYDB_OPERATION_REWRITE = 12,
	REYDB_OPERATION_SORT    = 13,
	REYDB_OPERATION_SEARCH  = 14,

} reydb_oper;

// *******************
// *** Permissions ***
// *******************

typedef enum _REYDB_PERMISSIONS {

	REYDB_PERMIT_READ,
	REYDB_PERMIT_WRITE,
	REYDB_PERMIT_REWRITE,
	REYDB_PERMIT_DELETE,

} reydb_permit;

// **************************
// *** Special Structures ***
// **************************

typedef struct _REYMON_DATABASE_STATE {
	reydb_state success;
} reydb_state_t;

// *****************************
// *** Environmnet Functions ***
// *****************************

extern void REYDB_INIT();

// ********************************
// *** Administration Functions ***
// ********************************

// ************************
// *** Output Functions ***
// ************************

extern reydb_state REYDB_CREATE_DATABASE(); // Create the database

// ***********************
// *** Input Functions ***
// ***********************

extern reydb_state REYDB_READ(reydb_table); // Read the database without making a single change

// ************************
// *** Output Functions ***
// ************************

extern reydb_state REYDB_ADD(reydb_table);     // Add a record to the database
extern reydb_state REYDB_REMOVE(reydb_table);  // Delete a record from the database
extern reydb_state REYDB_REWRITE(reydb_table); // Rewrite a record

// ************************
// *** Search Functions ***
// ************************

extern reydb_state REYDB_SORT(); // Sort the records
extern reydb_state REYDB_SEARCH(reydb_table); // Search the register in the database 

// ***************************
// *** Utilities Functions ***
// ***************************

extern reydb_state REYDB_EXIST(); // Function to check if the database exists

#ifdef _cpluplus
}
#endif

#endif // REYDB_H