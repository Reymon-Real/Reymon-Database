// ********************************
// *** Author:  Reymon Dev      ***
// *** File:    main.c          ***
// *** Date:    18/03/2026      ***
// *** Date:    20/03/2026      ***
// *** License: AGPL-3-or-later ***
// ********************************

// **************************
// *** Standard Libraries ***
// **************************

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// *******************************
// *** Reymon Database Library ***
// *******************************

#include <reydb.h>

// *************
// *** Table ***
// *************

typedef struct _table_employe {

	primary_key key;
	char salary[30];
	char currency[3];

} employe_t;

// *************************
// *** Static Variables ****
// *************************

static int       reydb_exit    = REYDB_SUCCESS;
static reydb_t   reydb_test    = { ZERO };
static employe_t reydb_employe = { ZERO, SPACE, SPACE };

// ***********************
// *** Local Functions ***
// ***********************

// Logic Functions
extern uint16_t initialize(void);
extern void     execute(void);
extern void     clean_exit(void);

// Utilities Functions
extern uint16_t database_exist(reydb_t*);

// *********************
// *** Main Function ***
// *********************

int main(void) {
	
// ******************
// *** Initialize ***
// ******************

	REYDB_INIT();

// ******************************
// *** Initialize Environment ***
// ******************************
	
	reydb_state success = initialize();

// ***********************
// *** Execution Logic ***
// ***********************
	
	switch (success) {
		
		case REYDB_CREATE_SUCCESS:
			
			execute();
			break;
		
		case REYDB_CREATE_FAILURE:
			
			reydb_exit = REYDB_FAILURE;
			break;

		default:
			
			reydb_exit = REYDB_FAILURE; // One Defender Line
			exit(reydb_exit);           // Second Defender Line
			break;                      // Third Defender Line
	}

// ******************
// *** Clean Exit ***
// ******************

	clean_exit();

// ***************************
// *** Exit of the program ***
// ***************************

	return reydb_exit; // Final Defender Line
}

// ***************************************
// *** Define Logic of Local Functions ***
// ***************************************

uint16_t initialize() {

	reydb_test.success = REYDB_CREATE_DATABASE(); // Create a test database
	reydb_employe.key      = 1;

	memcpy(reydb_employe.salary,   "10000", sizeof("10000"));
	memcpy(reydb_employe.currency, "CHF",   sizeof("CHF"));

	return database_exist(&reydb_test);
}

// ******************************
// *** Logic of the Execution ***
// ******************************

void execute() {

	if (reydb_test.success == REYDB_CREATE_SUCCESS) {
	
		printf("Create Success -> %d\n", reydb_test.success);
		reydb_test.success = REYDB_ADD(&reydb_employe);
	
	} else
		printf("Create Failure -> %d\n", reydb_test.success);

}

// *******************************************
// *** Logic for exit from current program ***
// *******************************************

void clean_exit() {
	reydb_exit = REYDB_SUCCESS;
}

// ************************************
// *** Verify if the database exist ***
// ************************************

uint16_t database_exist(reydb_t* reydb) {

	uint16_t success = ZERO;

	switch(reydb -> success) {
		
		case REYDB_CREATE_SUCCESS:
			
			success = REYDB_CREATE_SUCCESS;
			break;

		case REYDB_CREATE_FAILURE:
			
			success = REYDB_CREATE_FAILURE;
			break;

		default:
			success = REYDB_CRITICAL_ERROR;
	
	}

	return success;
}