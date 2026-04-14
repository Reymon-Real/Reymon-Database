// ***********************************
// *** Author:  Reymon Dev         ***
// *** File:    example.h          ***
// *** License: AGPL-3-or-later    ***
// *** Date:    April 13 from 2026 ***
// *** Update:  April 13 from 2026 ***
// ***********************************

#ifndef EXAMPLE_H
#define EXAMPLE_H

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

// ************************
// *** Reymon Libraries ***
// ************************

#include <reymon/reydb.h>

// *************
// *** Table ***
// *************

typedef struct _table_employe {

	reydb_key key;
	
	union {

		struct {
		
			reydb_decimal salary[31];
			reydb_string  currency[4];
		
		};

		char raw[512];
	};

}  employe_t;

// ************************
// *** Global Variables ***
// ************************

extern employe_t reydb_employe[10];

// ******************************
// *** Global Input Variables ***
// ******************************

extern int  reydb_scanf;
extern char reydb_accept[64];

// ***************************
// *** Utilities Functions ***
// ***************************

extern void     reopen_stdin();

#endif // EXAMPLE_H