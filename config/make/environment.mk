# ********************
# *** Set Commands ***
# ********************

RM      := rm
RMFLAGS := -rf

# *******************************
# *** Environment C Variables ***
# *******************************

export C_INCLUDE_PATH := include

# ***********************************
# *** Environment COBOL Variables ***
# ***********************************

export SYSLIB    := include:include/reymon
export COBOPT    := 
export COBCPYEXT := .cpy
export COBLSTDIR := build/list

# ************************************
# *** Environment Linker Variables ***
# ************************************

export LIBRARY_PATH := lib