# *****************
# *** Main Rule ***
# *****************

all: object library executable

# ********************
# *** Execut Rules ***
# ********************

run: $(BINARY_FILE_EXECUTABLE_TEST)
	@./$<

# *******************
# *** Clean Rules ***
# *******************

clean: clean-object clean-binary

distclean:
	$(RM) $(RMFLAGS) build $(LIBRARY_FOLDER)/$(BINARY_FILE_LIBRARY_SHARED_REYDB) $(BINARY_FILE_EXECUTABLE_TEST)

clean-object: clean-main clean-input clean-output

clean-binary: clean-libreydb clean-executable

clean-main:
	$(RM) $(RMFLAGS) $(OBJECT_FILE_MAIN_C)

clean-utils:
	$(RM) $(RMFLAGS) $(FIND_OBJECT_FILES_UTILS_C) $(FIND_OBJECT_FILES_UTILS_COBOL)

clean-input:
	$(RM) $(RMFLAGS) $(FIND_OBJECT_FILES_INPUT_C) $(FIND_OBJECT_FILES_INPUT_COBOL)

clean-output:
	$(RM) $(RMFLAGS) $(FIND_OBJECT_FILES_OUTPUT_C) $(FIND_OBJECT_FILES_OUTPUT_COBOL)

clean-libreydb:
	$(RM) $(RMFLAGS) $(LIBRARY_FOLDER)/$(BINARY_FILE_LIBRARY_SHARED_REYDB)

clean-executable:
	$(RM) $(RMFLAGS) $(BINARY_FILE_EXECUTABLE_TEST)

# ************************
# *** Object Main Rule ***
# ************************

object-main: $(OBJECT_FILE_MAIN_C)

# ********************
# *** Object Rules ***
# ********************

object-utils:  $(FIND_OBJECT_FILES_UTILS_COBOL)  $(FIND_OBJECT_FILES_UTILS_C)
object-input:  $(FIND_OBJECT_FILES_INPUT_COBOL)  $(FIND_OBJECT_FILES_INPUT_C)
object-output: $(FIND_OBJECT_FILES_OUTPUT_COBOL) $(FIND_OBJECT_FILES_OUTPUT_C)

# ********************
# *** Binary Rules ***
# ********************

object:     object-main object-utils object-input object-output
library:    $(LIBRARY_FOLDER)/$(BINARY_FILE_LIBRARY_SHARED_REYDB)
executable: $(BINARY_FILE_EXECUTABLE_TEST)