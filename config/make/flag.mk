# ************************
# *** Standa Warnings ***
# ************************

CWARNING    := -Wall -Wextra -Werror
COBWARNINGS := -Wall -Wextra -Werror

# *******************************
# *** Select Standar Language ***
# *******************************

CSTD   := -std=gnu99

# *****************************
# *** Standar Compiler Find ***
# *****************************

CFIND   := -I$(HEADER_FOLDER)
COBFIND := -I$(HEADER_FOLDER)

# **********************
# *** Compiler Flags ***
# **********************

CFLAGS   := $(CWARNING) $(CSTD) -MMD -MP
COBFLAGS := -q64 -M

################################################################

# ***********************
# *** Linker Warnings ***
# ***********************

CCLDWARNING  := -Wl,--warn-once -Wl,--warn-common
COBLDWARNING := --warn-once --warn-common

# *******************
# *** Linker Find ***
# *******************

CCLDFIND  := -L$(LIBRARY_FOLDER)
COBLDFIND := -L$(LIBRARY_FOLDER)

# ********************
# *** Dynamic Link ***
# ********************

COMMON_DYNAMIC_LINK := -l:libc.so -l:libm.so -l:libz.so -l:libcob2_64r.so -l:librt.so.1 -l:libdl.so.2 -l:libicuuc_64r.so -l:libicui18n_64r.so -l:libdfp_64r.so -l:libicudata_64r.so

# ****************************
# *** Linker Relative Path ***
# ****************************

CCLD_RELATIVE_PATH := -Wl,-rpath,"$(LIBRARY_FOLDER)"

################################################################

# ***********************
# *** Utilities Flags ***
# ***********************

ARFLAGS    := crsT
CCLDFLAGS  := $(CCLDWARNING)
COBLDFLAGS := $(COBLDWARNING) $(COBLDFIND)