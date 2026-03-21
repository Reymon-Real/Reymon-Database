# *****************
# *** Main Rule ***
# *****************

all: object-main object-input object-output \
     binary-library-version binary-library-file binary-executable

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
	$(RM) $(RMFLAGS) build

clean-object: clean-main clean-input clean-output

clean-binary: clean-librdb clean-executable

clean-main:
	$(RM) $(RMFLAGS) $(OBJECT_FILE_MAIN_C)

clean-input:
	$(RM) $(RMFLAGS) $(FIND_OBJECT_FILES_INPUT_COBOL)

clean-output:
	$(RM) $(RMFLAGS) $(FIND_OBJECT_FILES_OUTPUT_COBOL)

clean-librdb:
	$(RM) $(RMFLAGS) $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_STATIC_RDB)     $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_SHARED_RDB) \
	                 $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_STATIC_VERSION) $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_SHARED_VERSION)

clean-executable:
	$(RM) $(RMFLAGS) $(BINARY_FILE_EXECUTABLE_TEST)

# ************************
# *** Object Main Rule ***
# ************************

object-main: $(OBJECT_FILE_MAIN_C)

# ********************
# *** Object Rules ***
# ********************

object-input:  $(FIND_OBJECT_FILES_INPUT_COBOL)
object-output: $(FIND_OBJECT_FILES_OUTPUT_COBOL)

# ********************
# *** Binary Rules ***
# ********************

binary-executable:      $(BINARY_FILE_EXECUTABLE_TEST)
binary-library-file:    $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_STATIC_RDB)     $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_SHARED_RDB)
binary-library-version: $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_STATIC_VERSION) $(BUILD_FOLDER_LIB)/$(BINARY_FILE_LIBRARY_SHARED_VERSION)