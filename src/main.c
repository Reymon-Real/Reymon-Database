// ********************************
// *** Author:  Reymon Dev      ***
// *** File:    main.c          ***
// *** Date:    18/03/2026      ***
// *** Date:    20/03/2026      ***
// *** License: AGPL-3-or-later ***
// ********************************

#include <libcob.h>
#include "../librdb.h"

int main(int argc, char* argv[]) {
    
    cob_init(argc, argv);
    
    char rdb_name[20] = "test.db";
    char rdb_fs[2];
    rdb_create_database(rdb_name, rdb_fs);
    
    return 0;
}