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
#include <stddef.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

// *******************************
// *** Reymon Database Library ***
// *******************************

#include <reymon/reydb.h>

// ********************
// *** Local Header ***
// ********************

#include <executable/example.h>

// *********************
// *** Main Function ***
// *********************

void REYDB_MAIN(void (REYDB_INIT)(), reydb_state (REYDB_LOOP)(), void (REYDB_FREE)()) {

	REYDB_INIT();
	
	while(REYDB_LOOP() == REYDB_CONTINUE);
	
	REYDB_FREE();

}