# ************************
# *** Standa Warnings ***
# ************************

CWARNING    := -Wall -Wextra -Werror
COBWARNINGS := -Wall -Wextra -Werror

# *******************************
# *** Select Standar Language ***
# *******************************

CSTD   := -std=c99

# *****************************
# *** Standar Compiler Find ***
# *****************************

CFIND   := -I$(HEADER_FOLDER)
COBFIND := -I$(HEADER_FOLDER)

# **********************
# *** Compiler Flags ***
# **********************

CFLAGS   := $(CWARNING) $(CSTD) $(CFIND)
COBFLAGS := -q64

################################################################

# ***********************
# *** Linker Warnings ***
# ***********************

LDWARNING := 

# *******************
# *** Linker Find ***
# *******************

LDFIND := -L$(LIBRARY_FOLDER)

# ********************
# *** Dynamic Link ***
# ********************

LD_DYNAMIC_LINK := -l:libc.so -l:libm.so -l:libz.so -l:libcob2_64r.so -l:librt.so.1 -l:libdl.so.2 -l:libicuuc_64r.so -l:libicui18n_64r.so -l:libdfp_64r.so -l:libicudata_64r.so

# ****************************
# *** Linker Relative Path ***
# ****************************

LD_RELATIVE_PATH := -Wl,-rpath,"$(LIBRARY_FOLDER)"

################################################################

# ***********************
# *** Utilities Flags ***
# ***********************

ARFLAGS := crsT
LDFLAGS := $(LDWARNING) $(LDFIND)