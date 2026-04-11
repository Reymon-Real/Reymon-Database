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
#include <ctype.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

// *******************************
// *** Reymon Database Library ***
// *******************************

#include <reymon/reydb.h>

// **************
// *** Unions ***
// **************

typedef union _union_employe {

	struct {

		char salary[31];
		char currency[4];
	
	} fields;

	char raw[512];

} employe_u;

// *************
// *** Table ***
// *************

typedef struct _table_employe {

	reydb_key key;
	employe_u features;

}  employe_t;

// *************************
// *** Static Variables ****
// *************************

static char          reydb_accept[64];
static int           reydb_exit      = REYDB_SUCCESS;
static int           reydb_scanf     = ZERO;
static employe_t     reydb_employe   = { ZERO, { { "40000.00000", "CHF" } } };
static reydb_state_t reydb_test      = { ZERO };
FILE*                reydb_file = NULL;

// ***********************
// *** Local Functions ***
// ***********************

// Logic Functions
extern void     initialize(void);
extern uint16_t execute(void);
extern void     clean_exit(void);

// Utilities Functions
extern void     reopen_stdin();
extern void     operations(reydb_table);
extern uint16_t response(const char*);
extern uint16_t database_exist(reydb_state_t*);

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
	
	initialize();

// ********************
// *** Reopen Stdin ***
// ********************

	reopen_stdin();

// ***********************
// *** Execution Logic ***
// ***********************
	
	switch (database_exist(&reydb_test)) {
		
		case REYDB_CREATE_SUCCESS:
			
			while(execute() == REYDB_CONTINUE);
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

void initialize() {

	reydb_test.success = REYDB_EXIST();

	if(reydb_test.success == REYDB_FAILURE)
		reydb_test.success = REYDB_CREATE_DATABASE(); // Create a test database
	else
		reydb_test.success = REYDB_CREATE_SUCCESS;
}

// ******************************
// *** Logic of the Execution ***
// ******************************

uint16_t execute() {

	if (REYDB_READ(&reydb_employe) == REYDB_SUCCESS) {

		printf("Would you like to perform an operation on record %ld? [yes/no]\n", reydb_employe.key);
		
		switch(response("yes")) {

			case REYDB_SUCCESS:
				operations(&reydb_employe);
				reydb_exit = REYDB_CONTINUE;
				break;

			case REYDB_FAILURE:
				reydb_exit = REYDB_BREAK;
				break;

			default:
				reydb_exit = REYDB_BREAK;
				break;
		}
		
	} else {

			puts("Would you like to add the record to the database? [yes/no]");

			if (response("yes") == REYDB_SUCCESS) {
				
				reydb_test.success = REYDB_ADD(&reydb_employe);
				reydb_exit = REYDB_CONTINUE;
			
			} else
				reydb_exit = REYDB_FAILURE;

	}

	return reydb_exit;

}

// ********************
// *** Reopen Stdin ***
// ********************

void reopen_stdin() {
	close(ZERO);
	stdin = fdopen(open("/dev/tty", O_RDONLY), "r");
}

// *******************************************
// *** Logic for exit from current program ***
// *******************************************

void clean_exit() {
	reydb_exit = REYDB_SUCCESS; // REYDB_SUCCESS is equal to ZERO
}

// ************************************
// *** Verify if the database exist ***
// ************************************

uint16_t database_exist(reydb_state_t* reydb) {

	reydb_state success = ZERO;

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

// *******************************
// *** Get the user's response ***
// *******************************

uint16_t response(const char* respose) {

	char upper[64];
	reydb_scanf = scanf("%s", reydb_accept);

	strcpy(upper, respose);

	for (int i = ZERO; i < 64; i++) {

		char c = reydb_accept[i];
		reydb_accept[i] = toupper(c);

		c = upper[i];
		upper[i] = toupper(c);

	}

	if (strcmp(reydb_accept, upper) == ZERO)
		return REYDB_SUCCESS;

	return REYDB_FAILURE;
}

// ******************************
// *** Options for operations ***
// ******************************

reydb_oper options() {

	reydb_scanf = scanf("%s", reydb_accept);

	for (int i = ZERO; i < 64; i++) {

		char c = reydb_accept[i];
		reydb_accept[i] = toupper(c);

	}

	if (strcmp(reydb_accept, "ADD") == ZERO)
		return REYDB_OPERATION_ADD;

	else if (strcmp(reydb_accept, "REMOVE") == ZERO)
		return REYDB_OPERATION_REMOVE;

	else if (strcmp(reydb_accept, "REWRITE") == ZERO)
		return REYDB_OPERATION_REWRITE;

	else if (strcmp(reydb_accept, "SORT") == ZERO)
		return REYDB_OPERATION_SORT;

	else if (strcmp(reydb_accept, "SEARCH") == ZERO)
		return REYDB_OPERATION_SEARCH;

	return (reydb_oper) REYDB_FAILURE;
}

// **************************
// *** Menu of operations ***
// **************************

void operations(reydb_table table) {

	reopen_stdin();

	puts("1) Add Register");
	puts("2) Remove Register");
	puts("3) Update Register");
	puts("4) Sort Registers");
	puts("5) Search Register");

	reydb_oper option = options();

	if(option == REYDB_OPERATION_ADD) {

		REYDB_ADD(table);
	
	} else if (option == REYDB_OPERATION_REMOVE) {
		
		REYDB_REMOVE(table);
	
	} else if (option == REYDB_OPERATION_REWRITE) {
	
		REYDB_REWRITE(table);
	
	} else if (option == REYDB_OPERATION_SORT) {
		
		REYDB_SORT();
		int i = system("rm -f temporal.dat");
		if (i == ZERO) {}
	
	} else if (option == REYDB_OPERATION_SEARCH) {
		
		REYDB_SEARCH(table);
	
	}

}