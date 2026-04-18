# ***************************
# *** Create Object Files ***
# ***************************

$(OBJECT_FILE_MAIN_C): $(SOURCE_FILE_MAIN_C)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -O3 -c $< -o $@

-include build/obj/*.d

# ************************
# *** Create Libraries ***
# ************************

$(LIBRARY_FOLDER)/$(BINARY_FILE_LIBRARY_SHARED_REYDB): $(FIND_OBJECT_FILES_UTILS_COBOL) $(FIND_OBJECT_FILES_UTILS_C) $(FIND_OBJECT_FILES_INPUT_COBOL) $(FIND_OBJECT_FILES_INPUT_C) $(FIND_OBJECT_FILES_OUTPUT_COBOL) $(FIND_OBJECT_FILES_OUTPUT_C)
	@mkdir -p $(dir $@)
	$(COBLD) $(COBLDFIND) -dso -o $@ $^

# **************************
# *** Create Executables ***
# **************************

$(BINARY_FILE_EXECUTABLE_TEST): $(OBJECT_FILE_MAIN_C) $(FIND_OBJECT_FILES_MAIN_COBOL) $(FIND_OBJECT_FILES_MAIN_C) | $(LIBRARY_FOLDER)/$(BINARY_FILE_LIBRARY_SHARED_REYDB)
	@mkdir -p $(dir $@)
	$(CCLD) $(CCLDFLAGS) -o $@ $^ -l:libreydb.so $(LD_RELATIVE_PATH)
	@patchelf --set-rpath '$$ORIGIN/lib' $@