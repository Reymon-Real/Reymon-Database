// ********************************
// *** Author:  Reymon Dev      ***
// *** File:    librdb.h        ***
// *** License: AGPL-3-or-later ***
// *** Date:    18/03/2026      ***
// *** Update:  18/03/2026      ***
// ********************************

#ifndef _LIBRDB_H
#define _LIBRDB_H

#ifdef _cpluplus
extern "C" {
#endif

// *************************
// *** Standar Libraries ***
// *************************

#include <stdbool.h>

// *************************
// *** Define Data Types ***
// *************************

typedef char* rdb_condition;
typedef void* rdb_table_p;
typedef char* rdb_table_name_p;

// *******************
// *** Permissions ***
// *******************

typedef enum _PERMISSIONS_LIBRDB {

	RDB_READ,
	RDB_WRITE,
	RDB_REWRITE,
	RDB_DELETE,

} rdb_permit;

// ************************
// *** Basic Conditions ***
// ************************

#define RDB_EQUAL   "EQUAL"
#define RDB_LOSS    "LOSS"
#define RDB_GREATER "GREATER"

#define RDB_LOSS_THAN   "LOSS THAN"
#define RDB_GRETER_THAN "GREATER THAN"

#define RDB_LOSS_OR_EQUAL    "LOSS OR EQUAL"
#define RDB_GREATER_OR_EQUAL "GREATER OR EQUAL"

// *****************************
// *** Environmnet Functions ***
// *****************************

extern void rdb_init(void);

// ********************************
// *** Administration Functions ***
// ********************************

// ************************
// *** Output Functions ***
// ************************

extern void rdb_create_database(const char*, char*);
extern void rdb_create_table   (const rdb_table_name_p, int*);

// **********************
// *** Read Functions ***
// **********************

extern void rdb_read(const rdb_table_name_p, const rdb_table_p, void*, char*);

// ***********************
// *** Write Functions ***
// ***********************

extern void rdb_add    (const rdb_table_name_p, const rdb_table_p, const void*, int*);
extern void rdb_rewrite(const rdb_table_name_p, void*, int*);
extern void rdb_update (rdb_table_p, rdb_table_p, int*);

// ************************
// *** Search Functions ***
// ************************

extern void rdb_filter(const rdb_table_name_p, const rdb_condition);
extern void rdb_join  (const rdb_table_p, const rdb_table_p);

extern void rdb_sort  (const rdb_table_name_p, bool);
extern void rdb_search(const rdb_table_name_p, const rdb_table_p, void*);

// ***************************
// *** Utilities Functions ***
// ***************************

extern void rdb_count(int*);
extern void rdb_exist(int*);

#ifdef _cpluplus
}
#endif

#endif // _LIBRDB_H