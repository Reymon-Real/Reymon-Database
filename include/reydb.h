// ********************************
// *** Author:  Reymon Dev      ***
// *** File:    reydb.h         ***
// *** License: AGPL-3-or-later ***
// *** Date:    18/03/2026      ***
// *** Update:  18/03/2026      ***
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

typedef size_t primary_key;

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
	uint16_t    success;
} reydb_t;

// ****************************
// *** State from Operation ***
// ****************************

typedef enum _REYDB_STATE {

	REYDB_SUCCESS = ZERO | 0b0000000000000000,
	REYDB_FAILURE = ZERO | 0b0000000000000001,

	REYDB_CREATE_SUCCESS = ZERO | 0b0000000000000010,
	REYDB_CREATE_FAILURE = ZERO | 0b0000000000000011,

	REYDB_CRITICAL_ERROR = ZERO | 0b1000000000000000,

} reydb_state;

// *******************
// *** Permissions ***
// *******************

typedef enum _REYDB_PERMISSIONS {

	REYDB_PERMIT_READ,
	REYDB_PERMIT_WRITE,
	REYDB_PERMIT_REWRITE,
	REYDB_PERMIT_DELETE,

} reydb_permit;

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

extern uint16_t REYDB_CREATE_DATABASE();
extern uint16_t REYDB_CREATE_TABLE(reydb_table);

// **********************
// *** Read Functions ***
// **********************

extern uint16_t REYDB_READ(reydb_table);

// ***********************
// *** Write Functions ***
// ***********************

extern uint16_t REYDB_ADD(reydb_table);
extern uint16_t REYDB_REWRITE(reydb_table);

// ************************
// *** Search Functions ***
// ************************

extern uint16_t REYDB_SORT();
extern uint16_t REYDB_SEARCH(reydb_table, primary_key);

// ***************************
// *** Utilities Functions ***
// ***************************

extern uint16_t REYDB_COUNT();
extern uint16_t REYDB_EXIST();

#ifdef _cpluplus
}
#endif

#endif // REYDB_H