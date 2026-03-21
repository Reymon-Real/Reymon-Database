# *************************
# *** Find Source Files ***
# *************************

FIND_SOURCE_FILES_INPUT_COBOL  := $(shell find $(SOURCE_FOLDER_INPUT)  -type f -name '*.cbl')
FIND_SOURCE_FILES_OUTPUT_COBOL := $(shell find $(SOURCE_FOLDER_OUTPUT) -type f -name '*.cbl')

# ********************
# *** Object Files ***
# ********************

FIND_OBJECT_FILES_INPUT_COBOL  := $(patsubst $(SOURCE_FOLDER_INPUT)/%.cbl,  $(OBJECT_FOLDER_INPUT)/%.cbl.o,  $(FIND_SOURCE_FILES_INPUT_COBOL))
FIND_OBJECT_FILES_OUTPUT_COBOL := $(patsubst $(SOURCE_FOLDER_OUTPUT)/%.cbl, $(OBJECT_FOLDER_OUTPUT)/%.cbl.o, $(FIND_SOURCE_FILES_OUTPUT_COBOL))