# ************************
# *** Standar Warnings ***
# ************************

CWARNING := -Wall -Wextra -Werror

# *******************************
# *** Select Standar Language ***
# *******************************

CSTD   := -std=c99
COBSTD := -std=ibm

# *****************************
# *** Standar Compiler Find ***
# *****************************

CFIND := -I$(HEADER_FOLDER)

# ***********************
# *** COBOL Behaviour ***
# ***********************

COBBEHAVIOUR := -fstatic-call

# **********************
# *** Compiler Flags ***
# **********************

CFLAGS   := $(CWARNING) $(CSTD) $(CFIND)
COBFLAGS := $(CWARNING) $(COBSTD) $(CFIND) $(COBBEHAVIOUR)

################################################################

# ***********************
# *** Linker Warnings ***
# ***********************

LDWARNING := 

# *******************
# *** Linker Find ***
# *******************

LDFIND := -L./lib/libc -L./lib/libm -L./lib/cjson

# *******************
# *** Static Link ***
# *******************

LD_STATIC_LINK := $(LIBRARY_FILE_STATIC_COBOL) $(LIBRARY_FILE_STATIC_BERKLY) $(LIBRARY_FILE_STATIC_GMP) $(LIBRARY_FILE_STATIC_LIBZ) $(LIBRARY_FILE_STATIC_LZMA) $(LIBRARY_FILE_STATIC_NCURSESW) $(LIBRARY_FILE_STATIC_PANELW) $(LIBRARY_FILE_STATIC_TINFO) $(LIBRARY_FILE_STATIC_XML2)

# ********************
# *** Dynamic Link ***
# ********************

LD_DYNAMIC_LINK := -lc -lm -lcjson

# ****************************
# *** Linker Relative Path ***
# ****************************

LD_RELATIVE_PATH := -Wl,-rpath,"lib/libc:lib/libm:lib/cjson"

################################################################

# ***********************
# *** Utilities Flags ***
# ***********************

ARFLAGS := crsT
LDFLAGS := $(LDWARNING) $(LDFIND)