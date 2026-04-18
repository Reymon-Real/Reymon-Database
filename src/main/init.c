// ********************************
// *** Author: Reymon Dev       ***
// *** File:   init.c           ***
// *** Date:   20/03/2026       ***
// *** Update: 26/03/2026       ***
// *** License: AGPL-3-or-later ***
// ********************************

// **************************
// *** Standard Libraries ***
// **************************

#include <stdlib.h>

// ************************
// *** Reymon Libraries ***
// ************************

#include <reymon/reydb.h>
#include <executable/example.h>

// ************************
// *** Global Variables ***
// ************************

int       reydb_scanf = ZERO;
char      reydb_accept[64];
employe_t reydb_employe[10];

// ***********************
// *** Local Variables ***
// ***********************

static reydb_state_t reydb_test = { ZERO };

// ****************
// *** Function ***
// ****************

void REYDB_INIT() {

	// **************************
	// *** Initialize Employe ***
	// **************************

	for (size_t i = ZERO; i < 10; i++) {

		reydb_employe[i].key = i;
		
		strcpy(reydb_employe[i].salary, " ");
		strcpy(reydb_employe[i].currency, " ");

		// REYDB_ADD(&reydb_employe[i]);

	}

	// ***************************
	// *** Create the Database ***
	// ***************************

	reydb_test.success = REYDB_EXIST();

	if(reydb_test.success != REYDB_SUCCESS)
		reydb_test.success = REYDB_CREATE_DATABASE(); // Create a test database

	// ********************
	// *** Reopen Stdin ***
	// ********************

	reopen_stdin();

}

// ********************
// *** Reopen Stdin ***
// ********************

void reopen_stdin() {
	close(ZERO);
	stdin = fdopen(open("/dev/tty", O_RDONLY), "r");
}