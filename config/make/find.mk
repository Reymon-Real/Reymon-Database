# *************************
# *** Find Source Files ***
# *************************

FIND_SOURCE_FILES_UTILS_C  := $(shell find $(SOURCE_FOLDER_UTILS)  -type f -name '*.c')
FIND_SOURCE_FILES_INPUT_C  := $(shell find $(SOURCE_FOLDER_INPUT)  -type f -name '*.c')
FIND_SOURCE_FILES_OUTPUT_C := $(shell find $(SOURCE_FOLDER_OUTPUT) -type f -name '*.c')

FIND_SOURCE_FILES_UTILS_COBOL  := $(shell find $(SOURCE_FOLDER_UTILS)  -type f -name '*.cbl')
FIND_SOURCE_FILES_INPUT_COBOL  := $(shell find $(SOURCE_FOLDER_INPUT)  -type f -name '*.cbl')
FIND_SOURCE_FILES_OUTPUT_COBOL := $(shell find $(SOURCE_FOLDER_OUTPUT) -type f -name '*.cbl')

# ********************
# *** Object Files ***
# ********************


FIND_OBJECT_FILES_UTILS_C  := $(patsubst $(SOURCE_FOLDER_UTILS)/%.c,  $(OBJECT_FOLDER_UTILS)/%.c.o,  $(FIND_SOURCE_FILES_UTILS_C))
FIND_OBJECT_FILES_INPUT_C  := $(patsubst $(SOURCE_FOLDER_INPUT)/%.c,  $(OBJECT_FOLDER_INPUT)/%.c.o,  $(FIND_SOURCE_FILES_INPUT_C))
FIND_OBJECT_FILES_OUTPUT_C := $(patsubst $(SOURCE_FOLDER_OUTPUT)/%.c, $(OBJECT_FOLDER_OUTPUT)/%.c.o, $(FIND_SOURCE_FILES_OUTPUT_C))

FIND_OBJECT_FILES_UTILS_COBOL  := $(patsubst $(SOURCE_FOLDER_UTILS)/%.cbl,  $(OBJECT_FOLDER_UTILS)/%.cbl.o,  $(FIND_SOURCE_FILES_UTILS_COBOL))
FIND_OBJECT_FILES_INPUT_COBOL  := $(patsubst $(SOURCE_FOLDER_INPUT)/%.cbl,  $(OBJECT_FOLDER_INPUT)/%.cbl.o,  $(FIND_SOURCE_FILES_INPUT_COBOL))
FIND_OBJECT_FILES_OUTPUT_COBOL := $(patsubst $(SOURCE_FOLDER_OUTPUT)/%.cbl, $(OBJECT_FOLDER_OUTPUT)/%.cbl.o, $(FIND_SOURCE_FILES_OUTPUT_COBOL))